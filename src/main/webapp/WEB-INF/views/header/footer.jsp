<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li class="nobordertop">ID<input type="text" id="id"
						class="logininput"></li>
					<li class="nobordertop">PASSWORD<input type="password"
						id="password" class="logininput"></li>
					<li class="nobordertop"><a href="#"
						class="button primary fit loginbtn">Login</a></li>
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
