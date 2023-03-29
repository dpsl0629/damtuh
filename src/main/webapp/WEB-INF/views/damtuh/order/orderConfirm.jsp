<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="orderConfirm-box">
		<h4 class="basic-h4">주문이 완료되었습니다.</h4>
			<p class="desc">주문번호 : ${order.deliveryId }</p>
			<div class="orderConfirm-cont opt-clearfix">
				<div class="left-box">
					<p class="tit">배송 정보</p>
					<table class="basic-tbl">
						<caption>배송 정보</caption>
						<colgroup>
							<col style="width: 30%;">
							<col style="width: 70%;">
						</colgroup>
						<tbody>
							<tr>
								<th>수령인</th>
								<td>${order.receiverName }</td>
							</tr>
							<tr>
								<th>배송지 주소</th>
								<td>${order.receiverZip}<br>${order.receiverAddress }<br>${order.receiverAddressDetail }</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${order.receiverTel }</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>${order.receiverPhone }</td>
							</tr>
							<tr>
								<th>배송메시지</th>
								<td>${order.deliveryMemo }</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="right-box">
					<p class="tit">상품 정보</p>
					<table class="basic-tbl">
						<colgroup>
							<col style="width: 40%;">
							<col style="width: 30;">
							<col style="width: 30;">
						</colgroup>
						<thead>
							<tr>
								<th>상품명</th>
								<th>수량</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${order.productName }</td>
								<td>${order.delivery }</td>
								<td>${order.totalPrice }</td>
							</tr>
						</tbody>
					</table>
					<p class="tit">결제정보</p>
					<table class="basic-tbl confirm-tbl">
						<colgroup>
							<col style="width: 60%;">
							<col style="width: 40%;">
						</colgroup>
						<tbody>
							<tr>
								<th>총 상품수</th>
								<td>${order.quantity }</td>
							</tr>
							<tr>
								<th>총 상품금액</th>
								<td>${order.productPrice }원</td>
							</tr>
							<tr>
								<th>총 배송비</th>
								<td>${order.delivery }</td>
							</tr>
							<tr>
								<th>총 결제금액</th>
								<td>${order.totalPrice }</td>
							</tr>
							<tr>
								<th>총 예상 적립 포인트</th>
								<td>${order.point }</td>
							</tr>
							<tr style="border-top: 2px solid #0e5100;">
								<th style="color: #0e5100; font-weight: 600; font-size: 15px;">최종
									결제금액</th>
								<td style="font-weight: 600; font-size: 15px;">${order.totalPrice }</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="btn-list">
				<button type="button" class="btn-green">장바구니</button>
				<button type="button" class="btn-green" style="font-weight: 600;">주문내역
					확인</button>
			</div>
	</div>
</div>
