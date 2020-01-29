<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - ReserveForm</title>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<style>
</style>
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

						<div id = "reserveBar">
							<div class = "reserveIcon">
								<i class="fas fa-hourglass-half fa-4x" style = "color : #f56a6a;"></i>
								<span style = "color : #f56a6a; font-weight : bold;position: relative;  bottom: 11px;">예약 신청</span>
							</div>

							<div class = "reserveIcon">
								<i class="fas fa-check-circle fa-4x"></i>
								<span style = "position: relative; bottom: 11px;">예약 확인</span>
							</div>
						</div>

						<div id = "reserveForm">
							<form name = "reserForm" action = "reserveProcess.net" method = "post">
							<input type = "hidden" name = "hosid" value = "${hospital.id }"> 
								<table id = "reserveTable">
									<tr>
										<td>이름</td>
										<td>
											<input type = "text" name = "name" class = "textReadonly" value = "${member.name }" readOnly>
										</td>
										<td>성별</td>
										<td colspan = 2>
											<input type = "text" name = "gender" class = "textReadonly" value = "${member.gender }" readOnly>
										</td>
									</tr>
									<tr>
										<td>전화번호</td>
										<td>
											<input type = "text" name = "phone" class = "textReadonly" value = "${member.phone }" readOnly>
										</td>
										<td>생년월일</td>
										<td colspan = 2>
											<input type = "text" name = "birth" class = "textReadonly" value = "${member.birth }" readOnly>
										</td>
									<tr>
										<td>병원명</td>
										<td colspan = 4>
											<input type = "text" name = "hosname" class = "textReadonly" value = "${hospital.yadmNm }" readOnly>
										</td>
									</tr>
									<tr>
										<td>예약 날짜</td>
										<td>	<!-- min에 ${date}로 오늘 날짜 받아와서 넣기 -->
											<input type = "date" name = "reserveDate" min = "${today }" id = "reserveDate">
										</td>
										<td>예약 시간</td>
										<td>
											<select name = "hour" id = "hour">
												<option value="none" selected hidden>시</option>
												<%for(int i = 8; i <= 18; i++){ %>
												<option value = <%=i %>><%=i %></option>
												<%} %>
											</select>
										</td>
										<td>
											<select name = "minute" id = "minute">
												<option value="none" selected hidden>분</option>
												<option value = "00">00</option>
												<option value = "15">15</option>
												<option value = "30">30</option>
												<option value = "45">45</option>
											</select>
										</td>
									</tr>
								</table>
								
								<textarea maxLength = "100" name="disease" id = "reserveText" placeHolder = "증상을 입력하세요."></textarea>
								<div id = textareaCounter>0 / 100</div>
								
								<div id = "reserveBtnDIV">
									<input type = "submit" class = "reserveBtn" value = "예약하기">
									<input type = "reset" class = "reserveBtn" value = "취소">
								</div>
							</form>
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
			
			$("form").submit(function(){
				if($("#reserveDate").val() == ""){
					alert("예약 날짜를 선택하세요.");
					$("#reserveDate").focus();
					return false;
				}
				
				if($("#hour").val() == "none"){
					alert("예약할 시를 입력하세요.");
					$("#hour").focus();
					return false;
				}
				
				if ($("#minute").val() == "none"){
					alert("예약할 분을 입력하세요.");
					 $("#minute").focus();
					 return false;
				}
			});	// submit end

			$('#reserveText').on('keyup', function() {
				var content = $(this).val();
			    $('#textareaCounter').html(content.length +" / 100");

				if($(this).val().length > 100) {
					$(this).val($(this).val().substring(0, 100));
				}
			});	// textarea keyup end
			
			if($("input[name='gender']") == 0){
				$("input[name='gender']").val("남");
			}else{
				$("input[name='gender']").val("여");
			}
			
			function phoneFormat(num){
				var formatNum = "";
				num = '0' + num;
				if(num.length == 11){
					formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
				}else if(num.length == 10){
					formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
				}
				
				return formatNum;
			}
			
			var phone = $("input[name='phone']").val();
			$("input[name='phone']").val(phoneFormat(phone));
		});
	</script>
</body>
</html> 