<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>AS게시판</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/view.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/productMain.css" rel="stylesheet"/>
<link href="css/productDetail.css" rel="stylesheet"/>
<link href="css/view.css" rel="stylesheet" />
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/> -->
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
		<table id="table" class="table table-striped" width="900px" align="center"
			border="1" cellpadding="0" cellspacing="0" class="table">
			<thead>
				<tr>
					<th colspan="6" class="text-center">AS센터 게시판</th>
				</tr>
				<tr>
					<td class="td" width="100" align="center">글번호</td>
					<td class="td" width="200" align="center">아이디</td>
					<td class="td" width="200" align="center">제목</td>
					<td class="td" width="200" align="center">작성시간</td>
					<td class="td" width="100" align="center">조회수</td>
					<td class="td" width="100" align="center">댓글수</td>
				</tr>
			</thead>
			
			<tbody class="table table-hover">
			<c:set var="list" value="${boardList.list}"/>
			<c:if test="${list.size()==0}">
				<tr style="color:#8B4513;">
					<td colspan="6">문의 내용이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${list.size()!=0}">
				<jsp:useBean id="date" class="java.util.Date"/>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td class="td" style="color:#282828;" align="center">${vo.idx}</td>
						<td class="td" style="color:#282828;" align="center">
							<c:set var="id" value="${fn:replace(vo.id,'<','&lt;')}"></c:set>
							<c:set var="id" value="${fn:replace(id,'>','&gt;')}"></c:set>
							<a class="content" href="content?idx=${vo.idx}">${id}</a>
						</td>
						<td class="td" style="color:#282828;" align="center">
							<c:set var="title" value="${fn:replace(vo.title,'<','&lt;')}"></c:set>
							<c:set var="title" value="${fn:replace(title,'>','&gt;')}"></c:set>
							<a class="content" href="content?idx=${vo.idx}">${title}</a></td>
						<td style="color:#282828;" align="center">
						<c:if test="${date.year==vo.writeDate.year&&date.month==vo.writeDate.month&&date.date==vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="a h:mm"/></c:if>
						<c:if test="${date.year!=vo.writeDate.year||date.month!=vo.writeDate.month||date.date!=vo.writeDate.date}">
						<fmt:formatDate value="${vo.writeDate}" pattern="yyyy. MM. dd. E요일"/></c:if>
						</td>
						<td style="color:#282828;" class="td" align="center">${vo.hit}</td>
						<td style="color:#282828;" class="td" align="center">${vo.replyCount}</td>
					</tr>
				</c:forEach>
			</c:if>
				<tr>
					<td colspan="6" align="center">
						<!-- 처음으로 -->
						<c:if test="${boardList.currentPage>1}">
							<button type="button" class="button button1" title="첫 페이지로 이동" onclick="location.href='?currentPage=1'"><<</button>
						</c:if>
						<c:if test="${boardList.currentPage<=1}">
							<button type="button" class="button button2" title="이미 첫 페이지입니다." disabled="disabled"><<</button>
						</c:if>
						<!-- 10페이지 앞으로 -->
						<c:if test="${boardList.startPage>1}">
							<button type="button" class="button button1" title="이전 10페이지로" onclick="location.href='?currentPage=${boardList.currentPage-boardList.pageSize}'"><</button>
						</c:if>
						<c:if test="${boardList.startPage<=1}"> 
							<button type="button" class="button button2" title="첫 페이지입니다." disabled="disabled"><</button>
						</c:if>
						<c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
							<c:if test="${boardList.currentPage==i}">
									<button type="button" class="button button2" disabled="disabled">${i}</button>
							</c:if>
							<c:if test="${boardList.currentPage!=i}">
									<button type="button" class="button button1" onclick="location.href='?currentPage=${i}'">${i}</button>
							</c:if>
						</c:forEach>
						<c:if test="${boardList.endPage<boardList.totalPage }">
							<button type="button" class="button button1" onclick="location.href='?currentPage=${boardList.currentPage+boardList.pageSize}'">></button>
						</c:if>
						<c:if test="${boardList.endPage>=boardList.totalPage}">
							<button type="button" class="button button2" disabled="disabled">></button>
						</c:if>
						<!-- 마지막으로 -->
						<c:if test="${boardList.currentPage<boardList.totalPage}">
							<button type="button" class="button button1" title="마지막 페이지로 이동" onclick="location.href='?currentPage=${boardList.totalPage}'">>></button>
						</c:if>
						<c:if test="${boardList.currentPage>=boardList.totalPage}">
							<button type="button" class="button button2" title="마지막 페이지입니다." disabled="disabled">>></button>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<div class="table list-search" align="center">
								검색할 내용을 입력하세요.
								<form style="display:inline;" action="search" name=form onsubmit="return searchCheck(this)">
									<select name="tag" style="width: 100px; height: 25px;">
										<option selected="selected">아이디</option>
										<option>제목</option>
										<option>아이디+제목</option>
									</select>
									<input type="text" name="search" id="search" autocomplete="off" placeholder="검색어를 입력해주세요.">
									<input class="button button1" type="submit" value="검색" >
								</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<hr/>
		<div class="btnDiv">
			<a class="mybtn btn btn-default pull-right" href="insert" align="right">글쓰기</a>&nbsp;&nbsp;
			<a class="mybtn btn btn-default" href="as">AS센터위치</a>
		</div>
	</div>
	<br>
	<footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">(주)1조컴퍼티&nbsp;&nbsp;|&nbsp;&nbsp;대표자 : 정해승&nbsp;&nbsp;|&nbsp;&nbsp;서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층&nbsp;&nbsp;|&nbsp;&nbsp;대표문의 : 1588-5890 | Fax : 02-2135-2949</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">사업자번호 : 815-88-00171&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업번호 : 2015 - 서울강남 - 03148호</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2021 KOREA INFORMATION TECHNOLOGY ACADEMY. ALL RIGHTS RESERVED</p></div><br>
        </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/productMain.js"></script>
</body>
</html>