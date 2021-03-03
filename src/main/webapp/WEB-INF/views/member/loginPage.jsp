<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!--#include virtual="/html/include/sub-head.html"-->
<body class="sub-body">

    <div class="layout-skip"><a href="#container">본문바로가기</a></div>

    <!-- :: wrapper s :: -->
    <div class="wrapper">

        <!-- :: header s :: -->
        <!--#include virtual="/html/include/header.html"-->
        <!-- :: header e :: -->

        <div class="sub-wrapper">

            <!-- :: sub-top s :: -->
            <!--#include virtual="/html/include/sub-top.html"-->
            <!-- :: sub-top e :: -->

            <div class="sub-contents">
                <div class="sub-container">

                <!-- :: content s :: -->
                <div class="contents">
                    <div class="login-box">
                        <div class="login-form">
                        	<form id="login-form" action="${contextPath}/login" method="post">
	                            <fieldset>
	                                <legend>로그인</legend>
	                                <div class="login-cont">
	                                    <div class="input-field">
	                                        <p class="tit">아이디</p>
	                                        <input type="text" name="username" id="id" placeholder="아이디">
	                                    </div>
	                                    <div class="input-field">
	                                        <p class="tit">비밀번호</p>
	                                        <input type="password" name="password" placeholder="비밀번호">
	                                    </div>
	                                    
	                                </div>
	                                
	                                <!-- //로그인폼 - 좌우 -->
	                                <ul class="login-lst opt-clearfix">
	                                    <li>
	                                        <div class="chk-wrap">
	                                            <input type="checkbox" name="idsave" id="idsave" value="checked" class="mb0">
	                                            <label for="idsave"><span class="chk_mark"></span>아이디 저장</label>
	                                        </div>
	                                    </li>
	                                    <li>
	                                        <a href="${contextPath }/member/join.do">회원가입</a>
	                                        <a href="/member/find">아이디/비밀번호 찾기</a>
	                                    </li>
	                                </ul>
	                                <div class="button_wrap">
	                                    <input type="submit" class="btn-member" value="로그인">
	                                </div>
	                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	                            </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- :: content e :: -->


                </div>
            </div>

            <div class="btn-top-box">
                <a href="#lnk" class="btn-top js-btn-top"><span class="opt-screen-out">상단으로 이동</span></a>
            </div>
        </div>

        <!-- :: footer s :: -->
        <!--#include virtual="/html/include/footer.html"-->
        <!-- :: footer e :: -->

    </div>
    <!-- :: wrapper e :: -->