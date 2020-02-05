<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE HTML>
<html>
<head>
<title>My Doctor</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/css/main.css" />
<script src="resources/js/jquery-3.4.1.min.js"></script>
<style type="text/css">
.bktop {
  background-color: rgba(0, 0, 0, 0.6); 
  color: #fff; 
  position: fixed;
  right: 40px; 
  bottom: 40px;
  padding: 12px 18px;
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  display: none;
  text-decoration: none; 
  z-index: 99999;
}
.bktop:hover {
  background-color:rgba(0, 0, 0, 1);
}
</style>
<script type="text/javascript">
$(function(){	
	var p = 1;
	$("#add").click(function() {	
		p++;
		add();				
	});//add

	$("#su").click(function() {		
		 p =1;
		 search();
	});//서치
	
	$("#geon").keydown(function(key){
		 p =1;
		 if(key.keyCode == 13){
			 search();
		 }
	});

	
	function add(){
		$.ajax({
			url : "Allquery.net",
			type : "post",
			data : {
				"p" : p,
				"Allquery" : $("#geon").val(),
				"kim" :$("#kim option:selected").val(),
				"kim2" :$("#kim2 option:selected").val(),
				"kim3" : "kim3"
			},
			success : function(data) {				
				$('tbody').last().append(data);		
			},
			error : function(err) {
				alert("페이지가 더이상없습니다");
			}

		});//ajax
	}
	
	function search(){
		$.ajax({
			url : "Allquery.net",
			type : "post",
			data : {
				"p" : p,
				"Allquery" : $("#geon").val(),
				"kim" :$("#kim option:selected").val(),
				"kim2" :$("#kim2 option:selected").val(),
				"kim3" : "kim3"
			},
			success : function(data) {
				$("#total").html("");				
				$('tbody').last().empty();
				$('tbody').last().append(data);	
				
			},
			error : function(err) {
				alert("페이지가 더이상없습니다");
			}

		});//ajax
	}
	
	
	//스크롤
	$('a.bktop').click(function(e){
	    $('html, body').animate({scrollTop:0}, '1000');
	    e.preventDefault();
	  });
	  $(window).scroll(function() {
	    if($(this).scrollTop() > 10){
	      $('.bktop').fadeIn('2000');
	    } else {
	      $('.bktop').fadeOut('500');
	    }
	  });
	
})
</script>


</head>
<body class="is-preload">
   <!-- Wrapper -->
   <div id="wrapper">
      <!-- Main -->
      <div id="main">
         <div class="inner">
            <!-- Main -->
                  <!-- Header -->
                  <header id="header">                
                     <a href="main" class="logo"><strong>My Doctor</strong> by
                        team.5</a>
                  </header>

                  <!-- 검색 -->

                  <select name="kim" style="width: 15%; display: inline-block;" id="kim">
		    				<option value="no">지역선택</option>
		    				<option value="110000">서울</option>
		    				<option value="310000">경기도</option>
		    				<option value="220000">인천</option>
		    				<option value="250000">대전</option>
							<option value="210000">부산</option>
				    		<option value="320000">강원도</option>
				    		<option value="380000">경상남도</option>
				    		<option value="370000">경상북도</option>
				    		<option value="360000">전라남도</option>
				    		<option value="350000">전라북도</option>
				    		<option value="340000">충천남도</option>
				    		<option value="330000">충천북도</option>
				    		<option value="390000">제주시</option>
				</select>
				 <select name="kim2" id="kim2" class="categorysel" style="width: 15%; display: inline-block; ">
                              <option value="no">진료과목</option>
                              <option value="01">내과</option>
                              <option value="04">외과</option>
                              <option value="05">정형외과</option>
                              <option value="08">성형외과</option>
                              <option value="10">산부인과</option>
                              <option value="11">소아청소년과</option>
                              <option value="12">안과</option>
                              <option value="13">이비인후과</option>
                              <option value="14">피부과</option>
                              <option value="15">비뇨기과</option>
                              <option value="49">치과</option>                              
                           </select>
		
            <input type="text" style="width: 50%; display: inline-block;" name="geon" id="geon" value="${hidden}">
                       
            <button style="width: 10% ;" name="su" id="su">검색</button>
	
		
			<h4 id ="total">총결과 수 : ${total }</h4>
						
               	<section id="banner" style="padding: 1em 0 1em 0;">           
            <!-- Banner: body -->
                  
             <table style="font-size: 80%">
             <thead>
               <tr id="test">
               <td>분류</td>
               <td>지역</td>
               <td style="text-align: center;">이름</td>
               <td>주소</td>
               </tr>
             </thead>
             <tbody>
                <c:choose>
               <c:when test="${msg eq null }">               
             <c:forEach var="hs" items="${all}" >
				<tr>				
				<td style="font-size: 80%">${hs.clCdNm}</td>
				<td style="font-size: 80%">${hs.sgguCdNm}</td>
				<td style="text-align: center;"><a style="font-size: 80%" href="detail.net?ykiho=${hs.ykiho}&yadmNm=${hs.yadmNm}&clCdNm=${hs.clCdNm}&postNo=${hs.postNo }&addr=${hs.addr}&telno=${hs.telno}&hospUrl=${hs.hospUrl}&estbDd=${hs.estbDd}&drTotCnt=${hs.drTotCnt}&YPos=${hs.YPos}&XPos=${hs.XPos}">${hs.yadmNm}</a></td>
				<td style="font-size: 80%">${hs.addr}</td>
				</tr>
				</c:forEach> 
				</c:when>
				<c:otherwise>
				<tr><td colspan="3" style="text-align: center;">${msg}</td></tr>
				</c:otherwise>
				</c:choose>
				</tbody>				                 
               </table>                      
            </section>                    
             <c:if test="${fn:length(all)>=10}"><button id="add">더보기</button></c:if>
            <!-- banner end -->
            
            </div>
      </div>

      <jsp:include page="../header/footer.jsp"></jsp:include>
         
      </div>
 
  
<a href="#top" class="bktop">&uarr;</a>

   <!-- Scripts -->
   <script src="resources/js/jquery.min.js"></script>
   <script src="resources/js/browser.min.js"></script>
   <script src="resources/js/breakpoints.min.js"></script>
   <script src="resources/js/util.js"></script>
   <script src="resources/js/main.js"></script>

</body>
</html>