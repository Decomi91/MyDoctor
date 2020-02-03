<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
	width: 100%
}

body, h3 {
	font-family: 'Core Sans C', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕',
		'Dotum', '돋움', sans-serif;
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
	background: #f56a6a;
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

a {
	text-decoration: none;
}

.btnS2 {
	font-size: 16px;
	line-height: 0.9;
	padding: 10px 20px;
	vertical-align: top;
}

.btnRed:hover {
	background: #ef6464;
	border: 1px solid #ef6464;
	color: white !important;
}

.btnGry:hover {
	background: #3a3a3a;
	border: 1px solid #3a3a3a;
	color: white !important;
}

.qnaV15 .talkList tr.secretV17 .lt {
	padding-left: 18px;
	/*     background: url(http://fiximage.10x10.co.kr/web2017/common/ico_lock.png) 0 40% no-repeat;
 */
}

.qnaV15 .talkList td {
	padding: 10px 0;
	font-size: 13px;
	text-align: center;
}

input[type='submit'].qnabtn, input[type='reset'].qnabtn {
	box-shadow: none !important;
	background: #ef7979;
	width: 15% !important;
	border-radius: 0 !important;
	color: white !important;
	height: 35px !important;
	line-height: 35px !important;
	font-family: 'Core Sans C', 'Noto Sans KR', 'Malgun Gothic', '맑은 고딕', 'Dotum', '돋움', sans-serif;
}

input[type='reset'].qnabtn{background:#5f5f5f !important}

.talkList td {
	border-bottom: 1px solid #ddd;
	vertical-align: top;
}

.lt {
	text-align: left !important;
}

td {
	display: table-cell;
}

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
	border: 0 display: block;
	margin-inline-start: 2px;
	margin-inline-end: 2px;
	padding-block-start: 5%;
	padding-inline-start: 5%;
	padding-inline-end: 5%;
	padding-block-end: 5%;
	min-inline-size: min-content;
	background-color: #f5f6f7;
}

legend {
	visibility: hidden;
	width: 0;
	height: 0;
	padding: 0
}

#qnaMsg {
	width: 100%;
	margin: 2% 0;
}

.btnArea {
	text-align: center;
}

.qnaList {
	padding: 15px 80px;
	text-align: left;
}

tr.talkMore {
	background-color: #f5f6f7;
}

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

