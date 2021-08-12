<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<div class="contents">
	<div class="buyDetail-box">
		<form id="order-confirm" action="${contextPath }/order/orderConfirm">
			<div class="buyDetail-top">
				<sec:authentication property="principal.username"
					var="currentUserName" />
				<div class="id" style="display: none;">${currentUserName}</div>
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
							<td class="img"><img
								src="${contextPath }/thumbnails.do?fileName=${product2.productImage}"
								alt="상품 사진" /></td>
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
				<input type="checkbox" id="all-check"> <label
					for="all-check"
					style="font-weight: 600; color: #000; margin-left: 10px; font-size: 15px;">담터의
					모든 약관을 확인 하고 전체 동의 합니다. (전체 동의에 선택항목도 포함됩니다.)</label>
				<div class="agree-box">
					<p class="tit">비회원 주문에 대한 개인정보 수집 이용 동의</p>
					<div class="agree-cont">
						회사는 회원가입, 민원 등 고객상담 처리, 본인확인(14세 미만 아동 확인) 등 의사소통을 위한 정보 활용 및 이벤트
						등과 같은 마케팅용도 활용, 회원의 서비스 이용에 대한 통계, 이용자들의 개인정보를 통한 서비스 개발을 위해 아래와
						같은 개인정보를 수집하고 있습니다. <br>
						<br> - 수집항목: 구매자정보(이름,전화번호,휴대폰번호,이메일), 상품 구매/취소/반품/교환/환불 정보,
						수령인 정보(이름, 주소, 전화번호, 휴대폰번호) 비회원 비밀번호 - 수집/이용목적: 서비스 제공 및 계약의 이행,
						구매 및 대금결제, 물품배송 또는 청구지 발송, 불만처리 등 민원처리, 회원관리 등을 위한 목적 - 이용기간: 개인정보
						수집 및 이용목적 달성 시 까지 <br>
						<br> 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단,
						관계법령의 규정에 의하여 보전할 필요가 있는 경우 일정기간 동안 개인정보를 보관할 수 있습니다. 그 밖의 사항은 (주)
						담터의 개인정보처리방침을 준수합니다.
					</div>
					<input type="checkbox" id="agree-ico1"><label
						for="agree-ico1"><span
						style="color: #f00; font-weight: 600;">(필수)</span> 비회원 개인정보 수집 이용에
						대한 내용을 확인 하였으며 이에 동의 합니다.</label>
				</div>
				<div class="agree-box">
					<p class="tit">이용약관 동의</p>
					<div class="agree-cont">
						제1조(목적) <br>
						<br> 표준약관 제10023호 <br> 이 약관은 주식회사 담터가 운영하는
						사이트(www.damtuh.co.kr 이하 "담터)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에
						있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. ※ 「PC통신등을 이용하는 전자거래에
						대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」
					</div>
					<input type="checkbox" id="agree-ico2"><label
						for="agree-ico2"><span
						style="color: #f00; font-weight: 600;">(필수)</span> 비회원 개인정보 수집 이용에
						대한 내용을 확인 하였으며 이에 동의 합니다.</label>
				</div>
				<div class="agree-box">
					<p class="tit">상품 공급사 개인정보 제공 동의</p>
					<div class="agree-cont">
						- 제공받는 자 : 담터 OEM(1500228) 공급사<br> - 이용목적 : 상품 및 경품(서비스)
						배송(전송), 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의
						처리<br> - 수집항목 : 구매자정보(닉네임, 이름, 휴대전화 번호, 이메일주소), 수령인정보(이름,
						휴대전화 번호, 수령인 주소), 상품 구매, 취소, 반품, 교환정보, 송장정보<br> - 보유 / 이용기간 :
						상품 제공 완료 후 3개월<br>
					</div>
					<input type="checkbox" id="agree-ico3"><label
						for="agree-ico3"><span
						style="color: #f00; font-weight: 600;">(필수)</span> 상품 공급사 개인정보 제공
						동의에 대한 내용을 확인 하였으며 이에 동의 합니다.</label>
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
							<td><input type="text" name="ordererName"
								value="${member.name }"></td>
						</tr>
						<tr class="address">
							<th scope="row"><span class="important">받으실 곳</span></th>
							<td>
								<ul>
									<li><input type="text" class="ordererZip"
										name="ordererZip" value="${member.zipcode }"
										id="sample6_postcode2" style="background: #eee;">
									<button type="button" class="btn-green"
											onclick="sample6_execDaumPostcode2()">주소 찾기</button></li>
									<li><input type="text" class="ordererAddress"
										name="ordererAddress" id="sample6_address2"
										value="${member.address1 }" style="background: #eee;"></li>
									<li><input type="text" class="ordererAddressDetail"
										name="ordererAddressDetail" id="sample6_detailAddress2"
										value="${member.address2}"></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><input type="text" name="ordererTel"></td>
						</tr>
						<tr>
							<th scope="row"><span class="important">휴대폰 번호</span></th>
							<td><input type="text" name="ordererPhone"
								value="${member.phone }"></td>
						</tr>
						<tr class="email">
							<th scope="row"><span class="important">이메일</span></th>
							<td>
								<div class="input-col">
									<input type="text" class="email-input" placeholder="이메일"
										value="${member.email}">
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
									<li><input type="radio" name="input" id="direct" checked><label
										for="direct">직접 입력</label></li>
									<li><input type="radio" name="input" id="equal"><label
										for="equal">주문자 정보와 동일</label></li>
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
									<li><input type="text" class="receiverZip"
										name="receiverZip" id="sample6_postcode"
										style="background: #eee;">
									<button type="button" class="btn-green"
											onclick="sample6_execDaumPostcode()">주소 찾기</button></li>
									<li><input type="text" class="receiverAddress"
										name="receiverAddress" id="sample6_address"
										style="background: #eee;"></li>
									<li><input type="text" class="receiverAddressDetail"
										name="receiverAddressDetail" id="sample6_detailAddress"></li>
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
									<li><input type="radio" name="pay" id="pay1" checked><label
										for="pay1">무통장 입금</label></li>
									<li><input type="radio" name="pay" id="pay2"><label
										for="pay2">신용카드</label></li>
									<li><input type="radio" name="pay" id="pay3"><label
										for="pay3">가상계좌</label></li>
									<li><input type="radio" name="pay" id="pay4"><label
										for="pay4">휴대폰 결제</label></li>
									<li><input type="radio" name="pay" id="pay5"><label
										for="pay5">카카오페이</label></li>
								</ul>
							</td>
						</tr>
						<tr>
							<td class="payment-box" colspan="3">( 무통장 입금 의 경우 입금확인 후부터
								배송단계가 진행됩니다. )
								<ul>
									<li><label for="">입금자명</label><input type="text"></li>
									<li><label for="">입금은행</label> <select name="" id="">
											<option value="1">신한은행</option>
											<option value="1">국민은행</option>
											<option value="1">농협중앙회</option>
											<option value="1">우리은행</option>
									</select></li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="2">현금영수증 / 계산서 발행</th>
							<td colspan="3">
								<ul>
									<li><input type="radio" name="receipt" id="receipt"
										checked><label for="receipt">현금영수증</label></li>
									<li><input type="radio" name="receipt" id="bill"><label
										for="bill">세금계산서</label></li>
								</ul>
							</td>
						</tr>
						<tr class="receipt">
							<td colspan="4">
								<ul>
									<li><input type="radio" name="income" id="income" checked><label
										for="income">소득공제용</label></li>
									<li><input type="radio" name="income" id="expense"><label
										for="expense">지출증빙용</label></li>
								</ul>
							</td>
						</tr>
						<tr class="receipt income">
							<td colspan="4"><label for="" style="margin-right: 10px;">핸드폰
									번호</label><input type="text"></td>
						</tr>
						<tr class="expense none">
							<td colspan="4"><label for="" style="margin-right: 10px;">사업자
									등록번호</label><input type="text"></td>
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
									<li><input type="text" id="sample6_postcode2" disabled
										style="background: #eee;">
									<button type="button" class="btn-green"
											onclick="sample6_execDaumPostcode2()">주소 찾기</button></li>
									<li><input type="text" id="sample6_address2" disabled
										style="background: #eee;"></li>
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
							<div class="desc">상품금액</div>
							<div class="price">${product2.totalPrice }원</div>
						</div>
						<div class="result-info">
							<div class="desc">배송비</div>
							<div class="price">${product2.delivery }원</div>
						</div>
					</div>
					<div class="price-result">
						<div class="desc">총 결제금액</div>
						<div class="price">
							<span class="buy-price"></span>원
						</div>
					</div>
					<button type="submit" class="btn-result btn-green">결제하기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}

	function sample6_execDaumPostcode2() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						document.getElementById("sample6_detailAddress2")
								.focus();
					}
				}).open();
	}
