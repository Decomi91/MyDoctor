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
					<a href="index.html" class="logo"><strong>My Doctor</strong> by
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
															<div class="col-12 col-9-xsmall">
                                                               <label>나머지 주소</label> <input type="text" name="address2" id="address2" class="modifyInput" value="${myinfo.address}"></div>
															
															
															<div class="col-6 col-12-xsmall">
																<label>Email</label> <input type="email" name="email" id="email" class="modifyInput" value="${myinfo.email }">
															</div>
															<div class="col-6 col-12-xsmall">
															<label>&nbsp;</label>
																<select name="email-domain" id="emailCategory" class="modifyInput" value="${myinfo.email }">
																	<option value="">이메일주소</option>
																	<option value="1">naver.com</option>
																	<option value="2">gmail.com</option>
																	<option value="3">hanmail.net</option>
																</select>
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
													<form method="post" action="updatePass"  id="myPassword"><h2 class="mod">비밀번호 수정</h2>
													<div class="row gtr-uniform">
													<div class="col-4 col-12-xsmall">
																<label>기존 비밀번호</label> <input type="password" name="password" id="ex_password" class="modifyInput">
															</div>
															<div class="col-4 col-12-xsmall">
																<label>새 비밀번호</label> <input type="password" name="new_password" id="new_password" class="modifyInput">
															</div>
															<div class="col-4 col-12-xsmall">
																<label>비밀번호 확인</label> <input type="password" name="new_pass_ck" id="new_pass_ck" class="modifyInput">
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
<script>

</script>
</body>
</html>