<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	       content="width=device-width, initial-scale=1, user-scalable=no" />
     <link href="resources/css/main.css" rel="stylesheet">    
     <script src="http://code.jquery.com/jquery-3.4.1.js"></script>    
     <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=938fec5f1038f5f89dbb95889b66091b&libraries=services"></script>
     <script src="resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>마이페이지 - 예약(마이페이지 메인)</title>
<style>
.navbar {
	margin: 10px;
	width: 40%;
	font-size: 30px;
}

#reservation {
	border-collapse: collapse;
	width: 80%;
	text-align: center;
}

#bookmark {
	width: 80%;
}

</style>
<script>
	function cancel(){
		var check = confirm("예약을 취소하시겠습니까?");
		
		if(check == true){
			location.href = "cancel.do";
		}else{
			history.back();
		}
	}
</script>
</head>
<body>
	<div>
		<div>
			<img src = "resources/image/pp.jpg" width = "40px">
			<span>병원 예약 내용이 ?건 있습니다.</span>
		</div>
		<div>
			<div><button onclick = "location.href = 'reserve.net'">예약 확인</button></div>
			<div><button onclick = "location.href = 'chart.net'">진료 기록</button></div>
			<div><button>관심병원</button></div>
			<div><button>나의 정보 수정</button></div>
			<div><button>내가 쓴 후기</button></div>
			<div><button>문의 / 요청</button></div>
			<div><button>회원 탈퇴</button></div>
		</div>
	</div>
	
	<!-- Reservation -->
	<div>
		<div>
			<button class = "navbar">Reservation</button>
			<button class = "navbar">Chart</button>
		</div>
		
		<table id = reservation border = 1>
			<thead>
				<tr>
					<th>예약 시간</th>
					<th>병원</th>
					<th>진행 상황</th>
				</tr>
			</thead>
			
			<tbody>
				<!-- 순서를 최신순으로 할지? -->
				<tr>
					<td>2010.01.01 16:00</td>
					<td>땡땡병원</td>
					<td>승인 대기중<button onClick = "cancel()">예약취소</button></td>
				</tr>
				<tr>
					<td>2010.01.02 13:00</td>
					<td>땡땡병원</td>
					<td>취소된 예약</td>
				</tr>
				<tr>
					<td>2010.01.03 17:00</td>
					<td>123병원</td>
					<td>방문 예정</td>
				</tr>
				<tr>
					<td>2010.01.05 16:00</td>
					<td>가가병원</td>
					<td><button onclick = "location.href = 'reviewwrite.do'">후기 작성</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- Reservation end -->
	
	<!-- 관심 병원 -->
	<div>
		<div>
			<i class="fas fa-hand-holding-heart">관심병원</i>
		</div>
		
		<table id = "bookmark" >
			<tr>
				<td rowspan = 4><img src = "resources/image/hospital.jpg" width = "60px"></td>
			</tr>
			<tr>
				<td>가나다병원</td>
				<td rowspan = 4><i class="fas fa-heart" onclick = "location.href = 'bookmark.net'"></i></td>				
			</tr>
			<tr>
				<td>내과, 가정의학과, 소아과</td>
			</tr>
			<tr>
				<td><i class="fas fa-smile"></i> ? / 10</td>
			</tr>
			
			<tr>
				<td rowspan = 4><img src = "resources/image/hospital.jpg" width = "60px"></td>
			</tr>
			<tr>
				<td>땡땡병원</td>
				<td rowspan = 4><i class="fas fa-heart" onclick = "location.href = 'bookmark.net'"></i></td>
			</tr>
			<tr>
				<td>피부과, 내과</td>
			</tr>
			<tr>
				<td><i class="fas fa-smile"></i> ? / 10</td>
			</tr>
			
			<tr>
				<td rowspan = 4><img src = "resources/image/hospital.jpg" width = "60px"></td>
			</tr>
			<tr>
				<td>ABC병원</td>
				<td rowspan = 4><i class="fas fa-heart" onclick = "location.href = 'bookmark.net'"></i></td>
			</tr>
			<tr>
				<td>치과</td>
			</tr>
			<tr>
				<td><i class="fas fa-smile"></i> ? / 10</td>
			</tr>
		</table>
	</div>
	<!-- 관심 병원 end -->
</body>
</html>