</script>
<script>
	$("input:radio[id=pay1]").click(function() {
		$(".payWay").attr("rowspan", "2");
		$(".payment-box").attr("colspan", "3");
		$(".payment-box").removeClass("none");
	});

	$(document).ready(function() {
		for (var i = 2; i < 5; i++) {
			$("input:radio[id=pay" + i + "]").click(function() {
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

	Number.prototype.format = function() {
		if (this == 0)
			return 0;

		var reg = /(^[+-]?\d+)(\d{3})/;
		var n = (this + '');

		while (reg.test(n))
			n = n.replace(reg, '$1' + ',' + '$2');

		return n;
	};

	$(".buy-price").text((totalPrice + delivery).format());

	$(document)
			.ready(
					function() {

						$("#all-check").click(function() {
							if ($(this).is(":checked") == true) {
								$("#agree-ico1").attr("checked", true);
								$("#agree-ico2").attr("checked", true);
								$("#agree-ico3").attr("checked", true);
							} else {
								$("#agree-ico1").attr("checked", false);
								$("#agree-ico2").attr("checked", false);
								$("#agree-ico3").attr("checked", false);
							}
						});

						$("#equal")
								.click(
										function() {
											$("input[name='receiverName']")
													.val(
															($("input[name='ordererName']")
																	.val()));
											$("input[name='receiverTel']")
													.val(
															($("input[name='ordererTel']")
																	.val()));
											$("input[name='receiverPhone']")
													.val(
															($("input[name='ordererPhone']")
																	.val()));
											$("input[name='receiverZip']")
													.val(
															($("input[name='ordererZip']")
																	.val()));
											$("input[name='receiverAddress']")
													.val(
															($("input[name='ordererAddress']")
																	.val()));
											$(
													"input[name='receiverAddressDetail']")
													.val(
															($("input[name='ordererAddressDetail']")
																	.val()));
										});

						$("#direct").click(function() {
							$("input[name='receiverName']").val("");
							$("input[name='receiverTel']").val("");
							$("input[name='receiverPhone']").val("");
						});

						$(".email select").on("change", function() {
							$(".email-input").focus();
						});

						var orderConfirm = $("#order-confirm");

						$(".btn-result")
								.click(
										function(e) {
											var email = "";
											email = $(".email-input").val();

											console.log("이메일 버튼");
											console.log(email);
											var state = $(
													'#email-select option:selected')
													.val();
											var text = $(
													'#email-select option:selected')
													.text();
											if (state == '3') {
												console.log("ddd");
												console.log(email);
											} else {
												email = email + "@" + text;
												console.log("sss");
												console.log(email);
											}

											orderConfirm
													.append("<input type='hidden' name='totalProductPrice' value='"
															+ $(".total-price")
																	.text()
															+ "'>");
											orderConfirm
													.append("<input type='hidden' name='totalPrice' value='"+ buyPrice +"'>");
											orderConfirm
													.append("<input type='hidden' name='ordererEmail' value='"+ email +"'>");
											orderConfirm
													.append("<input type='hidden' name='customerId' value='"
															+ $(".id").text()
															+ "'>");

											if ($("#agree-ico1").is(":checked") == false) {
												alert("필수조건은 동의하셔야합니다.");
												$("#agree-ico1").focus();
												e.preventDefault();
											} else if ($("#agree-ico2").is(
													":checked") == false) {
												alert("필수조건은 동의하셔야합니다.");
												$("#agree-ico2").focus();
												e.preventDefault();
											} else if ($("#agree-ico3").is(
													":checked") == false) {
												alert("필수조건은 동의하셔야합니다.");
												$("#agree-ico3").focus();
												e.preventDefault();
											} else if (!$(
													"input[name='ordererName']")
													.val()) {
												alert("주문자 성명을 입력해주세요.");
												$("input[name='ordererName']")
														.focus();
												e.preventDefault();
											} else if (!$(
													"input[name='ordererPhone']")
													.val()) {
												alert("주문자 휴대폰 번호를 입력해주세요.");
												$("input[name='ordererPhone']")
														.focus();
												e.preventDefault();
											} else if (!$(".email-input").val()) {
												alert("주문자 이메일을 입력해주세요.");
												$(".email-input").focus();
												e.preventDefault();
											} else if (!$(
													"input[name='receiverName']")
													.val()) {
												alert("배송지 성함을 입력해주세요.");
												$("input[name='receiverName']")
														.focus();
												e.preventDefault();
											} else if (!$("#sample6_postcode")
													.val()) {
												alert("배송지 우편번호를 입력해주세요.");
												$("#sample6_postcode").focus();
												e.preventDefault();
											} else if (!$("#sample6_address")
													.val()) {
												alert("배송지 주소를 입력해주세요.");
												$("#sample6_address").focus();
												e.preventDefault();
											} else if (!$(
													"#sample6_detailAddress")
													.val()) {
												alert("배송지 주소를 입력해주세요.");
												$("#sample6_detailAddress")
														.focus();
												e.preventDefault();
											} else if (!$(
													"input[name='receiverPhone']")
													.val()) {
												alert("배송지 휴대폰 번호를 입력해주세요.");
												$("input[name='receiverPhone']")
														.focus();
												e.preventDefault();
											}

										});
					});
</script>