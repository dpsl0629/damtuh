<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="item-lst">
		<form id="product-form" action="${contextpath }/product/productDetail" method="get">
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
								<c:forEach items="${list}" var="list" varStatus="status">
									<li>
										<div>
											<div class="item-box">
												<a href="${list.productId }" class="move">
													<div class="img-box">
														<img class="item-img" src="${contextPath}/thumbnails.do?fileName=${list.fileName}" alt="상품 사진"> 
													</div>
												</a>
												<div class="txt-box">
													<p class="title">
														<c:out value="${list.productName}" />
													</p>
													<p class="price">
														<span class="bold"><fmt:formatNumber type="number"
																maxFractionDigits="3" value="${list.productPrice}" /> </span>원
													</p>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
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
							<c:forEach items="${list}" var="list" varStatus="status">
								<li>
									<div>
										<div class="item-box">
											<div class="img-box">
												<a href="#lnk"><img class="item-img"
													src="${contextPath}/thumbnails.do?fileName=${list.fileName}"></a>
											</div>
											<div class="txt-box">
												<p class="title">
													<c:out value="${list.productName}" />
												</p>
												<p class="price">
													<span class="bold"><fmt:formatNumber type="number"
															maxFractionDigits="3" value="${list.productPrice}" /> </span>원
												</p>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>


<script>
	var productForm = $("#product-form");

	$(".move").on("click",function(e) {
			e.preventDefault();

			productForm.append("<input type='hidden' name='productId' value='"
							+ $(this).attr("href") + "'>");
			productForm.attr("action", "/product/productDetail");
			productForm.submit();
	});

	$(".item-box .like").on("click", function(e) {
		$(".item-box .like").toggleClass("like-after");
	});
</script>