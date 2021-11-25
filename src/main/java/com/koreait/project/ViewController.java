package com.koreait.project;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.dao.MybatisDAO;
import com.koreait.vo.BoardVO;
import com.koreait.vo.ItemList;
import com.koreait.vo.ItemVO;
import com.koreait.vo.MemberVO;
 
 

@Controller
public class ViewController {
	
	@Autowired
	SqlSession sqlSession;
	
//	homePage.jsp를 호출 하는 메소드
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		System.out.println("컨트롤러로 homePage 호출");
		return "homePage";
	}
	
//	homePage.jsp를 호출 
	@RequestMapping("/homePage")
	public String homeback() {
		System.out.println("homeback 메소드 실행");
		return "homePage";
	}
	
//	interiorMain.jsp를 호출 
	@RequestMapping("/interiorMain")
	public String interiorMain() {
		System.out.println("컨트롤러로 interiorMain 호출");
		return "/productMain/interiorMain";
	}
	
//	lightingMain.jsp를 호출 
	@RequestMapping("/lightingMain")
	public String lightingMain() {
		System.out.println("컨트롤러로 lightingMain 호출");
		return "/productMain/lightingMain";
	}
	

//	productMain.jsp를 호출 하는 메소드
	@RequestMapping("/productMain")
	public String productMain(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 productMain 호출");
		return "productMain";
	}
	
//	======================================== speakerDetail 호출===============================================	
	
	@RequestMapping("/speakerDetail00")
	public String speakerDetail00() {
		System.out.println("컨트롤러로 speakerDetail00 호출");
		return "/productDetail/speakerDetail00";
	}
	@RequestMapping("/speakerDetail01")
	public String speakerDetail01() {
		System.out.println("컨트롤러로 productDetail01 호출");
		return "/productDetail/speakerDetail01";
	}
	@RequestMapping("/speakerDetail02")
	public String speakerDetail02() {
		System.out.println("컨트롤러로 productDetail02 호출");
		return "/productDetail/speakerDetail02";
	}
	@RequestMapping("/speakerDetail03")
	public String speakerDetail03() {
		System.out.println("컨트롤러로 productDetail03 호출");
		return "/productDetail/speakerDetail03";
	}
	@RequestMapping("/speakerDetail04")
	public String speakerDetail04() {
		System.out.println("컨트롤러로 productDetail04 호출");
		return "/productDetail/speakerDetail04";
	}
	@RequestMapping("/speakerDetail05")
	public String speakerDetail05() {
		System.out.println("컨트롤러로 productDetail05 호출");
		return "/productDetail/speakerDetail05";
	}
	@RequestMapping("/speakerDetail06")
	public String speakerDetail06() {
		System.out.println("컨트롤러로 productDetail06 호출");
		return "/productDetail/speakerDetail06";
	}
	@RequestMapping("/speakerDetail07")
	public String speakerDetail07() {
		System.out.println("컨트롤러로 productDetail07 호출");
		return "/productDetail/speakerDetail07";
	}
			
		//======================================== interiorDetail 호출===============================================	
			
//	interiorDetail01.jsp를 호출 
	@RequestMapping("/interiorDetail00")
	public String interiorDetail00() {
		System.out.println("컨트롤러로 interiorDetail00 호출");
		return "/productDetail/interiorDetail00";
	}
	@RequestMapping("/interiorDetail01")
	public String interiorDetail01() {
		System.out.println("컨트롤러로 interiorDetail01 호출");
		return "/productDetail/interiorDetail01";
	}
	@RequestMapping("/interiorDetail02")
	public String interiorDetail02() {
		System.out.println("컨트롤러로 interiorDetail02 호출");
		return "/productDetail/interiorDetail02";
	}
	@RequestMapping("/interiorDetail03")
	public String interiorDetail03() {
		System.out.println("컨트롤러로 interiorDetail03 호출");
		return "/productDetail/interiorDetail03";
	}
	@RequestMapping("/interiorDetail04")
	public String interiorDetail04() {
		System.out.println("컨트롤러로 interiorDetail04 호출");
		return "/productDetail/interiorDetail04";
	}
	@RequestMapping("/interiorDetail05")
	public String interiorDetail05() {
		System.out.println("컨트롤러로 interiorDetail05 호출");
		return "/productDetail/interiorDetail05";
	}
	@RequestMapping("/interiorDetail06")
	public String interiorDetail06() {
		System.out.println("컨트롤러로 interiorDetail06 호출");
		return "/productDetail/interiorDetail06";
	}
	@RequestMapping("/interiorDetail07")
	public String interiorDetail07() {
		System.out.println("컨트롤러로 interiorDetail07 호출");
		return "/productDetail/interiorDetail07";
	}
		
	//======================================== lightingDetail 호출===============================================	
		
