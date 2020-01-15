<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor</title>
<jsp:include page="header.jsp" />
<meta charset="utf-8" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

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
										<table>
											<tr>
												<td rowspan = "3" class = "table-wrapper"><img alt="" src="resources/images/pic10.jpg" width = "50px"></td>
												<th onclick = "location.href='detail.net'">가나다병원</th>
											</tr>
											<tr>
												<td>내과, 가정의학과, 소아과</td>
											</tr>
											<tr>
												<td><i class="fas fa-grin-hearts"></i> ? / 10</td>
											</tr>
											
										</table>
									</div>
								</div>
							</td>
						</tr>
					</table>
					
				</section>	
				<!-- banner end -->
			</div>
		</div>

	</div>

	<!-- Scripts -->
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