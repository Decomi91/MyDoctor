<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>My Doctor</title>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/css/main.css" />
		<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
		<div id="wrapper">

		<!-- Main -->
			<div id="main">
				<div class="inner">
					<header id="header">
						
						<a href="main" class="logo"><strong>My Doctor</strong> by
							team.5</a>
					</header>
					<!-- Banner: body -->
					<section id="banner">
						<div class="container">
							<form action="adminReqReply" method="post">
								<table class="table table-striped">
									<thead>
										<tr>
											<th  width="15%">항목 </th>
											<th colspan = "2" width="50%">내용</th>
											<th  width="10%">번호</th>
											<td colspan = "2" width="25%">${board.boardNum }</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>요청 ID</th>
											<td colspan="2">${board.id }</td>
											<th>요청일</th>
											<td colspan="2">${board.reqDate }</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="4">${board.subject }</td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan="4">${board.content }</td>
										</tr>
										<tr>
											<td>댓글 작성</td>
											<td colspan="4">
												<input type="hidden" name="boardNum" value="${board.boardNum }">
												<input type="hidden" name="checking" value="${board.checking }">
												<textarea rows="10" cols="8" name="reply" required="required">${board.reply}</textarea>
											</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="4"><button type="submit">등록</button>	
												<a href="javascript:history.go(-1)"><button type="button">돌아가기</button></a></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>		
						<br>
					</section>
				</div>
			</div>
			<!-- Sidebar -->
			<jsp:include page="../header/footer.jsp"></jsp:include>
		</div>
		
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/browser.min.js"></script>
		<script src="resources/js/breakpoints.min.js"></script>
		<script src="resources/js/util.js"></script>
		<script src="resources/js/main.js"></script>
	</body>
</html>