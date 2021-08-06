<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="contents">
    <div class="contents-box notice-box">
        <div class="board-view">
            <div class="board-view-header">
                <p class="tit"><span class="opt-screen-out">공지</span></span><span class="ico-badge badge-region"><c:out value="${article.title }"/></p>
                <p class="desc">
                    <strong>등록일:</strong>
                    <span><fmt:formatDate pattern="yyyy-MM-dd hh-mm-ss" value="${article.writeDate }"/></span>
                </p>
            </div>

            <!-- :: 첨부파일 없을 경우 해당 영역 삭제 s :: -->
            <div class="board-view-file">
                <div class="file-lst">
                    <p class="file">
                        <a href="#lnk">
                            <span class="ico-download"></span>
                            홈페이지 오픈.jpg
                        </a>
                    </p>
                    <p class="file">
                        <a href="#lnk">
                            <span class="ico-download"></span>
                            홈페이지 오픈.pdf
                        </a>
                    </p>
                </div>
            </div>
	            <!-- :: 첨부파일 없을 경우 해당 영역 삭제 e :: -->
	
            <div class="board-view-con">
                ${article.content }
            </div>
	           
           <form id="operForm" method="get">
        
	          <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		     <div class="btn-box right-box opt-clearfix">
		     	<button class="btn-green btn-modify" type="button">글 수정하기</button>
		     	<button class="btn-green btn-delete" type="button">글 삭제하기</button>
		     </div>
		     </sec:authorize>
		       	<input type="hidden" id="bno" name="bno" value="<c:out value='${article.bno }'/>">
		       	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
		       	<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
	       </form>
	        <div class="btn-lst">
	            <a class="move btn-green" href="#lnk">목록</a>
	        </div>
	    </div>
    </div>
</div>

<script>
  
$(document).ready(function() {
	var operForm = $("#operForm");
	
	$(".move").on("click", function(e) {
		e.preventDefault();
	 			
		operForm.find("#bno").remove();
		operForm.attr("action", "/support/notice");
		operForm.submit();
	});
	
	$(".btn-modify").on("click", function(e) {
		operForm.attr("action", "/support/modifyWrite");
		operForm.submit();
	});
	
	$(".btn-delete").on("click", function() {
		operForm.attr("action", "/support/deleteConfirm");
		operForm.submit();
	});
	
});
</script>
<script>
window.onpopstate = function(event) {
	history.pushState({pageNum:3, searchDt:'2019-05-07'}, null, '/support/notice');
	 history.back();
	 alert("뒤로가기");
}
</script>