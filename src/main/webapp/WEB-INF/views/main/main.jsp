<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctors</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 지도관련 스크립트 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=938fec5f1038f5f89dbb95889b66091b&libraries=services"></script>
<script type="text/javascript">

$(function() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {

			var lon = position.coords.longitude, // 경도
			lat = position.coords.latitude; // 위도
			
			
			//지도
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				level : 8
			// 지도의 확대 레벨
			};
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption);				
			hs(lon, lat);
			
			
			$("#nearhospital").click(function() {
				$("#map").empty();
				$("#div_result").empty();
			 map = new kakao.maps.Map(mapContainer, mapOption);	
				hs(lon, lat);
			});//clcik		
			
			
			
			function hs(xPos, yPos) {
				$.ajax({
							url : "intro_hs",
							typse : "POST",
							dataType : "json",
							data : {
								'xPos' : xPos,
								'yPos' : yPos
							},
							success : function(data) {
							
								var item = data.response.body.items.item;
								
								var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
								var imageSize = new kakao.maps.Size(24, 35); 
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
								
								
								
								
								
								function custonSort(a, b) {
			                    	  if(Number(a.distance) == Number(b.distance)){ return 0} 
			                    	  return  Number(a.distance) > Number(b.distance) ? 1 : -1;}
			                    	item.sort(custonSort);
								
								
							
								 console.log(item);
								 
								 var out ="";
								$.each(item,function(index,items){		
									var iwContent = '<div style="padding:5px;">'+((index++)+1)+"."+items.yadmNm+'</div>'; 
								    // 마커를 생성합니다
								    var marker = new kakao.maps.Marker({
								        map: map, // 마커를 표시할 지도
								        position: new kakao.maps.LatLng(items.YPos, items.XPos) , // 마커를 표시할 위치
								        title :items.yadmNm, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
								        image : markerImage, // 마커 이미지 									
								    });
								    
								    
								   
								   out +="<table>";
								   out +="<tr>";
								  /*  out +="<td rowspan ='3' class='table-wrapper'></td>"; */
								   //out +="<th onclick='location.href=locationView.do?ykiho="+items.ykiho+"&YPos="+items.YPos+"&XPos="+items.XPos+"' id=yadm"+(index+1)+">"+items.yadmNm+":"+items.addr+":"+items.distance+"</th>";
								   out +="<th><a href='detail.net?ykiho="+items.ykiho+"&YPos="+items.YPos+"&XPos="+items.XPos+"' id=yadm"+(index+1)+">"+items.yadmNm+" (상세정보)</a></th>";
								   out +="</tr>";
								    
								   out +="<tr>";
								   out +="<td>"+items.clCdNm+"</td>";
								   out +="</tr>";
								    
								   out +="<tr>";
								   out +="<td>거리 : "+Math.ceil(items.distance)+"M</td>";
								   out +="</tr>";
								    
								   out +="</table>";
								   
								   $("#div_result").html(out);
								    //$("#hs_list_tr").append("<li><a href='locationView.do?ykiho="+items.ykiho+"&YPos="+items.YPos+"&XPos="+items.XPos+"' id=yadm"+(index+1)+">"+items.yadmNm+":"+items.addr+":"+items.distance+"</a></li><hr>");
								    
								    
								    
								    //마우스
									var iwContent = '<div style="padding:5px;">'+items.yadmNm+'</div>';
									
								    kakao.maps.event.addListener(marker, 'mouseover', function() {									 
								    	 infowindow.open(map, marker);
								    });

								    
								    kakao.maps.event.addListener(marker, 'mouseout', function() {
								        infowindow.close();
								    });
								   
									
								
								    kakao.maps.event.addListener(marker, 'click', function() {
								    	
								    	//console.log($("a[id='yadm"+$(this)[0].label+"']"));
								    	//$("a[id='yadm"+$(this)[0].label+"']").focus();
								    	$("a[id=yadm"+(index+1)+"]").focus();
							
								    });
									

									//마우스끝
									
								    
								    //고쳐야댐
									/* var infowindow = new kakao.maps.InfoWindow({
										//position : iwPosition, 
											 content : iwContent});
									
									infowindow.open(map, marker); 
								     */
									 var infowindow = new kakao.maps.InfoWindow({
									    content : iwContent
									}); 
									
									//마우스함수끝
								    

								});
							},error : function(data, err) {
								alert("err")
							}
						});//ajax

			}//hs
			
			
			
			$("#nearpharmacy").click(function() {
				$("#map").empty();
				$("#div_result").empty();
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
				        level: 8 // 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(map); 

				// 카테고리로 은행을 검색합니다
				ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true}); 

				//data.place_name 이름
				//data.address_name 주소
				//data.place_url 길찾기
				
				
				var out ="";
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
					
				    if (status === kakao.maps.services.Status.OK) {
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i],i);				            				            
				            out +="<table>";
							   out +="<tr>";
							   /* out +="<td rowspan ='3' class='table-wrapper'></td>"; */							 
							   out +="<th>"+data[i].place_name+"</th>";
							   out +="</tr>";
							    
							   out +="<tr>";
							   out +="<td>"+data[i].address_name+"</td>";
							   out +="</tr>";
							    
							   out +="<tr>";
							   out +="<td><a id = 'place_name"+i+"' href='"+data[i].place_url+"'>상세정보</a></td>";
							   out +="</tr>";
							    
							   out +="</table>";
							   
							   $("#div_result").html(out);
				        }       
				    }
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place,i) {
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });

				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				    	
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				        $("a[id=place_name"+i+"]").focus();
				        
				        
				    });
				}				
									});//pha
		
			
			
			
		});//geo funtion

	} else {

		//var locPosition = new kakao.maps.LatLng(33.450701, 126.570667);

	}

	



});//onload

