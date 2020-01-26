<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 예약 현황</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/menuStyles.css" />
<link rel="stylesheet" href="resources/css/paging.css" />

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
							<div id="reservationDIV">
								<nav id="boardMenu">
									<ul>
										<li id="reviewli"><a class="menuLink" href="#"
											id="reviewa"> Reservation </a></li>
										<li id="qnali"><a class="menuLink" href="#" id="qnaa">Chart
										</a></li>
									</ul>
								</nav>

								<div class="table-wrapper">
									<table class="reservetable mypagetable">
										<thead>
											<tr>
												<th width=30%>예약 시간</th>
												<th width=25%>병원</th>
												<th width=25%>진행 상황</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
										
											<!-- 예약 내역이 있는 경우 -->
											<c:if test="${listcount > 0}">
												<c:set var = "num" value = "${listcount-(page-1)*10 }"/>
												<c:forEach var = "rv" items = "${rv }">
													<tr>
														<td>${rv.reserveTime }</td>
														<td>${rv.hosname }</td>
														<c:if test = "${rv.acceptance == -1 || rv.acceptance == -2}">
															<td><span class="hoscancel reservebox">취소된 예약</span></td>
															<td></td>
														</c:if>
														<c:if test = "${rv.acceptance == 0}">
															<td><span class="hoswaiting reservebox">승인 대기중</span></td>
															<td>
																<a href = "cancel.do?reserveNo=${rv.reserveNo }">예약 취소&nbsp;<i class="fas fa-angle-right"></i></a>
															</td>
														</c:if>
														<c:if test = "${rv.acceptance == 1}">
															<td><span class="hossoon reservebox">방문 예정</span></td>
															<td></td>
														</c:if>
														<c:if test = "${rv.acceptance == 2}">
															<td><span class="hosfinish reservebox">진료 완료</span></td>
															<td>
																<a href="reviewwrite.do?reserveNo=${rv.reserveNo }">후기 작성&nbsp;<i class="fas fa-angle-right"></i></a>
															</td>
														</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${listcount == 0}">
												<tr>
													<td colspan = "4">등록된 글이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
									
									<div class="center-block">
										<div class="row">
											<div class="col">
												<ul class="pagination">
													<c:if test="${page<=1}">
														<li class="page-item">
														<a class="page-link"  href="#">이전&nbsp;</a>
														</li>
													</c:if>
													<c:if test="${page > 1}">
														<li class="page-item">
															<a href="mypage.net?page=${page-1}" class="page-link">이전</a>&nbsp;
														</li>
													</c:if>
													
													<c:forEach var="a" begin="${startpage}" end="${endpage}">
														<c:if test="${a==page}">
															<li class="page-item">
																<a class="page-link" href="#">${a}</a>
															</li>
														</c:if>
														<c:if test="${a != page}">
															<li class="page-item">
																<a href="mypage.net?page=${a }" class="page-link">${a}</a>
															</li>
														</c:if>
													</c:forEach>
													
													<c:if test="${page>=maxpage}">
														<li class="page-item">
															<a class="page-link" href="#">&nbsp;다음</a>
														</li>
													</c:if>
													<c:if test="${page<maxpage}">
														<li class="page-item">
															<a href="mypage.net?page=${page+1}"  class="page-link">&nbsp;다음</a>
														</li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
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