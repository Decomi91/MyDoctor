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
				
				<section id="banner">
			         <form id="form" name="joinform" action="join" method="post" style="min-width:100%;display: flex;">
			         	<table class="table">
			         		<caption><h1>회원가입</h1></caption>
			         		<tbody>
                           		<tr>
                              		<td style="width: 15%">아이디</td>
                              		<td colspan="4"><input type="text" name="id" placeholder="아이디를 입력하세요" required="required"></td>
                              		
								</tr>
        						<tr>
        							<td>비밀번호</td>
        							<td colspan="4"><input type="password" name="password" placeholder="비밀번호를 입력하세요" required="required"></td>
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
									<td colspan="2"><input type="text" name="address" placeholder="주소검색을 누르세요" required="required" readonly="readonly" id="address"></td>
									<td colspan="2"><a class="btn btn-primary" onclick='javascript:postAddress()'>주소검색</a></td>
								</tr>
								<tr>
								<td>지도화면</td>
								<td colspan="2"><div id="map" style="width:500px;height:300px;margin-top:10px;display:none;"></div></td>
								</tr>
								<tr>
									<td>이메일주소</td>
									<td colspan="4"><input type="text" id="email" name="email" placeholder="이메일을 입력하세요" required="required"></td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td colspan="4"><input type="date" name="birth" required="required"></td>
								</tr>                           
                               	<tr>
                               		<td>성별</td>
                               		<td colspan="4"><input type="radio" id="man" name="gender" value="0" checked><label for="man">남자</label>
                                   <input type="radio" id="woman" name="gender" value="1"><label for="woman">여자</label></td>
                               	</tr>
                               	<tr>
                                   <td></td>
                                   <td colspan="4"><button type="submit" class="submitbtn">회원가입</button>
                                   <button type="reset" class="cancelbtn">다시작성</button></td>
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
				var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
				if($('#email').val().match(regExp) == null){
					 return false;
				}
				$('#phone').val(''+$("#phone1").val()+$("#phone2").val()+$("#phone3").val());
				console.log($('#phone').val());
				if($('#phone').val().length < 9){
		  		   return false;
				}
	  	   });
	  	   $('#phone1').keyup(function(){
	  		   if($("#phone1").val().length == 3){
	  			 $('#phone2').focus();
	  		   }
	  	   })
	  	   $('#phone2').keyup(function(){
	  		   if($("#phone2").val().length == 4){
	  			 $('#phone3').focus();
	  		   }
	  	   })
	  	});
     </script>

</body>
</html>