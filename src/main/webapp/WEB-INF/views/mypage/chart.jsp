<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>마이페이지 - 진료기록</title>
<style>
#chart {
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
	
	<!-- Chart -->
	<div>
		<h1>Chart</h1>
		<table id = chart border = 1>
			<thead>
				<tr>
					<th>내원 시간</th>
					<th>병원명</th>
					<th>진료 기록</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>2010.01.10 16:00</td>
					<td>안보여안과</td>
					<td><button onClick = "location.href = 'chart.net'">확인</button></td>
				</tr>
				
				<tr>
					<td>2010.01.05 10:20</td>
					<td>땡땡병원</td>
					<td><button onClick = "location.href = 'chart.net'">확인</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- Chart end -->
</body>
</html>