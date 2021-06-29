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
                    <form id="write-form" action="/support/noticeConfirm" method="post">
                    	<div class="contents-box">
                        <div class="board-view">
                            <div class="board-view-header">
                                <p class="tit"><input type="text" name="title"><c:out value="${notice.title}"/></p>
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
                                <textarea id="editor" cols="30" rows="10"><c:out value="${ notice.content}"/></textarea>
                            </div>
                     
                        </div>
                        <div class="btn-list">
                            <button type="submit" class="move btn-green" href="#lnk">글 수정하기</a>
                        </div>

                    </div>
                    </form>
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



