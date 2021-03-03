<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"	isELIgnored="false"
	%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  


<!-- :: main contents s :: -->
<div class="main-wrapper">

    <div class="main-visual">
        <div class="main-visual-box opt-clearfix main-visual-col">

                <div class="main-visual-item">
                    <div class="main-visual-txt">
                        <span class="tit">건강한 삶을 위한<br>차 한잔의 여유</span>
                        <p class="desc">담터와 함께 건강하고 행복한 삶을 시작하세요.</p>
                    </div>
                </div>
        </div>
    </div>

    <div class="main-story">
        <div class="main-story-box">
            <div class="story-cont opt-clearfix">
                <div class="story-box">
                    <p class="tit">율무차<br>품질 업그레이드</p>
                    <p class="desc">잣보다 보존성이 높은 호두, 아몬드를 이용해<br>
                        품질상의 업그레이드를 이뤘습니다.</p>
                </div>
                <div class="story-box">
                    <p class="tit">고객중심<br>
                        고객섬김을 통한 가치창출</p>
                    <p class="desc">정직과 신뢰를 바탕으로<Br>
                        고객을 섬깁니다.</p>
                </div>
                <div class="story-box">
                    <p class="tit">세계속의<br> 담터</p>
                    <p class="desc">중국, 미국, 홍콩 등 세계속에서<br>
                        담터를 만나실 수 있습니다.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="main-best">
        <div class="cont-container">
            <h2 class="tit-h2">베스트 상품</h2>
           <div class="main-best-box opt-clearfix">
               <div class="best-cont">
                    <div class="best-img gold">
                        <img src="${contextPath}/resources/images/main/gold-img.png" alt="1등 상품">
                    </div>
                    <div class="best-txt">
                        <p class="tit">담터 호두아몬드 율무차[18g*80포]</p>
                        <p class="pre-price">26,000원</p>
                        <p class="now-price">22,700원</p>
                        <button class="buy-btn" type="button">구매하러 가기</button>
                    </div>
               </div>
               <div class="best-cont">
                    <div class="best-img silver">
                        <img src="${contextPath}/resources/images/main/silver-img.png" alt="1등 상품">
                    </div>
                    <div class="best-txt">
                        <p class="tit">담터 호두아몬드 율무차[18g*80포]</p>
                        <p class="pre-price">26,000원</p>
                        <p class="now-price">22,700원</p>
                        <button class="buy-btn" type="button">구매하러 가기</button>
                    </div>
                </div>
                <div class="best-cont">
                    <div class="best-img bronze">
                        <img src="${contextPath}/resources/images/main/bronze-img.png" alt="1등 상품">
                    </div>
                    <div class="best-txt">
                        <p class="tit">담터 호두아몬드 율무차[18g*80포]</p>
                        <p class="pre-price">26,000원</p>
                        <p class="now-price">22,700원</p>
                        <button class="buy-btn" type="button">구매하러 가기</button>
                    </div>
                </div>
           </div>
        </div>
    </div>

    <div class="main-banner">
        <img src="${contextPath}/resources/images/main/banner.jpg" alt="메인 배너">
    </div>

    <div class="main-info opt-clearfix">
        <div class="cont-container">
            <div class="main-info-col">
                <div class="main-info-box">
                    <p class="tit">담터 소식</p>
                    <span class="more">더보기</span>
                    <div class="info-box">
                        <div class="notice-banner">
                            <img src="${contextPath}/resources/images/main/notice-banner.jpg" alt="공지사항 배너">
                            <ul class="notice-lst">
                                <li class="opt-clearfix"><span class="notice-tit main-tit">공지사항입니다</span><span class="notice-date">2020-12-24</span></li>
                                <li class="opt-clearfix"><span class="notice-tit">공지사항입니다</span><span class="notice-date">2020-12-24</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="quick-box">
                        <ul class="quick-lst opt-clearfix">
                            <li>
                                <div class="quick-cont">
                                    <a href="#lnk"><img src="${contextPath}/resources/images/main/quick1.png" alt=""></a>
                                    <p>1899-3931<br><span>(09~18)</span></p>
                                </div>
                            </li>
                            <li>
                                <div class="quick-cont">
                                    <a href="#lnk"><img src="${contextPath}/resources/images/main/quick2.png" alt=""></a>
                                    <p>FAQ</p>
                                </div>
                            </li>
                            <li>
                                <div class="quick-cont">
                                    <a href="#lnk"><img src="${contextPath}/resources/images/main/quick3.png" alt=""></a>
                                    <p>오시는 길</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="main-info-col">
                <div class="main-info-box">
                    <p class="tit">매장 안내</p>
                    <span class="more">더보기</span>
                    <div class="info-box">
                        <ul class="store-cont opt-clearfix">
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store1.png" alt="">
                                    </a>
                                    <p>GS25</p>
                                </div>
                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store2.png" alt="">
                                    </a>
                                    <p>농협 하나로마트</p>
                                </div>
                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store3.png" alt="">
                                    </a>
                                    <p>이마트</p>
                                </div>
                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store4.png" alt="">
                                    </a>
                                    <p>홈플러스</p>
                                </div>                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store5.png" alt="">
                                    </a>
                                    <p>롯데마트</p>
                                </div>                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store6.png" alt="">
                                    </a>
                                    <p>지마켓</p>
                                </div>                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store7.png" alt="">
                                    </a>
                                    <p>옥션</p>
                                </div>                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store8.png" alt="">
                                    </a>
                                    <p>미니스톱</p>
                                </div>      
                            </li>
                            <li>
                                <div class="store-box">
                                    <a href="#lnk">
                                        <img src="${contextPath}/resources/images/main/store9.png" alt="">
                                    </a>
                                    <p>세븐일레븐</p>
                                </div>      
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- :: main contents e :: -->
