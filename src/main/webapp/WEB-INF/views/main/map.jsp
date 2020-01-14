<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			body {
				background-color: white;
			}
			
			#loginbox {
				margin-top: 30px;
			}
			
			#loginbox>div:first-child {
				padding-bottom: 10px;
			}
			
			.iconmelon {
				display: block;
				margin: auto;
			}
			
			#form>div {
				margin-bottom: 25px;
			}
			
			#form>div:last-child {
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			.panel {
				background-color: #ffffff;
			}
			
			.panel-body {
				padding-top: 30px;
				background-color: rgba(255, 255, 255, .3);
			}
			
			#particles {
				width: 100%;
				height: 100%;
				overflow: hidden;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				position: absolute;
				z-index: -2;
			}
			
			.iconmelon, .im {
				position: relative;
				width: 150px;
				height: 150px;
				display: block;
				fill: #4A575D;
			}
			
			.iconmelon:after, .im:after {
				content: '';
				position: absolute;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
			}
			/* Made with love by Mutiullah Samim*/
			@import url('https://fonts.googleapis.com/css?family=Numans');
			
			.container {
				height: 100%;
				align-content: center;
			}
			
			.card {
				/* height: 430px; */
				height: 680px;
				margin-top: auto;
				margin-bottom: auto;
				width: 510px;
				background-color: rgba(0, 0, 0, 0.5) !important;
				margin-top: auto;
			}
			
			.social_icon span {
				font-size: 60px;
				margin-left: 10px;
				color: #CF1F46;
			}
			
			.social_icon span:hover {
				color: #4A575D;
				cursor: pointer;
			}
			
			.social_icon {
				position: absolute;
				right: 20px;
				top: -7px;
			}
			
			.input-group-prepend span {
				width: 50px;
				background-color: #CF1F46;
				color: black;
				border: 0 !important;
			}
			
			input:focus {
				outline: 0 0 0 0 !important;
				box-shadow: 0 0 0 0 !important;
			}
			
			.remember {
				color: white;
			}
			
			.remember input {
				width: 20px;
				height: 20px;
				margin-left: 15px;
				margin-right: 5px;
			}
			
			.login_btn {
				color: black;
				background-color: #CF1F46;
			}
			
			.login_btn:hover {
				color: black;
				background-color: #4A575D;
			}
			
			.links {
				color: white;
			}
			
			.links:hover {
				color: #CF1F46;
			}
			
			.links a {
				margin-left: 4px;
			}
			
			.ui-autocomplete {
				max-height: 200px;
				overflow-y: auto;
				/* prevent horizontal scrollbar */
				overflow-x: hidden;
				/* add padding to account for vertical scrollbar */
				padding-right: 20px;
			}
		</style>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous">
		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.6.0/css/all.css"
			integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h"
			crossorigin="anonymous">
		
		
		<title>Sign Up</title>

	</head>
	<body>
		<div class="container">
			<div style="text-align: center">
				<img class="mt-2" src="https://i.ibb.co/1vh49st/register-297979.png"
					alt="resim" style="width: 20%">
			</div>
	
			<div class="d-flex justify-content-center h-100">
				<form class="needs-validation" action="signup.do" method="post" id="form1">
					<div class="card">
						<div class="card-header">
							<h2 class="text-center text-light">Sign Up</h2>
						</div>
	
						<div class="card-body p-2">
	
							<div class="input-group form-group">
								<div class="input-group-prepend ">
									<span class="input-group-text"><i
										class='fas fa-user-graduate ml-2' style='font-size: 22px'></i></span>
									<input type="text" class="form-control" placeholder="병원이름"
										id="yadmNm" name="yadmNm" required>
	
								</div>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend ">
									<span class="input-group-text"><i
										class='fas fa-user-graduate ml-2' style='font-size: 22px'></i></span>
									<input type="text" class="form-control" placeholder="병원전화번호"
										id="hphone" name="hphone" required readonly="readonly">
								</div>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class='fas fa-user-graduate ml-2' style='font-size: 22px'></i></span>
									<input type="text" class="form-control" placeholder="병원주소"
										id="addr" name="addr" required readonly="readonly">
								</div>
							</div>
	
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i
										class='fas fa-user-graduate ml-2' style='font-size: 22px'></i></span>
									<input type="text" class="form-control" placeholder="아이디"
										id="id" name="id" required pattern="^([A-Za-z0-9_]){5,10}$" title="형식과 맞지않습니다 대소문자숫자 5~10글자">
								</div>
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class='fa fa-key ml-2'
										style='font-size: 20px'></i></span> <input type="password"
										class="form-control" placeholder="Password" id="password"
										name="password" required pattern="^([A-Za-z0-9!><?/:+~@#$%^&*()]){5,15}$"  maxlength="15" title="5~15대소문자 숫자 !><?/:+~@#$%^&*()특수기호">
								</div>
							</div>
	
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class='fa fa-key ml-2'
										style='font-size: 20px'></i></span> <input type="password"
										class="form-control" placeholder="Password" id="repassword"
										required pattern="^([A-Za-z0-9!><?/:+~@#$%^&*()]){5,15}$" maxlength="15" title="5~15대소문자 숫자 !><?/:+~@#$%^&*()특수기호">
								</div>
							</div>
							<input id="yki" name="yki" type="hidden">
	
							<div class="input-group form-group">
								<span style="font-weight: bold; font-size: 1.5em; color: white;">병원
									근무시간</span>
							</div>
							<div class="input-group form-group">
								<!-- <div class="input-group-prepend">
									<span class="input-group-text"><i class='fa fa-key ml-2'
										style='font-size: 20px'></i></span> <input type="password"
										class="form-control" placeholder="Confirm Password"
										id="tbTekrarSifre" required>
								</div> -->
							</div>
							<!-- 진료시간 -->
							<!-- required -->
							<input id="monStart" name="monStart" placeholder="월 시작시간 (기호 :생략)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="monEnd" name="monEnd"
								placeholder="월 종료시간 (기호 :생략)" class="day" required maxlength="4"><input
								id="tueStart" name="tueStart" placeholder="화 시작시간 (기호 :생략)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="tueEnd" name="tueEnd"
								placeholder="화 종료시간 (기호 :생략)" class="day" required maxlength="4">
							<input id="wedStart" name="wedStart" placeholder="수 시작시간 (기호 :생략)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="wedEnd" name="wedEnd"
								placeholder="수 종료시간 (기호 :생략)" class="day" required maxlength="4">
							<input id="thuStart" name="thuStart" placeholder="목 시작시간 (기호 :생략)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="thuEnd" name="thuEnd"
								placeholder="목 종료시간  (기호 :생략)" class="day" required maxlength="4"><input
								id="friStart" name="friStart" placeholder="금 시작시간  (기호 :생략)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="friEnd" name="friEnd"
								placeholder="금 종료시간  (기호 :생략)" class="day" required maxlength="4"><input
								id="satStart" name="satStart" placeholder="토 시작시간 (휴무 00 표기)"
								class="day" required maxlength="4"> <span
								style="color: white;">~</span> <input id="satEnd" name="satEnd"
								placeholder="토 종료시간 (휴무 00 표기)" class="day" required
								maxlength="4"><input id="sunStart" name="sunStart"
								placeholder="일 시작시간 (휴무 00 표기)" class="day" required
								maxlength="4"> <span style="color: white;">~</span> <input
								id="sunEnd" name="sunEnd" placeholder="일 종료시간 (휴무 00 표기)"
								class="day" required maxlength="4">
	
						</div>
						<div class="card-footer p-2">
							<div class="d-flex justify-content-center links">
								<button type="submit" id="btnKayıtOl"
									class="btn login_btn text-light btn-block"
									style="font-weight: 600;">Sign Up</button>
							</div>
						</div>
					</div>
	
				</form>
			</div>
		</div>

       
       <script>
			$(function(){
				$("input.day").keyup(function(e) {
					if(isNaN($(this).val())){
						alert("숫자만입력하셈");
						$(this).val($(this).val().substr(0,$(this).val().length-1));
						$(this).focus();
					
					}			
				}); 
				$( "#yadmNm" ).autocomplete({        	   
	      	        source : function( request, response ) {
	      	             $.ajax({
      	                    type: 'post',
      	                    url: "sign.do",
      	                    dataType: "json",   
      	                    data: { h_name : $("#yadmNm").val() },
      	                    success: function(data) {
      	                    	var result =data.response.body.items.item;
      	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
      	                        response(
      	                            $.map(result, function(item) {	
      	                                return {
      	                                    label: item.yadmNm+"("+item.addr+")",
      	                                    value: item.yadmNm,
     	                                    tel : item.telno,
      	                                    addr : item.addr,
      	                                    hidden : item.ykiho      	                                    
      	                                }
      	                            })
      	                        );
      	                    }});
	      	            },
	      	        //조회를 위한 최소글자수
	      	        minLength: 2,
	      	        select: function( event, ui ) {
	      	        
	      	       	 $("#hphone").val(ui.item.tel);
	      	     	  
	      	         $("#addr").val(ui.item.addr);
	      	         $("#yki").val(ui.item.hidden);
	      	       $.ajax({
		                    type: 'post',
		                    url: "work.do",
		                    dataType: "json",   
		                    data: { h_hideen : $("#yki").val() },
		                    success: function(data) {
		                    	//var hidden =data.response.body.items.item;
		                    	//noTrmtHoli
		                    	console.log(data.response)
		                    	console.log(data.response.body.items.item.noTrmtHoli);
		                    	
		                    	//$("#h_id").val(data.response.body.items.item.noTrmtHoli);
		                    	$("#monStart").val(data.response.body.items.item.trmtMonStart);
		                    	$("#monEnd").val(data.response.body.items.item.trmtMonEnd);
		                    	
		                    	$("#tueStart").val(data.response.body.items.item.trmtTueStart);
		                    	$("#tueEnd").val(data.response.body.items.item.trmtTueEnd);
		                    	
		                    	$("#wedStart").val(data.response.body.items.item.trmtWedStart);
		                    	$("#wedEnd").val(data.response.body.items.item.trmtWedEnd);
		                    	
		                    	$("#thuStart").val(data.response.body.items.item.trmtTueStart);
		                    	$("#thuEnd").val(data.response.body.items.item.trmtTueEnd);
		                    	
		                    	$("#friStart").val(data.response.body.items.item.trmtFriStart);
		                    	$("#friEnd").val(data.response.body.items.item.trmtFriEnd);
		                    	
		                    	$("#satStart").val(data.response.body.items.item.trmtSatStart);
		                    	$("#satEnd").val(data.response.body.items.item.trmtSatEnd);
		                    	
		                    	$("#sunStart").val(data.response.body.items.item.trmtSunStart);
		                    	$("#sunEnd").val(data.response.body.items.item.trmtSunEnd);
		                    }
		               });
	      	        }
	      	    });
          });
          (function(){
	        'use strict';
	        window.addEventListener('load',function(){
	            var forms = document.getElementsByClassName('needs-validation');
	            var validation = Array.prototype.filter.call(forms,function(form){
	                form.addEventListener('submit',function(event){
	                    if(form.checkValidity()===false)
	                    {
	                        event.preventDefault();
	                        event.stopPropagation();
	                    }
	                    form.classList.add('was-validated');
	                },false)
	            });
	        },false);
	    })();
          
          
          
  			$("#form1").submit(function() {
  				var hphone = $("#hphone").val();
      	   		 hphone =hphone.replace(/-/g,"");    	   		 
      	   	$("#hphone").val(hphone);
  				return true;
        	  	}); 
          
    </script>


</body>
</html>
