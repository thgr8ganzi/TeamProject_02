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
        <link href="css/productDetail.css" rel="stylesheet" />
         <script type="text/javascript" src="js/wishAndChoice.js"></script>
         <script type="text/javascript" src="js/home.js"></script>
        <!-- jqure -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
    <% String id=(String)session.getAttribute("id"); 
    	session.setAttribute("id", id);
    %>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="homePage">AZUREE</a>
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
        <!-- Product section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">
                	<!-- 메인제품 이미지-->
                    <div class="col-md-6">
                    	<!-- Carousel -->
						<div id="demo" class="carousel slide" data-bs-ride="carousel">
						  <!-- Indicators/dots -->
						  <div class="carousel-indicators">
						    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
						    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
						    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
						  </div>
						  
						  <!-- 슬라이드쇼 --><!-- 600 x 700 -->
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="images/speaker/detail/speakerDetail01-00.jpg" class="d-block" style="width:100%">
						    </div>
						    <div class="carousel-item">
						      <img src="images/speaker/detail/speakerDetail01-01.jpg" class="d-block" style="width:100%">
						    </div>
						    <div class="carousel-item">
						      <img src="images/speaker/detail/speakerDetail01-02.jpg" class="d-block" style="width:100%">
						    </div>
						  </div>
						  
						  <!-- 왼쪽 오른쪽 이동 아이콘 -->
						  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
						    <span class="text-dark"><</span>
						  </button>
						  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
						    <span class="text-dark">></span>
						  </button>
						</div>
                    </div>
                    <div class="col-md-6">
                    	<!-- 제품 코드 -->
                        <div class="small mb-1">Basic 등급</div>
                        
                        <!-- 제품 이름 -->
                        <h1 class="display-5 fw-bolder">A9 4세대 블루투스스피커_Smoked Oak</h1>
                        
                        <!-- 제품 가격 -->
                        <div class="fs-5 mb-5">
                            <span>시장 판매가 : 4,199,000원</span>
                        </div>
                        
                        <!-- 제품 설명란 -->
                        <p class="lead">Beoplay A9 4세대는 주거 공간을 풍부하고 강력한 사운드로 채워드립니다. 음향 기술적으로 유쾌한 주변 소리와 고르게 분산되면서 강력한 사운드 체험을 통합할 수 있습니다. 액티브 룸 보정 기능을 도입하여 스피커의 위치를 기준으로 사운드 성능을 최적화했습니다.</p>
                        
                        <div class="d-flex">
                            <c:if test="${id!=null&&id.trim().length()!=0}">
	                        	<button class="btn btn-outline-danger flex-shrink-0" type="submit" style="max-width: 10rem;" onclick="wish('1','A9 4세대 블루투스스피커_Smoked Oak', '${id}','speaker/detail/speakerDetail01-00')"><i class="bi bi-heart"></i> 
		                        	관심등록하기
		                        </button>&nbsp;&nbsp;&nbsp;
		                        <button class="btn btn-outline-success flex-shrink-0" type="submit" style="max-width: 10rem" onclick="choice('1','A9 4세대 블루투스스피커_Smoked Oak', '${id}','speaker/detail/speakerDetail01-00')">
		                        &nbsp;구독하기&nbsp;
		                        </button>
		                	</c:if>
		                	<c:if test="${id==null||id.trim().length()==0}">
		                		<button class="btn btn-outline-danger flex-shrink-0" type="submit" style="max-width: 10rem;" onclick="alert('로그인 후 사용가능합니다.')"><i class="bi bi-heart"></i> 
		                        	관심등록하기
		                        </button>&nbsp;&nbsp;&nbsp;
		                        <button class="btn btn-outline-success flex-shrink-0" type="submit" style="max-width: 10rem" onclick="alert('로그인 후 사용가능합니다.')">
		                        &nbsp;구독하기&nbsp;
		                        </button>
		                	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 관령 제품 section-->
        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Related products</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">Basic</div>
                            <!-- 제품 이미지-->
                            <img class="card-img-top" src="images/speaker/speakerMain00.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 관련 제품 이름-->
                                    <h5 class="fw-bolder">A9 4세대 블루투스스피커_Smoked Oak</h5>
                                    <!-- 관련 제품 가격-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="speakerDetail00">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">Basic</div>
                            <!-- 제품 이미지-->
                            <img class="card-img-top" src="images/speaker/speakerMain02.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 관련 제품 이름-->
                                    <h5 class="fw-bolder">BeoSound Edge 블루투스 스피커</h5>
                                    <!-- 제품 추천(별 개수) -->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- 관련 제품 가격-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="speakerDetail02">View options</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">Basic</div>
                            <!-- 제품 이미지-->
                            <img class="card-img-top" src="images/speaker/speakerMain03.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 관련 제품 이름-->
                                    <h5 class="fw-bolder">사운드바 베오사운드 스테이지+플로어 스탠드 세트</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- 관련 제품 가격-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="speakerDetail03">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">Basic</div>
                            <!-- 제품 이미지-->
                            <img class="card-img-top" src="images/speaker/speakerMain04.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- 관련 제품 이름-->
                                    <h5 class="fw-bolder">A9 4세대 블루투스스피커</h5>
                                    <!-- Product 추천-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="speakerDetail04">View options</a></div>
                            </div>
                        </div>
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
        <script src="js/productDetail.js"></script>
    </body>
</html>