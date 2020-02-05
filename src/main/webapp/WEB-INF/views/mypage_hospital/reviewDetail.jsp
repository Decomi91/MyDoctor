<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor</title>

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
						
							<div id="reservationDIV">
								<nav>
									<span class="noLink">리뷰 정보</span>
								</nav>
								
								<div class = "table-wrapper reserveDetailDIV">
									<table class="reservetable mypagetable reserveDetailTable">
										<tr>
											<th>게시자</th>
											<td colspan = 3>${fn:substring(rev.id, 0, 3)}****</td>
										</tr>
										<tr>
											<th>게시일</th>
											<td colspan = 3>${rev.uploaddate }</td>
										</tr>
										<tr>
											<th>글제목</th>
											<td colspan = 3>${rev.subject }</td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan = 3>${rev.content }</td>
										</tr>
										<tr>
											<th>답변</th>
											<td colspan = 3>
												<form action="replyInputReview" method="post">
													<textarea name="reply" rows="10" cols="10">${rev.reply }</textarea><br>
													<input type="hidden" name="reviewNum" value="${rev.reviewNum}">
													<button type="submit">답변 달기</button> &nbsp;&nbsp;
												</form>
											</td>
										</tr>
									</table>
									<br>
									<a href="hosmyreview.net"><button type="button">확인</button></a>
								</div>
								
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
	<script src="resources/js/main.js"></script>
</body>
</html> 