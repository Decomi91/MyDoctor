<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 병원상세</title>
<jsp:include page="../main/header.jsp" />
<meta charset="utf-8" />
</head>
<body class="is-preload">


	<!-- Wrapper -->
	<div id="wrapper">
		<div id="main">
			<div id="inner">
				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
						<span class="image left" style="height: 100%; margin-left: 5%">
							<img src="resources/images/pic10.jpg" alt="" />
						</span>

						<header>
							<h1 class="koreanfont hospitalnamesize">
								<i class="icon far fa-heart"
									style="float: right; color: #f56a6a; margin-right: 5%"
									id="fav_hos"></i>병원이름
							</h1>
							<p
								style="font-size: 12pt; font-family: Open Sans, sans-serif; color: #7f888f; margin-top: 2%">내과,
								가정의학과</p>
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
									<tr>
										<td>평일</td>
										<td>09:00 ~ 18:00</td>
									</tr>
									<tr>
										<td>주말</td>
										<td>09:00 ~ 18:00</td>
									</tr>
									<tr style="color: #f56a6a">
										<td>점심시간</td>
										<td>13:00 ~ 14:00</td>
									</tr>
								</tbody>
							</table>

							<a href="reserve.do"
								class="button large reservationbtn koreanfont"
								style="float: right; margin-top: 3%;" id="res_hos">예약하기</a>
							<div>
								<i class="fas fa-phone-alt"></i> 02-123-1234<br> <a href="">사이트
									방문하기</a>
							</div>
						</div>
					</div>
				</section>

				<nav id="boardMenu">
					<ul>
						<li id="reviewli">
							<a class="menuLink" href="#" id="reviewa">후기 </a>
						</li>
						<li id="qnali">
							<a class="menuLink" href="#" id="qnaa"> 문의</a>
						</li>
					</ul>
				</nav>


				<div style="border: 1px black solid">review/Q&A 게시판 영역</div>
			</div>
		</div>
	</div>

	<script>
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
		})
	</script>
</body>
</html>