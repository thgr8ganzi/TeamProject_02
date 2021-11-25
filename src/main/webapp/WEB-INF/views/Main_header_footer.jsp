<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>High-end-SHOP</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
    </head>
    <body>
    <% String id=(String)session.getAttribute("id"); 
    	session.setAttribute("id", id);
    %>
    
    	<!-- 홈페이지 메인P 상단 -->
	  	<c:if test="${id!=null&&id.trim().length()!=0}">
	    	<div class="container-fluid p-5 bg-white text-black">
				<div class="row">
			    	<div class="col-sm-6 text-center">
						<a class="navbar-brand" href="homePage"><img alt="" style="width:150px; height: 120px" src="images/title.png"></a>
			    	</div>
			    	<div class="col-sm-6 text-center" >
	      				<button type="button" class="btn" onclick="location.href='logout'">logout</button>
	      				<button type="button" class="btn" onclick="location.href='persnerInfo'">My</button>
	      				<button type="button" class="btn">
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
						<h1>홈페이지 이름</h1>
			    	</div>
			    	<div class="col-sm-6 text-center" >
	      				<button type="button" class="btn" onclick="login('login')">Login</button>
	      				<button type="button" class="btn" onclick="login('join')">Join</button>
	      				<button type="button" class="btn" onclick="alert('로그인 후 사용가능합니다.')">My</button>
	      				<button type="button" class="btn" onclick="alert('로그인 후 사용가능합니다.')">
	      					<i class="bi bi-heart me-1"></i>
					      	Wish
	      				</button>
					</div>
				</div>
			</div>
		</c:if>
        <!-- navbar-->
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
        
        <!-- ============================================================================================================ -->
        
        <!-- 서브 P 네비바-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="homePage">홈페이지 이름</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="homePage">Home</a></li>
                         <li class="nav-item"><a class="nav-link active" aria-current="page" href="speakerMain">Speaker</a></li>
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
                    <form class="d-flex">
                    	<c:if test="${id!=null&&id.trim().length()!=0}">
					    	<div class="container-fluid bg-light text-black">
								<div class="row">
							    	<div class="text-center" >
					      				<button type="button" class="btn" onclick="location.href='logout'">logout</button>
					      				<button type="button" class="btn" onclick="location.href='persnerInfo'">My</button>
					      				<button type="button" class="btn btn-outline-danger flex-shrink-0" style="border: none;">
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
        
        
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">(주)1조컴퍼티&nbsp;&nbsp;|&nbsp;&nbsp;대표자 : 정해승&nbsp;&nbsp;|&nbsp;&nbsp;서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층&nbsp;&nbsp;|&nbsp;&nbsp;대표문의 : 1588-5890 | Fax : 02-2135-2949</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">사업자번호 : 815-88-00171&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업번호 : 2015 - 서울강남 - 03148호</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2021 KOREA INFORMATION TECHNOLOGY ACADEMY. ALL RIGHTS RESERVED</p></div><br>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/home.js"></script>
    </body>
</html>

