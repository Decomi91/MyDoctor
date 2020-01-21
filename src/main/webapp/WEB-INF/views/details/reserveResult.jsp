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

						<div id = "reserveBar">
							<div class = "reserveIcon">
								<i class="fas fa-hourglass-half fa-4x"></i>
								<span style = "position: relative; bottom: 11px;">예약 신청</span>
							</div>

							<div class = "reserveIcon">
								<i class="fas fa-check-circle fa-4x" style = "color : #f56a6a;"></i>
								<span style = "color : #f56a6a; font-weight : bold; position: relative; bottom: 11px;">예약 확인</span>
							</div>
						</div>

						<div id = "reserveForm">
							~님 예약이 완료되었습니다.<br>
							예약 정보는 마이페이지 → 예약현황 에서 확인하실 수 있습니다.
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