</script>


</head>
<body class="is-preload">
<%-- <jsp:include page="header.jsp" /> --%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Main -->
<!-- 				<div id="main"> -->
<!-- 					<div class="inner"> -->
						<!-- Header -->
						<header id="header">
						
							<a href="main" class="logo"><strong>My Doctor</strong> by
								team.5</a>
						</header>
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- Banner: body -->
				<section id="banner">
					<table>
						<tr>
							<td class="content">
								<div>
									<button class="nearhospital koreanfont primary" id="nearhospital">주변 병원</button>
									<button class="nearpharmacy koreanfont" id="nearpharmacy">주변 약국</button><br>
									<!-- 지도 -->
									<div id="result">						
										<div id='map' style='width: 100%; height: 350px;'></div>
										<!-- <img src="resources/images/pic10.jpg" alt="" class = "mapsize"/> -->
									</div>
								</div>
							</td>
							
							<td class="content">
								<div>
									<select name="demo-category" id="demo-category" class="categorysel">
										<option value="">진료과목</option>
										<option value="1">소아과</option>
										<option value="2">치과</option>
										<option value="3">안과</option>
										<option value="4">정형외과</option>
									</select>
									<section id="search" class="alt hospitalsearch">
										<form method="post" action="#">
											<input type="text" name="hs_query" id="hs_query" placeholder="병원이름 또는 증상을 입력하세요." />
										</form>
									</section>
									
									<!-- 병원 list -->
									<div style="overflow:auto;" class="mapsize" id="div_result">
									
									<!-- 	 <table id="hs_list">
											<tr id="hs_list_tr">
											 <td rowspan = "3" class = "table-wrapper"><img alt="" src="resources/images/pic10.jpg" width = "50px"></td>
												<th onclick = "location.href='detail.net'">가나다병원</th>
											</tr>
											<tr>
												<td>내과, 가정의학과, 소아과</td>
											</tr>
											<tr>
												<td><i class="fas fa-grin-hearts"></i> ? / 10</td>
											</tr>
											
										</table>  -->
								</div>
							</td>
						</tr>
					</table>
					
				</section>	
				<!-- banner end -->
				
				
			</div>
		</div>
