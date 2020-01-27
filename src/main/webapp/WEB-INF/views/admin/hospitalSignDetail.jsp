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
										<th>병원 ID</th>
										<td colspan="4">${hospital.id }</td>
									</tr>
									<tr>
										<th>병원 이름</th>
										<td colspan="4">${hospital.yadmNm }</td>
									</tr>
									<tr>
										<th>병원 주소</th>
										<td colspan="4">${hospital.addr }</td>
									</tr>
									<tr>
										<th>병원 전화</th>
										<td colspan="4">${hospital.hphone }</td>
									</tr>
									<tr>
										<th>병원 요양 기호</th>
										<td colspan="4">${hospital.yki }</td>
									</tr>
									<tr>
										<th>병원 근무시간</th>
										<td colspan="2">
											<table>
												<tr>
													<td>월</td>
													<td>${hospital.monStart } ~ ${hospital.monEnd}</td>
												</tr>
												<tr>
													<td>화</td>
													<td>${hospital.tueStart } ~ ${hospital.tueEnd}</td>
												</tr>
												<tr>
													<td>수</td>
													<td>${hospital.wedStart } ~ ${hospital.wedEnd}</td>
												</tr>
												<tr>
													<td>목</td>
													<td>${hospital.thuStart } ~ ${hospital.thuEnd}</td>
												</tr>
												<tr>
													<td>금</td>
													<td>${hospital.friStart } ~ ${hospital.friEnd}</td>
												</tr>
												<tr>
													<td>토</td>
													<td>${hospital.satStart } ~ ${hospital.satEnd}</td>
												</tr>
												<tr>
													<td>일</td>
													<td>${hospital.sunStart } ~ ${hospital.sunEnd}</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>병원 의사</td>
										<td colspan="4">${hospital.doctors }명</td>
									</tr>
									<tr>
										<td>등록일</td>
										<td colspan="4">${hospital.joindate }</td>
									</tr>
									<tr>
										<td colspan="2"></td>
										<td>
											<form action="hospitalSignOkay" method="post">
												<input type="hidden" name="hosid" value="${hospital.id }">
												<button type="submit">등록</button>
												<a href="javascript:history.go(-1)"><button type="button">취소</button></a>
											</form>
										</td>
										<td></td>
										<td></td>
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