<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar -->

      
      <div id="sidebar">
         <div class="inner">
         
            <!-- Search -->
            <section id="search" class="alt">
               <form method="post" action="#">
                  <input type="text" name="query" id="query" placeholder="Search" />
               </form>
            </section>
      
      
            <!-- Login & Mypage -->
            <!-- id��=null�ΰ��_�α���/ȸ������ -->
            <c:if test="${loginid == null }">
               <nav id="menu">
                  <form action="loginMember" method="post">
                     <header class="major">
                        <h2>Login</h2>
                     </header>
                     
                     <ul style="margin-top : -10%;">
                        <li><input type="radio" id="pub" name="user" value="pub" checked="checked"><label for="pub">�Ϲ�ȸ��</label> &nbsp;&nbsp;&nbsp;
                           <input type="radio" id="hos" name="user" value="hos"><label for="hos">����ȸ��</label><br><br></li>
                        <li class="nobordertop">ID<input type="text" id="id" name="id" class="logininput"></li>
                        <li class="nobordertop">PASSWORD<input type="password" id="password" name="password" class="logininput"><br></li>
                        <li class="nobordertop"><button type="submit" class="button primary fit loginbtn">Login</button></li>
                        <li><a href="#" class="privacybtn privacybtnline">ID/��й�ȣ
                              ã�� </a><a href="joinForm" class="privacybtn">ȸ������</a></li>
                     </ul>
                  </form>
               </nav>
            </c:if>
            <!-- id��=null�ƴѰ��_���������� -->
            <c:if test="${loginid !=null && !(loginid eq 'admin') && chk==1}">
               <section>
                  <header class="major">
                     <h2>${loginid }�� ȯ���մϴ�</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
                        <i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;����
                        ���೻���� &nbsp;&nbsp; <a href="#">?</a> �� �ֽ��ϴ�.
                     </p>
                  </div>
                  <ul class="contact">
                     <li class="icon solid fas fa-address-book mypageacess"><a
                        href="mypage.net">����������</a></li>
                     <li
                        class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
                        href="#">���ɺ���</a></li>
                     <li class="icon solid far fa-calendar-alt mypageacess"><a
                        href="myreserve.net">���೻��</a></li>
                     <li class="icon solid fas fa-clipboard-list mypageacess"><a
                        href="#">������</a></li>
                  </ul>
                  <a href="logout" class="button primary fit koreanfont">�α׾ƿ�</a>
               </section>
            </c:if>
            <c:if test="${loginid !=null && !(loginid eq 'admin') && chk==2}">
               <section>
                  <header class="major">
                     <h2>${loginid }�� ȯ���մϴ�</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
                        <i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;����
                        ���೻���� &nbsp;&nbsp; <a href="#">?</a> �� �ֽ��ϴ�.
                     </p>
                  </div>
                  <ul class="contact">
                     <li class="icon solid fas fa-address-book mypageacess"><a
                        href="#">����������</a></li>
                     <li
                        class="icon solid far fa-hospital mypagelisecond-child mypageacess"><a
                        href="#">���� ���������</a></li>
                     <li class="icon solid far fa-calendar-alt mypageacess"><a
                        href="#">���೻��</a></li>
                     <li class="icon solid fas fa-clipboard-list mypageacess"><a
                        href="#">������</a></li>
                  </ul>
                  <a href="logout" class="button primary fit koreanfont">�α׾ƿ�</a>
               </section>
            </c:if>
            <c:if test="${loginid == 'admin'}">
               <section>
                  <header class="major">
                     <h2>������ ����</h2>
                  </header>
                  <div class="box" style="margin-bottom: 1em">
                     <p class="reservationnoti">
                        <i class="icon solid fas fa-bell" style="color: #f56a6a"></i>&nbsp;&nbsp;������ ��û �Խñ���
                         &nbsp;&nbsp; <a href="#">?</a> �� �ֽ��ϴ�.
                     </p>
                  </div>
                  <ul class="contact">
                     <li
                        class="icon solid far fa-clipboard-list mypageacess"><a
                        href="hospitalcontrol">���� ����</a></li>
                     <li class="icon solid far fa-clipboard-list mypagelisecond-child mypageacess"><a
                        href="usercontrol">ȸ�� ����</a></li>
                     <li class="icon solid fas fa-folder-open mypageacess"><a
                        href="#">��û �Խ���</a></li>
                  </ul>
                  <a href="logout" class="button primary fit koreanfont">�α׾ƿ�</a>
               </section>
            </c:if>
            <c:if test="${loginid != 'admin'}">
               <!-- Section2_Contact -->
               <section>
                  <header class="major">
                     <h2>Contact</h2>
         
                  </header>
                  <p>
                     ���� �����Ͽ� ���� ������ �ִ� ���������� �����ּ��� &nbsp;&nbsp;<a href="hs_signup.do">���ݹٷ� ��û,
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