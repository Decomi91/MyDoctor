<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>My Doctor</title>
<%-- 		<jsp:include page="../main/header.jsp" /> --%>
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
						<c:if test="${listcount > 0 }">
							<div class="container">
							<table class="table table-striped">
								<thead>
									<tr>
										<th colspan = "4">병원 정보 리스트</th>
										<th colspan = "2"><font size="3">병원의 수 : ${listcount }</font></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th width="10%">번호</th>
										<th width="15%">ID</th>
										<th width="35%">제목</th>
										<th width="20%">등록일</th>
										<th width="10%">상태</th>
										<th width="10%">관리</th>
									</tr>
									<c:forEach var="list" items="${boardlist }">
										<tr>
											<td>${list.boardNum }</td>
											<td>${list.id }</td>
											<td>${list.subject }</td>
											<td>${list.reqDate }</td>
											<td><c:if test="${list.checking==2 }">처리완료 </c:if>
												<c:if test="${list.checking==1 }">확인완료 </c:if>
												<c:if test="${list.checking==0 }">승인대기 </c:if></td>
											<td><a class="btn btn-primary" href="adminReqDetail?boardnum=${list.boardNum}">확인</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="center-block" id="space">
								<div class="row">
									<div class="col">
										<ul class="pagination">
											<c:if test="${page <= 1}">
												<li class="page-item">
													<a class="page-link gray" href="#">이전&nbsp;</a>
												</li>
											</c:if>
											<c:if test="${page > 1}">
												<li class="page-item">
													<a href="requestToAdmin?page=${page-1 }" class="page-link">이전</a>&nbsp;
												</li>								
											</c:if>
											
											<c:forEach var="i" begin="${startpage }" end="${endpage }">
												<c:if test="${i==page }">
													<li class="page-item"><a href="#" class="page-link gray">${i }</a></li>
												</c:if>
												<c:if test="${i!=page }">
													<li class="page-item"><a href="requestToAdmin?page=${i }" class="page-link">${i }</a></li>
												</c:if>
											</c:forEach>
											
											<c:if test="${page == endpage}">
												<li class="page-item">
													<a class="page-link gray" href="#">&nbsp;다음</a>
												</li>
											</c:if>
											<c:if test="${page != endpage}">
												<li class="page-item">
													<a href="requestToAdmin?page=${page+1 }" class="page-link">&nbsp;다음</a>
												</li>								
											</c:if>								
										</ul>
									</div>
								</div>
							</div>
							</div>
								
						</c:if>
						<c:if test="${listcount == 0 }">
							<font size=5>등록된 글이 없습니다.</font>
						</c:if><br>
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