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
							<table class="table table-striped">
								<thead>
									<tr>
										<th>항목 </th>
										<th colspan= "4">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>ID</th>
										<td colspan="4">${member.id }</td>
									</tr>
									<tr>
										<th>PW</th>
										<td colspan="4">${member.password }</td>
									</tr>
									<tr>
										<th>이름</th>
										<td colspan="4">${member.name }</td>
									</tr>
									<tr>
										<th>전화</th>
										<td colspan="4">${member.phone }</td>
									</tr>
									<tr>
										<th>주소</th>
										<td colspan="4">${member.address }</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td colspan="4">${member.email }</td>
									</tr>
									<tr>
										<td>생일</td>
										<td colspan="4">${member.birth }</td>
									</tr>
									<tr>
										<td>성별</td>
										<td colspan="4">
											<c:choose>
												<c:when test="${member.gender == 1}">
													남자
												</c:when>
												<c:otherwise>
													여자
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td></td>
										<td>
											<form action="memberWithdraw" method="post">
												<input type="hidden" name="id" value="${member.id }">
												<button type="submit">탈퇴</button>	
												<a href="javascript:history.go(-1)"><button type="button">돌아가기</button></a>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
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