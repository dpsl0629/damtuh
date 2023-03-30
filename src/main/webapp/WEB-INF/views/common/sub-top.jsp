<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="sub-top bg1">
	<h2 class="sub-tit">
		[&nbsp;&nbsp;
			<c:out value="${title}" escapeXml="false"/>
		&nbsp;&nbsp;]
	</h2>
</div>

<div class="breadcrumb">
	<div class="breadcrumb-container">
		<ul class="breadcrumb-list opt-clearfix">
			<li class="breadcrumb-item home"><span class="opt-screen-out">메인</span></li>
			<li class="breadcrumb-item">공공체육시설</li>
		</ul>
	</div>
</div>