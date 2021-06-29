<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui">
    <link rel="icon" type="image/x-icon" href="/images/layout/16xfavi.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/images/layout/256xfavi.ico">
    <link rel="shortcut icon" type="image/x-icon" href="/images/layout/16xfavi.ico">
    <link rel="apple-touch-icon" sizes="114x114" href="/images/layout/114xfavi.ico">
    <meta name="title" content="담터">
    <meta name="description" content="담터입니다">
    <meta name="keywords" content="양양시설관리사업소, 양양군, 문화시설, 체육시설, 예약">
    <meta name="author" content="주식회사 나모">
    <meta property="og:title" content="담터">
    <meta property="og:description" content="담터입니다">
    <meta property="og:url" content="PROJECT SITE URL">
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="담터">
    <meta property="og:image" content="/images/layout/16xfavi.ico">
    <!-- <meta name="_csrf" content="${_csrf.token}"/> -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
    <title>담터</title>
	<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
	<link href="${contextPath}/resources/css/common.css" rel="stylesheet" type="text/css" media="screen">
	<link href="${contextPath}/resources/css/layout.css" rel="stylesheet" type="text/css" media="screen">
	<link href="${contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
	<link href="${contextPath}/resources/css/sub.css" rel="stylesheet" type="text/css">
	<link href="${contextPath}/resources/css/datepicker.css" rel="stylesheet" type="text/css">
	<script src="${contextPath }/resources/js/libs/jquery-3.4.1.min.js"></script>
	<script src="${contextPath }/resources/js/libs/datepicker.js"></script>
	<script src="${contextPath }/resources/js/layout.js"></script>
	<script src="${contextPath }/resources/js/contents.js"></script>
	<script src="${contextPath }/resources/js/common.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
	    $(".gnb-list>li").mouseover(function() { 
	        $(this).addClass("active");
	        $(this).stop().children(".gnb-dep2-wrap").slideDown(); }); 
	        $(".gnb-list>li").mouseleave(function() {
	           $(this).removeClass("active");
	             $(this).children(".gnb-dep2-wrap").slideUp(); 
	       });
	   });
	
	
	</script>
