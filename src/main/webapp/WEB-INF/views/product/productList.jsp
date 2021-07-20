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
                        <form id="actionForm" action="/product/productDetail" method="get">
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
					                                                   <a href="#lnk" class="like-ico like"><span class="opt-screen-out">찜하기</span></a>
				                                                   </div>
				                                               </a>
				                                               <div class="txt-box">
				                                                   <p class="title"><c:out value="${list.productName}"/></p>
				                                                   <p class="price"><span class="bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.productPrice}"/> </span>원</p>
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
	                                                   <a href="#lnk"><img class="item-img" src="${contextPath}/thumbnails.do?fileName=${list.fileName}"></a>
	                                                   <a href="#lnk" class="like like-ico"></a>
	                                               </div>
	                                               <div class="txt-box">
	                                                   <p class="title"><c:out value="${list.productName}"/></p>
	                                                   <p class="title"><c:out value="${list.productId}"/></p>
	                                                   <p class="price"><span class="bold"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.productPrice}"/> </span>원</p>
	                                               </div>
	                                           </div>
	                                       </div>
	                                   </li>
	                                 </c:forEach>
	                              </ul>
	                            </div>
	                    	
                 			</form>
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
    
    actionForm = $("#actionForm");
    
    $(".move").on("click", function(e) {
		e.preventDefault();
		
		actionForm.append("<input type='hidden' name='productId' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action", "/product/productDetail.do");
		actionForm.submit();
	});
	
    
    $(".item-box .like").on("click", function(e) {
    	$(".item-box .like").toggleClass("like-after");
    });
    </script>