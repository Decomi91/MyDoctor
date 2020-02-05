<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar -->

      
      <div id="sidebar">
         <div class="inner">
         
            <!-- Search -->
            <section id="search" class="alt">
               <form method="post" action="Allquery.net">
                   <input type="text" name="Allquery" id="Allquery" placeholder="모든 병원 검색" />
               </form>
            </section>
      
      
            <!-- Login & Mypage -->
            <!-- id값=null인경우_로그인/회원가입 -->
            <c:if test="${loginid == null }">
               <nav id="menu">
                  <form action="loginMember" method="post">
                     <header class="major">
                        <h2>Login</h2>
                     </header>
                     
                     <ul style="margin-top : -10%;">
                        <li><input type="radio" id="pub" name="user" value="pub" checked="checked"><label for="pub">일반회원</label> &nbsp;&nbsp;&nbsp;
                           <input type="radio" id="hos" name="user" value="hos"><label for="hos">병원회원</label><br><br></li>
                        <li class="nobordertop">ID<input type="text" id="id" name="id" class="logininput"></li>
                        <li class="nobordertop">PASSWORD<input type="password" id="password" name="password" class="logininput"><br></li>
                        <li class="nobordertop"><button type="submit" class="button primary fit loginbtn">Login</button></li>
                        <li><a href="findAccount" class="privacybtn privacybtnline">ID/비밀번호
                              찾기 </a><a href="joinForm" class="privacybtn">회원가입</a></li>
                     </ul>
                  </form>
               </nav>
            </c:if>
            <!-- id값=null아닌경우_마이페이지 -->
            <!-- 일반회원으로 로그인했을 경우 -->
            <c:if test="${loginid !=null && !(loginid eq 'admin') && chk==1}">
               <section>
                  <header class="major">
                     <h2>${loginid }님 환영합니다</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
                        <i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;병원
								예약내용이 &nbsp;&nbsp; <a href="reserveCheck.net">${yesaccept }</a> 건 있습니다.
                     </p>
                  </div>
                  <ul class="contact">
                     <li class="icon solid fas fa-address-book mypageacess"><a
                        href="reserveCheck.net">마이페이지</a></li>
                     <li
                        class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
                        href="gobookmark.net">관심병원</a></li>
                     <li class="icon solid far fa-calendar-alt mypageacess"><a
                        href="mypage.net">예약내역</a></li>
                     <li class="icon solid fas fa-clipboard-list mypageacess"><a
                        href="finish.net">진료기록</a></li>
                  </ul>
                  <a href="logout" class="button primary fit koreanfont">로그아웃</a>
               </section>
            </c:if>
            <!-- 병원id로 로그인했을 경우 -->
            <c:if test="${loginid !=null && !(loginid eq 'admin') && chk==2}">
               <section>
                  <header class="major">
                     <h2>${loginid }님 환영합니다</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
                        <i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;오늘 병원
                        예약이 &nbsp;&nbsp; <a href="hosmypage_today.net">${accepted }</a> 건 있습니다.
                     </p>
                  </div>
                  <ul class="contact">
                     <li class="icon solid fas fa-hospital mypageacess"><a
                        href="hosmypage.net">예약 확인</a></li>
                     <li
                        class="icon solid far fa-address-book mypagelisecond-child mypageacess"><a
                        href="diagnosisList.net">진료 기록</a></li>
                     <li class="icon solid far fa-calendar-alt mypageacess"><a
                        href="reserveAll.net">전체 기록</a></li>
                     <li class="icon solid fas fa-clipboard-list mypageacess"><a
                        href="hosmyboard.net">게시판 관리</a></li>
                  </ul>
                  <a href="logout" class="button primary fit koreanfont">로그아웃</a>
               </section>
            </c:if>
            <!-- 관리자일 경우 -->
            <c:if test="${loginid == 'admin'}">
               <section>
                  <header class="major">
                     <h2>관리자 계정</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
						<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;관리자 요청 게시글이
							&nbsp;&nbsp; <a href="requestToAdmin">${adminReq }</a> 건 있습니다.
						<i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;병원 가입 요청이
							&nbsp;&nbsp; <a href="hospitalSignlist">${accepctReq }</a> 건 있습니다.
                     </p>
                  </div>
                  <ul class="contact">
                    <li class="icon solid far fa-clipboard-list mypageacess"><a
                        href="hospitalcontrol">병원 관리</a></li>
                    <li class="icon solid far fa-clipboard-list mypagelisecond-child mypageacess"><a
                        href="usercontrol">회원 관리</a></li> 
                    <li class="icon solid far fa-clipboard-list mypageacess"><a
                        href="hospitalSignlist">병원 신청 목록</a></li>
                    <li class="icon solid fas fa-folder-open mypageacess"><a
                        href="requestToAdmin">요청 게시판</a></li>
                  </ul>
                  <br>
                  <a href="logout" class="button primary fit koreanfont">로그아웃</a>
               </section>
            </c:if>
            <c:if test="${loginid != 'admin'}">
               <!-- Section2_Contact -->
               <section>
                  <header class="major">
                     <h2>Contact</h2>
         
                  </header>
                  <p>
                     제휴 관련하여 문의 사항이 있는 병원에서는 연락주세요 &nbsp;&nbsp;<a href="hs_signup.do">지금바로 요청,
                        Click Here!</a>
                  </p>
                  <ul class="contact">
                     <li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
                     <li class="icon solid fa-phone">(000) 000-0000</li>
                     <li class="icon solid fa-home">1234 Somewhere Road #8254<br />
                        Seoul, TN 00000-0000
                     </li>
                  </ul>
               </section>
            </c:if>
         
            <!-- Footer -->
            <footer id="footer">
               <p class="copyright">
                  &copy; MY DOCTOR. All rights reserved. Demo Images: <a
                     href="https://unsplash.com">Unsplash</a>. Design: <a
                     href="https://html5up.net">HTML5 UP</a>.
               </p>
            </footer>
         </div>
         
      </div>