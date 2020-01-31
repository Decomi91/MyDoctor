<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${chk!=1 }">
	<jsp:forward page="/main"></jsp:forward>
</c:if>
<div style="padding-top: 0" class="mypageSection sectionDisplay">
	<div class="mypageHeader">
		<div id="mypageHeaderdiv">
			<ul>
				<li><a href='mypage'><span>My page</span></a></li>
				<li><i class="icon solid fas fa-user-circle mypageBell"
					style="color: #f56a6a; font-size: 500%"></i></li>
				<li>병원 예약내용이&nbsp; <a href="mypage.net">
						${yesaccept } </a> 건 있습니다.
				</li>
			</ul>

		</div>
	</div>

	<div class="mypageMenu">
		<div id='cssmenu'>
			<ul>
				<li><a href='mypage.net'><span>예약 확인</span></a></li>
				<li><a href='gobookmark.net'><span>관심 병원</span></a></li>
				<li><a href='modifyck.do'><span>나의 정보 수정</span></a></li>
				<li><a href='myreview.net'><span>내가 쓴 후기</span></a></li>
				<li><a href='myqna.net'><span>문의/요청</span></a></li>
				<li class='last'><a href='quit.do'><span>회원탈퇴</span></a></li>
			</ul>
		</div>
		<div class="writeReqToADiv ">
		<a class="writeReqToA" data-toggle="modal" href="writeReqToA"><i class="far fa-paper-plane"></i>&nbsp;관리자에게 문의하기</a>
		</div>

	</div>
</div>
