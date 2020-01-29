<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${reqlistcount>0 }">
	<div class="accordion">
		<c:forEach var="r" items="${myreqlist}">
			<div class="accordion__item">
				<h3 class="accordion__title js-title">${r.reqDate }</h3>
				<div class="accordion__copy accordion__copy--open js-copy">
					<div>
						<strong>${r.subject }</strong><br> ${r.content }
					</div>
					<div>
						<hr>
						<i class="fas fa-share fa-flip-vertical"></i> ${r.reply }
					</div>
				</div>
			</div>
		</c:forEach>
	</div>





	<!-- 내가쓴 후기 끝 -->
	<ul class="pagination">
		<c:if test="${page<=1}">
			<li><a href="#" class="button">Prev</a></li>
		</c:if>
		<c:if test="${page>1}">
			<li><a href="myReqToA?page=${page-1 }" class="page">Prev</a></li>
		</c:if>
		<c:forEach var="a" begin="${startpage }" end="${endpage}">
			<c:if test="${a==page}">
				<li><a href="#" class="page">${a}</a></li>
			</c:if>
			<c:if test="${a!=page}">
				<li><a href="myReqToA?page=${a }" class="page">${a}</a></li>
			</c:if>
		</c:forEach>
		<c:if test="${page>=maxpage}">
			<li><a href="#" class="page">Next</a></li>
		</c:if>
		<c:if test="${page<maxpage}">
			<li><a href="myReqToA?page=${page+1 }" class="page">Next</a></li>
		</c:if>
	</ul>

</c:if>
<c:if test="${reqlistcount==0 }">
	<font size=5>등록된 글이 없습니다.</font>
</c:if>
