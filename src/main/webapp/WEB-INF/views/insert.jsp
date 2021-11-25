<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<style type="text/css">

.textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
    border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
div {
    display: block;
}
body {
    position: relative;
    -webkit-text-size-adjust: none;
    font-weight: 400;
    font-family: Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,돋움,dotum,sans-serif;
    color: var(--skinTextColor);
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet" /> -->
<link href="css/productMain.css" rel="stylesheet"/>

<title>글쓰기</title>
</head>
<head>
<style type="text/css">

.textarea_input {
    display: block;
    width: 100%;
    min-height: 40px;
    padding: 11px 12px 10px;
    border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
}
h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}
div {
    display: block;
}
body {
    position: relative;
    -webkit-text-size-adjust: none;
    font-weight: 400;
    font-family: Apple SD Gothic Neo,맑은 고딕,Malgun Gothic,돋움,dotum,sans-serif;
    color: var(--skinTextColor);
}
</style>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico"/>
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet"/>
<link href="css/productMain.css" rel="stylesheet"/>
<link href="css/view.css" rel="stylesheet"/>
<!-- <link href="css/insert.css" rel="stylesheet"/> -->
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/> -->
<title>글쓰기</title>
</head>
<body style="background-image: url(images/6.jpg);">
 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="homePage">AZUREE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="homePage">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="speakerMain">Speaker</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="interiorMain">Interior</a></li>
                        <li class="nav-item"><a class="nav-link" href="lightingMain">Lighting</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Service</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="as">Offline Store</a></li>
                                <li><a class="dropdown-item" href="comunity">Q & A</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                    	<c:if test="${id!=null&&id.trim().length()!=0}">
					    	<div class="container-fluid bg-light text-black">
								<div class="row">
							    	<div class="text-center" >
					      				<button type="button" class="btn" onclick="location.href='logout'">logout</button>
					      				<button type="button" class="btn" onclick="location.href='persnerInfo?id=${id}'">My</button>
					      				<button onclick="location.href='basket?id=${id}'" type="button" class="btn btn-outline-danger flex-shrink-0" style="border: none;">
					      					<i class="bi bi-heart me-1"></i>
									      	Wish
					      				</button>
									</div>
								</div>
							</div>
						</c:if>
					   <c:if test="${id==null||id.trim().length()==0}">
					    	<div class="container-fluid bg-light text-black">
								<div class="row">
							    	<div class="text-center" >
					      				<button type="button" class="btn" onclick="login('login')">Login</button>
					      				<button type="button" class="btn" onclick="login('join')">Join</button>
					      				<button type="button" class="btn" onclick="alert('로그인 후 사용가능합니다.')">My</button>
					      				<button type="button" class="btn btn-outline-danger flex-shrink-0" style="border: none;" onclick="alert('로그인 후 사용가능합니다.')">
					      					<i class="bi bi-heart me-1"></i>
					      					Wish
					      				</button>
									</div>
								</div>
							</div>
						</c:if>
                    </form>
                </div>
            </div>
        </nav>
     <br/>
	<div class="container">
		<form action="insertOK">
			<div class="writeWrap" style="width: 1000px; height: 580px;" align="center">
				<div class="writeHeader">
					<h2 class="title" align="center">질문하기</h2>			
				</div>
				<hr/>
				<div class="writeTitle">
					<textarea name="title" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;"></textarea>
				</div>
				<hr/>
				<div class="content">
					<textarea class="contentIn" rows="12" cols="20" name="content" style="resize: none; width: 98%;" placeholder="내용을 입력해 주세요."></textarea>
				</div>
				<br/>
				<div class="btnFlex">
					<button type="submit" class="mybtn btn btn-default" align="center">등록하기</button>&nbsp;&nbsp;
					<button type="button" class="mybtn btn btn-default" align="center" onclick="location.href='comunity'">뒤로가기</button>
				</div>
				<c:if test="${id!=null}">
					<input type="hidden" name="id" value="${id}">
				</c:if>
				<c:if test="${id==null}">
					<input type="hidden" name="id" value="비회원">
				</c:if>
			</div>
		</form>
	</div>
	
	<!-- 풋터 -->
	<footer style="bottom: 0px;" class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">(주)1조컴퍼티&nbsp;&nbsp;|&nbsp;&nbsp;대표자 : 정해승&nbsp;&nbsp;|&nbsp;&nbsp;서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층&nbsp;&nbsp;|&nbsp;&nbsp;대표문의 : 1588-5890 | Fax : 02-2135-2949</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">사업자번호 : 815-88-00171&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업번호 : 2015 - 서울강남 - 03148호</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2021 KOREA INFORMATION TECHNOLOGY ACADEMY. ALL RIGHTS RESERVED</p></div><br>
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="js/productMain.js"></script>
</body>
</html>