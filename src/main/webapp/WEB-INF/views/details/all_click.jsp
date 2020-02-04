<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	 <c:choose>
               <c:when test="${msg eq null }">               
             <c:forEach var="hs" items="${all}">
				<tr>
				<td style="font-size: 80%">${hs.clCdNm}</td>
				<td>${hs.sgguCdNm}</td>
				<td style="text-align: center;"><a style="font-size: 80%" href="detail.net?ykiho=${hs.ykiho}&yadmNm=${hs.yadmNm}&clCdNm=${hs.clCdNm}&postNo=${hs.postNo }&addr=${hs.addr}&telno=${hs.telno}&hospUrl=${hs.hospUrl}&estbDd=${hs.estbDd}&drTotCnt=${hs.drTotCnt}&YPos=${hs.YPos}&XPos=${hs.XPos}">${hs.yadmNm}</a></td>
				<td style="font-size: 80%">${hs.addr}</td>
				</tr>
				</c:forEach> 
				</c:when>
				<c:otherwise>
				<tr><td colspan="4" style="text-align: center;">${msg}</td></tr>
				</c:otherwise>
				</c:choose>