<!-- Sidebar -->
				
		<div id="sidebar">
			<div class="inner">
			
				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>
		
		
				<!-- Login & Mypage -->
				<!-- id값=null인경우_로그인/회원가입 -->
				<c:if test="${loginid == null }">
					<nav id="menu">
						<form action="loginMember" method="post">
							<header class="major">
								<h2>Login</h2>
							</header>
							
							<ul style="margin-top : -10%;">
								<li><input type="radio" id="pub" name="user" value="pub" checked="checked"><label for="pub">일반회원</label> &nbsp;&nbsp;&nbsp;
									<input type="radio" id="hos" name="user" value="hos"><label for="hos">병원회원</label><br><br></li>
								<li class="nobordertop">ID<input type="text" id="id" name="id" class="logininput"></li>
								<li class="nobordertop">PASSWORD<input type="password" id="password" name="password" class="logininput"><br></li>
								<li class="nobordertop"><button type="submit" class="button primary fit loginbtn">Login</button></li>
								<li><a href="#" class="privacybtn privacybtnline">ID/비밀번호
										찾기 </a><a href="joinForm" class="privacybtn">회원가입</a></li>
							</ul>
						</form>
					</nav>
				</c:if>
				<!-- id값=null아닌경우_마이페이지 -->
				<c:if test="${loginid !=null && !(loginid eq 'admin') && chk==1}">
					<section>
						<header class="major">
							<h2>${loginid }님 환영합니다</h2>
						</header>
						<div class="box" style="margin-bottom: 1em">
							<p class="reservationnoti">
								<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;병원
								예약내용이 &nbsp;&nbsp; <a href="#">?</a> 건 있습니다.
							</p>
						</div>
						<ul class="contact">
							<li class="icon solid fas fa-address-book mypageacess"><a
								href="#">마이페이지</a></li>
							<li
								class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
								href="#">관심병원</a></li>
							<li class="icon solid far fa-calendar-alt mypageacess"><a
								href="#">예약내역</a></li>
							<li class="icon solid fas fa-clipboard-list mypageacess"><a
								href="#">진료기록</a></li>
						</ul>
						<a href="logout" class="button primary fit koreanfont">로그아웃</a>
					</section>
				</c:if>
				<c:if test="${loginid !=null && !(loginid eq 'admin') && chk==2}">
					<section>
						<header class="major">
							<h2>${loginid }님 환영합니다</h2>
						</header>
						<div class="box" style="margin-bottom: 1em">
							<p class="reservationnoti">
								<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;병원
								예약내용이 &nbsp;&nbsp; <a href="#">?</a> 건 있습니다.
							</p>
						</div>
						<ul class="contact">
							<li class="icon solid fas fa-address-book mypageacess"><a
								href="#">마이페이지</a></li>
							<li
								class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
								href="#">여기 뭐써야했지</a></li>
							<li class="icon solid far fa-calendar-alt mypageacess"><a
								href="#">예약내역</a></li>
							<li class="icon solid fas fa-clipboard-list mypageacess"><a
								href="#">진료기록</a></li>
						</ul>
						<a href="logout" class="button primary fit koreanfont">로그아웃</a>
					</section>
				</c:if>
				<c:if test="${loginid == 'admin'}">
					<section>
						<header class="major">
							<h2>관리자 계정</h2>
						</header>
						<div class="box" style="margin-bottom: 1em">
							<p class="reservationnoti">
								<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;관리자 요청 게시글이
								 &nbsp;&nbsp; <a href="#">?</a> 건 있습니다.
							</p>
						</div>
						<ul class="contact">
							<li
								class="icon solid far fa-clipboard-list mypageacess"><a
								href="hospitalcontrol">병원 관리</a></li>
							<li class="icon solid far fa-clipboard-list mypagelisecond-child mypageacess"><a
								href="usercontrol">회원 관리</a></li>
							<li class="icon solid fas fa-folder-open mypageacess"><a
								href="#">요청 게시판</a></li>
						</ul>
						<a href="logout" class="button primary fit koreanfont">로그아웃</a>
					</section>
				</c:if>
				<c:if test="${loginid != 'admin'}">
					<!-- Section2_Contact -->
					<section>
						<header class="major">
							<h2>Contact</h2>
			
						</header>
						<p>
							제휴 관련하여 문의 사항이 있는 병원에서는 연락주세요 &nbsp;&nbsp;<a href="hs_signup.do">지금바로 요청,
								Click Here!</a>
						</p>
						<ul class="contact">
							<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
							<li class="icon solid fa-phone">(000) 000-0000</li>
							<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
								Seoul, TN 00000-0000
							</li>
						</ul>
					</section>
			
					<!-- Footer -->
					<footer id="footer">
						<p class="copyright">
							&copy; MY DOCTOR. All rights reserved. Demo Images: <a
								href="https://unsplash.com">Unsplash</a>. Design: <a
								href="https://html5up.net">HTML5 UP</a>.
						</p>
					</footer>
				</c:if>
			</div>
			
		</div>
	</div> 

	<!-- Scripts -->
	

	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/browser.min.js"></script>
	<script src="resources/js/breakpoints.min.js"></script>
	<script src="resources/js/util.js"></script>
	<script src="resources/js/main.js"></script>
	<script>
		$("#nearpharmacy").click(function() {
			$("#nearhospital").removeClass('primary');
			$("#nearpharmacy").addClass('primary');
		})
		$("#nearhospital").click(function() {
			$("#nearpharmacy").removeClass('primary');
			$("#nearhospital").addClass('primary');
		})
	</script>
</body>
</html>