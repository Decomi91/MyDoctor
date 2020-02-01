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
<link rel="stylesheet" href="resources/css/menuStyles.css" />
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
				<section id="banner" class="mod_body">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
				<div class="mypageContent mypageContent_mod">
			<form method="post" action="updateProcess.net" id="myInfo"><h2 class="mod">개인정보 수정</h2>
														<div class="row gtr-uniform">
															<div class="col-12 col-12-xsmall">
																<label>ID </label><input type="text" name="id" id="id" class="modifyInput" value="${myinfo.id }" readonly></div>
                                                               
                                                                <div class="col-12 col-12-xsmall">
                                                              <label> 이름</label> <input type="text" name="name" id="name" class="modifyInput" value="${myinfo.name }" readonly></div>
                                                                
                                                                <div class="col-12 col-12-xsmall">
                                                                <label>연락처 </label><input type="text" name="phone" id="phone" class="modifyInput" value="${myinfo.phone }"></div>
                                                                
                                                                <div class="col-9 col-12-xsmall">
                                                              <label> 주소</label> <input type="text" name="address" id="address" class="modifyInput" value="${myinfo.address }"></div>
															 <div class="col-3 col-9-xsmall">
															 <label>&nbsp;</label>
                                                               <input type="button" id="addrSearch" name="addrSearch" value="주소검색"></div>
															
															
															
															<div class="col-12 col-12-xsmall">
																<label>Email</label> <input type="email" name="email" id="email" class="modifyInput" value="${myinfo.email }">
															</div>
															
															
															<div class="col-6 col-12-xsmall">
															<label>생일</label> <input type="text" name="birth" id="birth" class="modifyInput" value="${myinfo.birth }" readonly>
															</div>
															
															<div class="col-6 col-12-xsmall">
															<label>성별</label> 
															<c:choose>
															<c:when test="${myinfo.gender ==1 }"> 
															<input type="text" name="gender" id="gender" class="modifyInput" value="남성" readonly>
															</c:when> 
															<c:when test="${myinfo.gender ==2 }"> 
															<input type="text" name="gender" id="gender" class="modifyInput" value="여성" readonly>
															</c:when>
															</c:choose>
															</div>
															<div class="col-6 col-12-xsmall modifybtn">
															<button type="reset" name="modifyReset" id="modifyReset">취소</button>
															<button type="submit" name="modifySubmit" id="modifySubmit">수정</button>
															
															</div>
														</div>
													</form>
													<form method="post" action="pwmodify.do"  id="myPassword"><h2 class="mod">비밀번호 수정</h2>
													<div class="row gtr-uniform">
													<!--  <div class="col-4 col-12-xsmall">
																<label>기존 비밀번호</label> <input type="password" name="ex_password" id="ex_password" class="modifyInput">
															</div>-->
															<div class="col-6 col-12-xsmall">
																<label>새 비밀번호</label> <input type="password" name="new_password" id="new_password" class="modifyInput">
															</div>
															<div class="col-6 col-12-xsmall">
																<label>비밀번호 확인</label> <input type="password" name="new_pass_ck" id="new_pass_ck" class="modifyInput">
															</div>
															<div class="col-4 col-12-xsmall">
															
															</div>
															<div class="col-6 col-12-xsmall">
															<span id="passckmsg"></span>
															</div>
															<div class="col-6 col-12-xsmall modifybtn">
															<button type="reset" name="modifyReset" id="modifyReset">취소</button>
															<button type="submit" name="modifySubmit" id="modifySubmit">수정</button>
															
															</div>
													</div>
													</form>
				</div>
					</div>
					
					</section>
 


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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

$('#new_pass_ck').keyup(function(){
	var newpass=$('#new_password').val();
	var passck=$('#new_pass_ck').val();
	if(!(newpass==passck)){
		$('#passckmsg').css('color', 'red').html('비밀번호가 일치하지 않습니다.');
		return false;
	}else{
		$('#passckmsg').css('color', 'green').html('비밀번호가 일치 합니다.');
	}
})

$('#addrSearch').click(function(){
		
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('address').value = "("+data.zonecode+")  "+fullRoadAddr; //5자리 새우편번호 사용
	                
	                //document.getElementById('address').value = data.jibunAddress;
	 
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            }
	        }).open();
	        
	        
	   
	})
</script>
</body>
</html>