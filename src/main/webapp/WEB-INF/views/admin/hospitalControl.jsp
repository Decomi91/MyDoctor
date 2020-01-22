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
										<th><font size="3">병원의 수 : ${listcount }</font></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th width="10%">번호</th>
										<th width="25%">병원ID</th>
										<th width="30%">병원명</th>
										<th width="20%">등록일</th>
										<th width="15%">관리</th>
									</tr>
									<c:set var="num" value="${listcount-(page-1)*10 }"/>
									<c:forEach var="list" items="${hoslist }">
										<tr>
											<td>
												<c:out value="${num }"/>
												<c:set var="num" value="${num-1 }"/>
											</td>
											<td>${list.id }</td>
											<td>${list.yadmNm }</td>
											<td>${list.joindate }</td>
											<td><a class="btn btn-primary" href="hospitalDetail?yki=${list.yki}">관리</a></td>
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
													<a href="hospitalcontrol?page=${page-1 }" class="page-link">이전</a>&nbsp;
												</li>								
											</c:if>
											
											<c:forEach var="i" begin="${startpage }" end="${endpage }">
												<c:if test="${i==page }">
													<li class="page-item"><a href="#" class="page-link gray">${i }</a></li>
												</c:if>
												<c:if test="${i!=page }">
													<li class="page-item"><a href="hospitalcontrol?page=${i }" class="page-link">${i }</a></li>
												</c:if>
											</c:forEach>
											
											<c:if test="${page == endpage}">
												<li class="page-item">
													<a class="page-link gray" href="#">&nbsp;다음</a>
												</li>
											</c:if>
											<c:if test="${page != endpage}">
												<li class="page-item">
													<a href="hospitalcontrol?page=${page+1 }" class="page-link">&nbsp;다음</a>
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
				
		<div id="sidebar">
			<div class="inner">
			
				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>
		
		
				<!-- Login & Mypage -->
				<!-- id 값이 admin이 아닐 경우 -->
				<c:if test="${loginid != 'admin'}">
					<script>
						location.replace('main');
					</script>
				</c:if>
				<c:if test="${loginid == 'admin'}">
					<section>
						<header class="major">
							<h2>관리자 계정</h2>
						</header>
						<div class="box" style="margin-bottom: 1em">
							<p class="reservationnoti">
								<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;관리자 요청 게시글이
								 &nbsp;&nbsp; <a href="#">?</a> 건 있습니다.
							</p>
						</div>
						<ul class="contact">
							<li
								class="icon solid far fa-clipboard-list mypageacess"><a
								href="hospitalcontrol">병원 관리</a></li>
							<li class="icon solid far fa-clipboard-list mypagelisecond-child mypageacess"><a
								href="usercontrol">회원 관리</a></li>
							<li class="icon solid fas fa-folder-open mypageacess"><a
								href="requestToAdmin">요청 게시판</a></li>
						</ul>
						<a href="logout" class="button primary fit koreanfont">로그아웃</a>
					</section>
				</c:if>
				<c:if test="${loginid != 'admin'}">
					<!-- Section2_Contact -->
					<section>
						<header class="major">
							<h2>Contact</h2>
			
						</header>
						<p>
							제휴 관련하여 문의 사항이 있는 병원에서는 연락주세요 &nbsp;&nbsp;<a href="#">지금바로 요청,
								Click Here!</a>
						</p>
						<ul class="contact">
							<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
							<li class="icon solid fa-phone">(000) 000-0000</li>
							<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
								Seoul, TN 00000-0000
							</li>
						</ul>
					</section>
				</c:if>
			
				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; MY DOCTOR. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>
			
		</div>
		</div>
		
		<script src="resources/js/jquery.min.js"></script>
		<script src="resources/js/browser.min.js"></script>
		<script src="resources/js/breakpoints.min.js"></script>
		<script src="resources/js/util.js"></script>
		<script src="resources/js/main.js"></script>
	</body>
</html>