<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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
/*     background: url(http://fiximage.10x10.co.kr/web2017/common/ico_lock.png) 0 40% no-repeat;
 */}
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
    padding: 15px 80px;
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
<c:if test="${chk eq '1' and hs_empty eq '1'}">
<div class="section reviewStars" id="reviewStar">
	<div class="reviewStar">
		<div>
			친절 : ${score.kindness } / 5
		</div>
		<div>
			만족 : ${score.ability } / 5
		</div>
		<div>
			가격 : ${score.price } / 5
		</div>
	</div>
</div>
<div class="section qnaV15" id="detail04">
	<span id="lyQnAContAll">
		<table class="talkList">
			<caption>Review 목록</caption>
			<colgroup>
				<col width="140"> <col width=""> <col width="90"> <col width="120">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">리뷰번호</th>
					<th scope="col">리뷰제목</th>
					<th scope="col">작성일자</th>
					<th scope="col">작성자</th>
				</tr>
			</thead>
			<tbody id="tableB">
				<c:if test="${listcount > 0}">
					<c:set var = "num" value = "${listcount-(page-1)*5 }"/>
					<c:forEach var = "review" items = "${review }">
						<tr class="secretV17">
							<td>${num }</td>
							<c:set var = "num" value = "${num-1 }"/>
							<td class="lt">
								<a href="javascript:" class="talkShort">${review.subject }</a>
							</td>
							<td>
								<fmt:formatDate value="${review.uploaddate }" pattern="yyyy-MM-dd" var="dateFmt"/>
								<c:out value="${ dateFmt}"></c:out>
							</td>
							<td>${fn:substring(review.id, 0, 3)}****</td>	<!-- 뒤에 몇글자 **처리 -->
							<tr class="talkMore " style="display: table-row;">
								<td colspan="4">
									<strong class="title">
										${review.content }
									</strong>
								</td>
							</tr>
						</tr>		
					</c:forEach>
				</c:if>
				<c:if  test="${listcount == 0 }">
				<tr>
					<th colspan=4>작성된 후기가 없습니다.</th>
				</tr>
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
</c:if>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	// 문의하기 click
	
	
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
	
	function pagination(data){
		$.ajax({
			url:'reviewpage',
			data : {'ykiho' : data.ykiho, 'page' : data.page},
			dataType: 'json',
			success:function(data){
				console.log(1);
				var table = '';
				$('#tableB').empty();
				var num = data.listcount-(data.page-1)*5;
				
				if(data.listcount > 0){
					data.review.forEach(function(item, index){
						table += '<tr class="secretV17">'
									+ '<td>' + num + '</td>'
										+ '<td class="lt">'
											+ '<a href="javascript:" class="talkShort">' + item.subject + '</a>'
										+ '</td>'
									+ '<td>' + moment(item.uploaddate).format('YYYY-MM-DD') + '</td>'
									+ '<td>' + item.id.substr(0,3) + '****</td>'
									+ '<tr class="talkMore " style="display: table-row;">'
										+ '<td colspan="4">'
											+ '<strong class="title">'
												+ item.content
											+ '</strong>'
										+ '</td>'
									+ '</tr>'
								+ '</tr>';
						table += '</tr>';
						num = num-1;
					})
				}
				
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
			}
		})
	}
	
</script>
</body>
</html>