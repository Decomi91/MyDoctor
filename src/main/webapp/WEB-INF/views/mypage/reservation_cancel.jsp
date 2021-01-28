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
<link rel="stylesheet" href="resources/css/menuStyles.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="main	" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
						<jsp:include page="mypage_menu.jsp"></jsp:include>	
						<div class="mypageContent">
						
							<div>
								<nav>
									<span class="noLink">예약 취소</span>
								</nav>
								
								<div id = "cancelDIV">
									<form action = "cancelProcess.do" method = "post">
										<div>
											<input type = "hidden" name = "reserveNo" value = "${reservation.reserveNo }">
											<font color = "black">${reservation.name }</font>님,
											<font color = "black">${reservation.hosname }</font>&nbsp;
											<font color = "black">${reservation.reserveTime }</font>
										</div>
										<div>
											<div style = "padding : 10px">예약 취소를 원하시면 비밀번호를 입력하세요.</div>
											<input type="password" name = "password" id = "cancelPW" style = "margin-bottom : 10px">
										</div>
									  	<div>
									  		<input type = "submit" value = "확인">
									  		<input type = "reset" value = "취소" onclick = 'history.back();'>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
 


			</div>
		</div>

	<jsp:include page="../header/footer.jsp"></jsp:include>

	</div>

	<!-- Scripts -->
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/browser.min.js"></script>
	<script src="resources/js/breakpoints.min.js"></script>
	<script src="resources/js/util.js"></script>
	<script src="resources/js/main.js"></script>
<script>

</script>
</body>
</html>