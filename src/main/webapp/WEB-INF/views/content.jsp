<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<!-- Core theme CSS (includes Bootstrap)-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
	
<link href="css/productMain.css" rel="stylesheet" />
<!-- <link href="bootstrap/css/bootstrap.css" rel="stylesheet"/> -->
<style type="text/css">
	.reply .textarea{
		width: 750px;
		height: 100px;
	}
	.reply .input{
		width: 100px;
		height: 50px;
	}
	.replyTable .replyHead{
		width: 400px;
		height: 50px;
	}
	.replyTable .replyBody{
		width: 50px;
		height: 50px;
	}
	
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/view.css" rel="stylesheet" />
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
	<div class="container" style="display: flex; justify-content: center;">
		<div class="writeWrap" style="width: 1000px; height: 500px;"
			align="center">
			<div class="contentTable table">
			<br>
				<div class="writeHeader">
					<h2 class="title" align="left">&nbsp;&nbsp;제목 : ${boardVO.title}</h2>
				</div>
				<hr />
				<div class="content">
					<table>
						<tbody>
							<tr>
								<td style="text-align: left;" height="400">${boardVO.content}</td>
							</tr>
						</tbody>
					</table>
				</div>
			<hr/>
			</div>
			<!-- 댓글이 있을때 -->
				<table width="600" cellpadding="0" cellspacind="0" class="replyTable table">
					<tr align="left" class="replyHead">
						<td style="border-bottom: 1px solid;" width="600">댓글</td>
					</tr>
					<c:set var="replyList" value="${replyBoardList.list}"/>
					<c:if test="${replyList.size()==0}">
						<tr align="left" class="replyHead">
							<td style="border-bottom: 1px solid;" width="600">댓글이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${replyList.size()!=1}">
						<c:forEach var="reply" items="${replyList}">
							<tr align="left" class="replyHead">
								<td style="border-bottom: 1px solid;" width="600">${reply.id} : ${reply.reply}</td>
							</tr>
						</c:forEach>
							<tr>
								<td colspan="5" align="center">
									<!-- 처음으로 -->
									<c:if test="${replyBoardList.currentPage>1}">
										<button type="button" class="button button1" title="첫 페이지로 이동" onclick="location.href='content?idx=${idx}&currentPage=1'"><<</button>
									</c:if>
									<c:if test="${replyBoardList.currentPage<=1}">
										<button type="button" class="button button2" title="이미 첫 페이지입니다." disabled="disabled"><<</button>
									</c:if>
									<!-- 10페이지 앞으로 -->
									<c:if test="${replyBoardList.startPage>1}">
										<button type="button" class="button button1" title="이전 10페이지로" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.currentPage-replyBoardList.pageSize}'"><</button>
									</c:if>
									<c:if test="${replyBoardList.startPage<=1}"> 
										<button type="button" class="button button2" title="첫 페이지입니다." disabled="disabled"><</button>
									</c:if>
									<c:forEach var="i" begin="${replyBoardList.startPage}" end="${replyBoardList.endPage}" step="1">
										<c:if test="${replyBoardList.currentPage==i}">
												<button type="button" class="button button2" disabled="disabled">${i}</button>
										</c:if>
										<c:if test="${replyBoardList.currentPage!=i}">
												<button type="button" class="button button1" onclick="location.href='content?idx=${idx}&currentPage=${i}'">${i}</button>
										</c:if>
									</c:forEach>
									<c:if test="${replyBoardList.endPage<replyBoardList.totalPage }">
										<button type="button" class="button button1" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.currentPage+replyBoardList.pageSize}'">></button>
									</c:if>
									<c:if test="${replyBoardList.endPage>=replyBoardList.totalPage}">
										<button type="button" class="button button2" disabled="disabled">></button>
									</c:if>
									<!-- 마지막으로 -->
									<c:if test="${replyBoardList.currentPage<replyBoardList.totalPage}">
										<button type="button" class="button button1" title="마지막 페이지로 이동" onclick="location.href='content?idx=${idx}&currentPage=${replyBoardList.totalPage}'">>></button>
									</c:if>
									<c:if test="${replyBoardList.currentPage>=replyBoardList.totalPage}">
										<button type="button" class="button button2" title="마지막 페이지입니다." disabled="disabled">>></button>
									</c:if>
								</td>
							</tr>
						</c:if>
				</table>
			<br />
			<!-- 리플 글쓰기 -->
			<div style="display: flex; justify-content: center;">
				<form action="reply">
					<div class="reply" style="display: flex;">
						<textarea name="reply" placeholder="댓글을 입력해주세요" class="contentIn textarea"></textarea>
						<input type="submit" value="등록하기" class="mybtn input" style="margin-top: 50px;">
						<input type="hidden" name="idx" value="${boardVO.idx}">
						<c:if test="${id!=null}">
							<input type="hidden" name="id" value="${id}">
						</c:if>
						<c:if test="${id==null}">
							<input type="hidden" name="id" value="비회원">
						</c:if>
					</div>
				</form>
			</div>
			<input type="button" value="글 목록 보기" onclick="location.href='comunity'" class="mybtn input">
			
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>