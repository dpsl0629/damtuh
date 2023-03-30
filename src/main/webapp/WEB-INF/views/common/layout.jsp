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
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	<c:if test="${type ne 'main'}">
		<jsp:include page="/WEB-INF/views/common/sub-top.jsp" />
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
	</c:if>
	<c:if test="${type eq 'main'}">
		<article id="main-body">
			<div class="layout-skip">
				<a href="#main-wrapper">본문바로가기</a>
			</div>
			<tiles:insertAttribute name="body" />
		</article>
	</c:if>
	<footer class="footer">
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</footer>
</body>