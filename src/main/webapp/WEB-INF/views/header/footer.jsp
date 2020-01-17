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
		<!-- id��=null�ΰ��_�α���/ȸ������ -->
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
					<li><a href="#" class="privacybtn privacybtnline">ID/��й�ȣ
							ã�� </a><a href="#" class="privacybtn">ȸ������</a></li>
				</ul>
			</nav>
		</c:if>
		<!-- id��=null�ƴѰ��_���������� -->
		<c:if test="${id !=null}">

			<section>
				<header class="major">
					<h2>Welcome</h2>
				</header>
				<div class="box" style="margin-bottom: 1em">
					<p class="reservationnoti">
						<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;����
						���೻���� &nbsp;&nbsp; <a href="#">?</a> �� �ֽ��ϴ�.
					</p>
				</div>
				<ul class="contact">
					<li class="icon solid fas fa-address-book mypageacess"><a
						href="#">����������</a></li>
					<li
						class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
						href="#">���ɺ���</a></li>
					<li class="icon solid far fa-calendar-alt mypageacess"><a
						href="#">���೻��</a></li>
					<li class="icon solid fas fa-clipboard-list mypageacess"><a
						href="#">������</a></li>
				</ul>
				<a href="#" class="button primary fit koreanfont">�α׾ƿ�</a>
			</section>
		</c:if>
		<!-- Section2_Contact -->
		<section>
			<header class="major">
				<h2>Contact</h2>

			</header>
			<p>
				���� �����Ͽ� ���� ������ �ִ� ���������� �����ּ��� &nbsp;&nbsp;<a href="#">���ݹٷ� ��û,
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
