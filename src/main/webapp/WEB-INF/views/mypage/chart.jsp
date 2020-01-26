<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 진료 기록</title>
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
						<jsp:include page="mypage_menu.jsp"></jsp:include>
						<div class="mypageContent">

							<!-- Reservation -->
							<div>
								<nav>
									<span class="noLink">Chart</span>
								</nav>

								<div class="table-wrapper">
									<table class="mypagetable charttable">
										<thead>
											<tr>
												<th width=30%>내원 시간</th>
												<th width=25%>병원</th>
												<th width=25%>진료기록</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>2010.01.10 16:00</td>
												<td>안보여 안과</td>
												<td><a href="#">진료 기록 확인&nbsp;<i
														class="fas fa-angle-right"></i></a></td>
											</tr>

											<tr>
												<td>2010.01.05 10:20</td>
												<td>토마토 치과</td>
												<td><a href="#">진료 기록 확인&nbsp;<i
														class="fas fa-angle-right"></i></a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- Reservation end -->
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