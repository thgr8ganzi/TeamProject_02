<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/basket.js" ></script>
<link href="css/productMain.css" rel="stylesheet"/>
<script src="js/wishAndChoice.js" ></script>
<!-- 
<link rel="stylesheet" href="css/basket.css">
 -->
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
<c:if test="${grade!=null}">
	<input type="hidden" id="grade" value="${grade}"/>
</c:if>
	<input type="hidden" id="grade" value=""/>
    	<!-- 홈페이지 메인 상단 -->
	  	<c:if test="${id!=null&&id.trim().length()!=0}">
	    	<div class="container-fluid p-5 bg-white text-black">
				<div class="row">
			    	<div class="col-sm-6 text-center">
						<a class="navbar-brand" href="homePage"><img alt="" src="images/title.png"></a>
			    	</div>
			    	<div class="col-sm-6 text-center" >
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
	    	<div class="container-fluid p-5 bg-white text-black">
				<div class="row">
			    	<div class="col-sm-6 text-center">
						<a class="navbar-brand" href="homePage"><img alt="" src="images/title.png"></a>
			    	</div>
			    	<div class="col-sm-6 text-center" >
	      				<button type="button" class="btn" onclick="login('login')">Login</button>
	      				<button type="button" class="btn" onclick="login('join')">Join</button>
	      				<button type="button" class="btn" onclick="alert('로그인 후 사용가능합니다.')">My</button>
	      				<button type="button" class="btn btn-outline-danger flex-shrink-0" style="border: none;"onclick="alert('로그인 후 사용가능합니다.')">
	      					<i class="bi bi-heart me-1"></i>
					      	Wish
	      				</button>
					</div>
				</div>
			</div>
		</c:if>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                	aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                	<span class="navbar-toggler-icon"></span></button>
                	
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-0 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="speakerMain">Speaker</a></li>
                        <li class="nav-item"><a class="nav-link" href="interiorMain">Interior</a></li>
                        <li class="nav-item"><a class="nav-link" href="lightingMain">Lighting</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Service</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="as">Offline Store</a></li>
                                <li><a class="dropdown-item" href="comunity">Q & A</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
	<!-- 장바구니 -->	
	<br/>
	<!-- <form id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;" name="orderform"> -->
		<!-- 컨터이너 시작 -->
		<div class="container" align="center">
			<div style="width: 800px; display: flex; background-color: #d2d2d2; height: 30px;">
					<div style="width: 10%" align="center">등급</div>
					<div style="width: 30%" align="center">이미지</div>
					<div style="width: 20%" align="center">상품명</div>
					<div style="width: 20%" align="center">사용</div>
					<div style="width: 20%" align="center">삭제</div>
			</div>
			<!-- 상품 한묶음 -->
			<div id="basket">
			<br>
			<c:if test="${itemList.size()==0}">
				<div style="text-align: center;">
					관심목록이 없습니다.
				</div>
			</c:if>
			<c:if test="${itemList.size()!=0}">
				<c:forEach var="item" items="${itemList}">
					<div class="basket" style="width: 800px; display: flex;">
						<c:if test="${item.grade=='basic'}">
							<c:set var="grade" value="1"/>
							<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute">Basic</div></div>
						</c:if>
						<c:if test="${item.grade=='standard'}">
							<c:set var="grade" value="2"/>
							<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute">Standard</div></div>
						</c:if>
						<c:if test="${item.grade=='premium'}">
							<c:set var="grade" value="3"/>
							<div style="width: 10%" align="center"><div class="badge bg-success text-white position-absolute">Premium</div></div>
						</c:if>
						<div style="width: 30%" align="center"><img alt="" src="images/${item.img}.jpg" style="width: 100px; height: 100px;"></div>
						<div style="width: 20%" align="center">${item.furnitureName}</div>
						<div style="width: 20%" align="center"><button class="btn btn-secondary" onclick="choice('${grade}','${item.furnitureName}', '${id}','${item.img}')">사용</button></div>
						<form action="deleteWishItem" style="width: 20%">
							<div align="center"><button width="20%" class="btn btn-secondary" type="submit">삭제</button></div>
							<input type="hidden" value="${id}" name="id"/>
							<input type="hidden" value="${item.img}" name="img"/>
						</form>
					</div>
					<hr style="width: 800px; color:#999999; border-style:dotted">
				</c:forEach>
			</c:if>
			</div>
			
			<!-- 구매하기버튼 -->
			<br>
			<div style="width: 1200px;">
				<div align="center"><input id="button" class="btn btn-secondary" onclick="pay()" value="구매하기" type="button"></div>
			</div>
		</div>
	<!-- </form> -->
	
</body>
</html>




















