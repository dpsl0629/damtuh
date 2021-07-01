<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<header>
	   <tiles:insertAttribute name="header" />
	</header>
		<!--
	    1depth 마다 sub-top에 각각 다른 클래스 개발 필요
	    공공체육시설: bg1
	    이용안내: bg2
	    예약하기: bg3
	    예약확인/취소: bg4
	    공지사항: bg5
	    개인정보처리방침: bg6
	-->
	<div class="sub-top <tiles:insertAttribute name="bg" />">
	    <h2 class="sub-tit"><tiles:insertAttribute name="subtit" /></h2>
	</div>
	
	<div class="breadcrumb">
	    <div class="breadcrumb-container">
	        <ul class="breadcrumb-list opt-clearfix">
	            <li class="breadcrumb-item home"><span class="opt-screen-out">메인</span></li>
	            <li class="breadcrumb-item"><tiles:insertAttribute name="subtit" /></li>
	        </ul>
	    </div>
	</div>
	<article>
	 	<tiles:insertAttribute name="body" />
	</article>
	<footer class="footer">
      		<tiles:insertAttribute name="footer" />
   	</footer>
</body>      
        
        