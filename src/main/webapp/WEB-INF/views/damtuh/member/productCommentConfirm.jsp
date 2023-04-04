<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="myPage-box comment-box comment-confirm opt-clearfix">
		<div class="lnb">
			<div class="lnb-menu">
				<div class="menu-box">
					<h4>쇼핑내역</h4>
					<ul>
						<li><a href="#lnk">전체 쇼핑내역</a></li>
						<li><a href="#lnk">주문취소/교환/반품내역</a></li>
						<li><a href="#lnk">장바구니</a></li>
					</ul>
				</div>
				<div class="menu-box">
					<h4>회원정보</h4>
					<ul>
						<li><a href="${contextPath }/member/modifyCheckForm">회원정보수정</a></li>
						<li><a href="${contextPath }/member/deleteCheckForm">회원탈퇴</a></li>
					</ul>
				</div>
				<div class="menu-box">
					<h4>고객센터</h4>
					<ul>
						<li><a href="#lnk">자주묻는 질문</a></li>
						<li><a href="#lnk">Q&#38;A</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="cont-container">
			<form id="comment-form" action="${contextPath }/member/myPage">
				<div class="txt-box">
					<p class="tit">
						구매하신 상품에 대한 상품평을 남겨주셔서 감사합니다.<br>
					</p>
				</div>
				<div class="desc-box">
					<div class="img-box">
						<table class="buyDetail-tbl basic-tbl">
							<caption>구매한 상품</caption>
							<colgroup>
								<col style="width: 20%;">
								<col style="width: 80%;">
							</colgroup>
							<thead>
								<tr>
									<th>상품</th>
									<th>상세</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img
										src="${contextPath }/thumbnails.do?fileName=${orderDetail.productImage}"
										alt="상품 사진" /></td>
									<td><c:out value="${orderDetail.productName }" /></td>
							</tbody>
						</table>
					</div>
					<div class="like-box">
						<c:forEach var="rating" varStatus="status" begin="1"
							end="${order.likeCount }">
							<a href="#lnk" class="like active"></a>
						</c:forEach>
						<c:choose>
							<c:when test="${empty order.likeCount }">
      						ddd
      						</c:when>
							<c:when test="${order.likeCount == 4}">
								<c:forEach var="rating" varStatus="status" begin="1" end="1">
									<a href="#lnk" class="like"></a>
								</c:forEach>
							</c:when>
							<c:when test="${order.likeCount == 3}">
								<c:forEach var="rating" varStatus="status" begin="1" end="2">
									<a href="#lnk" class="like"></a>
								</c:forEach>
							</c:when>
							<c:when test="${order.likeCount == 2}">
								<c:forEach var="rating" varStatus="status" begin="1" end="3">
									<a href="#lnk" class="like"></a>
								</c:forEach>
							</c:when>
							<c:when test="${order.likeCount == 1}">
								<c:forEach var="rating" varStatus="status" begin="1" end="4">
									<a href="#lnk" class="like"></a>
								</c:forEach>
							</c:when>
						</c:choose>
					</div>
					<div class="review-box">
						<textarea name="comment" readonly><c:out
								value="${order.content }" /></textarea>
					</div>
					<input type="hidden" class="like-count" name="likeCount"> <input
						type="hidden" name="deliveryId"
						value="${orderDetail.deliveryId }"> <input type="hidden"
						name="productNum" value="${orderDetail.productId }">
					<button type="button" class="btn-result btn-green">돌아가기</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript">
	var check = 0;

	$(".like1").on("click", function(e) {
		console.log("ddd");
		$(this).addClass("active");
		$(".like2").removeClass("active");
		$(".like3").removeClass("active");
		$(".like4").removeClass("active");
		$(".like5").removeClass("active");
	});

	$(".like2").on("click", function(e) {
		console.log("ddd");
		$(".like1").addClass("active");
		$(this).toggleClass("active");
		$(".like3").removeClass("active");
		$(".like4").removeClass("active");
		$(".like5").removeClass("active");
	});

	$(".like3").on("click", function(e) {
		console.log("ddd");
		$(".like1").addClass("active");
		$(".like2").addClass("active");
		$(this).toggleClass("active");
		$(".like4").removeClass("active");
		$(".like5").removeClass("active");
	});

	$(".like4").on("click", function(e) {
		console.log("ddd");
		$(".like1").addClass("active");
		$(".like2").addClass("active");
		$(".like3").addClass("active");
		$(this).toggleClass("active");
		$(".like5").removeClass("active");
	});

	$(".like5").on("click", function(e) {
		console.log("ddd");
		$(".like1").addClass("active");
		$(".like2").addClass("active");
		$(".like3").addClass("active");
		$(".like4").addClass("active");
		$(this).toggleClass("active");
	});

	$(".btn-result").on(
			"click",
			function(e) {
				var commentForm = $("#comment-form");
				var likeCount = 0;

				if ($('.like1').is('.active') && $(".like2").is('.active')
						&& $(".like3").is('.active')
						&& $(".like4").is('.active')
						&& $(".like5").is('.active')) {
					likeCount = 5;
				} else if ($('.like1').is('.active')
						&& $(".like2").is('.active')
						&& $(".like3").is('.active')
						&& $(".like4").is('.active')) {
					likeCount = 4;
				} else if ($('.like1').is('.active')
						&& $(".like2").is('.active')
						&& $(".like3").is('.active')) {
					likeCount = 3;
				} else if ($('.like1').is('.active')
						&& $(".like2").is('.active')) {
					likeCount = 2;
				} else {
					likeCount = 1;
					alert($('.like1').is('.active'));
					alert($('.like2').is('.active'));
					alert($('.like3').is('.active'));
					alert($('.like4').is('.active'));
					alert($('.like5').is('.active'));
				}

				alert(likeCount);
				$(".like-count").val(likeCount);
				commentForm.submit();

			});
</script>