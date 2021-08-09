<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="contents">
    <div class="joinConfirm-box">
    	<div class="tit-box">
    		<p class="tit">리뷰 작성 완료되었습니다.</p>
    	</div>
    	<a href="${contextPath }/member/myPage">마이페이지로 돌아가기</a>
    </div>
</div>
                