a.talkShort {
	color: black !important;
}
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
	
	<!-- 글쓰기 폼 start -->
	<div id="inquiryForm" class="boardForm tMar05" style="display: block;">
		<form id = "qnaform" name="qnaform" method="post" action="qnaWrite.net">
			<input type="hidden" name="ykiho" value = "">
			<input type = "hidden" name = "secret" value = "1">
			<input type = "hidden" name = "head" value = "문의글">
			<input type = "hidden" name = "reply" value = "">
			
			
			<fieldset>
				<legend>병원 문의 입력 폼</legend>
				
				<div class="sorting">
					<h3><strong>병원문의</strong></h3>
					<div class="option">
						<span class="lPad20">
							<input type="checkbox" class="check" id="qnaSecret" name="qnaSecret"> 
							<label for="qnaSecret">비밀글로 문의하기</label>
						</span>
					</div>
				</div>
				
				<div>
					<input type = "text" name = "subject" placeHolder = "제목을 입력하세요."> 
					<textarea name="content" id="qnaMsg" cols="100" rows="6" placeHolder = "내용을 입력하세요."></textarea>
				</div>
				
				<ul class="list01V15">
					<li>고객님이 작성하신 문의 및 답변은<a href="myqna.net"> 마이페이지 &gt; 문의</a> 에서도 확인이 가능합니다.</li>
					<li>병원 이용과 관련없는 문의는 강제 삭제 될 수 있습니다.</li>
				</ul>
				
				<div class="btnArea ct tMar30">
					<input type = "submit" class = "qnabtn" value = "등록">
					<input type = "reset" class = "qnabtn" onclick="$('#inquiryForm').hide();return false;" value = "취소">
				</div>
				
			</fieldset>
		</form>
	</div>
	<!-- 글쓰기 폼 end -->

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
			<tbody id="tableB">
		
			<c:if test="${listcount > 0}">
				<c:set var = "num" value = "${listcount-(page-1)*10 }"/>
				<c:forEach var = "qna" items = "${qna }">
					<tr class="secretV17">
						
						<!-- 답변 대기중일 경우 -->
						<c:if test="${qna.reply == null}">
							<td><strong>&lt;답변대기중&gt;</strong></td>
							
							<!-- 비밀글일 경우 클릭안되게 하기 -->
							<c:if test = "${qna.secret == 0 }">
								<td class="lt">
									<i class="fas fa-lock" style = "color:#00000059">
										비밀글 입니다.
									</i>
								</td>
								<td>${qna.uploaddate }</td>
								<td>${qna.writeId }</td>	<!-- 뒤에 몇글자 **처리 -->
							</c:if>
							
							<!-- 비밀글이 아닐경우 -->
							<c:if test = "${qna.secret == 1 }">
								<td class="lt">
									<i class="fas fa-lock-open"style = "color:#00000059">
										<a href="javascript:" class="talkShort">${qna.subject }</a>
									</i>
								</td>
								<td>${qna.uploaddate }</td>
								<td>${qna.writeId }</td>	<!-- 뒤에 몇글자 **처리 -->
								<tr class="talkMore " style="display: table-row;">
									<td colspan="4">
										<div class="qnaList">
											<div class="question">
												<strong class="title">
													<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문">
												</strong>
												<div class="account">
													<p>${qna.content }</p>
												</div>
											</div>
												
											<div class="answer">
												<strong class="title">
													<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변">
												</strong>
												<div class="account">
													<p></p>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:if>
						</c:if>
						
						<!-- 답변이 완료되었을 경우 -->
						<c:if test = "${qna.reply != null }">
							<td><strong>&lt;답변완료&gt;</strong></td>
						
							<c:if test = "${qna.secret == 0 }">
								<td class="lt">
									<i class="fas fa-lock"style = "color:#00000059">
										비밀글 입니다.
									</i>
								</td>
								<td>${qna.uploaddate }</td>
								<td>${qna.writeId }</td>	<!-- 뒤에 몇글자 **처리 -->
							</c:if>
							
							<!-- 비밀글이 아닐경우 -->
							<c:if test = "${qna.secret == 1 }">
								<td class="lt">
									<i class="fas fa-lock-open"style = "color:#00000059">
										<a href="javascript:" class="talkShort">${qna.subject }</a>
									</i>
								</td>
								<td>${qna.uploaddate }</td>
								<td>${qna.writeId }</td>	<!-- 뒤에 몇글자 **처리 -->
								<tr class="talkMore " style="display: table-row;">
									<td colspan="4">
										<div class="qnaList">
											<div class="question">
												<strong class="title">
													<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문">
												</strong>
												<div class="account">
													<p>${qna.content }</p>
												</div>
											</div>
												
											<div class="answer">
												<strong class="title">
													<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변">
												</strong>
												<div class="account">
													<p>${qna.reply }</p>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:if>
						</c:if>
						
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		
		
		
	</span>
									<div class="center-block">
										<div class="row">
											<div class="col">
												<ul class="pagination">
													<c:if test="${page<=1}">
														<li class="page-item">
														<a class="page-link"  href="#">이전&nbsp;</a>
														</li>
													</c:if>
													<c:if test="${page > 1}">
														<li class="page-item">
															<a href="javascript:pagination({page:${page-1 }, ykiho:'${ykiho}'});" class="page-link">이전</a>&nbsp;
														</li>
													</c:if>
													
													<c:forEach var="a" begin="${startpage}" end="${endpage}">
														<c:if test="${a==page}">
															<li class="page-item">
																<a class="page-link" href="#">${a}</a>
															</li>
														</c:if>
														<c:if test="${a != page}">
															<li class="page-item">
																<a href="javascript:pagination({page:${a }, ykiho:'${ykiho}'});" class="page-link">${a}</a>
															</li>
														</c:if>
													</c:forEach>
													
													<c:if test="${page>=maxpage}">
														<li class="page-item">
															<a class="page-link" href="#">&nbsp;다음</a>
														</li>
													</c:if>
													<c:if test="${page<maxpage}">
														<li class="page-item">
															<a href="javascript:pagination({page:${page+1 }, ykiho:'${ykiho}'});"  class="page-link">&nbsp;다음</a>
														</li>
													</c:if>
												</ul>
											</div>
										</div>
									</div>
