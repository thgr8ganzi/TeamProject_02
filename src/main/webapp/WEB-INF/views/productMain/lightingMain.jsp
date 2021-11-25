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
        <link href="css/productMain.css" rel="stylesheet" />
        <script type="text/javascript" src="js/home.js"></script>
    </head>
    <body>
    <% String id=(String)session.getAttribute("id"); 
    	session.setAttribute("id", id);
    %>
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
	      				<button type="button" class="btn btn-outline-danger flex-shrink-0" style="border: none;" onclick="alert('로그인 후 사용가능합니다.')">
	      					<i class="bi bi-heart me-1"></i>
					      	Wish
	      				</button>
					</div>
				</div>
			</div>
		</c:if>
		
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" 
                	aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                	<span class="navbar-toggler-icon"></span></button>
                	
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-0 mb-lg-0">
                        <li class="nav-item"><a class="nav-link"  href="homePage">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="speakerMain">Speaker</a></li>
                        <li class="nav-item"><a class="nav-link" href="interiorMain">Interior</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Lighting</a></li>
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
        
        <!-- Header-->
        <header class="py-5 bg-image-full" style="background-image: url('images/lighting/lightingMainP.jpg')">
            <div class="container px-5 px-lg-5 my-5" >
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">LIGHTING</h1>
                </div>
            </div>
        </header>
        
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: # FFD700;">Premium</div>
                            <!-- 1번 제품 이미지--><!-- 450 x 300 -->
                            <img class="card-img-top" src="images/lighting/lightingMain00.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Zeppelin 2 Pendant, White</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail00">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: # FFD700;">Premium</div>
                            <!-- 2번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain01.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Nebula</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail01">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: # FFD700;">Premium</div>
                            <!-- 3번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain02.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Taraxacum 88 S2 Pendant LED</h5>
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail02">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: # FFD700;">Premium</div>
                            <!-- 4번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain03.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Noctambule Suspension Cylinder(6 High)</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                    <!-- Product price-->
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail03">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: black;">Standard</div>
                            <!-- 5번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain04.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Superloon</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail04">View options</a></div>
                                
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: black;">Standard</div>
                            <!-- 6번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain05.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Skygarden 2 Pendent, Black</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail05">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem; color: black;">Standard</div>
                            <!-- 7번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain06.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Cocoon Chrysalis</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail06">View options</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                        	<!-- 등급 badge-->
                            <div class="badge bg-success text-white position-absolute" style="top: 0.5rem; right: 0.5rem;">Basic</div>
                            <!-- 8번 제품 이미지-->
                            <img class="card-img-top" src="images/lighting/lightingMain07.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">Table Gun Table Lamp, Gold</h5>
                                    <!-- Product reviews-->
                                    <div class="d-flex justify-content-center small text-warning mb-2">
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                        <div class="bi-star-fill"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="lightingDetail07">View options</a></div>
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
        <script src="js/productMain.js"></script>
    </body>
</html>