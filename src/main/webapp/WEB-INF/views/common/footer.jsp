<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<footer class="footer">
    <div class="footer-container">
        <div class="footer-wrap">
            <div class="footer-box">
                <ul class="footer-lnk-lst">
                    <li><a href="#lnk" class="strong">개인정보처리방침</a></li>
                </ul>
                <div class="footer-cont opt-clearfix">
                    <div class="footer-logo">
                        <img src="${contextPath }/resources/images/layout/footer-logo.png" alt="">
                    </div>
                    <div class="footer-txt">
                        <div class="footer-address">
                            <p>전라남도 순천시 승주읍 승주로 538-46</p>
                            <p>TEL : 02-599-7931 통신판매업신고번호 : 2021-전남순천-3835 팩스번호 : 02-596-7931 개인정보관리자 : 메일 : help1@damtuh.com</p>
                        </div>
                        <div class="footer-info">
                            <span>COPYRIGHT (C) damtuh ALL RIGHTS RESERVED.</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
