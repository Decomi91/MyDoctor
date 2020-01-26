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
					<a href="index.html" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
					<jsp:include page="hosmypage_menu.jsp"></jsp:include>
						<div class="mypageContent">
						
							<div id="reservationDIV">
								<nav>
									<span class="noLink">상세 정보</span>
								</nav>
								
								<div class = "table-wrapper reserveDetailDIV">
									<table class="reservetable mypagetable reserveDetailTable">
										<tr>
											<th>예약 번호</th>
											<td colspan = 3>${rv.reserveNo }
										</tr>
										<tr>
											<th>예약 시간</th>
											<td colspan = 3>${rv.reserveTime }</td>
										</tr>
										<tr>
											<th>환자 이름</th>
											<td>${rv.name }</td>
											<th>연락처</th>
											<td id = "reservephone">${member.phone }</td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td>${member.birth }</td>
											<th>성별</th>
											<td id = "reservegender">${member.gender }</td>
										</tr>
										<tr>
											<th>주소</th>
											<td colspan = 3>${member.address }</td>
										</tr>
										<tr>
											<th>증상</th>
											<td colspan = 3>${rv.disease }</td>
										</tr>
									</table>
									<button id = "reserveDetailbtn">확인</button>
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
		$("#nearpharmacy").click(function() {
			$("#nearhospital").removeClass('primary');
			$("#nearpharmacy").addClass('primary');
		})
		$("#nearhospital").click(function() {
			$("#nearpharmacy").removeClass('primary');
			$("#nearhospital").addClass('primary');
		})
		
		$(function(){
			if($("#reservegender").val() == 0){
				$("#reservegender").text("남");
			}else{
				$("#reservegender").text("여");
			}
			
			console.log($("#reservephone").text());
			
			function phoneFormat(num){
				var formatNum = "";
				
				if(num.length == 11){
					formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
				}else if(num.length == 10){
					formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
				}
				
				return formatNum;
			}
			
			var phone = $("#reservephone").text();
			$("#reservephone").text(phoneFormat(phone));
		})
		
	</script>
</body>
</html> 