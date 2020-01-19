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

#reserveTable {
	width: 100%;
	margin: 0 auto
}

#reserveTable tr td:first-child, #reserveTable tr td:nth-child(3n) {
	width: 30%;
	text-align: center;
	font-weight: bold
}

#reserveBtnDIV{margin-top: 20px;
    text-align: center;}
.reserveBtn{width : 30%}
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
								<i class="fas fa-hourglass-half fa-4x" style = "color : #f56a6a;"></i>
								<span style = "color : #f56a6a; font-weight : bold;">예약 신청</span>
							</div>
							
							<div class = "reserveIcon">
								<i class="fas fa-check-circle fa-4x"></i>
								<span>예약 확인</span>
							</div>
						</div>
						
						<div id = "reserveForm">
							<table id = "reserveTable">
								<tr>
									<td>아이디</td>
									<td>
										아이디 고정
									</td>
									<td>이름</td>
									<td>
										이름 고정
									</td>
								</tr>
								<tr>
									<td>병원명</td>
									<td>
										병원명 고정
									</td>
								</tr>
								<tr>
									<td>예약 날짜</td>
									<td>
										<input type = "date" name = "reserveDate" required>
									</td>
									<td>예약 시간</td>
									<td>	<!-- 텍스트? select? -->
										<input type = "text" name = "reserveTime" required>
									</td>
								</tr>
							</table>
							<textarea style = "width: 90%; height: 100px; margin: 0 auto;margin-top: 20px;" placeHolder = "증상을 입력하세요."></textarea>
							<div id = "reserveBtnDIV">
								<input type = "submit" class = "reserveBtn" value = "예약하기">
								<input type = "reset" class = "reserveBtn" value = "취소">
							</div>
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