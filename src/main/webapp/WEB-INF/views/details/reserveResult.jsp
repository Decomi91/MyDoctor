<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - ReserveForm</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<style>
#reserveBar {
	padding: 10px 0px 50px 0px
}

.reserveIcon {
	display: inline-block;
	width: 49%;
	height: 55px;
	text-align: center;
	line-height: 55px
}

#reserveForm {
	padding: 50px 0px;
	width: 70%;
	margin: 0 auto;
}

</style>
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
								<span>예약 신청</span>
							</div>
							
							<div class = "reserveIcon">
								<i class="fas fa-check-circle fa-4x" style = "color : #f56a6a;"></i>
								<span style = "color : #f56a6a; font-weight : bold;">예약 확인</span>
							</div>
						</div>
						
						<div id = "reserveForm">
							~님 예약이 완료되었습니다.
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