<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor_Mypage문의/요청</title>
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
						<!-- 내가쓴 문의 시작 -->
						<div class="mypageContent">
							<label class="mod qnabtn tohos" title="to.병원"><input type="radio"
								name="reqselbtn" value="1" checked="checked" id="reqtoH">문의 내역</label> <label
								class="mod qnabtn toadmin" title="to.관리자"><input type="radio"
								name="reqselbtn" value="2" id="reqtoA">요청 내역</label>


							<c:if test="${qnalistcount>0 }">
								<div class="accordion">
									<c:forEach var="r" items="${myqnalist}">
										<div class="accordion__item">
											<h3 class="accordion__title js-title">${r.yadmnm }&nbsp;&#40;${r.uploaddate }&#41;</h3>
											<div class="accordion__copy accordion__copy--hide js-copy">
												<div>
													<strong>${r.subject }</strong><br> ${r.content }
												</div>
												<div>
													<hr>
													<i class="fas fa-share fa-flip-vertical"></i> ${r.reply }
												</div>
											</div>
										</div>
									</c:forEach>
								</div>





								<!-- 내가쓴 후기 끝 -->
								<ul class="pagination">
									<c:if test="${page<=1}">
										<li><a href="#" class="button">Prev</a></li>
									</c:if>
									<c:if test="${page>1}">
										<li><a href="myqna.net?page=${page-1 }" class="page">Prev</a></li>
									</c:if>
									<c:forEach var="a" begin="${startpage }" end="${endpage}">
										<c:if test="${a==page}">
											<li><a href="#" class="page">${a}</a></li>
										</c:if>
										<c:if test="${a!=page}">
											<li><a href="myqna.net?page=${a }" class="page">${a}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${page>=maxpage}">
										<li><a href="#" class="page">Next</a></li>
									</c:if>
									<c:if test="${page<maxpage}">
										<li><a href="myqna.net?page=${page+1 }" class="page">Next</a></li>
									</c:if>
								</ul>

							</c:if>
							<c:if test="${qnalistcount==0 }">
								<font size=5>등록된 글이 없습니다.</font>
							</c:if>
							
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
	<script src="resources/js/req.js"></script>
	<script src="resources/js/reqboardtoggle.js"></script>
</body>
</html>