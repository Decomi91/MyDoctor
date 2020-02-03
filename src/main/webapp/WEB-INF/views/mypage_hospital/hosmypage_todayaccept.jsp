<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 마이페이지(오늘의 진료)</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/hosmenuStyles.css" />
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
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
						<jsp:include page="hosmypage_menu.jsp"></jsp:include>
						<div class="mypageContent">

							<!-- Reservation -->
							<div id="reservationDIV">
								<nav>
									<span class="noLink">Today Reservation</span>
								</nav>

								<div class="table-wrapper">
								<form action = "diagnosis.net" method="post">
									<table class="reservetable mypagetable">
										<thead>
											<tr>
												<th width=17.5%>예약 번호</th>
												<th width=22.5%>예약 시간</th>
												<th width=20%>환자 정보</th>
												<th width=20%>처리 상태</th>
												<th width=10%>취소</th>
												<th width=10%>
													<input type = "checkbox" name = "reserveAll" id = "reserveAll">
													<label for = "reserveAll"></label>
												</th>
											</tr>
										</thead>

										<tbody>
										
											<!-- 예약 내역이 있는 경우 -->
											<c:if test="${listcount > 0}">
												<c:set var = "num" value = "${listcount-(page-1)*10 }"/>
												<c:forEach var = "rv" items = "${rv }">
													<tr>
														<td>${num }</td>
														<c:set var="num" value="${num-1 }"></c:set>
														<td>
															<a href = "reserveDetail.net?reserveNo=${rv.reserveNo }" id = "reserveTimeA">${rv.reserveTime }</a>
														</td>
														<td>${rv.name }</td>
														<td>
															<c:choose>
																<c:when test="${rv.acceptance==1 }">승인됨</c:when>
																<c:when test="${rv.acceptance==0 }">승인대기</c:when>
																<c:when test="${rv.acceptance==-1 }">취소</c:when>
															</c:choose>
														</td>
														<td>
															<a href = "reserveX.net?reserveNo=${rv.reserveNo }&page=${page}">
																<i class="fas fa-window-close reserveX" style = "color:red"></i>
															</a>		
														</td>
														<td>
															<input type = "checkbox" name = "reserveOk" id = "${rv.reserveNo }" class = "reserveOk" value = "${rv.reserveNo }">
															<label for = "${rv.reserveNo }"></label>
														</td>
												</c:forEach>
											</c:if>
											<c:if test="${listcount == 0}">
												<tr>
													<td colspan = "6">요청된 예약이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
										<tfoot>
											<tr>
												<td colspan = "5"></td>
												<td>
													<input type = "submit" id = "reserveOkbtn" value = "완료">
												</td>
											</tr>
										</tfoot>
									</table>
									</form>
									
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
															<a href="hosmypage_today.net?page=${page-1}" class="page-link">이전</a>&nbsp;
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
																<a href="hosmypage_today.net?page=${a }" class="page-link">${a}</a>
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
															<a href="hosmypage_today.net?page=${page+1}"  class="page-link">&nbsp;다음</a>
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
		$(function(){
			$("#reserveAll").click(function(){
				if($(this).prop("checked") == true)
					$(".reserveOk").prop("checked", true);
				else
					$(".reserveOk").prop("checked", false);
			});
			
			$(".reserveOk").click(function(){
				if($(this).prop("checked") == false && $("#reserveAll").prop("checked") == true){
					$("#reserveAll").prop("checked", false);
				}
			});
		})
	</script>
</body>
</html>