<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head> 
<title>My Doctor_Mypage기본틀</title>
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
				<section id="banner">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
					<!-- 내가쓴 후기 시작 -->
				<div class="mypageContent">
				<h2 class="mod">내가 쓴 후기</h2>
				<div class="accordion">
  <div class="accordion__item">
    <h3 class="accordion__title js-title">병원이름(방문날짜)</h3>
    <div class="accordion__copy accordion__copy--open js-copy">
   <div><strong>스케일링 하나도 안아픈 병원은 처음이에요.</strong><br>
    상담원분들도 친절하고 과잉진료도 없어서 매우 만족스러웠습니다.
    치과 정착 못하고 있었는데 앞으로 치과갈일 있으면 여기만 가려구요.
    추천합니다.</div>
    <div><hr>
    <i class="fas fa-share fa-flip-vertical"></i> 후기 감사 드립니다. 진료가 만족스러우셨다니 다행입니다. 앞으로도 편안한 진료와
    친절한 서비스로 환자분의 불편함을 치료해드리는 땡땡치과 되겠습니다. 편안한 하루 되세요.
    </div>
    </div>
   
  </div>
  
  <div class="accordion__item">
    <h3 class="accordion__title js-title">후기2</h3>
    <div class="accordion__copy js-copy">By not having the imagination to imagine what the content "might" be, a design consideration is lost. Meaning becomes obfuscated because "it's just text", understandability gets compromised because nobody realized that this</div>
  </div>
  
  <div class="accordion__item">
    <h3 class="accordion__title js-title">후기3</h3>
    <div class="accordion__copy js-copy">By not having the imagination to imagine what the content "might" be, a design consideration is lost. Meaning becomes obfuscated because "it's just text", understandability gets compromised because nobody realized that this</div>
  </div>
  
  <div class="accordion__item">
    <h3 class="accordion__title js-title">후기4</h3>
    <div class="accordion__copy js-copy">By not having the imagination to imagine what the content "might" be, a design consideration is lost. Meaning becomes obfuscated because "it's just text", understandability gets compromised because nobody realized that this</div>
  </div>
  
  <div class="accordion__item">
    <h3 class="accordion__title js-title">후기5</h3>
    <div class="accordion__copy js-copy">By not having the imagination to imagine what the content "might" be, a design consideration is lost. Meaning becomes obfuscated because "it's just text", understandability gets compromised because nobody realized that this</div>
  </div>
</div>
				
				
				<!-- 내가쓴 후기 끝 -->
				<ul class="pagination">
														<li><span class="button disabled">Prev</span></li>
														<li><a href="#" class="page active">1</a></li>
														<li><a href="#" class="page">2</a></li>
														<li><a href="#" class="page">3</a></li>
														<li><a href="#" class="page">4</a></li>
														<li><a href="#" class="page">5</a></li>
														<li><a href="#" class="button">Next</a></li>
													</ul>
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



$title.click(function () {
  $(this).next(copy).slideToggle();
  $(this).parent().siblings().children().next().slideUp();
  return false;

});
</script>
</body>
</html>