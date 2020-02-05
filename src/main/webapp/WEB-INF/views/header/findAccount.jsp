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
<style>
.hint {
	width: 90%;
}

.findbtn {
	margin: 5%;
	text-align: center;
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
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">

						<div class="row gtr-uniform">

							<div class="col-6 col-12-xsmall">
								<form action="id.find" class="hint">
									<h2 class="mod">아이디 찾기</h2>
									<label>이름</label> <input type="text" name="name" id="name"
										class="modifyInput" required> <label>이메일주소</label> <input
										type="email" name="email" id="email" class="modifyInput"
										required>
									<div class="findbtn">
										<button type="submit">아이디찾기</button>
									</div>
								</form>
							</div>

							<div class="col-6 col-12-xsmall">
								<form method="post" action="password.find" class="hint">
									<h2 class="mod">비밀번호 찾기</h2>
									<label>아이디</label> <input type="text" name="id" id="id"
										class="modifyInput" required> <label>이메일주소</label> <input
										type="email" name="email" id="email" class="modifyInput"
										required>
										<label>이름</label> <input type="text" name="name" id="name"
										class="modifyInput" required>
									<div class="findbtn">
										<button type="submit">비밀번호 찾기</button>
									</div>
								</form>
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