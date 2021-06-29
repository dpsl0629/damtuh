<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                    <div class="item-detail opt-clearfix">
                        <form action="${contextPath }/order/orderPage" id="orderForm" method="get">
	                        <div class="item-visual">
	                            <div class="visual-cont">
	                                <div class="img-box">
	                                    <img src="${contextPath }/thumbnails.do?fileName=${product.fileName}" alt="">
	                                    <input type="hidden" name="productImage" value="${product.fileName }"/>
	                                </div>
	                                <div class="">
	                                    <ul class="thumb-lst opt-clearfix">
	                                    	<li>
	                                    		<div class="img">
			                                    	<c:choose>
				                                    	<c:when test="${product.thumbnail1 !=null}">
				                                        <img src="${contextPath }/thumbnails.do?fileName=${product.thumbnail1}" alt="">
				                                        </c:when>
			                                        </c:choose>
		                                        </div>
	                                        </li>
	                                        <c:choose>
		                                    	<c:when test="${product.thumbnail2 !=null}">
		                                        <div class="img"><img src="${contextPath }/thumbnails.do?fileName=${product.thumbnail2}" alt=""></div>
		                                        </c:when>
	                                        </c:choose>
	                                        <c:choose>
		                                    	<c:when test="${product.thumbnail3 !=null}">
		                                        <div class="img"><img src="${contextPath }/thumbnails.do?fileName=${product.thumbnail3}" alt=""></div>
		                                        </c:when>
	                                        </c:choose>
	                                        <c:choose>
		                                    	<c:when test="${product.thumbnail4 !=null}">
		                                        <div class="img"><img src="${contextPath }/thumbnails.do?fileName=${product.thumbnail4}" alt=""></div>
		                                        </c:when>
	                                        </c:choose>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="item-desc">
	                            <div class="desc-cont">
	                                <a href="#lnk" class="like-ico">
	                                </a>
	                                <div class="tit-box">
	                                	<input type="hidden" class="productId" value="${product.productId }"/>
	                                    <p class="tit productName">${product.productName }</p>
	                                    <p class="price"><span class="bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.productPrice}"/></span>원</p>
	                                </div>
	                                <select>
	                                    <option>할인쿠폰</option>
	                                </select>
	                                <div class="count-box opt-clearfix">
	                                    <div class="count-cont">
	                                        <button type="button" class="minus" onclick="minus()">-</button>
	                                        <input type="text" class="num" id="num" value="1" name="quantity">
	                                            <label class="num opt-screen-out">스피너</label>
	                                        <button type="button"  class="plus" onclick="plus()">+</button>
	                                    </div>
	                                    <div class="price-cont"><span type="text" name="totalProductPrice" class="total-price txt">${product.productPrice }</span>원</div>
	                                </div>
	                                <div class="btn-box">
	                                    <button class="btn-basket" type="button">장바구니</button>
	                                    <a href="${product.productId }" class="btn-buy">구매하기</a>
	                                </div>
                                </form>
                                <div class="ship opt-clearfix">
                                    <span class="tit">배송정보</span>
                                    <span class="desc">3000원<br>(100,000원 이상 구매 시 무료배송)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="detail-box">
                        <div class="tab">
                            <ul class="tab-menu opt-clearfix">
                                <li class="active" data-tab="tab1"><a href="#lnk">상세정보</a></li>
                                <li data-tab="tab2"><a href="#lnk">리뷰</a></li>
                                <li data-tab="tab3"><a href="#lnk">교환/반품 안내</a></li>
                            </ul>
                        </div>
                        <div class="tab-cont">
                            <div class="tab-content tab1 active">
                                <div class="detail-info">
                                    <div class="detail-cont">
                                        <div class="tit">
                                            타입
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.type }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            1회 제공량당 열량
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.calorie }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            개당 중량
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.weight }"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="detail-info">
                                    <div class="detail-cont">
                                        <div class="tit">
                                            원산지
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.contryOrigin }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            모델번호
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.modelNum }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            상품번호
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.productNum }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            상품상태
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.state }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            브랜드
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.brand }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            제조국
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.contryProduce }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            소비자상담 관련 전화번호
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.tel }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            제조년월일과 유통기한 또는 품질유지기한
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.expiryDate }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            식품의 유형
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.kind }"/>
                                        </div>
                                    </div>
                                    <div class="detail-cont">
                                        <div class="tit">
                                            생산자 및 생산자의 소재지, 수입자
                                        </div>
                                        <div class="desc">
                                            <c:out value="${product.producer }"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content tab2">
                                <div class="review-box opt-clearfix">
                                    <div class="search-box opt-clearfix">
                                        <div class="search-form-inp">
                                            <input type="text" title="검색어를 입력해 주세요" placeholder="검색어를 입력해 주세요">
                                            <button type="button" class="search-form-btn">검색</button>
                                        </div>
                                    </div>
                                    <div class="review-cont">
                                    <c:if test="${empty commentList}">
			                                    등록된 후기가 없습니다.
			                                  </c:if>
			                            	<c:if test="${'commentList.content' != null}">
		                                         <c:forEach items="${commentList}" end="${fn:length('commentList.content')}" var="comment">
                                        			 <div class="review-contents opt-clearfix">
			                                            <div class="user">
			                                                <c:out value="${comment.userId }"/>
			                                            </div>
			                                            <div class="like-box">
				                                            <c:forEach var="rating" varStatus="status" begin="1" end="${comment.likeCount }">
						                       					<a href="#lnk" class="like active"></a>
					                       					</c:forEach>
					                       					<c:choose>
				                       						<c:when test="${empty comment.likeCount }">
				                       						ddd
				                       						</c:when>
					                       					<c:when test="${comment.likeCount == 4}">
						                       					<c:forEach var="rating" varStatus="status" begin="1" end="1">
							                       					<a href="#lnk" class="like"></a>
						                       					</c:forEach>
					                       					</c:when>
					                       					<c:when test="${comment.likeCount == 3}">
						                       					<c:forEach var="rating" varStatus="status" begin="1" end="2">
							                       					<a href="#lnk" class="like"></a>
						                       					</c:forEach>
					                       					</c:when>
					                       					<c:when test="${comment.likeCount == 2}">
						                       					<c:forEach var="rating" varStatus="status" begin="1" end="3">
							                       					<a href="#lnk" class="like"></a>
						                       					</c:forEach>
					                       					</c:when>
					                       					<c:when test="${comment.likeCount == 1}">
						                       					<c:forEach var="rating" varStatus="status" begin="1" end="4">
							                       					<a href="#lnk" class="like"></a>
						                       					</c:forEach>
					                       					</c:when>
					                       					</c:choose>
			                                            </div>
			                                            <div class="contents">
			                                                <c:out value="${comment.content }"/>
			                                            </div>
			                                            <div class="bottom-box">
			                                            	<fmt:formatDate pattern="yyyy-MM-dd" value="${comment.writeDate}"/>
			                                            </div> 
		                                            </div>
		                                      		 </c:forEach>
                                       		</c:if>
                                          </div>
                                    </div>
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
    
    
    <script>
    
 


    var count = 1;
    var countEl = $(".num");
    var price = Number($(".total-price").text());
    var totalPrice = 0;
    var delivery = 0;
    var point = 0;
    
    Number.prototype.format = function(){
	        if(this==0) return 0;
	     
	        var reg = /(^[+-]?\d+)(\d{3})/;
	        var n = (this + '');
	     
	        while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
	     
	        return n;
	    };
	    
	    
    $(document).ready(function() {
    	   var token = $("meta[name='_csrf']").attr("content");
    	    var header = $("meta[name='_csrf_header']").attr("content");
    	    console.log(token);
    	    console.log(header);
    	    $(function() {
    	    	if(token && header) {
    	        $(document).ajaxSend(function(e, xhr, options) {
    	            xhr.setRequestHeader(header, token);
    	        });
    	    	}
    	    });

    	    
  	 	$(".total-price").text(price.format());
  	 	
  	 	
    });
    
    $(".desc-cont a").on("click", function() {
    	$(".desc-cont a").toggleClass("like-after");	
    });
 
    function plus(){
    	if (count < 99) {
        count++;
        countEl.val(count);
        console.log(count);
    	console.log($(".total-price").val());
    	price = Number(price) + (Number(price)/(count-1));
     	console.log(price);
    	}
    	$(".total-price").text(price.format());
    }
    function minus(){
        if (count > 1) {
            count--;
            countEl.val(count);
            price = Number(price) - (Number(price)/(count+1));
         	console.log(price);
        	}
    	$(".total-price").text(price.format());
    }
    

    console.log(countEl);
    
    var cnt = 0;
    
    var productId = $(".productId").val();
    
    console.log(productId);
    
   	$(".desc-cont a").on("click", function() {
	    if($(".desc-cont a").hasClass("like-after") === true) {
	    	cnt++;
    		console.log("하하하");
    		console.log(cnt);
	    }
	    
	    console.log("cnt : " + cnt);
	    
	    
		  
		  var data = {cnt:cnt, productId:productId};
		 
		  
		  $.ajax({
				type : "POST",
				url:"/product/likeCheck",
				data: {cnt:cnt, productId:productId},
				async:false,
				success:function(data){
					console.log("굿");
		        }

			}); // ajax 종료
	    
    });
   	

	
	var orderForm = $("#orderForm");
    
    $(".btn-buy").on("click", function(e) {
		e.preventDefault();
		console.log(price);
		console.log(typeof(price));
		
		if(price >= 100000) {
			delivery = 0;
		} else {
			delivery = 3000;
		}
		
		point = price/1000;
		
		console.log(delivery);
		orderForm.append("<input type='hidden' name='productId' value='"+ $(this).attr("href")+"'>");
		orderForm.append("<input type='hidden' name='totalPrice' value='"+ $(".total-price").text()+"'>");
		orderForm.append("<input type='hidden' name='productName' value='"+ $(".productName").text()+"'>");
		orderForm.append("<input type='hidden' name='productPrice' value='"+ $(".price span").text()+"'>");
		orderForm.append("<input type='hidden' name='delivery' value='"+ delivery +"'>");
		orderForm.append("<input type='hidden' name='point' value='"+ point +"'>");
		orderForm.submit();
		console.log($(".total-price").text());
	});
    
   $(document).ready(function() {
	   if($(".like-count").val() == 5) {
	    	$(".like1").addClass("active");
	    	$(".like2").addClass("active");
	    	$(".like3").addClass("active");
	    	$(".like4").addClass("active");
	    	$(".like5").addClass("active");
	    } else if ($(".like-count").val() == 4) {
	    	$(".like1").addClass("active");
	    	$(".like2").addClass("active");
	    	$(".like3").addClass("active");
	    	$(".like4").addClass("active");
	    } else if ($(".like-count").val() == 3) {
	    	$(".like1").addClass("active");
	    	$(".like2").addClass("active");
	    	$(".like3").addClass("active");
	    } else if ($(".like-count").val() == 2) {
	    	$(".like1").addClass("active");
	    	$(".like2").addClass("active");
	    } else {
	    	$(".like1").addClass("active");
	    }
	   
	   $(".contents").on("click", function() {
		   $(".like-count").val();
	   });
   });
    
    </script>