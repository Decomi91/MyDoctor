<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - ReserveResultForm</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
</head>
<body class="is-preload" >

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

						<div id = "reserveBar">
							<div class = "reserveIcon">
								<i class="fas fa-hourglass-half fa-4x"></i>
								<span style = "position: relative;  bottom: 11px;">예약 신청</span>
							</div>

							<div class = "reserveIcon">
								<a href="reserveCheck.net"><i class="fas fa-check-circle fa-4x" style = "color : #f56a6a;"></i>
								<span style = "color : #f56a6a; font-weight : bold; position: relative; bottom: 11px;">예약 확인</span></a>
							</div>
						</div>

						<div id = "reserveForm">
							<font color = "black">${loginid }</font>님<br>
							<font color = "black">${hosname }&nbsp; ${reserveDate }</font>에 예약이 완료되었습니다.<br>
							예약 승인 정보는 <a href="reserveCheck.net">마이페이지 → 예약현황</a> 에서 확인하실 수 있습니다.
							<br>
							<br>
							추가 예약을 원하시면<a href="reserve.net?yki=${yki }"> 클릭</a>해주세요.
						</div>
						
					</div>
				</section>
				<!-- banner end -->
			</div>
		</div>
<jsp:include page="../header/footer.jsp" />
	</div>
<!-- Scripts -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/browser.min.js"></script>
	<script src="resources/js/breakpoints.min.js"></script>
	<script src="resources/js/util.js"></script>
	<script src="resources/js/main.js"></script>=
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