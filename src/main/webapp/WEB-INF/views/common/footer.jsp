<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"    
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <div class="footer-container">
        <div class="footer-wrap">
            <div class="footer-box">
                <div class="footer-address">
                    <p>경기도 포천시 신북면 청신로 2047번길 85-8 주식회사 담터</p>
                    <span>TEL : 1899-3931 | FAX : 031-534-2910</span>
                </div>
                <div class="footer-info">
                    <span>Copyright ⓒ 2005-2020 DAMTUH CO. LTD. All Rights Reserved.</span>
                </div>
                <div class="footer-logo">
                    <img src="${contextPath }/resources/images/layout/footer-logo.png" alt="">
                </div>
                <ul class="footer-lnk-list">
                    <li><a href="#lnk" class="strong">개인정보처리방침</a></li>
                </ul>
            </div>
        </div>
    </div>
