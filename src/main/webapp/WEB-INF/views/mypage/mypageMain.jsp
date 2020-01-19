<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 마이페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/menuStyles.css" />
<style>
.bookmarkHos{    color: #222;
    font-size: 20px;
    padding-top: 2px;
    padding-bottom: 1px;
    line-height: 1.3;
    margin-bottom: -1px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;}
    
    .bookmarkScore{color: #e7711b;}
    
 .bookmarkOut{
 	border : 1px solid grey;
 	border-radius: 3px;
 	width : 80%;
 	margin : 0 auto;
 	padding : 10px;
 	height : 800px;
 }
.aaa {
	float : left;
}
 .ttt {
 	float : right;
 	width : 15%
 }
 
 .bookmarkIcon{padding : 15px}
 
 .bookmarkSpan{padding : 15px}
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
						<jsp:include page="mypage_menu.jsp"></jsp:include>
						<div class="mypageContent">

							<!-- Reservation -->
							<div id="reservationDIV">
								<nav id="boardMenu">
									<ul>
										<li id="reviewli"><a class="menuLink" href="#"
											id="reviewa"> Reservation </a></li>
										<li id="qnali"><a class="menuLink" href="#" id="qnaa">Chart
										</a></li>
									</ul>
								</nav>

								<div class="table-wrapper">
									<table class="reservetable mypagetable">
										<thead>
											<tr>
												<th width=30%>예약 시간</th>
												<th width=25%>병원</th>
												<th width=25%>진행 상황</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<!-- 순서를 최신순으로 할지? -->
											<tr>
												<td>2010.01.01 16:00</td>
												<td>땡땡병원</td>
												<td><span class="hoswaiting reservebox">승인 대기중</span></td>
												<td><a href="#">예약 취소&nbsp;<i
														class="fas fa-angle-right"></i></a></td>
											</tr>
											<tr>
												<td>2010.01.02 13:00</td>
												<td>땡땡병원</td>
												<td><span class="hoscancel reservebox">취소된 예약</span></td>
												<td></td>
											</tr>
											<tr>
												<td>2010.01.03 17:00</td>
												<td>밝은이 안과</td>
												<td><span class="hossoon reservebox">방문 예정</span></td>
												<td></td>
											</tr>
											<tr>
												<td>2010.01.05 16:00</td>
												<td>토마토 치과</td>
												<td><span class="hosfinish reservebox">진료 완료</span></td>
												<td><a href="#">후기 작성&nbsp;<i
														class="fas fa-angle-right"></i></a></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- Reservation end -->


							<!-- 관심 병원 -->
							<div>
								<nav>
									<span class="noLink">관심 병원</span>
								</nav>

								<div class="bookmarkOut">
									<!-- 반복될 목록 -->
									<div>
										<div class = "aaa">
											<a href = "detail.net"></a>
											<div class = bookmarkHos>덕산병원</div>
											<div>
												<span class = "bookmarkScore"><i class="fas fa-grin-hearts"></i> ? / 10</span>
												<span>(13)</span>
												· 내과/이비인후과
											</div>
											<div>
												<span>서울시 구로구 오류1동 18-51</span>
											</div>
											<div>
												<span>02-1234-1234</span>
											</div>
										</div>
										
											<div class = "ttt">
												<i class="fas fa-heart bookmarkIcon"></i><br>
												<span class = "bookmarkSpan">찜 취소</span>
											</div>
											<div class = "ttt">
												<a href = "#">
													<i class="fas fa-globe-americas bookmarkIcon"></i><br>
													<span class = "bookmarkSpan">웹사이트</span>
												</a>
											</div>
									</div>
								</div>
							</div>
							<!-- 관심 병원 end -->
							
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