<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
<head> 
<title>My Doctor_Mypage_내가쓴 후기</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/menuStyles.css" />
<style>
.rateResult{margin:2% 0}
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
					<a href="main" class="logo"><strong>My Doctor</strong> by
						team.5</a>

				</header>

				<!-- Banner: body -->
				<section id="banner">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
					<!-- 내가쓴 후기 시작 -->
				<div class="mypageContent">
				<h2 class="mod">내가 쓴 후기</h2>
			
				<c:if test="${listcount>0 }">
					<div class="accordion">	
					<c:forEach var="r" items="${myreviewlist}">
			<div class="accordion__item">
    <h3 class="accordion__title js-title" >${r.yadmnm }&nbsp;&#40;
    <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${r.visited }"/>&#41;</h3>
    <div class="accordion__copy accordion__copy--open js-copy">
   <div><strong>${r.subject }</strong><br>
  ${r.content }</div>
  <div>
 								
<div class="rateResult">
  💗 ${r.kindness}/5 &nbsp; 🩺 ${r.ability }/5 &nbsp; 🧾 ${r.price}/5 </div>
    <div>
    <hr>
    <i class="fas fa-share fa-flip-vertical"></i> ${r.reply }
    </div>
    </div>
    </div>
    </div>
   </c:forEach>
  </div>
  
  

				
				
				<!-- 내가쓴 후기 끝 -->
				<ul class="pagination">
				<c:if test="${page<=1}">
					<li><a href="#" class="button">Prev</a></li></c:if>
					<c:if test="${page>1}">
					<li><a href="myreview.net?page=${page-1 }" class="page">Prev</a></li>
					</c:if>
					<c:forEach var="a" begin="${startpage }" end="${endpage}">
					<c:if test="${a==page}">
					<li><a href="#" class="page">${a}</a></li></c:if>
					<c:if test="${a!=page}">
					<li><a href="myreview.net?page=${a }" class="page">${a}</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${page>=maxpage}">
					<li><a href="#" class="page">Next</a></li></c:if>
					<c:if test="${page<maxpage}">
					<li><a href="myreview.net?page=${page+1 }" class="page">Next</a></li>
					</c:if>
				</ul>
													
													</c:if>
													
					<c:if test="${listcount==0 }">	
					<font size=5>등록된 글이 없습니다.</font>	
					</c:if>						
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
var $title = $('.js-title');
var copy   = '.js-copy';
$title.next(copy).hide();
$title.click(function () {
  $(this).next(copy).slideToggle();
  $(this).parent().siblings().children().next().slideUp();
  return false;
  
});
 
 

  
 

 


</script>
</body>
</html>