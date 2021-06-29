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
                            <!-- :: 첨부파일 없을 경우 해당 영역 삭제 e :: -->

                            <div class="board-view-con">
                                ${article.content }
                            </div>
                            
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
			                    <div class="btn-box right-box opt-clearfix">
			                    	<a href="${contextPath }/support/modifyWrite?bno=${article.bno}" class="btn-green" type="button">글쓰기</a>
			                    </div>
		                    </sec:authorize>
                     
                        </div>
                        <div class="btn-list">
                            <a class="move btn-green" href="#lnk">목록</a>
                        </div>
                        
                        <form id="operForm" method="get">
                        	<input type="hidden" id="bno" name="bno" value="<c:out value='${article.bno }'/>">
                        	<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
                        	<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
                        </form>

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

<script>
    
    	$(document).ready(function() {
    		var operForm = $("#operForm");
    		
    		$(".move").on("click", function(e) {
				e.preventDefault();
    			
				operForm.find("#bno").remove();
				operForm.attr("action", "/support/notice");
				operForm.submit();
    		});
    	});
    </script>