<body>
	<div class="layout-skip"><a href="#container">본문바로가기</a></div>

    <!-- :: wrapper s :: -->
    <div class="wrapper">

        <!-- :: header s :: -->	
        <header class="header">
            <div class="header-wrap">
                <div class="header-container">
                    <div class="header-top">
                        <button type="button" class="mob-gnb-btn" title="모바일 메뉴">
                            <span class="ico"></span>
                        </button>
                        <h1 class="header-logo">
                            <a href="${contextPath }/main/main.do" class="header-logo-link"><img src="${contextPath}/resources/images/layout/header-logo.png" title="logo"><span class="opt-screen-out"></span></a>
                        </h1>
                        <div class="opt-mobile-tablet-hide">
                            <div class="header-etc">
                            <sec:authorize access="isAuthenticated()">
                                <a href="#"  class="header-etc-item" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
								<form id="logout-form" action='<c:url value='${contextPath}/logout'/>' method="POST">
								   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
								</form>
                            </sec:authorize>	
                            <sec:authorize access="isAnonymous()">
                            	<a href="#"  class="header-etc-item" onclick="document.getElementById('login-form').submit();">로그인</a>
								<form id="login-form" action='<c:url value='${contextPath}/member/myPage'/>'>
								   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
								</form>
                            </sec:authorize>
                            <sec:authorize access="isAuthenticated()">
                                <a href="${contextPath}/member/myPage" class="header-etc-item">마이페이지</a>
                            </sec:authorize>	
                            <sec:authorize access="isAnonymous()">
                                <a href="${contextPath}/member/join.do" class="header-etc-item">회원가입</a>
                            </sec:authorize>
                        	</div>
                       	</div>
                    </div>
        
                    <div class="gnb"> <div class="layout-skip"><a href="#container">본문바로가기</a></div>

        <!-- :: wrapper s :: -->
        <div class="wrapper">

            <!-- :: header s :: -->
            <header class="header">
                <div class="header-wrap">
                    <div class="header-container">
                        <div class="header-top">
                            <button type="button" class="mob-gnb-btn" title="모바일 메뉴">
                                <span class="ico"></span>
                            </button>
                            <h1 class="header-logo">
                                <a href="#lnk" class="header-logo-link"><img src="/images/layout/header-logo.png" title="logo"><span class="opt-screen-out"></span></a>
                            </h1>
                            <div class="opt-mobile-tablet-hide">
                                <div class="header-etc">
                                    <a href="#lnk" class="header-etc-item">로그인</a>
                                    <a href="#lnk" class="header-etc-item">회원가입</a>                           
                                </div>
                            </div>
                        </div>
            
                        <div class="gnb">
                            <nav class="gnb-wrap">
                                <ul class="gnb-lst opt-clearfix">
                                    <li class="">
                                        <a href="">이용정보</a>
                                            <div class="gnb-dep2-wrap">
                                                <ul class="gnb-dep2-lst">
                                                    <li>
                                                        <a href="#lnk">인사말</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=6fff31d8331c428691a8e8027e03340f">연혁</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=a30e23881dc0439ca14bef032ddeab0c">조직도</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=e7d982670af0449fb8c8d9e4933197b5">임원현황</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=cffb9faeda9146d6aef3f4e6ad9282b9">직원현황</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=0ef2bc37e7b04fda9dbe43f0a91e78fd">회원종목단체</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=435b0bfe498b46ba87247c92c81cdc98">규약 및 규정</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=dbd22a198f164e4490bbde5c65cc84de">찾아오시는 길</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="">
                                            <a href="#lnk">어트랙션</a>
                                            <div class="gnb-dep2-wrap">
                                                <ul class="gnb-dep2-lst">
                                                    <li>
                                                        <a href="/contents.do?cid=8d968e6596d64e03b55fdc267fe1f7e1">주요기능</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=6c4cb43c7aa44667a7a2ced05a64ab86">대회정보</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="">
                                            <a href="/contents.do?cid=e501f7e1f00a42c2ab0ce54842d966ad">할인 & 이벤트</a>
                                            <div class="gnb-dep2-wrap">
                                                <ul class="gnb-dep2-lst">
                                                    <li>
                                                        <a href="/contents.do?cid=e501f7e1f00a42c2ab0ce54842d966ad">주요기능</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=2be40360937842ba8ba81c2973664e1f">대회정보</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=93f51952b5a74a75bb56d038ad009224">생활체육 영상</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="">
                                            <a href="#">고객지원</a>
                                            <div class="gnb-dep2-wrap">
                                                <ul class="gnb-dep2-lst">
                                                    <li>
                                                        <a href="/contents.do?cid=c2e785b816b646afb25dccfd8ac97e5a">여성 생활체육 교실사업</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=d12f41a6e1c04cfaa0bf61d6da6a16fd">다문화 생활체육 교실사업</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=bc4b8bc8ab9943c3a1f5d8d37adcadd7">어르신 생활체육 교실사업</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=fd708cae287d4bde8258356467048bce">생활체육 교실사업</a>
                                                    </li>
                                                    <li>
                                                        <a href="/contents.do?cid=81cacafc41e748be9d0ba953efd41eb8">스포츠클럽 리그제</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                        <li>
                                            <a href="#lnk" style="font-weight: 600;">예매 & 예약</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <!--<div class="gnb-dimed"></div>-->
                        </div>
                    </div>
                </div>
            </header>
                        <nav class="gnb-wrap">
                            <ul class="gnb-list opt-clearfix">
                                <li>
                                    <a href="#lnk">회사소개</a>
                                    <div class="gnb-dep2-wrap">
                                        <ul class="gnb-dep2-list">
                                            <li><a href="${contextPath }/company/damtuh.do">인사말</a></li>
                                            <li><a href="${contextPath }/company/ideology.do">경영이념</a></li>
                                            <li><a href="${contextPath }/company/ci.do">CI</a></li>
                                            <li><a href="${contextPath }/company/history.do">회사 연혁</a></li>
                                            <li><a href="#lnk">작업공정</a></li>
                                            <li><a href="#lnk">세계속의 담터</a></li>
                                            <li><a href="#lnk">찾아오시는 길</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="${contextPath }/product/productList.do">제품구매 </a>
                                </li>
                                <li>
                                    <a href="#lnk">차 이야기 </a>
                                    <div class="gnb-dep2-wrap">
                                        <ul class="gnb-dep2-list">
                                            <li><a href="${contextPath }/chaStory/origin.do">차의 기원</a></li>
                                            <li><a href="${contextPath }/chaStory/kind.do">차의 종류</a></li>
                                            <li><a href="#lnk">직원소개</a></li>
                                            <li><a href="#lnk">오시는 길</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li>
                                    <a href="#lnk">고객지원</a>
                                    <div class="gnb-dep2-wrap">
                                        <ul class="gnb-dep2-list">
                                            <li><a href="${contextPath }/support/notice.do">담터소식</a></li>
                                            <li><a href="#lnk">주요업무</a></li>
                                            <li><a href="#lnk">직원소개</a></li>
                                            <li><a href="#lnk">오시는 길</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        
      
</body>
</html>