</div>
<script>
	// 문의하기 click
	$('#inquiryForm').hide();
	$("#inquiryBtn").click(function(){
		$("#inquiryForm").toggle();
	});

	
	$("input[name='ykiho']").val(ykiho);
	console.log(ykiho);
	
	// 문의 등록
	$("#qnaform").submit(function(event){
		var frm = document.qnaform;

		if(frm.subject.value.length < 1){
			alert("제목을 입력하세요.");
			frm.subject.focus();
			return false;
		}else if(frm.content.value.length < 1){
			alert("내용을 입력하세요.");
			frm.content.focus();
			return false;
		}
	
		if($("input:checkbox[id='qnaSecret']").is(":checked") == true){
			$("input[name='secret']").val("0");
		}else{
			$("input[name='secret']").val("1");
		}
	});	// submit end
	
	$(".talkList .talkMore").hide();
	$(".talkList .talkShort").click(function(){
		if($(this).parent().parent().parent().next('.talkMore').is(":hidden")){
			$(".talkList .talkMore").hide();
			$(this).parent().parent().parent().next('.talkMore').show();
		} else {
			$(this).parent().parent().parent().next('.talkMore').hide();
		}

		// 클릭 위치가 가려질경우 스크롤 이동
		if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
			$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
		}
	});
	function pagination(data){
		$.ajax({
			url:'qnapage',
			data : {'ykiho' : data.ykiho, 'page' : data.page},
			dataType: 'json',
			success:function(data){
				console.log(1);
				var table = '';
				$('#tableB').empty();
				if(data.listcount > 0){
					data.qna.forEach(function(item, index){
						table += '<tr class="secretV17">';
						console.log(item.reply);
						console.log(item.secret);
						if(item.reply == null){
							table += '<td><strong>&lt;답변대기중&gt;</strong></td>'; 
							if(item.secret == 0){
								table += '<td class="lt">'
								 		+ '<i class="fas fa-lock" style = "color:#00000059">'
												+ '비밀글 입니다.'
										+ '</i>'
										+'</td>'
										+'<td>' + item.uploaddate +'</td>'
										+'<td>' + item.writeId +'</td>';
							}else{
								table += '<td class="lt">'
										+ '<i class="fas fa-lock-open"style = "color:#00000059">'
											+ '<a href="javascript:" class="talkShort">' + item.subject + '</a>'
										+ '</i>'
										+'</td>'
										+'<td>' + item.uploaddate +'</td>'
										+'<td>' + item.writeId +'</td>'
									+'<tr class="talkMore " style="display: table-row;">'
									+ '<td colspan="4">'
										+'<div class="qnaList">'
										+ '<div class="question">'
											+'<strong class="title">'
												+'<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문">'
											+'</strong>'
											+'<div class="account">'
											+ '<p>' + item.content + '</p>'
											+'</div>'
										+ '</div>'
										+ '<div class="answer">'
											+'<strong class="title">'
												+'<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변">'
											+'</strong>'
											+'<div class="account">'
												+ '<p></p>'
											+'</div>'
										+ '</div>'
										+'</div>'
									+ '</td>'
									+'</tr>';
							}
						}else{
							table += '<td><strong>&lt;답변완료&gt;</strong></td>'; 
							if(item.secret == 0){
								table += '<td class="lt">'
								 		+ '<i class="fas fa-lock" style = "color:#00000059">'
												+ '비밀글 입니다.'
										+ '</i>'
										+'</td>'
										+'<td>' + item.uploaddate +'</td>'
										+'<td>' + item.writeId +'</td>';
							}else{
								table += '<td class="lt">'
										+ '<i class="fas fa-lock-open"style = "color:#00000059">'
											+ '<a href="javascript:" class="talkShort">' + item.subject + '</a>'
										+ '</i>'
										+'</td>'
										+'<td>' + item.uploaddate +'</td>'
										+'<td>' + item.writeId +'</td>'
									+'<tr class="talkMore " style="display: table-row;">'
									+ '<td colspan="4">'
										+'<div class="qnaList">'
										+ '<div class="question">'
											+'<strong class="title">'
												+'<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_q.png" alt="질문">'
											+'</strong>'
											+'<div class="account">'
											+ '<p>' + item.content + '</p>'
											+'</div>'
										+ '</div>'
										+ '<div class="answer">'
											+'<strong class="title">'
												+'<img src="http://fiximage.10x10.co.kr/web2015/shopping/ico_a.png" alt="답변">'
											+'</strong>'
											+'<div class="account">'
												+ '<p>' + item.reply + '</p>'
											+'</div>'
										+ '</div>'
										+'</div>'
									+ '</td>'
									+'</tr>';
							}
						}
						
						table += '</tr>';
						
					})
				}
				var num = data.listcount-(data.page-1)*10;
				$('#tableB').append(table);
				
				$('.pagination').empty();
				var paging = '';
				
				if(data.page<=1){
					paging += '<li class="page-item">'
							+ '<a class="page-link"  href="#">이전</a>'
							+'</li>';	
				}else{
					paging += '<li class="page-item">'
								+'<a href="jav	ascript:pagination({page:' + (data.page-1) + ', ykiho:\''+data.ykiho+'\'});" class="page-link">이전</a>'
							+ '</li>'; 
				}
				paging += '&nbsp;';
				for(var a = data.startpage; a<=data.endpage; a++){
					if(a == data.page){
						paging += '<li class="page-item">'
									+ '<a class="page-link" href="#">' + a + '</a>'
								+'</li>'; 
					}else{
						paging += '<li class="page-item">'
									+ '<a href="javascript:pagination({page:' + a +', ykiho:\'' + data.ykiho + '\'});" class="page-link">' 
										+ a 
									+ '</a>'	
								+'</li>';
					}
					paging += '&nbsp;';
				}
				if(data.page>= data.maxpage){
					paging += '<li class="page-item">'
								+'<a class="page-link" href="#">&nbsp;다음</a>'
							+ '</li>';
				}else{
					paging += '<li class="page-item">'
								+'<a href="javascript:pagination({page:' + (data.page+1) +', ykiho:\'' + data.ykiho + '\'});" class="page-link">&nbsp;다음</a>'
							+ '</li>';
				}
				$('.pagination').append(paging);
			},
			complete:function(){
				$(".talkList .talkMore").hide();
				$(".talkList .talkShort").click(function(){
					if($(this).parent().parent().parent().next('.talkMore').is(":hidden")){
						$(".talkList .talkMore").hide();
						$(this).parent().parent().parent().next('.talkMore').show();
					} else {
						$(this).parent().parent().parent().next('.talkMore').hide();
					}

					// 클릭 위치가 가려질경우 스크롤 이동
					if($(window).scrollTop()>$(this).parent().parent().offset().top-47) {
						$('html, body').animate({scrollTop:$(this).parent().parent().offset().top-47}, 'fast');
					}
				});
			}
		})
	}
	
</script>
</body>
</html>