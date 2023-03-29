<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="login-box">
		<div class="login-form">
			<form id="modify-check-form"
				action="${contextPath }/member/deleteConfirm">
				<fieldset>
					<legend>로그인</legend>
					<p style="color: #f00;">${requestScope.loginFailMsg}</p>
					<div class="login-cont">
						<div class="input-field">
							<p class="tit">비밀번호</p>
							<input type="text" name="pw" id="pw" placeholder="아이디">
						</div>
					</div>
					<div class="button_wrap">
						<input type="submit" class="btn-member" value="로그인">
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
				</fieldset>
				<input type="hidden" name="loginRedirect" value="${loginRedirect }" />
				<p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message }</p>
				<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />
			</form>
		</div>
	</div>
</div>

