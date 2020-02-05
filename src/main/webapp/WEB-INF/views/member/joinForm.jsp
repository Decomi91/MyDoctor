<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
     <title>My Doctor</title>
	<meta charset="utf-8" />
     <meta name="viewport"
	       content="width=device-width, initial-scale=1, user-scalable=no" />
     <link href="resources/css/main.css" rel="stylesheet">    
     <script src="http://code.jquery.com/jquery-3.4.1.js"></script>
     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=938fec5f1038f5f89dbb95889b66091b&libraries=services"></script>
     <script src="resources/js/jquery.min.js"></script>
<style type="text/css">
#menu {
	font-family: jua !important;
}

.checkbtn {
	font-family: 'Font Awesome 5 Free';
	width: 100%;
	background: #ffc2c142;
	box-shadow: inset 0 0 0 2px #f79292;
	color: #f76868 !important;
}

.add {
	padding: 18px 30px;
	border-radius: 5px;
	font-family: 'Font Awesome 5 Free';
	font-size: 0.8em;
	font-weight: 700;
	height: 3.5em;
	letter-spacing: 0.075em;
	line-height: 3.5em;
}

.checkbtn:hover {
	background: #fddfdd
}

button[type='submit'].qnabtn, button[type='reset'].qnabtn {
	box-shadow: none !important;
	background: #ef7979;
	width: 48% !important;
	border-radius: 3px !important;
	color: white !important;
	height: 45px !important;
	line-height: 45px !important;
	font-family: 'Core Sans C', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', 'Dotum', '돋움', sans-serif;
}

button[type='reset'].qnabtn{background:#5f5f5f !important}
input[type='radio']+label{margin-top: 0;}
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
					<a href="main" class="logo"><strong>My Doctor</strong> by team.5</a>
				</header>
				
				<section id="banner" style="padding-top: 45px;">
			         <form id="form" name="joinform" action="join" method="post" style="min-width:100%;display: flex;">
			         	<table class="table">
			         		<caption id="menu" style = "color: black"><font size = 10>회원가입</font></caption>
			         		<tbody>
                           		<tr>
                              		<td style="width: 15%">아이디</td>
                              		<td colspan="3"><input type="text" name="id" placeholder="아이디를 입력하세요 (영문자 숫자 _ 5~10자)" autofocus required="required"></td>
                              		<td><button type = "button" onClick = "javascript:goCheck();" class = "checkbtn">중복검사</button>
								</tr>
        						<tr>
        							<td>비밀번호</td>
        							<td colspan="4"><input type="password" name="password" id = "password" placeholder="비밀번호를 입력하세요" required="required"></td>
        						</tr>
        						<tr>
        							<td>비밀번호 확인</td>
        							<td colspan="4">
        								<input type="password" name="pwCheck" id = "pwCheck" placeholder="비밀번호를 한 번 더 입력하세요" required="required">
        								<div id = "pwAlert" style = "display:none;width:100%;border-radius: 6px;padding: 8px 13px;font-weight:bold;margin-top: 10px"></div>
        							</td>
        						</tr>
								<tr>
									<td>이름</td>
									<td colspan="4"><input type="text" name="name" placeholder="이름을 입력하세요" required="required"></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" id="phone1" placeholder="000" pattern="0[0-9]{1,2}"maxlength="3" required="required"></td>
									<td><input type="text" id="phone2" placeholder="999" pattern="[0-9]{3,4}" maxlength="4"  required="required"></td>
									<td><input type="text" id="phone3" placeholder="9999" pattern="[0-9]{4}" maxlength="4" required="required"></td>
									<td style="width:15%"><input type="hidden" name="phone" id="phone"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td colspan="3">
										<input type="text" name="address" placeholder="주소검색을 누르세요" required="required" readonly="readonly" id="address">
										<div id = "map"style="width:500px;height:300px;margin-top:10px;display:none;"></div>
									</td>
									<td>
										<a class="checkbtn add" onclick='javascript:postAddress()'>주소검색</a>
									</td>
								</tr>
							<!-- 	<tr>
								<td>지도화면</td>
								<td colspan="3"><div id="map" style="width:500px;height:300px;margin-top:10px;display:none;"></div></td>
								</tr> -->
								<tr>
									<td>이메일주소</td>
									<td colspan="4"><input type="text" id="email" name="email" placeholder="***@***.***" required="required"></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td colspan="4"><input type="date" name="birth" max="${today }" value="1990-01-01" required="required"></td>
								</tr>                           
                               	<tr>
                               		<td>성별</td>
                               		<td colspan="4"><input type="radio" id="man" name="gender" value="0" checked><label for="man">남자</label>
                                   <input type="radio" id="woman" name="gender" value="1"><label for="woman">여자</label></td>
                               	</tr>
                               	<tr>
                                   <td colspan="5" style = "text-align: center;">
                                   		<button type="submit" class="submitbtn qnabtn">회원가입</button>
                                   		<button type="reset" class="cancelbtn qnabtn">취소</button>
                                   </td>
                              	</tr>
                              </tbody>
                             </table>
                         </form>
      			</section>
             </div>

        </div>
     </div> 
      
      
      
      
     
      
     <script src="resources/js/jquery.min.js"></script>
     <script>
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
     mapOption = {
         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     }
     //지도를 미리 생성
	  var map = new daum.maps.Map(mapContainer, mapOption);
	 //주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
				  position: new daum.maps.LatLng(37.537187, 127.005476),
			  map: map
				});
  
