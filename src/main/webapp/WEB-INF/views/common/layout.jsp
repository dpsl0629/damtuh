<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<tiles:insertAttribute name="header" />
</head>
<body>
	<article id="main-body">
		<div class="layout-skip">
			<a href="#main-wrapper">본문바로가기</a>
		</div>
		<tiles:insertAttribute name="body" />
	</article>
	<footer class="footer">
		<tiles:insertAttribute name="footer" />
	</footer>
</body>