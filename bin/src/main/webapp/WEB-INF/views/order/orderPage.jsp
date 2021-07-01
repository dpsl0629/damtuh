<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                    <div class="buyDetail-box">
                    <form id="orderConfirm" action="/order/orderConfirm">
                        <div class="buyDetail-top">
			                <sec:authentication property="principal.username" var="currentUserName"/>
							<div class="id">${currentUserName}</div>
                            <table class="buyDetail-tbl basic-tbl">
                                <caption>상품 리스트</caption>
                                <colgroup>
                                    <col style="width: 20%">
                                    <col style="width: 30%">
                                    <col style="width: 10%">
                                    <col style="width: 20%">
                                    <col style="width: 10%">
                                    <col style="width: 20%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th colspan="2">상품/옵션 정보</th>
                                        <th>수량</th>
                                        <th>합계금액</th>
                                        <th>적립</th>
                                        <th>배송비</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="img"><img src="${contextPath }/thumbnails.do?fileName=${product2.productImage}"/></td>
                                        <td class="tit">${product2.productName }</td>
                                        <td>${product2.quantity }</td>
                                        <td class="total-price">${product2.totalPrice }</td>
                                        <td>${product2.point }</td>
                                        <td class="delivery">${product2.delivery }</d>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="buyDetail-middle">
                        <input type="checkbox" id="all-check"> <label for="all-check" style="font-weight: 600; color: #000; margin-left: 10px; font-size: 15px;">담터의 모든 약관을 확인 하고 전체 동의 합니다. (전체 동의에 선택항목도 포함됩니다.)</label>
                            <div class="agree-box">
                                <p class="tit">비회원 주문에 대한 개인정보 수집 이용 동의</p>
                                <div class="agree-cont">
                                    회사는 회원가입, 민원 등 고객상담 처리, 본인확인(14세 미만 아동 확인) 등 의사소통을 위한 정보 활용 및 이벤트 등과 같은 마케팅용도 활용, 회원의 서비스 이용에 대한 통계, 이용자들의 개인정보를 통한 서비스 개발을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                                    <br><br>
                                - 수집항목: 구매자정보(이름,전화번호,휴대폰번호,이메일), 상품 구매/취소/반품/교환/환불 정보, 수령인 정보(이름, 주소, 전화번호, 휴대폰번호) 비회원 비밀번호
                                - 수집/이용목적: 서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 불만처리 등 민원처리, 회원관리 등을 위한 목적
                                - 이용기간: 개인정보 수집 및 이용목적 달성 시 까지
                                <br><br>
                                원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
                                단, 관계법령의 규정에 의하여 보전할 필요가 있는 경우 일정기간 동안 개인정보를 보관할 수 있습니다.
                                그 밖의 사항은 (주) 000 개인정보처리방침을 준수합니다.
                                </div>
                                <input type="checkbox" id="agree-ico1"><label for="agree-ico1"><span style="color:#f00; font-weight: 600;">(필수)</span> 비회원 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의 합니다.</label>
                            </div>
                            <div class="agree-box">
                                <p class="tit">이용약관 동의</p>
                            <div class="agree-cont">
                                            제1조(목적)
                                <br><br>
                            표준약관 제10023호
                            <br>
                            이 약관은 주식회사 에넥스가 운영하는 사이트(www.enex.co.kr 이하 "에넥스)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
                            ※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」
                            <br><br>
        
                            제2조(정의)
                            <br>
                            ① 에넥스란 주식회사 에넥스가 재화 또는 용역(이하 '재화등’이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 ‘재화등’을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 에넥스을 운영하는 사업자의 의미로도 사용합니다.<br>
                            ② ‘마일리지’란 다양한 할인 혜택 및 재구매에 따른 할인 혜택 서비스를 강화하기 위하여 주식회사 에넥스가 제공하는 일종의 포인트를 말합니다.<br>
                            ③ '이용자'란 에넥스'에 접속하여 이 약관에 따라 '에넥스'가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
                            ④ "서비스"란 이 약관 제4조에 정한 대로 에넥스 사이트를 이용하는 이용자에게, 무료 또는 유료로 제공하는 행위 또는 그 행위의 대상인 유•무형의 물건 자체를 의미합니다.<br>
                            ⑤ '회원'이라 함은 에넥스에 개인정보를 제공하여 회원등록을 한 자로서, 에넥스의 정보를 지속적으로 제공받으며, 에넥스가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.<br>
                            ⑥ '비회원'이라 함은 회원에 가입하지 않고 에넥스가 제공하는 서비스를 이용하는 자를 말합니다.
                            <br>
                            <br>
                            제3조(약관등의 명시와 설명 및 개정)
                            <br>
                            ① 에넥스는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 쉽게 알 수 있도록 에넥스의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
                            ② 에넥스는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회ㆍ배송책임ㆍ환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
                            ③ 에넥스는 전자상거래 등에서의 소비자보호에관한법률, 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 개인정보보호법, 방문판매등에관한법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
                            ④ 에넥스는 약관을 개정할 경우에는 적용일자 및 개정사유 명시하여 현행약관과 함께 에넥스의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 에넥스는 개정전과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
                            ⑤ 에넥스는 약관을 개정할 경우에는 그 개정약관은 그 적용 일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 에넥스에 송신하여 에넥스의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
                            ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계 법령 또는 상관례에 따릅니다.<br>
                            <br><br>
        
                            제4조(서비스의 제공 및 변경)
                            <br>
                            ① 에넥스는 다음과 같은 업무를 수행합니다.<Br>
                            1. ‘재화등’ 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>
                            2. 구매계약이 체결된 재화 또는 용역의 배송<br>
                            3. 광고, 이벤트 행사 등 상품 또는 용역과 관련한 다양한 판촉 행위<br>
                            4. 기타 이용자에게 유용한 부가 서비스 및 에넥스가 정하는 업무<br>
                            ② 에넥스가 ‘재화등’의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화•용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화•용역의 내용 및 제공일자를 명시하여 현재의 재화•용역의 내용을 게시한 곳에 즉시 공지합니다.<br>
                            ③ 에넥스가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 ‘재화등’의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>
                            ④ 전항의 경우 에넥스의 고의 또는 과실이 있는 경우에 한하여, 에넥스가 이용자의 손해를 배상합니다.
                            <br><br>
                            제5조(서비스의 중단)
                            <br>
                            ① 에넥스는 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>
                            ② 에넥스는 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 에넥스는 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>
                            ③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 에넥스는 제8조에 정한 방법으로 이용자에게 통지하고 당초 에넥스에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, 에넥스가 보상기준을 고려하지 아니한 경우에는 이용자들의 ‘마일리지’ 등을 에넥스에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br>
                            <br><br>
                            제6조(회원가입)
                            <br>
                            ① 이용자는 에넥스가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>
                            ② 에넥스은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.<br>
                            1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 에넥스의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.<br>
                            2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
                            3. 기타 회원으로 등록하는 것이 에넥스의 기술상 현저히 지장이 있다고 판단되는 경우<br>
                            ③ 회원가입계약의 성립시기는 에넥스의 승낙이 회원에게 도달한 시점으로 합니다.<br>
                            ④ 회원은 제16조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 에넥스에 그 변경사항을 알려야 합니다.<br>
                            <br><br>
        
                            제7조(회원 탈퇴 및 자격 상실 등)
                            <br>
                            ① 회원은 에넥스에 언제든지 탈퇴를 요청할 수 있으며 에넥스는 즉시 회원탈퇴를 처리합니다.<br>
                            ② 회원이 다음 각 호의 사유에 해당하는 경우, 에넥스는 회원 자격을 제한 및 정지시킬 수 있습니다.<br>
                            1. 가입 신청 시에 허위 내용을 등록한 경우<br>
                            2. 에넥스를 이용하여 구입한 ‘재화등’의 대금, 기타 에넥스 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>
                            3. 다른 사람의 에넥스 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br>
                            4. 에넥스를 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>
                            ③ 에넥스가 회원 자격을 제한•정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 에넥스가 회원자격을 상실 시킬 수 있습니다.<br>
                            ④ 에넥스가 회원자격을 상실 시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br>
                            ⑤ 에넥스는 회원의 정보보호를 위해 회원이 1년 이상 로그인하지 않는 경우, 휴면 계정으로 전환하여 개인정보를 파기 또는 분리 보관하며, 휴면 계정 전환 후 5년 동안 로그인하지 않는 경우, 회원의 회원자격을 상실시킬 수 있습니다.<br>
                            <br><br>
        
                            제8조(회원에 대한 통지)
                            <br>
                            ① 에넥스가 회원에 대한 통지를 하는 경우, 회원이 에넥스와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>
                            ② 에넥스는 불특정다수 회원에 대한 통지의 경우 1주일이상 에넥스 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지합니다.<br>
        
                            <br><br>
                            제9조(구매신청)
                            <br>
                            에넥스 이용자는 에넥스 온라인몰 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, 에넥스 온라인몰 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<bR>
                            단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.<br>
                            1. 재화등의 검색 및 선택<br>
                            2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<bR>
                            3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인<bR>
                            4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)<br>
                            5. 재화등의 구매신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의<br>
                            6. 결제방법의 선택<br>
                            <br><br>
        
                            제10조 (계약의 성립)
                            <br>
                            ① 에넥스는 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>
                            1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>
                            2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>
                            3. 기타 구매신청에 승낙하는 것이 에넥스 기술상 현저히 지장이 있다고 판단하는 경우<br>
                            ② 에넥스의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>
                            ③ 에넥스의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능여부, 구매신청의 정정, 취소 등에 관한 정보 등을 포함하여야 합니다.<br>
                            <br><Br>
                            제11조(지급방법)<br>
                            에넥스 에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, 에넥스는 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br>
                            1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체<br>
                            2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<bR>
                            3. 온라인무통장입금<br>
                            4. 전자화폐에 의한 결제<br>
                            5. 수령시 대금지급<br>
                            6. 마일리지 등 에넥스가 지급한 포인트에 의한 결제<br>
                            7. 에넥스와 계약을 맺었거나 에넥스가 인정한 상품권에 의한 결제<br>
                            8. 기타 전자적 지급 방법에 의한 대금 지급 등<br>
        
                            <br><br>
                            제12조(수신확인통지·구매신청 변경 및 취소)<br>
                            <br>
                            ① 에넥스는 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>
                            ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고, 에넥스는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만, 이미 대금을 지불한 경우에는 제16조의 청약철회 등에 관한 규정에 따릅니다.<br>
                            <br><br>
                            제13조(마일리지 등 제도 운영)<br>
                            <br>
                            ① 에넥스는 특정상품 또는 용역을 구입하거나 특정 결제수단으로 구입하는 고객에게 ‘마일리지’를 부여할 수 있습니다. 이러한 ‘마일리지’ 부여는 다음 각 호의 방법에 따르되, 그 구체적인 방법은 에넥스의 운영정책에 의합니다.’<br>
                            1. 에넥스는 ‘마일리지’ 부여를 안내한 상품이나 용역의 판매가에 대해 특정한 비율만큼 ‘마일리지’를 부여합니다.<br>
                            2. 에넥스는 ‘마일리지’ 부여를 안내한 상품이나 용역에 대해 당해 판매가에 상관없이 일정한 금액을 부여하는 방식으로 ‘마일리지’를 부여합니다.<br>
                            3. 회사의 운영정책에 따라 상품별 주문증가에 따른 추가 ‘마일리지’ 부여가 불가능 할 수 있고, ‘마일리지’ 사용가능 시점 및 ‘마일리지’의 분할사용가능 여부가 다를 수 있습니다.<br>
                            4. ‘마일리지’는 회사의 서비스제도로서 상품 구매시 현금가액과 동일하게 사용할 수 있으나 현금으로만 구매할 수 있도록 에넥스가 정해놓은 상품의 구매 시 사용할 수 없으며, 사용 후 현금으로는 환불되지 않습니다.<br>
                            5. 고객은 ‘마일리지’ 부여일로부터 24개월 이내에 그 ‘마일리지’를 전액 사용하여야 합니다. 단, ‘마일리지’ 부여시 ‘마일리지’ 사용기간에 대해 별도의 사전 고지 또는 특약이 있는 경우에는 그 사용기간 이내에 사용하여야 합니다. ‘마일리지’ 사용은 부여된 순서로 사용되며 사용기간 경과 후 잔여 ‘마일리지’가 있는 경우 그 ‘마일리지’는 자동적으로 소멸됩니다.<br>
                            6. ‘마일리지’는 고객에게 선택권을 부여하여 즉시할인을 받을 수도 있으며, 즉시할인율은 적립율보다는 작습니다.<br>
                            7. ‘마일리지’는 잔여 포인트가 100 포인트 이상일 경우 사용하실 수 있습니다. 100원 단위로 사용가능 합니다.<br>
                            ② 운영정책은 별도 고지하며, 회사의 사정에 따라 수시로 변경될 수 있습니다.<br>
                            ③ 경품은 추첨일 또는 고객 고지일로부터 90일 이내에 청구하여야 합니다. 단, 경품가액이 5만원 이상인 경우 제세공과금을 사전에 납부하여야 합니다.<br>
                            <br>
                            제14조(‘재화등’의 공급)
                            <br><br>
                            ① 에넥스는 이용자와 ‘재화등’의 공급시기에 관하여 별도의 약정이 없는 이상 이용자가 청약을 한 날로부터 7일 이내에 ‘재화등’을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취하며, 이때 에넥스는 이용자가 ‘재화등’의 공급절차 및 진행사항을 확인할 수 있도록 적절한 조치를 합니다. 단, 주문제작(시스템주방 포함) 등의 구매에 관한 계약을 체결한 경우 에넥스는 별도 고지를 통해 ‘재화등’을 배송할 수 있습니다.<br>
                            ② 에넥스는 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 에넥스가 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만, 에넥스가 고의ㆍ과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br>
                            ③ 에넥스와 소비자간에 상품의 인도시기 또는 용역의 제공시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이 이 약관에 우선합니다.<br>
                            <br><br>
                            제15조(환급)
                            <br>
                            에넥스는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br>
                            <br><br>
                            제16조(청약철회 등)
                            <br>
                            ① 에넥스와 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. 단, 주문제작(시스템주방 포함), 실측을 통한 구매 등의 관한 주문 계약을 체결한 이용자는 아래의 기준에 의거하여 청약을 철회 할 수 있으며, 청약 철회의 효과는 다음과 같습니다.<br>
                            <br>
                            ② 이용자는 '재화등'을 배송을 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. 단, 주문제작(시스템주방 포함)의 경우에는 당사의 고의 또는 과실이 아닌 경우에는 교환 또는 환불이 불가하다.<br>
                            1. 이용자에게 책임 있는 사유로 '재화등'이 멸실 또는 훼손된 경우(다만, '재화등'의 내용 확인을 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)<br>
                            2. 이용자의 사용 또는 일부 소비에 의하여 '재화등'의 가치가 현저히 감소한 경우<br>
                            3. 시간의 경과에 의하여 재판매가 곤란할 정도로 '재화등'의 가치가 현저히 감소한 경우<br>
                            4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>
                            ③ 제2항 제2호 내지 제4호의 경우에 에넥스가 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>
                            ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시ㆍ광고 내용과 다르거나, 계약내용과 다르게 이행된 경우에는 당해 재화 등을 공급받은 날로부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회 등을 할 수 있습니다.<br>
                            <br><br>
                            제17조(청약철회 등의 효과)
                            <br>
                            ① 에넥스는 본 약관 제16조에 따라 청약철회가 있은 후 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 에넥스가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.<br>
                            <br>
                            ② 에넥스가 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>
                            <br>
                            ③ 청약철회등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. 에넥스는 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 ‘재화등’의 내용이 표시•광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 ‘재화등’의 반환에 필요한 비용은 에넥스가 부담합니다.<br>
                            <br>
                            ④ 이용자가 ‘재화등’을 제공받을 때 발송비를 부담한 경우에 에넥스는 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br>
                            <br><br>
                            제18조(개인정보보호)
                            <br>
                            ① 에넥스는 이용자의 개인정보수집 시 서비스제공을 위하여 필요한 최소한의 개인정보를 수집합니다.<br>
                            ② 에넥스는 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br>
                            ③ 에넥스는 이용자의 개인정보를 수집ㆍ이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br>
                            ④ 에넥스는 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용ㆍ제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br>
                            ⑤ 에넥스가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련 사항(제공 받는 자, 제공목적 및 제공할 정보의 내용) 등 개인정보보호법 제15조가 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br>
                            ⑥ 이용자는 언제든지 에넥스가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 에넥스는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에 에넥스는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>
                            ⑦ 에넥스는 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인 정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br>
                            ⑧ 에넥스 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br>
                            ⑨ 기타 개인정보 취급과 관련한 내용은 '개인정보취급방침'에 고지하고 있으며 약관과 별도의 동의를 얻습니다.<br>
                            <br><br>
                            제19조(에넥스의 의무)
                            <br>
                            ① 에넥스는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화•용역을 제공하는 데 최선을 다하여야 합니다.<br>
                            ② 에넥스는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>
                            ③ 에넥스가 상품이나 용역에 대하여 「표시•광고의공정화에관한법률」제3조 소정의 부당한 표시•광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br>
                            ④ 에넥스가 이용자가 원하지 않는 영리목적의 광고성 전자 우편을 발송하지 않습니다.<br>
                            <br><br>
                            제20조(회원의 ID 및 비밀번호에 대한 의무)
                            <br>
                            ① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>
                            ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>
                            ③ 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 에넥스에 통보하고 에넥스의 안내가 있는 경우에는 그에 따라야 합니다.<br>
                            <br><br>
                            제21조(이용자의 의무)
                            <br>
                            이용자는 다음 행위를 하여서는 안됩니다.<Br>
                            1. 신청 또는 변경 시 허위내용의 등록<br>
                            2. 타인의 정보 도용<br>
                            3. 에넥스에 게시된 정보의 변경<br>
                            4. 에넥스가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br>
                            5. 에넥스 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
                            6. 에넥스 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
                            7. 외설 또는 폭력적인 메시지•화상•음성 기타 공서양속에 반하는 정보를 에넥스에 공개 또는 게시하는 행위<br>
                            <br><br>
                            제22조(에넥스와 연결된 웹사이트의 관계)
                            <br>
                            ① 에넥스와 연결된 웹사이트란 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우를 말합니다.<br>
                            ② 에넥스와 연결된 웹사이트가 독자적으로 제공하는 ‘재화등’에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 에넥스의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.<br>
                            <br><br>
                            제23조(저작권의 귀속 및 이용제한)
                            <br>
                            ① 에넥스가 작성한 저작물에 대한 저작권 기타 지적재산권은 에넥스에 귀속합니다.<br>
                            ② 이용자는 에넥스를 이용함으로써 얻은 정보 중 에넥스에게 지적재산권이 귀속된 정보를 에넥스의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>
                            ③ 에넥스는 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br>
                            <br><br>
                            제24조(분쟁해결)
                            <br>
                            ① 에넥스는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치•운영합니다.<br>
                            ② 에넥스는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 줍니다.<br>
                            ③ 에넥스와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시ㆍ도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br>
                            <br><br>
                            제25조(재판권 및 준거법)
                            <br>
                            ① 에넥스와 이용자간에 발생한 전자거래 분쟁에 관한 소송은 제소당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
                            ② 에넥스와 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.<br>
                            ③ 에넥스와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시•도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br>
        
                            <br><br>
                            제26조 (대리행위 및 보증인의 부인)
                            <br>
                            ① 회사는 구매자와 판매자 간의 자유로운 상품의 거래를 위한 시스템을 운영 및 관리, 제공할 뿐이므로 구매자 또는 판매자를 대리하지 않으며, 회원 사이에 성립된 거래와 관련된 책임과 회원이 제공한 정보에 대한 책임은 해당 회원이 직접 부담하여야 합니다.<br>
                            ② 회사는 구매자와 판매자 간의 거래와 관련하여 판매의사 또는 구매의사의 존부 및 진정성, 등록 상품의 품질, 완전성, 안정성, 적법성 및 타인의 권리에 대한 비침해성, 구매자 또는 판매자가 입력하는 정보 및 그 정보를 통하여 링크된 URL에 게재된 자료의 진실성 또는 적법성 등 일체를 보증하지 않습니다. 다만, 등록된 상품 관련 정보가 법규 위반이나 저작권 침해가 명백한 경우, 또는 저작권 등 권리를 침해받았다고 주장하는 자가 그 침해의 정지ㆍ예방을 요청하는 경우 회사는 당사자간의 분쟁이 해결되어 권리관계가 명확해질 때까지 해당 상품에 대한 삭제, 수정 또는 미노출 처리할 수 있습니다.<br>
                            ③ 회사는 구매자와 판매자간의 거래의 안전성과 신뢰성을 높이는 도구만을 개발하여 제공합니다. 단, 회사가 판매하는 직매입 상품의 경우 구매자에 대하여 회사는 판매자의 지위를 갖게 됩니다.<br>
                            <br><br>
                            [부칙]
                            <br>
                            부칙(2021.01.01)
                            <br>
                            1. 이 약관은 2021년 01월 01일부터 시행됩니다.
                            </div>
                            <input type="checkbox" id="agree-ico2"><label for="agree-ico2"><span style="color:#f00; font-weight: 600;">(필수)</span> 비회원 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의 합니다.</label>
                            </div>
                            <div class="agree-box">
                                <p class="tit">상품 공급사 개인정보 제공 동의</p>
                                <div class="agree-cont">
                                    - 제공받는 자 : 에넥스 OEM(1500228) 공급사<br>
                                    - 이용목적 : 상품 및 경품(서비스) 배송(전송), 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의 처리<br>
                                    - 수집항목 : 구매자정보(닉네임, 이름, 휴대전화 번호, 이메일주소), 수령인정보(이름, 휴대전화 번호, 수령인 주소), 상품 구매, 취소, 반품, 교환정보, 송장정보<br>
                                    - 보유 / 이용기간 : 상품 제공 완료 후 3개월<br>
                                </div>
                                <input type="checkbox" id="agree-ico3"><label for="agree-ico3"><span style="color:#f00; font-weight: 600;">(필수)</span> 상품 공급사 개인정보 제공 동의에 대한 내용을 확인 하였으며 이에 동의 합니다.</label>
                            </div>
                        </div>
                        <div class="buyDetail-info">
                            <p class="tit">주문자 정보</p>
                            <table class="basic-tbl orderer-tbl">
                                <caption>주문자 정보</caption>
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 75%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row"><span class="important">주문하시는 분</span></th>
                                        <td><input type="text" name="ordererName" value="${member.name }"></td>
                                    </tr>
                                    <tr class="address">
                                        <th scope="row"><span class="important">받으실 곳</span></th>
                                        <td>
                                            <ul>
                                                <li><input type="text" class="ordererZip" name="ordererZip" value="${member.zipcode }" id="sample6_postcode2" style="background: #eee;"><button type="button" class="btn-green"  onclick="sample6_execDaumPostcode2()">주소 찾기</button></li>
                                                <li><input type="text" class="ordererAddress" name="ordererAddress" id="sample6_address2" value="${member.address1 }" style="background: #eee;"></li>
                                                <li><input type="text" class="ordererAddressDetail" name="ordererAddressDetail" id="sample6_detailAddress2" value="${member.address2}"></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">전화번호</th>
                                        <td><input type="text" name="ordererTel"></td>
	                                </tr>
	                                <tr>
                                        <th scope="row"><span class="important">휴대폰 번호</span></th>
                                        <td><input type="text" name="ordererPhone" value="${member.phone }"></td>
	                                </tr>
	                                <tr class="email">
                                        <th scope="row"><span class="important">이메일</span></th>
                                        <td>
                                        	<div class="input-col">
                                                <input type="text" class="email-input" placeholder="이메일" value="${member.email}">
                                            </div>
                                            <div class="input-col">
                                                <span class="etc">@</span>
                                            </div>
                                            <div class="input-col">
                                                <select id="email-select">
                                                    <option value="0">naver.com</option>
                                                    <option value="1">nate.com</option>
			                                        <option value="2">hanmail.com</option>	
                                                    <option value="3" name="3">직접 입력</option>	
                                                </select>
                                            </div>
                                        </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="buyDetail-info">
                            <p class="tit">배송지 정보</p>
                            <table class="basic-tbl orderer-tbl">
                                <caption>배송지 정보</caption>
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 75%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">배송지 확인</th>
                                        <td>
                                            <ul>
                                                <li><input type="radio" name="input" id="direct" checked><label for="direct">직접 입력</label></li>
                                                <li><input type="radio" name="input" id="equal"><label for="equal">주문자 정보와 동일</label></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="important">받으실분</span></th>
                                        <td><input type="text" name="receiverName"></td>
                                    </tr>
                                    <tr class="address">
                                        <th scope="row"><span class="important">받으실 곳</span></th>
                                        <td>
                                            <ul>
                                                <li><input type="text" class="receiverZip" name="receiverZip" id="sample6_postcode" style="background: #eee;"><button type="button" class="btn-green"  onclick="sample6_execDaumPostcode()">주소 찾기</button></li>
                                                <li><input type="text" class="receiverAddress" name="receiverAddress" id="sample6_address" style="background: #eee;"></li>
                                                <li><input type="text" class="receiverAddressDetail" name="receiverAddressDetail" id="sample6_detailAddress"></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">전화번호</th>
                                        <td><input type="text" name="receiverTel"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><span class="important">휴대폰 번호</span></th>
                                        <td><input type="text" name="receiverPhone"></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">배송메시지</th>
                                        <td><input type="text" name="deliveryMemo"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="buyDetail-info">
                            <p class="tit">결제 정보</p>
                            <table class="basic-tbl orderer-tbl">
                                <caption>결제정보</caption>
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 75%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">상품합계 금액</th>
                                        <td class="totalPrice">${product2.totalPrice }원</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">배송비</th>
                                        <td>${product2.delivery }원</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">할인 및 적립</th>
                                        <td>${product2.point }원</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">최종 결제 금액</th>
                                        <td><span class="buy-price"></span>원</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="buyDetail-info">
                            <p class="tit">결제수단 선택 / 결제</p>
                            <table class="basic-tbl orderer-tbl">
                                <caption>결제수단 선택, 결제</caption>
                                <colgroup>
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                    <col style="width: 25%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="payWay" scope="row" rowspan="2">결제수단</th>
                                        <td colspan="3">
                                            <ul>
                                                <li><input type="radio" name="pay" id="pay1" checked><label for="pay1">무통장 입금</label></li>
                                                <li><input type="radio" name="pay" id="pay2"><label for="pay2">신용카드</label></li>
                                                <li><input type="radio" name="pay" id="pay3"><label for="pay3">가상계좌</label></li>
                                                <li><input type="radio" name="pay" id="pay4"><label for="pay4">휴대폰 결제</label></li>
                                                <li><input type="radio" name="pay" id="pay5"><label for="pay5">카카오페이</label></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="payment-box" colspan="3">
                                            ( 무통장 입금 의 경우 입금확인 후부터 배송단계가 진행됩니다. )
                                            <ul>
                                                <li><label for="">입금자명</label><input type="text"></li>
                                                <li><label for="">입금은행</label>
                                                    <select name="" id="">
                                                        <option value="1">신한은행</option>
                                                        <option value="1">국민은행</option>
                                                        <option value="1">농협중앙회</option>
                                                        <option value="1">우리은행</option>
                                                    </select>
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="2">현금영수증 / 계산서 발행</th>
                                        <td colspan="3">
                                            <ul>
                                                <li><input type="radio" name="receipt" id="receipt" checked><label for="receipt">현금영수증</label></li>
                                                <li><input type="radio" name="receipt" id="bill"><label for="bill">세금계산서</label></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr class="receipt">
                                        <td colspan="4">
                                            <ul>
                                                <li><input type="radio" name="income" id="income" checked><label for="income">소득공제용</label></li>
                                                <li><input type="radio" name="income" id="expense"><label for="expense">지출증빙용</label></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr class="receipt income">
                                        <td colspan="4">
                                            <label for="" style="margin-right: 10px;">핸드폰 번호</label><input type="text">
                                        </td>
                                    </tr>
                                    <tr class="expense none">
                                        <td colspan="4">
                                            <label for="" style="margin-right: 10px;">사업자 등록번호</label><input type="text">
                                        </td>
                                    </tr>
                                    <tr class="business none">
                                        <th>사업자 번호</th>
                                        <td colspan="3"><input type="text"></td>
                                    </tr>
                                    <tr class="business none">
                                        <th>회사명</th>
                                        <td><input type="text"></td>
                                        <th>대표자명</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr class="business none">
                                        <th>업태</th>
                                        <td><input type="text"></td>
                                        <th>종목</th>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr class="address business none">
                                        <th scope="row"><span class="important">받으실 곳</span></th>
                                        <td colspan="3">
                                            <ul>
                                                <li><input type="text" id="sample6_postcode2" disabled style="background: #eee;"><button type="button" class="btn-green"  onclick="sample6_execDaumPostcode2()">주소 찾기</button></li>
                                                <li><input type="text" id="sample6_address2" disabled style="background: #eee;"></li>
                                                <li><input type="text" id="sample6_detailAddress2"></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="buyDetail-result">
                            <div class="result-box">
                                <p class="tit">결제정보(1)</p>
                                <div class="result-cont">
                                    <div class="result-info">
                                        <div class="desc">
                                            상품금액
                                        </div>
                                        <div class="price">
                                            ${product2.totalPrice }원
                                        </div>
                                    </div>
                                    <div class="result-info">
                                        <div class="desc">
                                            배송비
                                        </div>
                                        <div class="price">
                                            ${product2.delivery }원
                                        </div>
                                    </div>
                                </div>
                                <div class="price-result">
                                    <div class="desc">총 결제금액</div>
                                    <div class="price"><span class="buy-price"></span>원</div>
                                </div>
                                <button type="submit" class="btn-result btn-green">결제하기</button>
                            </div>
                        </div>
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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    function sample6_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode2').value = data.zonecode;
                document.getElementById("sample6_address2").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress2").focus();
            }
        }).open();
    }
