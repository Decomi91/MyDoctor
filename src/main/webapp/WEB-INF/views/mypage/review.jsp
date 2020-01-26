<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 리뷰 작성</title>
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
						<jsp:include page="mypage_menu.jsp"></jsp:include>
						
						<div class="mypageContent mypageContent_mod">
							<form method="post" action="ReviewAddAction.do" id="myInfo">
								<h2 class="mod">Review</h2>
								
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<label>ID</label>
										<input type="text" name="id" id="id" class="modifyInput" value="${member.id }" readonly>
									</div>

									<div class="col-6 col-12-xsmall">
										<label>이름</label> 
										<input type="text" name="name" id="name" class="modifyInput" value="${member.name }" readonly>
									</div>
									
									<div class="col-4 col-9-xsmall">
										<label>병원명</label> 
										<input type="text" name="hospital" id="hospital" class="modifyInput" value="${reservation.hosname }" readOnly>
									</div>

									<div class="col-4 col-12-xsmall">
										<label>진료날짜</label> 
										<input type="text" name="visited" id="visited" class="modifyInput" value="${reservation.reserveTime }" readOnly>
									</div>

									<div class="col-4 col-12-xsmall">
										<label>증상</label> 
										<input type="text" name="disease" id="disease" class="modifyInput" value="${reservation.disease }" readonly>
									</div>

									<div class="col-6 col-12-xsmall">
										<label>작성날짜</label> 
										<input type="text" name="uploaddate" id="uploaddate" class="modifyInput" value="${today }" readonly>
									</div>
									
									<div class="col-12 col-12-xsmall">
										<label>제목</label> 
										<input type="text" name="subject" id="writeDate" class="modifyInput" placeHolder="제목을 입력하세요." required>
									</div>
									
									<div class="col-12 col-12-xsmall">
										<label>내용</label> 
										<textarea name="content" id="content" cols="67" rows="10" placeHolder="내용을 입력하세요." required ></textarea>
									</div>
									
									<div class="col-6 col-12-xsmall modifybtn">
										<button type="submit" name="reviewSubmit" id="modifySubmit">등록</button>
										<button type="reset" name="reviewReset" id="modifyReset">취소</button>
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