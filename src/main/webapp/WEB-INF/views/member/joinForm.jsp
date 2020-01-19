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
</head>
<body class="is-preload">

    <!-- Wrapper -->
	<div id="wrapper">
	
	  <!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="index.html" class="logo"><strong>My Doctor</strong> by team.5</a>
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
									<td colspan="2"><input type="text" name="address" placeholder="주소검색을 누르세요"  readonly="readonly" ></td>
									<td colspan="2"><a class="btn btn-primary">주소검색</a></td>
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