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
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Main -->
<!-- 				<div id="main"> -->
<!-- 					<div class="inner"> -->
						<!-- Header -->
						<header id="header">
						
							<a href="main" class="logo"><strong>My Doctor</strong> by
								team.5</a>
						</header>
<!-- 					</div> -->
<!-- 				</div> -->
				<!-- Banner: body -->
				<section id="banner">
					<table>
						<tr>
							<td class="content">
								<div>
									<button class="nearhospital koreanfont primary" id="nearhospital">주변 병원</button>
									<button class="nearpharmacy koreanfont" id="nearpharmacy">주변 약국</button><br>
									<div>
										<img src="resources/images/pic10.jpg" alt="" class = "mapsize"/>
									</div>
								</div>
							</td>
							
							<td class="content">
								<div>
									<select name="demo-category" id="demo-category" class="categorysel">
										<option value="">진료과목</option>
										<option value="1">소아과</option>
										<option value="2">치과</option>
										<option value="3">안과</option>
										<option value="4">정형외과</option>
									</select>
									<section id="search" class="alt hospitalsearch">
										<form method="post" action="#">
											<input type="text" name="query" id="query" placeholder="병원이름 또는 증상을 입력하세요." />
										</form>
									</section>
									
									<!-- 병원 list -->
									<div style="overflow:auto;" class="mapsize">
										<c:forEach var = "h" items = "${hoslist }">
											<table>
												<tr>
													<td rowspan = "3" class = "table-wrapper"><img alt="" src="resources/images/pic10.jpg" width = "50px"></td>
													<th onclick = "location.href='detail.net?id=${h.id}'">${h.yadmNm }</th>
												</tr>
												<tr>
													<td>내과, 가정의학과, 소아과</td>
												</tr>
												<tr>
													<td><i class="fas fa-grin-hearts"></i> ? / 10</td>
												</tr>
											</table>
										</c:forEach>
									</div>
								</div>
							</td>
						</tr>
					</table>
					
				</section>	
				<!-- banner end -->
				
				
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
		$("#nearpharmacy").click(function() {
			$("#nearhospital").removeClass('primary');
			$("#nearpharmacy").addClass('primary');
		})
		$("#nearhospital").click(function() {
			$("#nearpharmacy").removeClass('primary');
			$("#nearhospital").addClass('primary');
		})
	</script>
</body>
</html>