//지도 함수	  	   
	    function postAddress() {
				new daum.Postcode({
   				oncomplete: function(data) {
     					  var addr = data.address; // 최종 주소 변수
       // 주소 정보를 해당 필드에 넣는다.
       document.getElementById("address").value = addr;
       // 주소로 상세 정보를 검색
       geocoder.addressSearch(data.address, function(results, status) {
           // 정상적으로 검색이 완료됐으면
           if (status === daum.maps.services.Status.OK) {

               var result = results[0]; //첫번째 결과의 값을 활용

               // 해당 주소에 대한 좌표를 받아서
               var coords = new daum.maps.LatLng(result.y, result.x);
               // 지도를 보여준다.
               mapContainer.style.display = "block";
               map.relayout();
               // 지도 중심을 변경한다.
               map.setCenter(coords);
               // 마커를 결과값으로 받은 위치로 옮긴다.
               marker.setPosition(coords)
           }
       });
   }
}).open();
}

	     $(function() {
	  	   var checkid=false;
	  	   var checkemail=false;
	  	   
	  	   $('#form').submit(function() {
	  		 
	  		   
	  		 	if(idCheck < 1){
					alert("ID 중복 검사를 하세요.");
					return false;
				}
	  		 
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
				
				if($('#email').val().match(regExp) == null){
					alert('이메일 형식에 맞게 입력하세요.');
					return false;
				}
				
				$('#phone').val(''+$("#phone1").val()+$("#phone2").val()+$("#phone3").val());
				
				if($('#phone').val().length < 9){
					alert('전화번호 형식에 맞게 입력하세요.');
					return false;
				}
	  	   });	// submit end
	  	   
	  	   $('#phone1').keyup(function(){
	  		   if($("#phone1").val().length == 3){
	  			 $('#phone2').focus();
	  		   }
	  	   });	// phone1 keyup end
	  	   
	  	   $('#phone2').keyup(function(){
	  		   if($("#phone2").val().length == 4){
	  			 $('#phone3').focus();
	  		   }
	  	   });	// phone2 keyup end
	  	   
	  	   $("#pwCheck").keyup(function(){
	  		   var password = $("#password").val();
	  		   
	  		   if($(this).val() != password){
	  			   $("#pwAlert").text("비밀번호가 일치하지 않습니다.")
	  			   				.css({display: "inline-block",
									border: "1px solid rgb(218, 161, 161)",
									background: "#f8d8da"});
	  			   $(this).focus();
	  		   }else{
	  				$("#pwAlert").text("비밀번호가 일치합니다.")
	  								.css({display: "inline-block",
	  									border: "1px solid #8BC34A",
	  									background: "#d5eddb"});
	  				$("input[name='name']").focus();
	  		   }
	  	   });	// 비밀번호 확인 end
	  	   
	  	   $("button[type='reset']").click(function(){
	  		   location.href='main';
	  	   })
	  	});
	     
	     idCheck = 0;
	     
	     function goCheck(){
	    	 id = $("input[name='id']").val();
	    	 idCheck++;
	    	 
	    	 $.ajax({
	    		 url : "ididCheck.do",
	    		 data : {"id" : id},
	    		 success : function(resp){
	    			 r = false;
	    			 
	    			var idpattern = /^\w{5,10}$/;
	   	  		   var id = $("input[name='id']").val();
	   	  		    console.log("id = " + id);
	   	  		   if(!idpattern.test(id)){
	   	  			   alert("ID는 영문자 숫자 _로 5~10자 가능합니다.");
	   	  			   return false;
	   	  		   }
	   	  		   
	    			 if(resp == 1){
	    				 alert("중복된 ID가 존재합니다.");
	    				 $("input[name='id']").val("");
	    				 $("input[name='id']").focus();
	    			 }else{
	    				 alert("사용 가능한 ID입니다.");
	    				 $("input[name='password']").focus();
	    			 }
	    		 },	// success end
				error : function(resp){
							alert("죄송합니다. 잠시 후 다시 시도해주세요.");
							return false;
						}	// error end
	    	 	});	// ajax end
	    	 	return r;
	  	   }	// goCheck end
     </script>

</body>
</html>