</script>
<script>
	$("input:radio[id=pay1]").click(function(){
		$(".payWay").attr("rowspan", "2");
		$(".payment-box").attr("colspan","3");
		$(".payment-box").removeClass("none");
	});
	
	$(document).ready(function() {
		for(var i = 2; i<5; i++) {
			$("input:radio[id=pay" + i + "]").click(function(){
				$(".payment-box").addClass("none");
				$(".payWay").attr("rowspan", "1");
			});
		}
	});
	
	
	$("#receipt").click(function() {
		$(".receipt").removeClass("none");
		$(".business").addClass("none");
	});
	
	$("#bill").click(function() {
		$(".receipt").addClass("none");
		$(".business").removeClass("none");
	});
	
	$("#income").click(function() {
		$(".income").removeClass("none");
		$(".expense").addClass("none");
	});
	
	$("#expense").click(function() {
		$(".expense").removeClass("none");
		$(".income").addClass("none");
	});
	
</script>
<script>
	
	var totalPrice = parseInt($(".total-price").text()) * 1000;
	console.log("total :" + totalPrice)
	var delivery = Number($(".delivery").text());
	var buyPrice = totalPrice + delivery;
	
	 Number.prototype.format = function(){
	        if(this==0) return 0;
	     
	        var reg = /(^[+-]?\d+)(\d{3})/;
	        var n = (this + '');
	     
	        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	     
	        return n;
	    };
	    
	    

		$(".buy-price").text((totalPrice + delivery).format());
	
	$(document).ready(function() {
		

		
		$ ( "#all-check"). click (function () {
		    if ($(this).is(":checked") == true) {
		        $ ("#agree-ico1"). attr ( "checked", true);
		        $ ("#agree-ico2"). attr ( "checked", true);
		        $ ("#agree-ico3"). attr ( "checked", true);
		    }
		    else {
		        $("#agree-ico1"). attr ( "checked", false);
		        $("#agree-ico2"). attr ( "checked", false);
		        $("#agree-ico3"). attr ( "checked", false);
		    }
		});
		
		$("#equal").click(function() {
			$("input[name='receiverName']").val(($("input[name='ordererName']").val()));
			$("input[name='receiverTel']").val(($("input[name='ordererTel']").val()));
			$("input[name='receiverPhone']").val(($("input[name='ordererPhone']").val()));
			$("input[name='receiverZip']").val(($("input[name='ordererZip']").val()));
			$("input[name='receiverAddress']").val(($("input[name='ordererAddress']").val()));
			$("input[name='receiverAddressDetail']").val(($("input[name='ordererAddressDetail']").val()));
		});
		
		$("#direct").click(function() {
			$("input[name='receiverName']").val("");
			$("input[name='receiverTel']").val("");
			$("input[name='receiverPhone']").val("");
		});
		
		$(".email select").on("change", function() {
			$(".email-input").focus();
		});
		
		var orderConfirm = $("#orderConfirm");
		
		$(".btn-result").click(function(e) {
			var email = "";
			email = $(".email-input").val();
			
			
			console.log("이메일 버튼");
			console.log(email);
			var state = $('#email-select option:selected').val();
			var text = $('#email-select option:selected').text();
			if(state == '3') {
				console.log("ddd");
				console.log(email);
			} else {
				email = email + "@" + text;
				console.log("sss");
				console.log(email);
			}
			
			orderConfirm.append("<input type='hidden' name='totalProductPrice' value='"+ $(".total-price").text()+"'>");
			orderConfirm.append("<input type='hidden' name='totalPrice' value='"+ buyPrice +"'>");
			orderConfirm.append("<input type='hidden' name='ordererEmail' value='"+ email +"'>");
			orderConfirm.append("<input type='hidden' name='customerId' value='"+ $(".id").text() +"'>");
				
			if($("#agree-ico1").is(":checked") == false) {
				alert("필수조건은 동의하셔야합니다.");
				$("#agree-ico1").focus();
				e.preventDefault();
			} else if($("#agree-ico2").is(":checked") == false) {
				alert("필수조건은 동의하셔야합니다.");
				$("#agree-ico2").focus();
				e.preventDefault();
			} else if($("#agree-ico3").is(":checked") == false) {
				alert("필수조건은 동의하셔야합니다.");
				$("#agree-ico3").focus();
				e.preventDefault();
			} else if(!$("input[name='ordererName']").val()) {
				alert("주문자 성명을 입력해주세요.");
				$("input[name='ordererName']").focus();
				e.preventDefault();
			} else if(!$("input[name='ordererPhone']").val()) {
				alert("주문자 휴대폰 번호를 입력해주세요.");
				$("input[name='ordererPhone']").focus();
				e.preventDefault();
			} else if(!$(".email-input").val()) {
				alert("주문자 이메일을 입력해주세요.");
				$(".email-input").focus();
				e.preventDefault();
			} else if(!$("input[name='receiverName']").val()) {
				alert("배송지 성함을 입력해주세요.");
				$("input[name='receiverName']").focus();
				e.preventDefault();
			} else if(!$("#sample6_postcode").val()) {
				alert("배송지 우편번호를 입력해주세요.");
				$("#sample6_postcode").focus();
				e.preventDefault();
			} else if(!$("#sample6_address").val()) {
				alert("배송지 주소를 입력해주세요.");
				$("#sample6_address").focus();
				e.preventDefault();
			} else if(!$("#sample6_detailAddress").val()) {
				alert("배송지 주소를 입력해주세요.");
				$("#sample6_detailAddress").focus();
				e.preventDefault();
			} else if(!$("input[name='receiverPhone']").val()) {
				alert("배송지 휴대폰 번호를 입력해주세요.");
				$("input[name='receiverPhone']").focus();
				e.preventDefault();
			}
			
		});
	});
	
</script>