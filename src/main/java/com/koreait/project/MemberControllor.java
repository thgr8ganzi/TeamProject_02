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
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.dao.MybatisDAO;
import com.koreait.vo.ItemList;
import com.koreait.vo.ItemVO;
import com.koreait.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class MemberControllor {

	@Autowired
	SqlSession sqlSession;
	
//	로그인
	@RequestMapping("/login")
	public void login(HttpServletResponse response,HttpServletRequest request, Model model, MemberVO memberVO) {
		System.out.println("컨트롤러로 login 호출");
		
		HttpSession session = request.getSession();
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		System.out.println(memberVO);
		int check = mapper.login(memberVO);
		System.out.println(check);
		if(check == 1) {
			try {
				session.setAttribute("id", memberVO.getId());
				System.out.println(2);
				response.getWriter().write(String.valueOf(check));
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("로그인 성공");
			System.out.println(3);
		}else {
			System.out.println(4);
			try {
				response.getWriter().write("0");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}	
	
//	회원탈퇴
	@RequestMapping("/deleteMember")
	public String memberDelete(HttpServletRequest request, MemberVO memberVO) {
		System.out.println("컨트롤러로 memberDelete 호출");
		String id = request.getParameter("id");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		mapper.deleteMember(id);
		request.getSession().removeAttribute("id");
		return "homePage";
	}
	
//	회원정보 보여주기
	@RequestMapping("/persnerInfo")
	public String memberView(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 perenerInfo 호출");
		String id = request.getParameter("id");
		
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
		MemberVO memberVO = ctx.getBean("memberVO", MemberVO.class);
		
		memberVO = mapper.memberView(id);
		ItemList itemList=ctx.getBean("itemList", ItemList.class);
		itemList.setList(mapper.selectSubscript(id));
		System.out.println(itemList.getList());
		model.addAttribute("itemList",itemList.getList());
		System.out.println(memberVO);
		System.out.println(id);
		model.addAttribute("memberVO", memberVO);
		
		return "persnerInfo";
	}
	
//	loginPage.jsp를 호출 하는 메소드
	@RequestMapping("/loginPage")
	public String loginPage(HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 loginPage 호출");
		model.addAttribute("job",request.getParameter("job"));
		return "loginPage";
	}
	
//	회원가입에서 사용자 입력정보 받아오는 요청처리
	@RequestMapping("/create")
	public void create(HttpServletResponse response, HttpServletRequest request, Model model, MemberVO memberVO) {
		System.out.println("컨트롤러로 create 호출");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.create(memberVO);
		HttpSession session=request.getSession();
		
		session.setAttribute("id", memberVO.getId());
		try {
			response.getWriter().write("");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
//	idCheck 기능
	@RequestMapping("/idCheck")
	public void idCheck(HttpServletResponse response,HttpServletRequest request, Model model) {
		System.out.println("Controller idCheck 실행");
		MybatisDAO
		mapper=sqlSession.getMapper(MybatisDAO.class);
		int check= mapper.idCheck(request.getParameter("id"));
		try {
			response.getWriter().write(""+check);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, Model model) {
		System.out.println("controller의 logout메소드 실행");
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		return "redirect:homePage";
	}
	
//  회원정보 수정하기
	  @RequestMapping("/persnerInfo2")
	  public String persnerInfo2(HttpServletRequest request, Model model, MemberVO memberVO) {
	      System.out.println("컨트롤러로 persnerInfo2 호출");
	
	      MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
	      AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:applicationCTX.xml");
	      mapper.memberView2(memberVO);
	      model.addAttribute("id", memberVO.getId());
	
	
	      return "redirect:persnerInfo";
	  }
//	인증번호
	@RequestMapping("/findingID")
	public void test(HttpServletResponse response ,HttpServletRequest request, Model model) {
		
		System.out.println("컨트롤러로 test 호출 NCSC6YPVQLUF73S2");
		String api_key = "NCSC6YPVQLUF73S2";
	    String api_secret = "IHOWP45FYBQORBVDWPEDPVCZL0TRSKVI";
	    Message coolsms = new Message(api_key, api_secret);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    StringBuffer randNum=new StringBuffer();
	    Random random=new Random();
	    
	    String phoneNum=request.getParameter("phoneNum");
	    MybatisDAO mapper= sqlSession.getMapper(MybatisDAO.class);
	    
	    int checkPhone=mapper.checkPhone(phoneNum);
	    
	    if(checkPhone==1) {
	    	System.out.println("randNum 1 "+randNum.toString());
	    
		    for(int i=0; i<4;i++) randNum.append(random.nextInt(10));
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phoneNum);
		    params.put("from", "01077441397");
		    params.put("type", "SMS");
		    params.put("text", "인증 번호 : "+randNum.toString());
		    params.put("app_version", "test app 1.2"); // application name and version
	
		    try {
		      JSONObject obj = (JSONObject) coolsms.send(params);
		      System.out.println(obj.toString());
		      String id=mapper.selectId(phoneNum);
		      System.out.println("randNum 2 "+randNum.toString());
		      System.out.println("id 2 "+id);
			  response.getWriter().write(randNum.toString()+" "+id);
		    } catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
		      try {
				response.getWriter().write("1");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		    }catch (IOException e) {
		    	e.printStackTrace();
		    }
	    }else {
	    	try {
				response.getWriter().write("2");
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	}
	
//	이메일로 아이디 찾기
	@RequestMapping("/userIdSearch")
	public String userIdSearch(HttpServletRequest request, Model model, MemberVO memberVO) {
		System.out.println("컨트롤러로 userIdSearch 호출");
		String email = request.getParameter("email");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		mapper.userIdSearch(email);
		String id = memberVO.getId();
		if(email.equals(memberVO.getEmail())) {
			model.addAttribute("id", id);
		}
		return "userIdSearch";
	}
//	비밀번호인증번호
	@RequestMapping("/findingPW")
	public void PWfind(HttpServletResponse response ,HttpServletRequest request, Model model) {
		
		System.out.println("컨트롤러로 PWfind 호출");
		String api_key = "NCSSBSKLPAFYHQZE";
	    String api_secret = "QI8CJLG5GNRICNLP2UVCQXPOMLQXEFE7";
//	    Message coolsms = new Message(api_key, api_secret);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    StringBuffer randNum=new StringBuffer();
	    Random random=new Random();
	    
	    String phoneNum=request.getParameter("phoneNum");
	    String id = request.getParameter("id");
	    MybatisDAO mapper= sqlSession.getMapper(MybatisDAO.class);
	    HashMap<String, String> hmap = new HashMap<String, String>();
	    hmap.put("phoneNum", phoneNum);
	    hmap.put("id", id);
	    
	    int checkId = mapper.checkId(hmap);
	    
	    if(checkId == 1) {
	    	System.out.println("randNum 1 "+randNum.toString());
		    for(int i=0; i<4;i++) randNum.append(random.nextInt(10));
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phoneNum);
		    params.put("from", "01054487182");
		    params.put("type", "SMS");
		    params.put("text", "인증 번호 : "+randNum.toString());
		    params.put("app_version", "test app 1.2"); // application name and version
		    try {
//		      JSONObject obj = (JSONObject) coolsms.send(params);
//		      System.out.println(obj.toString());
		      System.out.println("randNum 2 "+randNum.toString());
		      response.getWriter().write(randNum.toString());
			} catch (IOException e) {
				e.printStackTrace();
			} /*catch (CoolsmsException e) {
		      System.out.println(e.getMessage());
		      System.out.println(e.getCode());
			      try {
					response.getWriter().write("1"); // 전송오류가 난 경우
				} catch (IOException e1) {
					e1.printStackTrace();
				}
		    }*/
	    } else {
	    	System.out.println("아이디를 확인하세요.");
	    	try {
				response.getWriter().write("2"); // 아이디나 핸드폰번호 오류
			} catch (IOException e) {
				e.printStackTrace();
			}
	    }
	}
	
	@RequestMapping("/updatePW")
	public String updatePW(HttpServletRequest request, Model model, MemberVO memberVO) {
		System.out.println("컨트롤러로 updatePW 호출");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		MybatisDAO mapper = sqlSession.getMapper(MybatisDAO.class);
		
		mapper.changePW(memberVO);
		model.addAttribute("job", "login");
		
		return "loginPage";
	}

	@RequestMapping("/phoneNumCheck")
	public void phoneNumCheck(HttpServletResponse response ,HttpServletRequest request, Model model) {
		System.out.println("컨트롤러로 phoneNumCheck 호출");
		String api_key = "NCSSBSKLPAFYHQZE";
	    String api_secret = "QI8CJLG5GNRICNLP2UVCQXPOMLQXEFE7";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    StringBuffer randNum=new StringBuffer();
	    Random random=new Random();
	    
	    String phone = request.getParameter("phone"); // 넘어온 휴대폰 번호를 받는다.
	    for(int i=0; i<4;i++) randNum.append(random.nextInt(10)); // 인증 번호를 만드는 부분
	    HashMap<String, String> params = new HashMap<String, String>();
//	    params.put("to", phone);	// 인증 번호를 보낼 번호
//	    params.put("from", "01054487182");// 관리자 번호
//	    params.put("type", "SMS");	// 메시지 타입
//	    params.put("text", "인증 번호 : "+randNum.toString()); // 문자 내용 - 인증번호
//	    params.put("app_version", "test app 1.2");
	    try {
//	      JSONObject obj = (JSONObject) coolsms.send(params);	// 문자를 보내고 그 결과를 가져온다. 
//	      System.out.println(obj.toString());
//	      String test=obj.toString();
//	      if(test.substring(test.length()-2,test.length()-1)!="1") {	// 제대로 된 번호인지 확인
//	    	  response.getWriter().write("1");	// 잘못된 번호일 경우 1을 보낸다.
//	      }else {
//	    	  System.out.println("randNum 2 "+randNum.toString());
	    	System.out.println(randNum.toString());
	    	  response.getWriter().write(randNum.toString());	// 제대로 된 번호이므로 js에서 해당 인증번호를 사용해야 하므로 인증번호를 보낸다.
//	      }
//		} catch (IOException e) {
//			e.printStackTrace();
			
//		}catch (CoolsmsException e) {
//	      System.out.println(e.getMessage());
//	      System.out.println(e.getCode());
//		      try {
//		    	  response.getWriter().write("1"); 
//			} catch (IOException e1) {
//				e1.printStackTrace();
//			}
//	    }
		
//	    try {
//			response.getWriter().write("sad");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	// 제대로 된 번호이므로 js에서 해당 인증번호를 사용해야 하므로 인증번호를 보낸다.
	}

//	pay.jsp를 호출 
	@RequestMapping("/pay")
	@ResponseBody
	public String pay(HttpServletRequest request, Model model) {
		System.out.println("pay 메소드 실행");
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK 258c6b5703bc89deb0590ec7a3d9c222");
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true);
				String grade=request.getParameter("class");
				int gradeInt=0;
				switch(grade) {
					case "Basic":
						gradeInt=1;
						break;
					case "Standard":
						gradeInt=2;
						break;
					case "Premium":
						gradeInt=3;
						break;
					
				}
				String id=request.getParameter("id");
				String price=request.getParameter("price");
				
				
				MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
				
				int gradeCheck=mapper.selectGrade(id);
				System.out.println(gradeCheck+" 385");
				if(gradeCheck==0) {
					
					String parameter = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id="+id+"&item_name="+grade+"&quantity=1&total_amount="+price+"&vat_amount=0&tax_free_amount=0&approval_url=http://localhost:9090/project10/homePage&fail_url=http://localhost:9090/project10/homePage&cancel_url=http://localhost:9090/project10/homePage";
					OutputStream outputStream = connection.getOutputStream();
					DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
					dataOutputStream.writeBytes(parameter);
					dataOutputStream.close();
					int result = connection.getResponseCode();
					InputStream input;
					if(result == 200) {
						AbstractApplicationContext ctx=new GenericXmlApplicationContext("classpath:applicationCTX.xml");
						MemberVO vo=ctx.getBean("memberVO",MemberVO.class);
						vo.setGrade(gradeInt);
						vo.setId(id);
						System.out.println(vo+" 400");
						mapper.subscript(vo);
						request.getSession().setAttribute("grade", grade);
						input = connection.getInputStream();
					}else {
						input = connection.getErrorStream();
					}
					InputStreamReader reader = new InputStreamReader(input);
					BufferedReader bufferedReader = new BufferedReader(reader);
					return bufferedReader.readLine();
				}else if(gradeInt==gradeCheck){
					return "{\"result\":\"=\"}";
				}else if(gradeInt==1){
					return "{\"result\":\"basic\"}";
				}else if(gradeInt==2){
					return "{\"result\":\"standard\"}";
				}else if(gradeInt==3){
					return "{\"result\":\"premium\"}";
				}
		} catch (MalformedURLException e) {
				e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
	
	@RequestMapping("/wish")
	public void wish(HttpServletResponse response ,HttpServletRequest request, Model model) {
		System.out.println("MemberController wish 실행");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		int grade=Integer.parseInt(request.getParameter("grade"));
		String name=request.getParameter("itemName");
		String id=request.getParameter("id");
		String img=request.getParameter("img");
		
		int memberGrade=mapper.selectGrade(id);
		
		try {
			if(grade>memberGrade) {
					response.getWriter().write(String.valueOf(2));
					return;
			}else {
				String gradeStr="";
				switch(grade) {
					case 1:
						gradeStr="basic";
						break;
					case 2:
						gradeStr="standard";
						break;
					case 3:
						gradeStr="premium";
						break;
				}
				HashMap<String, String> hmap=new HashMap();
				hmap.put("id",id);
				hmap.put("img", img);
				if(mapper.selectItem(hmap)==1){;
					response.getWriter().write("1");
					return;
				}else {
					AbstractApplicationContext ctx=new GenericXmlApplicationContext("applicationCTX.xml");
					ItemVO item=ctx.getBean("itemVO", ItemVO.class);
					item.setFurnitureName(name);
					item.setGrade(gradeStr);
					item.setId(id);
					item.setImg(img);
					mapper.insertWish(item);
					response.getWriter().write("ok");
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/choice")
	public void choice(HttpServletResponse response ,HttpServletRequest request, Model model, ItemVO itemVO) {
		System.out.println("MemberController의 choice 실행");
		try {
			MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
			HashMap<String, String> hmap=new HashMap<String, String>();
			hmap.put("img", itemVO.getImg());
			hmap.put("id", itemVO.getId());
			if(mapper.selectItemChoice(hmap)==1) {
				response.getWriter().write("1");
				return;
			}else {
				int memberGrade=mapper.selectGrade(itemVO.getId());
				if(Integer.parseInt(itemVO.getGrade())>memberGrade) {
					response.getWriter().write("2");
					return;
				}else {
					String grade="";
					switch(itemVO.getGrade()) {
						case "1":
							grade="basic";
							break;
						case "2":
							grade="standard";
							break;
						case "3":
							grade="premium";
							break;
					}
					hmap.put("grade", grade);
					if(mapper.selectGradeItem(hmap)>=1) {
						response.getWriter().write("3");
						return;
					}else {
						hmap.put("furnitureName", itemVO.getFurnitureName());
						mapper.choiceItem(hmap);
						mapper.choiceItemCheckNum(hmap);
						response.getWriter().write("ok");
					}
				}
			}
		}catch(IOException e) {
		}
	}
	@RequestMapping("returnItem")
	public String returnItem(HttpServletRequest request, Model model, ItemVO itemVO) {
		System.out.println("MemberController returnItem 실행");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		mapper.deleteItem(itemVO);
		model.addAttribute("id", itemVO.getId());
		System.out.println(itemVO);
		return "redirect:persnerInfo";
	}
	
	@RequestMapping("deleteSubscript")
	public String deleteSubscript(HttpServletRequest request, Model model) {
		System.out.println("MemberController returnItem 실행");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		String id=request.getParameter("id"); 
		mapper.deleteSubscript(id);
		mapper.deleteItems(id);
		mapper.deleteWishAll(id);
		return "redirect:persnerInfo?id="+id;
	}
	
	@RequestMapping("updateGrade")
	public String updateGrade(HttpServletRequest request, Model model) {
		System.out.println("MemberController returnItem 실행");
		MybatisDAO mapper=sqlSession.getMapper(MybatisDAO.class);
		String id=request.getParameter("id");
		return "redirect:persnerInfo?id="+id;
	}
	
}
