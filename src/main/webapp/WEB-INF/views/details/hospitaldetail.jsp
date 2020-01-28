<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 병원상세</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">

						<div class="image left" style="height: 100%; margin-left: 5%">
							<!-- <img src="resources/images/pic10.jpg" alt="" /> -->
							<div id="map" style="width: 100%; height: 350px;"></div>
						</div>
						<header>
							<h1 class="koreanfont hospitalnamesize">
								<i class="icon far fa-heart"
									style="float: right; color: #f56a6a; margin-right: 5%"
									id="fav_hos"></i>${vo.yadmNm }
							</h1>
							<p
								style="font-size: 12pt; font-family: Open Sans, sans-serif; color: #7f888f; margin-top: 2%">(${vo.clCdNm})${vo.dgsbjtCdNm}</p>

						</header>

						<div class="table-wrapper" style="width: 50%">
							<table>
								<thead>
									<tr>
										<th></th>
										<th>진료시간</th>

									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty work.monStart}">

											<tr>
												<td>월요일</td>
												<td>${work.monStart }</td>
												<td>${work.monEnd }</td>

											</tr>
											<tr style="color: #f56a6a">
												<td>점심시간</td>
												<td>13:00 ~ 14:00</td>

											</tr>
										</c:when>
										<c:when test="${not empty work.trmtMonStart}">
											<tr>
												<td>${work.trmtMonStart }<td></td></c:when>
                         				  <c:otherwise>
                        
										   <tr>
                         					  <td>데이터가 없습니다</td>
                          				 </tr>
                           				</c:otherwise>
                           
                           </c:choose>
                        </tbody>
                     </table>
                     <a
								href="https://map.kakao.com/link/to/${vo.yadmNm },${vo.YPos },${vo.XPos}"
								class="button large reservationbtn koreanfont"
								style="float: right; margin-top: 3%;" target="_blank">길찾기</a>
                     <c:if test="${chk==1 }">
                        <a href="reserve.net?yki=${vo.ykiho }"
									class="button large reservationbtn koreanfont"
									style="float: right; margin-top: 3%;" id="res_hos">예약하기</a>
                     </c:if>
                     <div>
                        <i class="fas fa-phone-alt"></i>${vo.telno }<br>
								<c:if test="${vo.hospUrl!='undefined'}">
									<a href="${vo.hospUrl}" target="_blank">사이트
                           방문하기</a>
								</c:if> 
                          
                     </div>


                  </div>

               </div>
            </section>
            <nav id="boardMenu">
               <ul>
                  <li id="reviewli"><a class="menuLink" href="#"
							id="reviewa">
                        후기 </a></li>
                  <li id="qnali"><a class="menuLink" href="#"
							id="qnaa"> 문의
                  </a></li>

               </ul>
            </nav>
            <div id="boardcontent">review/Q&A 게시판 영역</div>

         </div>
      </div>

      <jsp:include page="../header/footer.jsp"></jsp:include>

   </div>

      <!-- 맵 -->
    <script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=938fec5f1038f5f89dbb95889b66091b"></script>
   <!-- Scripts -->
   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/browser.min.js"></script>
   <script src="resources/js/breakpoints.min.js"></script>
   <script src="resources/js/util.js"></script>
   <script src="resources/js/main.js"></script>
   <script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng('${vo.YPos}','${vo.XPos}'), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng('${vo.YPos}','${vo.XPos}'); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		var iwContent = '<div style="padding:5px; text-align:center">${vo.yadmNm} <br><a href="https://map.kakao.com/link/to/${vo.yadmNm },${vo.YPos },${vo.XPos}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
		
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
		
		
		$("#fav_hos").click(function() {
		    if ($(this).hasClass('solid')) {
		       $(this).removeClass('solid');
		    } else {
		       $(this).addClass('solid');
		    }
		 })
		 $('#reviewli').click(function() {
		    $(this).addClass('selectedBoard');
		    $('#reviewa').addClass('selectedBoard');
		    $('#qnali').removeClass('selectedBoard');
		    $('#qnaa').removeClass('selectedBoard');
		 })
		 $('#qnali').click(function() {
		    $(this).addClass('selectedBoard');
		    $('#qnaa').addClass('selectedBoard');
		    $('#reviewli').removeClass('selectedBoard');
		    $('#reviewa').removeClass('selectedBoard');
		    $('#boardcontent').empty();
		    $('#boardcontent').load("qna");
		 })
	</script>
   
</body>
</html>