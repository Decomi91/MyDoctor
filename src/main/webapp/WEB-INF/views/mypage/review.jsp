<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>

<html>
<head>
<title>My Doctor - 리뷰 작성</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<link rel="stylesheet" href="resources/css/menuStyles.css" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style>
input{border:none !important; background-color:transparent !important; display: inline-block !important;
width: 70% !important;}
div{padding-top:0.5em !important;}
.writereviewbtn{padding-left:0 !important; text-align:center;}
#subject{border-bottom: 1px solid rgb(245, 106, 106) !important;
background-color:transparent !important; border-radius: 0px !important; margin-left:2%; margin-bottom:2%
}
#content{border: 1px solid rgb(245, 106, 106)!important; border-radius: 4px; margin:1%}


div.left{width:60% !important;display: inline-block !important; }

strong{width:20% !important; text-align:left; margin-right:2%}
.ratehos{padding-top:0 !important}


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
				<section id="banner" class="mod_body">
					<div class="content">
						<jsp:include page="mypage_menu.jsp"></jsp:include>
						
						<div class="mypageContent mypageContent_mod">
							<form method="post" action="ReviewAddAction.do" id="myInfo">
								<h2 class="mod">Review</h2>
								
								<div class="row gtr-uniform">
								<!-- 작성자, 진료기록 정보 불러오는 부분 -->
									<div class="col-6 col-12-xsmall">
										<strong>ID</strong><input type="text" name="id" id="id" value="${reserveRecord.id }" readonly>
									</div>

									<div class="col-6 col-12-xsmall">
										<strong>이름</strong> 
										<input type="text" name="name" id="name"  value="${reserveRecord.name }" readonly>
									</div>
									
									<div class="col-8 col-12-xsmall">
										<strong>병원명</strong> 
										<input type="text"  value="${reserveRecord.hosname}" readOnly>
									<input type="hidden" name="hospital" id="hospital"  value="${reserveRecord.hosid}" readOnly>
									</div>

									<div class="col-12 col-12-xsmall">
										<strong>진료날짜</strong>
										<input type="text" name="visited" id="visited" value="${reserveRecord.reserveTime }" readOnly>
									</div>

									<div class="col-8 col-12-xsmall">
										<strong>증상</strong>
										<input type="text" name="disease" id="disease"  value="${reserveRecord.disease }" readonly>
									</div>

									<!-- 별점 -->
						
									<div class="col-12 col-12-xsmall ratehos">
<strong class="ratingS">친절</strong>									
<div class="rating left kindness">
  <div class="stars right">
    <a class="star rated" ><input type="hidden" value="1"></a>
    <a class="star rated"><input type="hidden" value="2"></a>
    <a class="star rated"><input type="hidden" value="3"></a>
    <a class="star"><input type="hidden" value="4"></a>
    <a class="star"><input type="hidden" value="5"></a>
  </div>
</div>
<input type="hidden" id="kindness" name="kindness" value="3">
</div>		
<div class="col-12 col-12-xsmall ratehos">
<strong class="ratingS">진료</strong>									
<div class="rating left ability">
  <div class="stars right">
    <a class="star rated" ><input type="hidden" value="1"></a>
    <a class="star rated"><input type="hidden" value="2"></a>
    <a class="star rated"><input type="hidden" value="3"></a>
    <a class="star"><input type="hidden" value="4"></a>
    <a class="star"><input type="hidden" value="5"></a>
  </div>
</div>
<input type="hidden" id="ability" name="ability" value="3">
</div>							
<div class="col-12 col-12-xsmall ratehos">
									<strong class="ratingS">가격</strong>
<div class="rating left price">
  <div class="stars right">
     <a class="star rated" ><input type="hidden" value="1"></a>
    <a class="star rated"><input type="hidden" value="2"></a>
    <a class="star rated"><input type="hidden" value="3"></a>
    <a class="star"><input type="hidden" value="4"></a>
    <a class="star"><input type="hidden" value="5"></a>
  </div>
</div>
<input type="hidden" id="price" name="price" value="3">
</div>							
							<!-- 후기작성 -->
									<div class="col-12 col-12-xsmall">
										<strong>제목</strong> 
										<input type="text" name="subject" id="subject"  placeHolder="제목을 입력하세요." required>
									</div>
									
									<div class="col-12 col-12-xsmall">
										<strong>내용</strong> 
										<textarea name="content" id="content" cols="67" rows="10" placeHolder="내용을 입력하세요." required ></textarea>
									</div>
									
									<div class="col-6 col-12-xsmall modifybtn writereviewbtn">
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
 
$("button[type='submit']").click(function(){
	$("#inquiryForm").toggle();
	var frm = document.qnaform;
		if(frm.contents.value.length < 1){
			alert("내용을 적어주셔야 합니다.");
			frm.contents.focus();
			return;
		}

		if(confirm("후기를 등록하시겠습니까?")){
			frm.submit();
		}
	});
	
$('.rating .star').hover(function() {
    $(this).addClass('to_rate');
    $(this).parent().find('.star:lt(' + $(this).index() + ')').addClass('to_rate');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').addClass('no_to_rate');
  }).mouseout(function() {
    $(this).parent().find('.star').removeClass('to_rate');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate');
  }).click(function() {
    $(this).removeClass('to_rate').addClass('rated');
    $(this).parent().find('.star:lt(' + $(this).index() + ')').removeClass('to_rate').addClass('rated');
    $(this).parent().find('.star:gt(' + $(this).index() + ')').removeClass('no_to_rate').removeClass('rated');
    
    		
    /*Save your rate*/
    /*TODO*/
  });
  $('.kindness .star').click(function() {
	    console.log($(this).find('input').val());
	    var kindness=$(this).find('input').val();
	    kindness=Number(kindness);
	    document.getElementById('kindness').value =kindness;
	  });
  $('.ability .star').click(function() {
	    console.log($(this).find('input').val());
	    var ability=$(this).find('input').val();
	    ability=Number(ability);
	 document.getElementById('ability').value =ability;  	
	  });
  $('.price .star').click(function() {
	    console.log($(this).find('input').val());
	    var price=$(this).find('input').val();
	    price=Number(price);
	    	document.getElementById('price').value =price;
	  });
</script>
</body>
</html>