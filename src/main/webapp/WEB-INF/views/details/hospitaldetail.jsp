<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<h1 class="koreanfont hospitalnamesize" style="font-size: 3em;">
							 <c:if test="${chk==1 and hs_empty eq '1'}">
							 	<c:if test="${count eq '1' }">
								<i class="icon far fa-heart solid detailIcon"
									style="float: right; color: #f56a6a; margin-right: 5%"
									id="fav_hos"></i>
									</c:if>
								<c:if test="${empty count  }">
								<i class="icon far fa-heart detailIcon"
									style="float: right; color: #f56a6a; margin-right: 5%"
									id="fav_hos"></i>
									</c:if>
									</c:if>${vo.yadmNm }
							</h1>
							<p
								style="font-size: 12pt; font-family: Open Sans, sans-serif; color: #7f888f; margin-top: 2%">(${vo.clCdNm})${vo.dgsbjtCdNm}</p>

						</header>

						<div class="table-wrapper" style="width: 50%">
						
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
									<a href="${vo.hospUrl}" target="_blank">사이트 방문하기</a>
								</c:if> 
                          
                     </div>


                  </div>
                  

               </div>
               
               
            </section>

            
            <div class="table-wrapper" style="width: 70%">
							<table>
                        <thead>
                           <tr>
                              <th></th>
                              <th>진료시간</th>

                           </tr>
                        </thead>
                        <tbody>
                        <!-- DB데이터 -->
                        <c:choose>                        
                        <c:when test="${hs_empty eq 1 }">
                           <tr>
                              <td>월요일</td>
                              <td>0${work.monStart}  ~ ${work.monEnd}</td>
                           </tr>
                           <tr>
                              <td>화요일</td>
                              <td>0${work.tueStart}  ~ ${work.tueEnd}</td>
                           </tr>
                           <tr>
                              <td>수요일</td>
                              <td>0${work.wedStart}  ~ ${work.wedEnd}</td>
                           </tr>
                           <tr>
                              <td>목요일</td>
                              <td>0${work.thuStart}  ~ ${work.thuEnd}</td>
                           </tr>
                           <tr>
                              <td>금요일</td>
                              <td>0${work.friStart}  ~ ${work.friEnd}</td>
                           </tr>
                           <tr>
                              <td>토요일</td>
                              <c:choose>
                              <c:when test="${work.satStart eq 0}"><td style="color: red">휴진</td></c:when>
                              <c:otherwise><td>${work.satStart}  ~ ${work.satEnd}</td></c:otherwise>
                              </c:choose>
                           </tr>
                           <tr>
                          	  <td>일요일</td>
                           	  <c:choose>
                              <c:when test="${work.sunStart eq 0}"><td style="color: red">휴진</td></c:when>
                              <c:otherwise><td>${work.sunStart}  ~ ${work.sunEnd}</td></c:otherwise>
                              </c:choose>
                           </tr>
                           <tr style="color: #f56a6a">
                              <td>점심시간</td>
                              <c:choose>
                              <c:when test="${work.lunchStart eq 0}"><td style="color: red">점심시간 없음</td></c:when>
                              <c:otherwise><td>${work.lunchStart } ~ ${work.lunchEnd }</td></c:otherwise>
                              </c:choose>                             
                           </tr>
                           </c:when>
                           <c:when test="${hs_empty eq 2 }">
                          <tr>
                              <td>월요일</td>
                              <td>${work.trmtMonStart}  ~ ${work.trmtMonEnd}</td>
                           </tr>
                           <tr>
                              <td>화요일</td>
                              <td>${work.trmtTueStart}  ~ ${work.trmtTueEnd}</td>
                           </tr>
                           <tr>
                              <td>수요일</td>
                              <td>${work.trmtWedStart}  ~ ${work.trmtWedEnd}</td>
                           </tr>
                           <tr>
                              <td>목요일</td>
                              <td>${work.trmtThuStart}  ~ ${work.trmtThuEnd}</td>
                           </tr>
                           <tr>
                              <td>금요일</td>
                              <td>${work.trmtFriStart}  ~ ${work.trmtFriEnd}</td>
                           </tr>
                           <tr>
                              <td>토요일</td>
                              <c:choose>
                              <c:when test="${work.trmtSatStart eq 0}"><td style="color: red">휴진</td></c:when>
                              <c:otherwise><td>${work.trmtSatStart}  ~ ${work.trmtSatEnd}</td></c:otherwise>
                              </c:choose>
                           </tr>
                           <tr>
                          	  <td>일요일</td>
                           	  <c:choose>
                              <c:when test="${work.trmtSunStart eq 0}"><td style="color: red">휴진</td></c:when>
                              <c:otherwise><td>${work.trmtSunStart}  ~ ${work.trmtSunEnd}</td></c:otherwise>
                              </c:choose>
                           </tr>
                           <tr style="color: #f56a6a">
                           <td>점심시간</td>
                              <c:choose>
                              <c:when test="${fn:contains(work.lunchWeek,'없음')}"><td style="color: red">점심시간 없음</td></c:when>
                              <c:otherwise><td>PM ${work.lunchWeek }</td></c:otherwise>
                              </c:choose>                             
                           </tr>
                           </c:when>                          
                           <c:otherwise>  
                           <!-- 데이터아예 없을경우 -->                       
                           <tr>
                              <td colspan="2">검색된 데이터가 없습니다</td>                             
                           </tr>
                           </c:otherwise>                           
                           </c:choose>
                           
                        </tbody>
                        
                     </table>
                     </div>
            
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

		 
		 // bookmark yuri
		 $(function(){
			function getUrlParams() {
				var params = {};
				window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
				return params;
				}
			
			oParams = getUrlParams();
			ykiho = oParams.ykiho;
			console.log("ykiho = " + ykiho);
			
			 
			$("#fav_hos").click(function() {
				if ($(this).hasClass('solid')) {
					chk = -1;
				} else {	// 선택됨
					chk = 1;
				}
				
				console.log(chk);
				
				$.ajax({
					url : "bookmark.net",
					data : {"ykiho" : ykiho,
							"chk" : chk},
					dataType : "json",
					success : function(resp){
						if(resp == 1){
							$("#fav_hos").addClass('solid');
							alert("관심병원에 등록되었습니다.");
						}else if(resp == -1){
							$("#fav_hos").removeClass('solid');
							alert("관심병원이 해제되었습니다.");
						}
					},	// success end
					error : function(resp){
						alert("죄송합니다. 잠시 후 다시 시도해주세요.");
						return false;
					}	// error end
				});	// ajax end
			 });	// #fav_hos click end
		 })	

	</script>
   
</body>
</html>