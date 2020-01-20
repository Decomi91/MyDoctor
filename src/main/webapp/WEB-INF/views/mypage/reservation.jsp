<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 예약 확인</title>
<style>
#reservation {
	border-collapse: collapse;
	width: 80%;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div>
			<img src = "resources/image/pp.jpg" width = "40px">
			<span>병원 예약 내용이 ?건 있습니다.</span>
		</div>
		<div>
			<div><button onclick = "location.href = 'reserve.net'">예약 확인</button></div>
			<div><button onclick = "location.href = 'record.net'">진료 기록</button></div>
			<div><button>관심병원</button></div>
			<div><button>나의 정보 수정</button></div>
			<div><button>내가 쓴 후기</button></div>
			<div><button>문의 / 요청</button></div>
			<div><button>회원 탈퇴</button></div>
		</div>
	</div>
	
	<!-- Reservation -->
	<div>
		<h1>Reservation</h1>
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
					<td>승인 대기중<button onclick = "location.href = 'cancel.do'">예약취소</button></td>
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
</body>
</html>