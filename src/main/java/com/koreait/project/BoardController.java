package com.koreait.project;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.dao.MybatisDAO;
import com.koreait.vo.BoardList;
import com.koreait.vo.BoardVO;
import com.koreait.vo.ReplyBoardList;
import com.koreait.vo.ReplyVO;
import com.koreait.vo.SearchParam;

@Controller
public class BoardController {

	@Autowired
	SqlSession sqlSession;
	
//	comunity.jsp호출
	@RequestMapping("/comunity")
	public String comunity(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 comunity 호출");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		int currentPage=1;
		int pageSize=10;
		try {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}catch(NumberFormatException e) {}
		
		int totalCount=mapper.totalCount();
		AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		
		BoardList boardList=ctx.getBean("boardList", BoardList.class);
		boardList.initMvcBoardList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		
		boardList.setList(mapper.selectList(hmap));
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("currentPage",currentPage);
		return "comunity";
	}
	
//	insert.jsp호출
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 insert 호출");
		return "insert";
	}
	
//	insert에서 게시글 입력시 오는 요청처리
	@RequestMapping("/insertOK")
	public String insertOK(HttpServletRequest request, Model model, BoardVO boardVO) {
		System.out.println("컨트롤러로 insertOK 호출");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		try {
			boardVO.setGup(mapper.gup());
		} catch (Exception e) {
			boardVO.setGup(1);
		}
		mapper.insert(boardVO);
		return "redirect:comunity";
	}

	@RequestMapping("/search")
	public String search(HttpServletRequest request,HttpServletResponse response, Model model) {
		String tag=request.getParameter("tag");
		String search=request.getParameter("search");
		int currentPage=1;
		int pageSize=10;
		try {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}catch(NumberFormatException e) {}
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		int totalCount=tag.equals("아이디")?mapper.idSearchCount(search):
			tag.equals("제목")?mapper.titleSearchCount(search):mapper.idTitleSearchCount(search);
		System.out.println(totalCount);
		AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		BoardList boardList=ctx.getBean("boardList", BoardList.class);
		boardList.initMvcBoardList(pageSize, totalCount, currentPage);
		SearchParam param=ctx.getBean("searchParam", SearchParam.class);
		param.setEndNO(boardList.getEndNo());
		param.setStartNO(boardList.getStartNo());
		param.setTag(tag);
		param.setSearch(search);
		System.out.println(param);
		boardList.setList(
				tag.equals("아이디")?mapper.selectIdSearchList(param):
				tag.equals("제목")?mapper.selectTitleSearchList(param):mapper.selectIdTitleSearchList(param));
		model.addAttribute("boardList",boardList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("param",param);
		System.out.println(boardList.getList());
		return "searchComunity";
	}
	/*
	private String getJson(String search, String tag) {
		AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		BoardList boardList=ctx.getBean("boardList",BoardList.class);
		if(tag.equals("제목")) {
			boardList.setList(mapper.titleSearch(search));
		}else {
			boardList.setList(mapper.contentSearch(search));
		}
		StringBuffer result=new StringBuffer();
		ArrayList<BoardVO> list=boardList.getList();
		result.append("{\"result\":[");
		for(int i=0;i<list.size();i++) {
			result.append("[{\"value\":\""+list.get(i).getIdx()+"\"},");
			result.append("{\"value\":\""+list.get(i).getTitle().trim()+"\"},");
			result.append("{\"value\":\""+list.get(i).getContent().trim()+"\"},");
			result.append("{\"value\":\""+list.get(i).getWriteDate()+"\"},");
			result.append("{\"value\":\""+list.get(i).getHit()+"\"},");
			result.append("{\"value\":\"댓글\"}],");
		}
		result.append("]}");
		return result.toString();
	}
*/
	@RequestMapping("/content")
	public String content(HttpServletRequest request, Model model) {
		System.out.println("controller의 content메소드 실행");
		int idx=Integer.parseInt(request.getParameter("idx"));
		
		AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		mapper.hitPlus(idx);
		BoardVO boardVO=ctx.getBean("vo", BoardVO.class);
		
		ReplyBoardList replyBoardList=ctx.getBean("replyBoardList",ReplyBoardList.class);
		int pageSize=5;
		int currentPage=1;
		try {
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}catch(NumberFormatException e) {}
		int total=mapper.replyTotalCount(idx);
		replyBoardList.initMvcBoardList(pageSize, total, currentPage);
		HashMap<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startNo", replyBoardList.getStartNo());
		hmap.put("endNo", replyBoardList.getEndNo());
		hmap.put("gup", idx);
		
		replyBoardList.setList(mapper.selectReplyList(hmap));
		
		model.addAttribute("replyBoardList", replyBoardList);
		model.addAttribute("currentPage",currentPage);
		boardVO=mapper.selectContent(idx);
		model.addAttribute("boardVO", boardVO);
		model.addAttribute("idx",idx);
		return "content";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request,Model model, ReplyVO replyVO) {
		System.out.println("controller의 reply메소드 실행");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		System.out.println(replyVO);
		mapper.seqPlus(replyVO.getIdx());
		mapper.reply(replyVO);
		mapper.replyCountPlus(replyVO.getIdx());
		return "redirect:content?idx="+replyVO.getIdx();
	}
}
