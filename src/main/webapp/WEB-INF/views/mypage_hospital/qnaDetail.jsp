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
									<span class="noLink">게시글 정보</span>
								</nav>
								
								<div class = "table-wrapper reserveDetailDIV">
									<table class="reservetable mypagetable reserveDetailTable">
										<tr>
											<th>게시자</th>
											<td colspan = 3>${qna.writeId }</td>
										</tr>
										<tr>
											<th>게시일</th>
											<td colspan = 3>${qna.uploaddate }</td>
										</tr>
										<tr>
											<th>${qna.head }</th>
											<td colspan = 3>${qna.subject }</td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan = 3>${qna.content }</td>
										</tr>
										<tr>
											<th>답변</th>
											<td colspan = 3>
												<form action="replyInput" method="post">
													<textarea name="reply" rows="10" cols="10">${qna.reply }</textarea><br>
													<input type="hidden" name="boardNum" value="${qna.boardNum}">
													<button type="submit">답변 달기</button> &nbsp;&nbsp;
												</form>
											</td>
										</tr>
									</table>
									<br>
									<form action="qnaDelete" method="post" id="del">
										<input type="hidden" name="boardNum" value="${qna.boardNum}">
										<a href="hosmyboard.net"><button type="button">확인</button></a>
										<button type="submit">삭제</button>
									</form>
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
	<script>
		$(function(){
			$('#del').submit(function(){
				var del = confirm('정말 삭제하시겠습니까?');
				if(del == false){
					return false;
				}
			})
		})
	</script>
</body>
</html> 