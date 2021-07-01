<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <div class="kind-box">
                        <div class="tab">
                            <ul class="tab-menu opt-clearfix">
                                <li class="active" data-tab="tab1"><a href="#lnk">전통차</a></li>
                                <li data-tab="tab2"><a href="#lnk">녹차</a></li>
                                <li data-tab="tab3"><a href="#lnk">우롱차</a></li>
                                <li data-tab="tab4"><a href="#lnk">홍차</a></li>
                                <li data-tab="tab5"><a href="#lnk">보이차</a></li>
                                <li data-tab="tab6"><a href="#lnk">가루차</a></li>
                            </ul>
                        </div>
                        <div class="tab-cont">
                            <div class="tab-content tab1 active">
                                <h3 class="basic-h3">전통차</h3>
                                <p class="txt">
                                    우리나라에는 많은 종류의 전통차가 있습니다. 전통차는 식물의 가식부를 이용해 만드는 것이 일반적입니다.
                                </p>
                                <div class="desc-box">
                                    <p class="basic-tit">열매를 원료로한 차</p>
                                    <p class="desc">
                                        결명자차, 구기자차, 귤차, 대추차, 들깨자, 매실차, 모과차, 밤차, 보리차, 산사차, 살구차, 연자차, 오디차, 오미자차, 옥수수차, 유자차, 율무차, 은행차, 포도차, 현미차, 호두차, 회향차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">잎을 원료로한 차</p>
                                    <p class="desc">
                                        감잎차, 국화차, 녹차, 두충차, 비파차, 삼백초자, 솔잎차, 쑥차, 오가차, 으름차, 인동차, 진달래차, 초피차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">뿌리를 원료로한 차</p>
                                    <p class="desc">
                                        감잎차, 국화차, 녹차, 두충차, 비파차, 삼백초자, 솔잎차, 쑥차, 오가차, 으름차, 인동차, 진달래차, 초피차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">껍질을 원료로한 차</p>
                                    <p class="desc">
                                        감잎차, 국화차, 녹차, 두충차, 비파차, 삼백초자, 솔잎차, 쑥차, 오가차, 으름차, 인동차, 진달래차, 초피차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">식물전체를 원료로한 차</p>
                                    <p class="desc">
                                        다시마차, 민들레차, 석곡차, 영지차, 음양곽차, 표고버섯차, 화살차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">꽃잎을 원료로한 차</p>
                                    <p class="desc">
                                        국화차, 벚꽃차
                                    </p>
                                </div>
                                <div class="desc-box">
                                    <p class="basic-tit">기타재료를 원료로한 차</p>
                                    <p class="desc">
                                        쌍화차, 꿀차
                                    </p>
                                </div>
                            </div>
                            <div class="tab-content tab2">
                                <h3 class="basic-h3">녹차</h3>
                                <p class="basic-tit">
                                    발효하지 않은 차
                                </p>
                                <p class="desc">
                                    차는 4월 20일 곡우 때부터 차의 여린 잎을 따서 무쇠나 돌솥에 덖거나 쪄서 산화효소 활동을 볶지시킨 것을 말합니다. 덖음차는 부차라 하고 찐차를 증제차라 합니다. 덖음차는 숭늉처럼 구수한 맛을 내고 차색이 녹황색이 되며 차잎은 둥글게 말려져 있습니다. 증제차는 차잎을 100℃ 정도의 수증기로 30~40초 정도 쪄내기 때문에 푸른 녹색을 그대로 지니고 있으며 차잎의 모양은 침상형으로 되어 있습니다.<br><br>
                                    우리 국민은 주로 덖음차를 제조하여 마셨고, 일본인들은 담백하고 연한 맛이 나는 증제차를 즐겨 마십니다.
                                </p>
                            </div>
                            <div class="tab-content tab3">
                                <h3 class="basic-h3">우롱차</h3>
                                <p class="basic-tit">
                                    반 발효차
                                </p>
                                <p class="desc">
                                    중국차의 대명사라 할 수 있는 오룡o철관음o청차o쟈스민차 등은 10~70% 발효시킨 것입니다. 우려진 차색은 황록색과 적황색이 됩니다.<br><bR>
                                    차향을 돋우기 위해 마른 꽃잎을 섞은 향차가 있는데 그 대표적인 차가 중국음식집에서 흔히 맛볼 수 있는 쟈스민차입니다.
                                </p>
                            </div>
                            <div class="tab-content tab4">
                                <h3 class="basic-h3">홍차</h3>
                                <p class="txt">
                                    홍차는 차잎을 85%이상 발효시킨 것입니다. 홍차는 차 소비량의 75%를 차지합니다. 인도 o 스리랑카 o 중국 o 케냐 o 인도네시아가 주생산국이며 영국인들이 즐겨 마십니다.
