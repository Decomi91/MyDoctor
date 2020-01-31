<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${chk!=2 }">
	<jsp:forward page="/main"></jsp:forward>
</c:if>
<div style="padding-top: 0" class="mypageSection sectionDisplay">
	<div class="mypageHeader">
		<div id="mypageHeaderdiv">
			<ul>
				<li><a href='#'><span>My page</span></a></li>
			</ul>
			<table id = "hosSidebarTable">
				<tr>
					<td>오늘의 예약</td>
					<td>대기중인 예약</td>
				</tr>
				<tr>
					<td><a href="hosmypage_today.net">${accepted }</a></td>
					<td><a href="hosmypage.net">${wait }</a></td>
				</tr>
				<tr>
					<td>오늘 취소 예약</td>
					<td>문의글</td>
				</tr>
				<tr>
					<td>${canceled}</td>
					<td><a href="hosmyboard.net?noreply=1">${qnawait }</a></td>
				</tr>
			</table>
		</div>
	</div>

	<div class="mypageMenu">
		<div id='cssmenu'>
			<ul>
				<li><a href='hosmypage.net'><span>예약 확인</span></a></li>
				<li><a href='diagnosisList.net'><span>진료 기록</span></a></li>
				<li><a href='reserveAll.net'><span>전체 기록</span></a></li>
				<li><a href='hosmyboard.net'><span>게시판 관리</span></a></li>
				<li><a href='hosmyreview.net'><span>후기 확인</span></a></li>
				<li><a href='#'><span>병원 정보 수정</span></a></li>
				<li class='last'><a href='#'><span>회원탈퇴</span></a></li>
			</ul>
		</div>
	</div>
</div>