//	lightingDetail01.jsp를 호출 
	@RequestMapping("/lightingDetail00")
	public String lightingDetail00() {
		System.out.println("컨트롤러로 lightingDetail00 호출");
		return "/productDetail/lightingDetail00";
	}
	@RequestMapping("/lightingDetail01")
	public String lightingDetail01() {
		System.out.println("컨트롤러로 lightingDetail01 호출");
		return "/productDetail/lightingDetail01";
	}
	@RequestMapping("/lightingDetail02")
	public String lightingDetail02() {
		System.out.println("컨트롤러로 lightingDetail02 호출");
		return "/productDetail/lightingDetail02";
	}
	@RequestMapping("/lightingDetail03")
	public String lightingDetail03() {
		System.out.println("컨트롤러로 lightingDetail03 호출");
		return "/productDetail/lightingDetail03";
	}
	@RequestMapping("/lightingDetail04")
	public String lightingDetail04() {
		System.out.println("컨트롤러로 lightingDetail04 호출");
		return "/productDetail/lightingDetail04";
	}
	@RequestMapping("/lightingDetail05")
	public String lightingDetail05() {
		System.out.println("컨트롤러로 lightingDetail05 호출");
		return "/productDetail/lightingDetail05";
	}
	@RequestMapping("/lightingDetail06")
	public String lightingDetail06() {
		System.out.println("컨트롤러로 lightingDetail06 호출");
		return "/productDetail/lightingDetail06";
	}
	@RequestMapping("/lightingDetail07")
	public String lightingDetail07() {
		System.out.println("컨트롤러로 lightingDetail07 호출");
		return "/productDetail/lightingDetail07";
	}

	//======================================== Detail 끝===============================================

	
//	as.jsp호출
	@RequestMapping("/as")
	public String as(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 as 호출");
		return "as";
	}
	
//	speakerMain에서 게시글 입력시 오는 요청처리
	@RequestMapping("/speakerMain")
	public String speakerMain(HttpServletRequest request, Model model, BoardVO boardVO) {
		System.out.println("컨트롤러로 speakerMain 호출");
		return "productMain/speakerMain";
	}
	
//	speakerMain에서 게시글 입력시 오는 요청처리
	@RequestMapping("/basket")
	public String basket(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 basket 호출");
		String id = request.getParameter("id");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		MemberVO memberVO = ctx.getBean("memberVO", MemberVO.class);
		
		memberVO = mapper.memberView(id);
		ItemList itemList=ctx.getBean("itemList", ItemList.class);
		itemList.setList(mapper.selectWish(id));
		System.out.println(itemList.getList());
		model.addAttribute("itemList",itemList.getList());
		System.out.println(memberVO);
		System.out.println(id);
		model.addAttribute("memberVO", memberVO);
		
		return "basket";
	}

	@RequestMapping("/deleteWishItem")
	public String deleteWishItem(HttpServletRequest request, Model model, ItemVO itemVO) {
		System.out.println("컨트롤러로 deleteWishItem 호출");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		mapper.deleteWishItem(itemVO);
		
		model.addAttribute("id", itemVO.getId());
		
		return "redirect:basket";
	}
	
	
	

	
	@RequestMapping("/tab")
	public String tab() {
		System.out.println("tab 메소드 실행");
		return "tab";
	}
}

