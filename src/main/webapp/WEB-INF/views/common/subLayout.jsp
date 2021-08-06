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
	<div class="layout-skip"><a href="#contents">본문바로가기</a></div>
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
	<article id="sub-body">
		<div class="wrapper">
	        <div class="sub-wrapper">
	            <div class="sub-contents">
	                <div class="sub-container">
	                	<tiles:insertAttribute name="body" />
	                </div>
	           </div>
	        </div>
       </div>
	</article>
	<footer class="footer">
     	<tiles:insertAttribute name="footer" />
   	</footer>
</body>      
        
        