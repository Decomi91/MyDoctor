<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
					
						<span class="image left" style="height:100%; margin-left:5%">
							<img src="resources/images/pic10.jpg" alt="" />
						</span>
						<header>
											<h1 class="koreanfont hospitalnamesize"><i class="icon far fa-heart" style="float:right; color: #f56a6a; margin-right:5%" id="fav_hos"></i>병원이름 
											</h1><p style="font-size:12pt; font-family:Open Sans, sans-serif; color:#7f888f; margin-top:2%">내과, 가정의학과</p>
											
										</header>
										<div class="table-wrapper" style="width:50%">
														<table>
															<thead>
																<tr>
																	<th></th>
																	<th>진료시간</th>
																	
																</tr>
															</thead>
															<tbody>
																<tr>
																	<td>평일</td>
																	<td> 09:00 ~ 18:00</td>
																	
																</tr>
																<tr>
																	<td>주말</td>
																	<td> 09:00 ~ 18:00</td>
																	
																</tr>
																<tr style="color:#f56a6a">
																	<td>점심시간</td>
																	<td> 13:00 ~ 14:00</td>
																	
																</tr>
																</tbody>
																</table>
																<a href="#" class="button large reservationbtn koreanfont" style="float:right; margin-top:3%;" id="res_hos">예약하기</a>
																	<div><i class="fas fa-phone-alt"></i> 02-123-1234<br>
																<a href="">사이트 방문하기</a></div>
																
																
					</div>
				
					</div>
					</section>
 <nav id="boardMenu" >
                <ul>
                        <li id="reviewli"><a class="menuLink" href="#" id="reviewa"> 후기 </a>
                        </li><li id="qnali"><a class="menuLink" href="#" id="qnaa"> 문의 </a></li>
                       
                </ul>
        </nav>
<div style="border: 1px black solid">review/Q&A 게시판 영역</div>

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
				<c:if test="${id == null }">
					<nav id="menu">
						<header class="major">
							<h2>Login</h2>
						</header>

						<ul>
							<li class="nobordertop">ID<input type="text" id="id" class="logininput"></li>
							<li class="nobordertop">PASSWORD<input type="password" id="password"
								class="logininput"></li> 
							<li class="nobordertop"><a href="#" class="button primary fit loginbtn">Login</a></li>
							<li><a href="#" class="privacybtn privacybtnline">ID/비밀번호
									찾기 </a><a href="#" class="privacybtn">회원가입</a></li>
						</ul>
					</nav>
				</c:if>
				<!-- id값=null아닌경우_마이페이지 -->
				<c:if test="${id !=null}">

					<section>
						<header class="major">
							<h2>Welcome</h2>
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
						<a href="#" class="button primary fit koreanfont">로그아웃</a>
					</section>
				</c:if>
				<!-- Section2_Contact -->
				<section>
					<header class="major">
						<h2>Contact</h2>

					</header>
					<p>
						제휴 관련하여 문의 사항이 있는 병원에서는 연락주세요 &nbsp;&nbsp;<a href="#">지금바로 요청,
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
$("#fav_hos").click(function(){
	if($(this).hasClass('solid')){
		$(this).removeClass('solid');
	}else{
		$(this).addClass('solid');
	}
})
$('#reviewli').click(function(){
	$(this).addClass('selectedBoard');
	$('#reviewa').addClass('selectedBoard');
	$('#qnali').removeClass('selectedBoard');
	$('#qnaa').removeClass('selectedBoard');
})
$('#qnali').click(function(){
	$(this).addClass('selectedBoard');
	$('#qnaa').addClass('selectedBoard');
	$('#reviewli').removeClass('selectedBoard');
	$('#reviewa').removeClass('selectedBoard');
})
</script>
</body>
</html>