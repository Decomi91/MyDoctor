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
					<a href="index.html" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
				<div class="mypageContent">
				<div class="signoutpassck">
				 
				<i class="fas fa-user-lock"></i><p class="signoutmsg">비밀번호를 한번 더 입력해 주세요</p>
			 <div id="passckbox"><div class="passck1">비밀번호 확인
			 </div><input type="password" class="passck2"></div>
			  <div class="signoutsubbtn"><a href="#" class="passckbtn_">취소</a>
		<a href="#" class="passckbtn_ passckbtn_ok">확인</a></div>
			 
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