인도 히말라야 산맥 고지대인 다즐링 지역에서 생산된 다즐링, 중국 안휘성의 기문에서 생산되는 기문, 스리랑카의 중부 산악지대인 우바에서 생산되는 우바 홍차가 세계 3대 명차로 꼽힙니다. 차색은 잎차의 크기에 따라 붉은 오렌지색을 띠우기도 하고 흑색을 띤 홍갈색도 납니다. 오렌지 색을 띠는 차가 고급차라고 볼 수 있습니다.
                                </p>
                                <div class="desc-box">
                                    <p class="basic-tit">홍차의 종류(원산지 별)</p>
                                    <ul class="desc">
                                        <li class="desc-lst">
                                            <span class="bold">다즐링 (Darjeeling) 차</span>
                                            <p>
                                                다즐링은 히말라야 고지에서 생산되는 차잎입니다. 붉은 색이 진하며 향이 깊어 매우 높이 평가하지만 생산량이 적어서 대부분 다른 차잎과 브랜드해서 사용합니다. 홍차의 샴페인이라고 불립니다. 좋은 다즐링에서는 와인향이 난다고 합니다. 실제로 100% 다즐링을 구하기는 매우 어렵습니다. 일반 홍차와는 다른 분류법을 사용하며, 수확된 시기에 따라서 First Flush(3,4월 수확), Second Flush(5,6월 수확), Autumnal Flush(10월 이후)로 나뉘며 시기에 따라서 맛과 향에 차이가 있습니다
                                            </p>
                                        </li>
                                        <li class="desc-lst">
                                            <span class="bold">실론 (Ceylon) 차</span>
                                            <p>
                                                스리랑카의 실론섬에서 나는 차를 실론티 라고 합니다. Kanday(칸디), Uva(우바), Dimbula(딤불라), Nuwara Eliya(누와라 엘리야) 등의 여러 차종이 생산되며 특히 실론티 중의 실론티 라는 Uva(우바)차는 세계 3대 홍차중의 하나로 은은한 장미향을 띄고 있어 애호가들의 절대적인 사랑을 받고 있는 홍차 입니다.
                                            </p>
                                        </li>
                                        <li class="desc-lst">
                                            <span class="bold">기문(keemun)홍차</span>
                                            <p>
                                                난초의 꽃의 향기를 안에 포함하고, 기품이 있는 깊은 맛을 가지고 있는 홍차로서 정통기문홍차의 대부분은 수작업 중심의 정교한 제차 방법으로 비용이 매우 들고, 대량생산을 할 수 없기 때문에 일반 시장에 유통하는 것이 거의 없습니다. 그 때문에 정통기문홍차의 맛과 향기는 유럽, 특히 영국에서는 왕실에서「명차중의 명차」라고 불리며 사랑받고 있습니다.
                                            </p>
                                        </li>
                                        <li class="desc-lst">
                                            <span class="bold">아삼(Assam) 차</span>
                                            <p>
                                                인도북동부의 아삼지방의 정글지역에서 생산되는 부드럽고 달콤한 홍차입니다. 주로 밀크티로 마십니다. 아이리쉬 브랙퍼스트 등의 기본 차잎으로 쓰입니다.
                                            </p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content tab5">
                                <h3 class="basic-h3">보이차</h3>
                                <p class="basic-tit">
                                    후발효차
                                </p>
                                <p class="desc">
                                    차를 만들어 완전히 건조되기 전에 곰팡이가 번식하도록 해 곰팡이에 의해 자연히 후발효가 일어나도록 만든 차입니다.<br>
                                    잎차로 보관하는 것보다 덩어리로 만든 고형차는 저장기간이 오래 될수록 고급차로 쳐줍니다.
                                    차색은 등황색과 흑갈색을 띱니다.
                                </p>
                            </div>
                            <div class="tab-content tab6">
                                <h3 class="basic-h3">가루차</h3>
                                <p class="basic-tit">
                                    가루차는 이름 그대로 차잎을 말려 가루로 만든 것입니다.
                                </p>
                                <p class="desc">
                                    일본 사람들이 손님 접대용으로 의식차로 세계에 내놓은 차가 가루차(말차) 입니다.<br>
가루차를 만들기 위한 차는 푸른 녹색의 차색을 유지하기 위해 차나무를 키울 때 부터 그늘을 만들어준다고 합니다.
                                </p>
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