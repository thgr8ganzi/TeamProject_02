<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/home.css" rel="stylesheet" />
<title>Insert title here</title>
<style type="text/css">
.ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #f1f1f1;
}
.li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}
.li a.active {
    background-color: #000;
    color: white;
}
.li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
footer{
	clear: both;
}
</style>
<script src="js/as.js" ></script>
</head>
<body>
<% String id=(String)session.getAttribute("id"); 
	session.setAttribute("id", id);
%>
<!-- 서브 P 네비바-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="homePage">AZUREE</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link" href="homePage">Home</a></li>
                         <li class="nav-item"><a class="nav-link active" href="speakerMain">Speaker</a></li>
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
        
        
	<br/>
	<!-- 지도 -->
	<div class="container" id="container" style="display: flex;">
		<div id="map" style="width: 800px; height: 800px; display: inline;"></div>
		<div id="container2" style="width: 18%; display: flex;" >
			<ul class="ul">
		      <li class="li"><a class="active">매장위치</a></li>
		      <li class="li" onclick="a1()"><a>서초키친프라자</a></li>
		      <li class="li" onclick="a2()"><a>(주)한샘유나이티드</a></li>
		      <li class="li" onclick="a3()"><a>플래그샵 방배점</a></li>
		      <li class="li" onclick="a4()"><a>가구수리통영자게장</a></li>
		      <li class="li" onclick="a5()"><a>영동가구수리센타</a></li>
		      <li class="li" onclick="a6()"><a>가구수리119</a></li>
		      <li class="li" onclick="a7()"><a>행복가구수리</a></li>
		      <li class="li" onclick="a8()"><a>레드플래닛 하남점</a></li>
		      <li class="li" onclick="a9()"><a>이케아 광명점</a></li>
		      <li class="li" onclick="a10()"><a>이케아 기흥점</a></li>
		      <li class="li" onclick="a11()"><a>이케아 고양점</a></li>
		      <li class="li" onclick="a12()"><a>이케아 동부산점</a></li>
		      <li class="li" onclick="a13()"><a>스타필드 안성</a></li>
		    </ul>
		</div>
		
		<br>
		<div id="container3" style="width: 300px; margin-right: 0px; margin-left: 10px;">
			원하는 매장을 클릭시 <br>매장주소, 영업시간, 전화번호가 표시됩니다.
		</div>
	</div>
	<br/>
	<!-- 풋터 -->
	<footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">(주)1조컴퍼티&nbsp;&nbsp;|&nbsp;&nbsp;대표자 : 정해승&nbsp;&nbsp;|&nbsp;&nbsp;서울특별시 강남구 테헤란로 146 현익빌딩 3층,4층&nbsp;&nbsp;|&nbsp;&nbsp;대표문의 : 1588-5890 | Fax : 02-2135-2949</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">사업자번호 : 815-88-00171&nbsp;&nbsp;|&nbsp;&nbsp;통신판매업번호 : 2015 - 서울강남 - 03148호</p></div><br>
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2021 KOREA INFORMATION TECHNOLOGY ACADEMY. ALL RIGHTS RESERVED</p></div><br>
        </footer>
        
	<!-- 지도 js 파일 -->
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a76e79a8afe55dfdc875941c4ecd0cee"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.51046091724093, 126.9960699844713), // 지도의 중심좌표
			level : 8,		// 지도의 확대 레벨
			 mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		};
		// 지도를 생성한다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		var data = [
			[37.505749458885994, 127.02255646351706, '<div style="padding:5px;">서초키친프라자</div>'],
			[37.50008182735071, 126.99839235322463, '<div style="padding:5px;">(주)한샘유나이티드</div>'],
			[37.49899826057006, 126.98567992998383, '<div style="padding:5px;">플래그샵 방배점</div>'],
			[37.499846518158144, 127.07627732130388, '<div style="padding:5px;">가구수리통영자게장</div>'],
			[37.53982781399092, 127.06207007055734, '<div style="padding:5px;">영동가구수리센타</div>'],
			[37.525150350632224, 126.89935320465486, '<div style="padding:5px;">가구수리119</div>'],
			[37.48544884329952, 126.90618550971472, '<div style="padding:5px;">행복가구수리</div>'],
			[37.53446192766364, 127.23073280082848, '<div style="padding:5px;">레드플래닛 하남점</div>'],
			[37.42429446722628, 126.88273782379433, '<div style="padding:5px;">이케아 광명점</div>'],
			[37.22286407486171, 127.11608669866199, '<div style="padding:5px;">이케아 기흥점</div>'],
			[37.63587342090475, 126.86114460393814, '<div style="padding:5px;">이케아 고양점</div>'],
			[35.19120016391626, 129.21047394096277, '<div style="padding:5px;">이케아 동부산점</div>'],
			[36.994961174162356, 127.14742677167598, '<div style="padding:5px;">스타필드 안성</div>'],
		]
		
		for(var i = 0; i < data.length; i++){
	
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(data[i][0], data[i][1])
			});
	
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
	
	
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : data[i][2]
			});
	
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			// infowindow.open(map, marker);
			
		}
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}

		
	</script>
</body>
</html>
</html>