package com.koreait.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.koreait.vo.BoardVO;
import com.koreait.vo.ItemVO;
import com.koreait.vo.MemberVO;
import com.koreait.vo.ReplyBoardList;
import com.koreait.vo.ReplyVO;
import com.koreait.vo.SearchParam;

public interface MybatisDAO {

	void data();

	void insert(BoardVO boardVO);

	int totalCount();

	ArrayList<BoardVO> selectList(HashMap<String, Integer> hmap);

	int gup();

	ArrayList<BoardVO> titleSearch(String search);

	ArrayList<BoardVO> contentSearch(String search);

	void create(MemberVO member);

	int idCheck(String parameter);
	
	int login(MemberVO memberVO);
	
	int memberDelete(MemberVO memberVO);
	
	MemberVO memberView(String id);

	BoardVO selectContent(int idx);

	void reply(ReplyVO replyVO);

	void seqPlus(int idx);

	int replyTotalCount(int idx);

	ArrayList<ReplyBoardList> selectReplyList(HashMap<String, Integer> hmap);
	
	void memberView2(MemberVO memberVO);

	int idSearchCount(String search);

	int titleSearchCount(String search);
	
	int idTitleSearchCount(String search);

	void hitPlus(int idx);

	void replyCountPlus(int idx);

	ArrayList<BoardVO> selectIdSearchList(SearchParam param);

	ArrayList<BoardVO> selectTitleSearchList(SearchParam param);

	ArrayList<BoardVO> selectIdTitleSearchList(SearchParam param);

//	이메일로 아이디 찾기 ID 찾기
	String userIdSearch(String email);

	int checkPhone(String phoneNum);

	String selectId(String phoneNum);
	
	int checkId(HashMap<String, String> hmap);

	void changePW(MemberVO memberVO);

	int selectGrade(String id);

	void subscript(MemberVO vo);

	int selectItem(HashMap<String, String> img);

	void insertWish(ItemVO item);

	int selectGradeItem(HashMap<String, String> hmap);

	void choiceItem(HashMap<String, String> hmap);

	void choiceItemCheckNum(HashMap<String, String> hmap);

	int selectItemChoice(HashMap<String, String> hmap);

	ArrayList<ItemVO> selectSubscript(String id);

	void deleteItem(ItemVO itemVO);

	ArrayList<ItemVO> selectWish(String id);

	void deleteWishItem(ItemVO itemVO);

	void deleteMember(String id);

	void deleteSubscript(String id);

	void deleteItems(String id);

	void deleteWishAll(String id);
}
