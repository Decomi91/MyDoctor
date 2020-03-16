<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head> 
<title>My Doctor_관리자에게 문의하기</title>
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
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
				<div class="mypageContent">
				<form action="writeReqToA.do">
				
				<div class="signoutpassck ">
				
				<div class="divreqtoA">
				<h2><i class="far fa-paper-plane"></i>&nbsp;관리자에게 문의</h2>
				<input type="hidden" value="${loginid}" id="id" name="id">
				<label>제목</label><input type="text" name="subject" id="subject">
				<label>내용</label>
				<textarea rows="10" cols="80" maxlength="3000" placeholder="문의 내용을 입력해  주세요" id="content" name="content"></textarea>
				</div>
				 <div class="signoutsubbtn"><button type="reset" class="passckbtn_">취소</button>
		<button type="submit" class="passckbtn_ passckbtn_ok">확인</button></div>
				</div>
			  </form>
			
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