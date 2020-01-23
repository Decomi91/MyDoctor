<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
table {
    border-collapse: collapse;
    border: 0;
    empty-cells: show;
    border-spacing: 2px;
    width:100%
}
body, h3{
    font-family: 'Core Sans C','Noto Sans KR','Malgun Gothic','맑은 고딕','Dotum','돋움',sans-serif;
    line-height: 1.6;
    color: #555;
}
.sorting .option {
    position: absolute;
    right: 0;
    top: 0;
}
 button {
    margin: 0;
    padding: 0;
}
.sorting {
    position: relative;
    width: 100%;
    font-size: 11px;
}

.paging {
    width: 100%;
    text-align: center;
    height: 25px;
}
.btnRed {
    color: #fff;
    background:#f56a6a;
    border: 1px solid #f56a6a;
}
.btnW100 {
    width: 98px;
    padding-left: 0;
    padding-right: 0;
}
.btnS1 {
    font-size: 11px;
    line-height: 13px;
    padding: 9px 10px 10px;
}
.btn {
    display: inline-block;
    text-align: center;
    font-weight: bold;
    vertical-align: middle;
    cursor: pointer;
}
.boardForm .btnArea a {
    margin: 0 0 0 5px;
}
.btnGry {
    color: #fff;
    background: #666;
    border: 1px solid #666;
}
a{text-decoration: none;}
.btnS2 {
    font-size: 16px;
    line-height: 0.9;
    padding: 10px 20px;
    vertical-align: top;
}
.btnRed:hover {
    background: #ef6464;
    border: 1px solid #ef6464;
     color:white !important;
}
.btnGry:hover {
    background: #3a3a3a;
    border: 1px solid #3a3a3a;
    color:white !important;
}
.qnaV15 .talkList tr.secretV17 .lt {
    padding-left: 18px;
    background: url(http://fiximage.10x10.co.kr/web2017/common/ico_lock.png) 0 40% no-repeat;
}
.qnaV15 .talkList td {
    padding: 10px 0;
    font-size: 13px;
    text-align: center;
 
}
.talkList td {
    
    border-bottom: 1px solid #ddd;
    vertical-align: top;
     
}
.lt {
    text-align: left !important;
}
td {
    display: table-cell;}
    
.talkList thead th {
    display: block;
    visibility: hidden;
    width: 0;
    height: 0;
}
caption {
    overflow: hidden;
    width: 0;
    height: 0;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}
.pdtDetailV15 h3 {
    
    color: #000;
    font-weight: bold;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.boardForm fieldset {
    padding: 60px 80px 50px 80px;
    border:0
    display: block;
    margin-inline-start: 2px;
    margin-inline-end: 2px;
    padding-block-start: 5%;
    padding-inline-start: 5%;
    padding-inline-end: 5%;
    padding-block-end: 5%;
    min-inline-size: min-content;
    background-color:#f5f6f7;
    
}
legend {
    visibility: hidden;
    width: 0;
    height: 0;
    padding:0
}
#qnaMsg{width:100%; margin:2% 0;}
.btnArea{text-align:center;}
.qnaList {
    padding: 45px 80px;
    text-align: left;
}
tr.talkMore{background-color:#f5f6f7;}
.qnaList .answer {
    margin-top: 5%;
    padding-top: 2%;
    border-top: 1px solid #ddd;
}
.qnaList .title {
    width: 60px;
    text-align: left;
}
.qnaList .title, .qnaList .account {
    float: left;
}
a.talkShort{color: black !important;}
</style>
</head>
<body>
<div class="section qnaV15" id="detail04">
	<div class="sorting">
		<h2>Q&amp;A </h2>
		<div class="option">
			<a href="" onclick="return false;" id="inquiryBtn" class="btn btnS2 btnRed">문의하기</a>
		</div>
	</div>
	<div id="inquiryForm" class="boardForm tMar05" style="display: block;">
		<form name="qnaform" method="post" action="qnawrite.do" onsubmit="return false;">
		<input type="hidden" name="id" value=>
		<input type="hidden" name="hosId" value="병원번호?">
		
		<fieldset>
		<legend>병원 문의 입력 폼</legend>
			<div class="sorting">
				<h3><strong>병원문의</strong></h3>
				<div class="option">
					
					<input type="hidden" id="secretyn" name="secretyn" value="N">
					<span class="lPad20"><input type="checkbox" class="check" id="qnaSecret" name="qnaSecret" onclick="jsQNACheck('s');"> <label for="qnaSecret">비밀글로 문의하기</label></span>
				</div>
			</div>
			<div>
				<textarea name="contents" id="qnaMsg" cols="100" rows="6" onclick="jsCheckLimit();"></textarea>
				</div>
			<ul class="list01V15">
				<li>고객님이 작성하신 문의 및 답변은<a href="myqna.net"> 마이페이지 &gt; 문의</a> 에서도 확인이 가능합니다.</li>
				<li>병원 이용과 관련없는 문의는 강제 삭제 될 수 있습니다.</li>
			</ul>
			<div class="btnArea ct tMar30">
				<a href="" class="btn btnS1 btnRed btnW100" onclick="GotoItemQnA();return false;">등록</a>
				<a href="" class="btn btnS1 btnGry btnW100" onclick="$('#inquiryForm').hide();return false;">취소</a>
			</div>
		</fieldset>
		</form>
	</div>

	<span id="lyQnAContAll">
		<table class="talkList">
			<caption>Q&amp;A 목록</caption>
			<colgroup>
				<col width="140"> <col width=""> <col width="90"> <col width="120">
			</colgroup>
			<thead>
			<tr>
				<th scope="col">답변여부</th>
				<th scope="col">답변내용</th>
				<th scope="col">작성일자</th>
				<th scope="col">작성자</th>
			</tr>
			</thead>
			<tbody>
		
			<tr class="secretV17">
				<td><strong>&lt;답변완료&gt;</strong></td>
				<td class="lt">
					
						비밀글 입니다.
					
				</td>
				<td>2020/01/22</td>
				<td>sdubu**</td>
			</tr>
			<tr class="talkMore secretV17" style="display: none;">
				<td colspan="4">
					<div class="qnaList">
						<div class="question">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문"></strong>
							<div class="account">
								
									비밀글 입니다.
								
							</div>
						</div>
						
						<div class="answer">
							<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변"></strong>
							<div class="account">
							
									<p>비밀글 입니다.</p>
								
							</div>
						</div>
						
					</div>
				</td>
			</tr>
			<tr>
			<td><strong>&lt;답변완료&gt;</strong></td>
			<td class="lt">
				
					<a href="javascript:" class="talkShort">설연휴 언제까지 진료하시나요?</a>
				
			</td>
			<td>2019/12/15</td>
			<td>hy73**</td>
		</tr>
		<tr class="talkMore " style="display: table-row;">
			<td colspan="4">
				<div class="qnaList">
					<div class="question">
						<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문"></strong>
						<div class="account">
							
								<p>설연휴 언제까지 진료하시나요?</p>
							
						</div>
					</div>
					
					<div class="answer">
						<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변"></strong>
						<div class="account">
							
								<p>안녕하세요, 땡땡병원 입니다.<br><br>설 연휴동안은 정상 진료하지만 <br>설 당일은 휴무인점 안내드립니다. <br><br>만족스러운 답변이 되셨는지요?<br>감사합니다.<br></p>
							
						</div>
					</div>
					
				</div>
			</td>
		</tr>
		<tr>
			<td><strong>&lt;답변중&gt;</strong></td>
			<td class="lt">
				
					<a href="javascript:" class="talkShort">피부과 진료도 보시나요?</a>
				
			</td>
			<td>2019/12/15</td>
			<td>user1</td>
		</tr>
		<tr class="talkMore " style="display: table-row;">
			<td colspan="4">
				<div class="qnaList">
					<div class="question">
						<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문"></strong>
						<div class="account">
							
								<p>가정의학과라고 나오는데 혹시 피부과 진료도 보시나요?</p>
							
						</div>
					</div>
					
					<div class="answer">
						<strong class="title"><img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변"></strong>
						<div class="account">
							
								<p>안녕하세요, 땡땡병원 입니다.<br><br>간단한 피부질환 진료를 보긴하지만 상황에 따라 피부과 전문병원의 진료를 권유드릴수도 있는점 안내드립니다. <br><br>만족스러운 답변이 되셨는지요?<br>감사합니다.<br></p>
							
						</div>
					</div>
					
				</div>
			</td>
		</tr>
			</tbody>
		</table>
		
		
		
	</span>
</div>
<script>
$('#inquiryForm').hide();
$("#inquiryBtn").click(function(){
	$("#inquiryForm").toggle();
});
	// 문의 등록
	function GotoItemQnA(){
		var frm = document.qnaform;
		if(frm.contents.value.length < 1){
			alert("내용을 적어주셔야 합니다.");
			frm.contents.focus();
			return;
		}

		if(confirm("상품에 대해 문의 하시겠습니까?")){
			frm.submit();
		}
	}

	$(".talkList .talkMore").hide();
	$(".talkList .talkShort").click(function(){
		if($(this).parent().parent().next('.talkMore').is(":hidden")){
			$(".talkList .talkMore").hide();
			$(this).parent().parent().next('.talkMore').show();
		} else {
			$(this).parent().parent().next('.talkMore').hide();
		}

		// 클릭 위치가 가려질경우 스크롤 이동
		if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
			$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
		}
	});
	
	
</script>
</body>
</html>