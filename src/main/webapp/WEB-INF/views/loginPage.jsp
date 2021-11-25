<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/login.js"></script>
<!-- jqure -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">

</style>
</head>

<!-- 헤더 -->
<div class="header">
	<!-- <a class="navbar-brand" href="homePage"><img alt="" style="width:150px; height: 120px" src="images/title.png"></a> -->
</div>

<body width="100%" height="100%" onload="job('${job}')" style="background-image: url('images/loginback.jpg')">
	<div class="loginForm" id="login">
      <h1>Login</h1>
	      <div class="idForm">
	        <input type="text" name="id" class="id" placeholder="id" autocomplete="off">
	      </div>
	      <div class="pwForm">
	        <input type="password" name="password" class="pw" placeholder="password" autocomplete="off">
	      </div>
      <div>
      	<input type="button" href="#" class="btn" onclick="login('login')" value="LOG IN">	
        <input type="button" href="#" class="btn" onclick="job('join')" value="회원가입">
          <div class="bottomText" style="margin-right: 5px;">forgot ID?&nbsp;&nbsp;<a href="#" onclick="job('find')" style="color: orange;">find ID</a></div>
          <div class="bottomText" style="margin-right: 5px;">forgot PW?&nbsp;&nbsp;<a href="#" onclick="job('pwFind')" style="color: orange;">find PW</a></div>
      </div>
    </div>
    `
    <div id="checkMessage">
	    <div class="loginForm2">
	        <div class="backbutton"><a type="submit" href="#" onclick="job('login')" style="color: orange;">◀back</a></div>
	      <div class="findForm">
	        <input type="text" name="phone" id="phoneNum" class="id" placeholder="'-'없이 휴대폰 번호를 입력하세요." autocomplete="off"">
	      </div>
	        <div>
	        <input type="button" value="문자발송" onclick="message()"style=" width: 30%">
	        </div>
 
	      <div class="findForm">
	        <input type="text" name="num" class="id" placeholder="인증번호를 입력하세요." autocomplete="off" >
	        <span id="true" style="display: none;"></span>
	      </div>
	        <div>
	        <input type="button" value="확인" onclick="numCheck()"style=" width: 31%"><br/>
	        </div>
    	</div>
    </div>
    
	<div class="joinForm" id="join">
      <h1>Join</h1>
      	<div class="flex-container">
      		<div class="flex-box">
      		<div class="a">
		      <div class="idForm1" style="float: left; width: 68%; margin-right: 2%;">
				<input type="text" id="id" name="id" class="id" onkeyup="idCheck2()" placeholder="ID" autocomplete="off">
		      </div>
		      <div class="idConfirm" style="float: left;">
		      <input type="button" onclick="idCheck()" value="중복 검사"></div>
      		</div>
				<span id="idCheck" style="font-size:11px; color: white;"></span>
      		
      		<div class="a">
		      <div class="pwForm1">
		        <input type="password" name="password" class="pw" onkeyup="passwordPattenCheck()" placeholder="Password" autocomplete="off">
		      </div>
		        <span  id="password1" style="font-size:11px; color: white;"></span>
      		</div>
		      
		    <div class="a">
		      <div class="idForm1">
		        <input type="password" name="password2" class="pw" onkeyup="passwordCheck()" placeholder="Password Check" autocomplete="off">
		      </div>
		        <span  id="password2" style="font-size:11px; color: white;"></span>
		  	</div>  
		  </div>
		  
		    <div class="flex-box">
		    <div class="a">
		      <div class="pwForm1">
		        <input type="text" name="name" class="id" placeholder="name" autocomplete="off">
		      </div>
		     	</div>
		     
		     <div class="a">
		      <div class="pwForm1">
		        <input type="text" name="addr" class="id" placeholder="addr" autocomplete="off">
		      </div>
		     </div>	
		      
		      <div class="a">
		      <div class="pwForm1">
		        <input type="text" name="tel" class="pw" placeholder="tel" autocomplete="off">
		      </div>
		      </div>
		    </div>
		    
		    
		    <div class="flex-box">
		      <div class="a">
		      <div class="idForm1">
		        <input type="text" name="phone" class="id" placeholder="phone" autocomplete="off"> <div class="idConfirm"><input type="button" onclick="joinPhoneCheck()" value="인증번호 받기"/></div>
		        <input type="text" class="id" id="joinPhoneCheck" style="display: none;" placeholder="인증 번호를 입력하세요."/>
		        <input type="button" id="phoneNumBtn" style="display: none;" onclick="joinPhoneCheck2()" value="확인"/>
		      </div>
		      </div>
		      
		      <div class="a">
		      <div class="idForm1">
		        <input type="email" name="email" class="id" placeholder="email" autocomplete="off">
		      </div>
		      </div>

		      <div style="color: white; padding: 10px 10px;">
		        <label class="ChoiceGender" onclick="checked(this)" >
		        <input checked="checked" type="radio" name="sex" value="1">남</label> <label class="gender" onclick='checked(this)'><input type="radio" name="sex" value="0" style="color: white; background-color: black;">여</label>
		      </div>
		    </div>
		</div>
      <div class="flex-btn">
      	<div class="flex-btnbox">
	      	<input type="button" href="#" class="btn" onclick="join()" value="가입하기">
	    </div>
      	<div class="flex-btnbox">
	        <input type="button" href="#" class="btn" onclick="job('login')" value="이전페이지">
	    </div>
      </div>
    </div>
    
    
    <div id="pwFind">
	    <div class="loginForm2">
	        <div class="backbutton"><a type="submit" href="#" onclick="job('login')" style="color: orange;">◀back</a></div>
	        
	      <div class="findForm">
	        <input type="text" name="pwFindid" id="pwFind_id" class="id" placeholder="아이디를 입력하세요." autocomplete="off">
	      </div>

	      <div class="findForm">
	        <input type="text" name="phone" id="pwFind_phoneNum" class="id" placeholder="'-'없이 휴대폰 번호를 입력하세요." autocomplete="off">
	      </div>
	        <div>
	        <input type="button" value="문자발송" onclick="pw_message()" style=" width: 30%"/>
	        </div>
 
	      <div class="findForm">
	        <input type="text" name="num2" class="id" placeholder="인증번호를 입력하세요." autocomplete="off">
	        <span id="true" style="display: none;"></span>
	      </div>
	        <div>
	        <input type="button" value="확인" onclick="numCheck2()" style=" width: 31%"/><br/>
	        </div>
	</div>      
	      <div id="newPW" style="display: none;">
		      <div class="idForm2" id="phoneNumBtn">
		        <input type="password" name="newPW" class="id" id="pwFind_phoneNum" placeholder="새 비밀번호를 입력하세요." autocomplete="off" onkeyup="passwordPattenCheck2()">
		        <span id='password3'></span>
		      </div>
		      <div class="idForm2" id="joinPhoneCheck">
		        <input type="password" name="newPW2" class="id" id="pwFind_phoneNum" placeholder="비밀번호를 한 번 더 입력하세요." autocomplete="off" onkeyup="passwordCheck2()">
		        <span id="password4" style=""></span><br/>
		        <input type="button" value="확인" onclick="newPW()"/>
		      </div>
    	</div>
    </div>
		<input type="hidden" id="idCheck2" value="2"/>
		<input type="hidden" id="messageNum"/>
		<input type="hidden" id="hiddenId"/>
		<input type="hidden" id="newPwCheck"/>
		<input type="hidden" id="pass" value="0"/>
		<input type="hidden" id="phoneCheckNum"/>
</body>
</html>