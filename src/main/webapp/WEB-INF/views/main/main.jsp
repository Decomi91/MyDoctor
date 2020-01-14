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
					<a href="index.html" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
						<button class="nearhospital koreanfont primary" id="nearhospital">주변 병원</button>
						<button class="nearpharmacy koreanfont" id="nearpharmacy">주변 약국</button>
						<br>
						<div>
							<img src="resources/images/pic10.jpg" alt="" class="mapsize" />
						</div>
					</div>
					<div class="content">
								<select name="demo-category" id="demo-category" class="categorysel">
																	<option value="">진료과목</option>
																	<option value="1">소아과</option>
																	<option value="1">치과</option>
																	<option value="1">안과</option>
																	<option value="1">정형외과</option>
																</select>
									<section id="search" class="alt hospitalsearch">
					<form method="post" action="#" >
						<input type="text" name="query" id="query" placeholder="병원이름, 증상" />
					</form>
				</section>			
																<div>
							<img src="resources/images/pic10.jpg" alt="" class="mapsize" />
						</div>
					</div>
					</section>



			</div>
		</div>

		<!-- Sidebar: 메뉴눌렀을때 나오는 sidebar영역입니다. -->
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
						<header class="major">
							<h2>Login</h2>
						</header>
						<form action="loginMember" method="post" id="loginForm">
							<input type="radio" id="pub" name="user" value="pub" checked> <label for="pub">일반회원</label> 
							<input type="radio" id="hos" name="user" value="hos"> <label for="hos">병원회원</label>
							<ul>	
								<li class="nobordertop">ID<input type="text" id="id" class="logininput" name="id"></li>
								<li class="nobordertop">PASSWORD<input type="password" id="password" name="password"
									class="logininput"></li> 
								<li class="nobordertop"><br><button type="submit" class="button primary fit loginbtn">Login</button></li>
								<li><a href="#" class="privacybtn privacybtnline">ID/비밀번호
										찾기 </a><a href="#" class="privacybtn">회원가입</a></li>
							</ul>
						</form>
					</nav>
				</c:if>
				<!-- id값=null아닌경우_마이페이지 -->
				<c:if test="${loginid !=null}">

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
						<a href="logout" class="button primary fit koreanfont">로그아웃</a>
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
$("#nearpharmacy").click(function(){
	$("#nearhospital").removeClass('primary');
	$("#nearpharmacy").addClass('primary');
})
$("#nearhospital").click(function(){
	$("#nearpharmacy").removeClass('primary');
	$("#nearhospital").addClass('primary');
})
</script>
</body>
</html>