<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 관심병원</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/menuStyles.css" />
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
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
						<jsp:include page="mypage_menu.jsp"></jsp:include>
						<div class="mypageContent">

							<!-- 관심 병원 -->
							<div>
								<nav>
									<span class="noLink">관심 병원</span>
								</nav>
								
								<div class = "table-wrapper" style = "text-align: center;">
									
									<c:if test="${listcount > 0}">
										<c:forEach var = "bm" items = "${bm }">
											<div class = "bookmarkRepeat">
												<div class = "bookmarkHosname">
													<span class = "bookmarkIcon">
														<i class="icon far fa-heart solid bookmarkIcon fa-2x fav_hos" 
															onClick = "location.href='bookmarkcancel.do?ykiho=${bm.yki}'"></i>
													</span>
													<span class = "HosnameA">
													${bm.yadmNm }
													</span>
													<a href="reserve.net?yki=${bm.yki }"
														class="button koreanfont bookReserve">예약하기</a>
												</div>
												<div class = "bookmarkHosInfo" style = "display : none">
													<span class = "infoSpan">${bm.addr }</span>
													<span class = "infoSpan infoHphone">${bm.hphone }</span>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${listcount == 0 }">
									<span>등록된 관심병원이 없습니다.</span>
									</c:if>
									
									<div class="center-block">
										<div class="row">
											<div class="col">
												<ul class="pagination">
													<c:if test="${page<=1}">
														<li class="page-item">
														<a class="page-link"  href="#">이전&nbsp;</a>
														</li>
													</c:if>
													<c:if test="${page > 1}">
														<li class="page-item">
															<a href="mypage.net?page=${page-1}" class="page-link">이전</a>&nbsp;
														</li>
													</c:if>
													
													<c:forEach var="a" begin="${startpage}" end="${endpage}">
														<c:if test="${a==page}">
															<li class="page-item">
																<a class="page-link" href="#">${a}</a>
															</li>
														</c:if>
														<c:if test="${a != page}">
															<li class="page-item">
																<a href="mypage.net?page=${a }" class="page-link">${a}</a>
															</li>
														</c:if>
													</c:forEach>
													
													<c:if test="${page>=maxpage}">
														<li class="page-item">
															<a class="page-link" href="#">&nbsp;다음</a>
														</li>
													</c:if>
													<c:if test="${page<maxpage}">
														<li class="page-item">
															<a href="mypage.net?page=${page+1}"  class="page-link">&nbsp;다음</a>
														</li>
													</c:if>
												</ul>
											</div>
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
		$(function(){
			$(".bookmarkHosname").each(function(index, item){
				$(this).click(function(){
					var submenu = $(this).next(".bookmarkHosInfo");

					// submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
					if( submenu.is(":visible") ){
						submenu.slideUp();
					}else{
						submenu.slideDown();
					}
				});
			});
			// menu class 중에 두번째 있는 menu 의 하위에 있는 a태그에 클릭 이벤트를 발생시킨다.
			$(".bookmarkHosname:eq(0)").click();
			
			
			function phoneFormat(num){
				var formatNum = "";
				
				if(num.length != 8)
					num = '0' + num;
				
				if(num.length == 11){
					formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, "$1-$2-$3");
				}else if(num.length == 10){
					formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, "$1-$2-$3");
				}else if(num.length==8){
			        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
			    }else{
			        if(num.indexOf('02')==0){
			           formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
			        }else{
			           formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
			        }
			    }
				return formatNum;
			}
			
			$(".infoHphone").each(function(index, item){
				var phone = $(this).text();
				console.log(phone);
				$(this).text(phoneFormat(phone));
			});
			
		})
	</script>
</body>
</html>