<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
<link rel="icon" type="image/x-icon" href="/images/layout/16xfavi.ico">
<link rel="shortcut icon" type="image/x-icon"
	href="/images/layout/256xfavi.ico">
<link rel="shortcut icon" type="image/x-icon"
	href="/images/layout/16xfavi.ico">
<link rel="apple-touch-icon" sizes="114x114"
	href="/images/layout/114xfavi.ico">
<meta name="title" content="담터">
<meta name="description" content="담터입니다">
<meta name="keywords" content="담터">
<meta name="author" content="김예원">
<meta name="keywords" content="담터">
<meta name="author" content="김예원">
<meta property="og:title" content="담터">
<meta property="og:description" content="담터입니다">
<meta property="og:url" content="PROJECT SITE URL">
<meta property="og:type" content="website">
<meta property="og:site_name" content="담터">
<meta property="og:image" content="/images/layout/16xfavi.ico">
<!-- <meta name="_csrf" content="${_csrf.token}"/> -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<title>담터</title>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${contextPath}/resources/css/layout.css" rel="stylesheet"
	type="text/css" media="screen">
<link href="${contextPath}/resources/css/reset.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/resources/css/sub.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/resources/css/datepicker.css" rel="stylesheet" type="text/css">
<script src="${contextPath}/resources/js/libs/jquery-3.4.1.min.js"></script>
<script src="${contextPath}/resources/js/libs/datepicker.js"></script>
<script src="${contextPath}/resources/js/libs/ckeditor.js"></script>
<script src="${contextPath}/resources/js/libs/config.js"></script>
<script src="${contextPath}/resources/js/layout.js"></script>
<script src="${contextPath}/resources/js/contents.js"></script>
<body>
	<div class="wrapper">
		<header class="header">
			<div class="header-wrap">
				<div class="header-container">
					<div class="header-top">
						<button type="button" class="mob-gnb-btn" title="모바일 메뉴">
							<span class="ico"></span>
						</button>
						<h1 class="header-logo">
							<a href="${contextPath }/damtuh.do" class="header-logo-link"><img
								src="${contextPath }/resources/images/layout/header-logo.png"
								title="헤더 로고"><span class="opt-screen-out"></span></a>
						</h1>
						<div class="opt-mobile-tablet-hide">
							<div class="header-etc">
								<sec:authorize access="isAuthenticated()">
									<a href="#" class="header-etc-item"
										onclick="document.getElementById('logout-form').submit();">로그아웃</a>
									<!-- <form id="logout-form" action='<c:url value='${contextPath}/logout'/>' method="POST">
								   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
								</form> -->
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<a href="#" class="header-etc-item"
										onclick="document.getElementById('login-form').submit();">로그인</a>
									<!-- <form id="login-form" action='<c:url value='${contextPath}/damtuh/member/myPage.do'/>'>
									   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
									</form> -->
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a href="${contextPath}/member/myPage.do" class="header-etc-item">마이페이지</a>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<a href="${contextPath}/member/join.do" class="header-etc-item">회원가입</a>
								</sec:authorize>
							</div>
						</div>
					</div>

					<div class="gnb">
						<div class="opt-web-hide">
							<div class="header-etc">
								<sec:authorize access="isAuthenticated()">
									<a href="#" class="header-etc-item"
										onclick="document.getElementById('logout-form').submit();">로그아웃</a>
									<form id="logout-form"
										action='<c:url value='${contextPath}/logout'/>' method="POST">
										<input name="${_csrf.parameterName}" type="hidden"
											value="${_csrf.token}" />
									</form>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<a href="#" class="header-etc-item"
										onclick="document.getElementById('login-form').submit();">로그인</a>
									<form id="login-form"
										action='<c:url value='/damtuh/member/myPage.do'/>'>
										<input name="${_csrf.parameterName}" type="hidden"
											value="${_csrf.token}" />
									</form>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()">
									<a href="${contextPath}/damtuh/member/myPage.do" class="header-etc-item">마이페이지</a>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
									<a href="${contextPath}/damtuh/member/join.do" class="header-etc-item">회원가입</a>
								</sec:authorize>
							</div>
						</div>
						<nav class="gnb-wrap">
							<ul class="gnb-lst opt-clearfix">
								<li class=""><a href="${contextPath }/damtuh/company/damtuh.do">이용정보</a>
									<div class="gnb-dep2-wrap">
										<ul class="gnb-dep2-lst">
											<li><a href="${contextPath }/damtuh/company/damtuh.do">회사소개</a></li>
											<li><a href="${contextPath }/damtuh/company/damtuh.do">인사말</a></li>
											<li><a href="${contextPath }/damtuh/company/ideology.do">경영이념</a>
											</li>
											<li><a href="${contextPath }/damtuh/company/ci.do">CI</a></li>
											<li><a href="${contextPath }/damtuh/company/history.do">회사연혁</a></li>
											<li><a href="#lnk">작업공정</a></li>
											<li><a href="#lnk">세계속의 담터</a></li>
											<li><a href="#lnk">찾아오시는 길</a></li>
										</ul>
									</div></li>
								<li><a href="${contextPath }/damtuh/product/productList.do"
									style="font-weight: 600;">제품구매</a></li>
								<li><a href="${contextPath }/damtuh/info/kind.do">차이야기</a>
									<div class="gnb-dep2-wrap">
										<ul class="gnb-dep2-lst">
											<li><a href="${contextPath }/damtuh/info/kind.do">차의 종류</a></li>
											<li><a href="${contextPath }/damtuh/info/origin.do">차의 기원</a></li>
										</ul>
									</div></li>
								<li class=""><a href="${contextPath}/damtuh/support/noticeList.do">고객지원</a>
									<div class="gnb-dep2-wrap">
										<ul class="gnb-dep2-lst">
											<li><a href="${contextPath}/damtuh/support/noticeList.do">공지사항</a></li>
											<li><a href="#lnk">자주 묻는 질문</a></li>
										</ul>
									</div>
								</li>
							</ul>
						</nav>
						<div class="gnb-dimed"></div>
					</div>
				</div>
			</div>
		</header>
	</div>
