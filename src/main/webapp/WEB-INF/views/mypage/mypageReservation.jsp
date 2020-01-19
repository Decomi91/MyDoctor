<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 예약 현황</title>
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
									<span class = "noLink">Reservation</span>
								</nav>

								<div class="table-wrapper">
									<table class = "reservetable mypagetable">
										<thead>
											<tr>
												<th width = 30%>예약 시간</th>
												<th width = 25%>병원</th>
												<th width = 25%>진행 상황</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<!-- 순서를 최신순으로 할지? -->
											<tr>
												<td>2010.01.01 16:00</td>
												<td>땡땡병원</td>
												<td>
													<span class = "hoswaiting reservebox">승인 대기중</span>
												</td>
												<td>
													<a href="#">예약 취소&nbsp;<i class="fas fa-angle-right"></i></a>
												</td>
											</tr>
											<tr>
												<td>2010.01.02 13:00</td>
												<td>땡땡병원</td>
												<td>
													<span class = "hoscancel reservebox">취소된 예약</span>
												</td>
												<td></td>
											</tr>
											<tr>
												<td>2010.01.03 17:00</td>
												<td>밝은이 안과</td>
												<td>
													<span class = "hossoon reservebox">방문 예정</span>
												</td>
												<td></td>
											</tr>
											<tr>
												<td>2010.01.05 16:00</td>
												<td>토마토 치과</td>
												<td>
													<span class = "hosfinish reservebox">진료 완료</span>
												</td>
												<td>
													<a href = "#">후기 작성&nbsp;<i class="fas fa-angle-right"></i></a>
												</td>
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