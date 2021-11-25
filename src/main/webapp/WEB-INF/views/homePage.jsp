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
        <script src="js/wishAndChoice.js"></script>
        <!-- jqure -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
		<%
		String token="";
		if(request.getParameter("pg_token")!=null){
			token=request.getParameter("pg_token");
		}else{
			token="1";
		}
		%>
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
        
        <!-- Carousel -->
		<div id="demo" class="carousel slide" data-bs-ride="carousel" style="border-bottom: 20px solid #222">
		
		  <!-- Indicators/dots -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
		    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
		  </div>
		  
		  <!-- 슬라이드쇼 -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="images/flosMain.jpg" alt="FlosCompany" class="d-block" style="width:100%">
		    </div>
		    <div class="carousel-item">
		      <img src="images/bangMain.jpg" alt="B&OCompany" class="d-block" style="width:100%">
		    </div>
		    <div class="carousel-item">
		      <img src="images/zanottaMain.jpg" alt="ZanottaCompany" class="d-block" style="width:100%">
		    </div>
		  </div>
		  
		  <!-- 왼쪽 오른쪽 이동 아이콘 -->
		  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </button>
		</div>
        
        
        <!-- Basic section-->
        <section class="py-3" style="background-color: black; border-bottom: 20px solid #222">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <img alt="section2" src="images/MainSP-1.jpg">
                    </div>
                    <div class="col-lg-6" style="color: white;">
                        <p style="font-size: 60px; font-weight: bold">Basic 등급</p><br><br>
                        <p class="lead" style="font-weight: bold;">구독료 :&nbsp;&nbsp;월&nbsp;&nbsp; ₩ 350,000<br><br>500만원 이하의 고가의 다양한 조명 스피커 가구를 매월 자유롭게 즐겨보세요.</p><br><br>
                        <form class="d-flex">
                    		<c:if test="${id!=null&&id.trim().length()!=0}">
                        		<button type="button" class="btn-light btn-outline-success btn-lg flex-shrink-0" style="border: none;" id="button" onclick="pay('350000','Basic','${id}')">
                        			구독하기
                        		</button>
                    		</c:if>
                        	<c:if test="${id==null||id.trim().length()==0}">
                        		<button type="button" class="btn-light btn-outline-success btn-lg flex-shrink-0" style="border: none;" onclick="alert('로그인 후 사용가능합니다.')">
                        			구독하기
                        		</button>
                        	</c:if>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Standard section-->
        <section class="py-3" style="background-color: black; border-bottom: 20px solid #222">
            <div class="container my-5">
                <div class="row">
                    <div class="col-lg-6" style="color: white;">
                       	<p style="font-size: 60px; font-weight: bold">Standard 등급</p><br><br>
                        <p class="lead" style="font-weight: bold;">구독료 :&nbsp;&nbsp;월&nbsp;&nbsp; ₩ 450,000<br><br>1000만원 이하 럭셔리, 고급 가구를 우리집에서 만나다. 우수한 브랜드의 존재 이유를 알 수 있습니다.</p><br><br>
                        <form class="d-flex">
                    		<c:if test="${id!=null&&id.trim().length()!=0}">
                        		<button type="button" class="btn-light btn-outline-danger btn-lg flex-shrink-0" style="border: none;" onclick="pay('450000','Standard','${id}')">
                        		구독하기
                        		</button>
                    		</c:if>
                        	<c:if test="${id==null||id.trim().length()==0}">
                        		<button type="button" class="btn-light btn-outline-danger btn-lg flex-shrink-0" style="border: none;" onclick="alert('로그인 후 사용가능합니다.')">
                        		구독하기
                        		</button>
                        	</c:if>
                        </form>
                    </div>
                    <div class="col-lg-6" >
                        <img alt="section2" src="images/MainSP-2.jpg">
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Premium section-->
        <section class="py-3" style="background-color: black; border-bottom: 20px solid #222">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <img alt="section2" src="images/MainSP-3.jpg">
                    </div>
                    <div class="col-lg-6" style="color: white;">
                       	<p style="font-size: 60px; font-weight: bold">Premium 등급</p><br><br>
                        <p class="lead" style="font-weight: bold;">구독료 :&nbsp;&nbsp;월&nbsp;&nbsp; ₩ 550,000<br><br>모든 제품을 지금까지 경험해보지 못한 다양한 High-end 제품들을 매달 무제한으로 즐기세요. 추가 요금이 전혀 없습니다.</p><br><br>
                        <form class="d-flex">
                    		<c:if test="${id!=null&&id.trim().length()!=0}">
                        		<button type="button" class="btn-light btn-outline-dark btn-lg flex-shrink-0" style="border: none;" onclick="pay('550000','Premium','${id}')">
                        		구독하기
                        		</button>
                    		</c:if>
                        	<c:if test="${id==null||id.trim().length()==0}">
                        		<button type="button" class="btn-light btn-outline-dark btn-lg flex-shrink-0" style="border: none;" onclick="alert('로그인 후 사용가능합니다.')">
                        		구독하기
                        		</button>
                        	</c:if>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- Introduce section-->
        <section class="py-5" style="background-color: black;">
        	<div class="py-5" >
	            <div class="container my-5" align="center">
					<span id="faq-title"><h1>자주 묻는 질문(FAQ)</h1></span>
					<div class="faq-content">
					  <button class="question" id="que-1">
					  	<span id="que-1-toggle" style="color: white;">+</span>
					  	<span style="color: white; font-weight: bold;" >'홈페이지' 란 무엇인가요?</span>
					  </button>
					  <div class="answer" id="ans-1">'홈페이지' 는 하이엔드 스피커, 가구, 조명 등을 구독 경제 시스템을 도입하여 홈 인테리어의 새로운 변화를 선보입니다.<br>저렴한 월 요금으로 매월 새로운 '나의 집'을 경험하고, 평소 사용해 보고 싶었던 제품들을 원하는 만큼 즐길 수 있습니다.</div>
					</div>
					<div class="faq-content">
					  <button class="question" id="que-2">
					  	<span id="que-2-toggle" style="color: white;">+</span>
					  	<span style="color: white; font-weight: bold;">'홈페이지' 은(는) 어떻게 사용하나요?</span>
					  	</button>
					  <div class="answer" id="ans-2">먼저, 사용자들은 구독권을 구매한 후,<br>구독권 등급의 맞는 상품을 구독할 수 있습니다.</div>
					</div>
					<div class="faq-content">
					  <button class="question" id="que-3">
					  	<span id="que-3-toggle" style="color: white;">+</span>
					  	<span style="color: white; font-weight: bold;">'홈페이지' 구독권은 얼마인가요?</span>
					  	</button>
					  <div class="answer" id="ans-3">Basic : 월 350,000원<br>Standard : 월 450,000원<br>Premium : 월 550,000원</div>
					</div>
					<div class="faq-content">
					  <button class="question" id="que-4">
					  	<span id="que-4-toggle" style="color: white;">+</span>
					  	<span style="color: white; font-weight: bold;">멤버십을 해지하려면 어떻게 하나요?</span>
					  </button>
					  <div class="answer" id="ans-4">'홈페이지' 는 부담 없이 간편합니다.<br>성가신 계약도, 약정도 없으니까요.<br>멤버십 해지도 온라인에서 클릭 두 번이면 완료할 수 있습니다.<br>해지 수수료도 없으니 원할 때 언제든 계정을 시작하거나 종료하세요.</div>
					</div>
	            </div>
	    	</div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">(주)1조컴퍼티&nbsp;&nbsp;|&nbsp;&nbsp;대표자 : 정해승&nbsp;&nbsp;|&nbsp;&nbsp;서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층&nbsp;&nbsp;|&nbsp;&nbsp;대표문의 : 1588-5890 | Fax : 02-2135-2949</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">사업자번호 : 815-88-00171&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업번호 : 2015 - 서울강남 - 03148호</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2021 KOREA INFORMATION TECHNOLOGY ACADEMY. ALL RIGHTS RESERVED</p></div><br>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        
        <script type="text/javascript" src="js/basket.js"></script>
        <script type="text/javascript" src="js/home.js"></script>
    </body>
</html>

