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
        <div class="board-view opt-clearfix">
            <div class="board-view-header">
                <p class="tit"><span class="opt-screen-out">공지</span></span><span class="ico-badge badge-region"><c:out value="${article.title }"/></p>
                <p class="desc">
                    <strong>등록일:</strong>
                    <span><fmt:formatDate pattern="yyyy-MM-dd hh-mm-ss" value="${article.writeDate }"/></span>
                </p>
            </div>

                <c:choose>
	            	<c:when test="${attachList == null }">
	            		<p>파일이 없습니다.</p>
	            	</c:when>
            		<c:when test="${attachList != null}">
	                	<c:forEach items="${attachList}" var="attach">
					            <div class="board-view-file">
					                <div class="file-lst">
					                     <p class="file">
					                        <a href="#lnk" data-path="${attach.uploadPath }" data-uuid="${attach.uuid }" data-filename="${attach.fileName }">
					                            <img class="ico" src="${contextPath }/resources/images/sub/attach.png"/><c:out value="${attach.fileName}"/>
					                        </a>
					                    </p>
					                </div>
				                </div>
        				</c:forEach>
		            </c:when>
	           </c:choose>
	
            <div class="board-view-con">
                ${article.content }
            </div>
	           
           <form id="operForm" method="get">
        
	          <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		     <div class="btn-box right-box">
		     	<button class="btn-green btn-delete" type="button">글 삭제하기</button>
		     	<button class="btn-green btn-modify" type="button">글 수정하기</button>
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
		operForm.attr("action", "/support/noticeList");
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
	
	$(".file a").on("click", function(e) {
		var liObj = $(this);
		
		var path = encodeURIComponent(liObj.data("path") +"/" + liObj.data("uuid") + "_" + liObj.data("filename"));
		self.location = "/support/download?fileName=" + path;
	});
	
});
</script>