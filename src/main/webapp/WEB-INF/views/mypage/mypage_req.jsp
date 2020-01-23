<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
<head> 
<title>My Doctor_Mypage문의/요청</title>
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
				<section id="banner">
					<div class="content">
					<!-- 마이페이지 메뉴 include -->
					<jsp:include page="mypage_menu.jsp"></jsp:include>	
					<!-- 내가쓴 후기 시작 -->
				<div class="mypageContent">
				<label class="mod qnabtn tohos"><input type="radio" name="reqselbtn" value="1" checked="checked">문의 내역</label>
				<label class="mod qnabtn toadmin"><input type="radio" name="reqselbtn" value="2">요청 내역</label> 
				
				
				<div class="accordion">
  <div class="accordion__item">
    <h3 class="accordion__title js-title">병원이름(질문날짜)</h3>
    <div class="accordion__copy accordion__copy--open js-copy">
   <div><strong>스케일링할때도 마취하나요?</strong><br>
   쫄보예요. 안아팠음 좋겠어요. 혹시 스케일링할때도 마취가능한가요?</div>
    <div><hr>
    <i class="fas fa-share fa-flip-vertical"></i> 문의 답변드립니다.
    주사를 통해 국소마취가 가능하긴 합니다만 내원하시어 상담 후 결정하실것을 추천드립니다.
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

$('input[type=radio]:checked').parent().css('color','#f56a6a');
$('input[type=radio]').change(function(){
	console.log($('input[type=radio]:checked').val());
	$('input[type=radio]:checked').parent().css('color','#f56a6a');
	$('input[type=radio]:not(:checked)').parent().css('color','#7f888f');
})

</script>
</body>
</html>