<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<div class="contents">
   	<form id="operForm" action="/support/modifyConfirm" method="get">
   	<div class="contents-box">
        <div class="board-view">
            <div class="board-view-header">
                <p class="tit"><span class="bno" style="margin-right: 10px;"><c:out value="${notice.bno }"/></span><input type="text" name="title" value="${notice.title}"></p>
            </div>

            <!-- :: 첨부파일 없을 경우 해당 영역 삭제 s :: -->
            <div class="board-view-file">
                <div class="file-list">
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
            <div class="board-view-con">
                <textarea id="editor" cols="30" rows="10"><c:out  value="${ notice.content}"/></textarea>
            </div>
        </div>
         	<div class="btn-list">
            	<button type="button" class="move btn-green">글 수정하기</button>
       		</div>
        	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
        	<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
        </form>

    </div>
</div>

<script>CKEDITOR.replace('editor');</script>

<script>
	
	$(".move").on("click", function(e){
		e.preventDefault();
		var operForm = $("#operForm");
		var data = CKEDITOR.instances.editor.getData();	
		operForm.append("<input type='hidden' name='bno' value='" + $(".bno").text() + "'/>");
		operForm.append("<input type='hidden' name='content' value='" + data + "'/>");
		operForm.submit();
	});
	
</script>


