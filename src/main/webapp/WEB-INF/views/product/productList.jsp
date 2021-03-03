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
                    <div class="item-lst">
                        <div class="tab">
                            <ul class="tab-menu opt-clearfix">
                                <li class="active" data-tab="tab1"><a href="#lnk">분말차</a></li>
                                <li data-tab="tab2"><a href="#lnk">액상과실차</a></li>
                                <li data-tab="tab3"><a href="#lnk">전통차</a></li>
                                <li data-tab="tab4"><a href="#lnk">침출차</a></li>
                                <li data-tab="tab5"><a href="#lnk">선물세트</a></li>
                                <li data-tab="tab6"><a href="#lnk">아이스티</a></li>
                                <li data-tab="tab7"><a href="#lnk">핫초코</a></li>
                                <li data-tab="tab8"><a href="#lnk">기타 분말음료</a></li>
                                <li data-tab="tab9"><a href="#lnk">퓨전음료류</a></li>
                                <li data-tab="tab10"><a href="#lnk">요거티</a></li>
                            </ul>
                        </div>
                        <div class="tab-cont">
                            <div class="tab-content tab1 active">
                                <select>
                                    <option value="1">높은가격순</option>
                                    <option value="2">낮은가격순</option>
                                    <option value="3">판매순</option>
                                    <option value="4">최신순</option>
                                </select>
                                <div class="buy-box">
                                    <div class="buy-cont">
                                        <ul class="buy-lst opt-clearfix">
                                            <li>
                                                <div>
                                                    <div class="item-box">
                                                        <div class="img-box">
                                                            <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item1.jpg" alt=""></a>
                                                            <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                        </div>
                                                        <div class="txt-box">
                                                            <p class="title">호두아몬드율무차 티백(80T)</p>
                                                            <p class="price"><span class="bold">20,000</span>원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div>
                                                    <div class="item-box">
                                                        <div class="img-box">
                                                            <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item2.jpg" alt=""></a>
                                                            <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                        </div>
                                                        <div class="txt-box">
                                                            <p class="title">호두아몬드율무차 티백(50T)</p>
                                                            <p class="price"><span class="bold">20,000</span>원</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="item-box">
                                                    <div class="img-box">
                                                        <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item3.jpg" alt=""></a>
                                                        <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                    </div>
                                                    <div class="txt-box">
                                                        <p class="title">호두아몬드율무차 티백(50T)</p>
                                                        <p class="price"><span class="bold">20,000</span>원</p>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <ul class="buy-lst opt-clearfix">
                                            <li>
                                                <div class="item-box">
                                                    <div class="img-box">
                                                        <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item4.jpg" alt=""></a>
                                                        <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                    </div>
                                                    <div class="txt-box">
                                                        <p class="title">호두아몬드율무차 티백(50T)</p>
                                                        <p class="price"><span class="bold">20,000</span>원</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="item-box">
                                                    <div class="img-box">
                                                        <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item3.jpg" alt=""></a>
                                                        <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                    </div>
                                                    <div class="txt-box">
                                                        <p class="title">호두아몬드율무차 티백(50T)</p>
                                                        <p class="price"><span class="bold">20,000</span>원</p>
                                                    </div>
                                                </div>
                                            </li>
                                            <li><div>ddd</div></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="tab-content tab2">
                        <select>
                            <option value="1">높은가격순</option>
                        </select>
                        <div class="buy-box">
                            <div class="buy-cont">
                                <ul class="buy-lst opt-clearfix">
                                    <li>
                                        <div>
                                            <div class="item-box">
                                                <div class="img-box">
                                                    <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item1.jpg" alt=""></a>
                                                    <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                </div>
                                                <div class="txt-box">
                                                    <p class="title">호두아몬드율무차 티백(80T)</p>
                                                    <p class="price"><span class="bold">20,000</span>원</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <div class="item-box">
                                                <div class="img-box">
                                                    <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item2.jpg" alt=""></a>
                                                    <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                                </div>
                                                <div class="txt-box">
                                                    <p class="title">호두아몬드율무차 티백(50T)</p>
                                                    <p class="price"><span class="bold">20,000</span>원</p>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <div class="img-box">
                                                <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item3.jpg" alt=""></a>
                                                <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                            </div>
                                            <div class="txt-box">
                                                <p class="title">호두아몬드율무차 티백(50T)</p>
                                                <p class="price"><span class="bold">20,000</span>원</p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="buy-lst opt-clearfix">
                                    <li>
                                        <div class="item-box">
                                            <div class="img-box">
                                                <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item4.jpg" alt=""></a>
                                                <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                            </div>
                                            <div class="txt-box">
                                                <p class="title">호두아몬드율무차 티백(50T)</p>
                                                <p class="price"><span class="bold">20,000</span>원</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <div class="img-box">
                                                <a href="#lnk"><img class="item-img" src="${contextPath }/resources/images/sub/item3.jpg" alt=""></a>
                                                <a href="#lnk" class="like"><img src="${contextPath }/resources/images/sub/like.png" alt=""></a>
                                            </div>
                                            <div class="txt-box">
                                                <p class="title">호두아몬드율무차 티백(50T)</p>
                                                <p class="price"><span class="bold">20,000</span>원</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li><div>ddd</div></li>
                                </ul>
                            </div>
                        </div>
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