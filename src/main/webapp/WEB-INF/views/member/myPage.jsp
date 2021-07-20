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
                    <div class="myPage-box opt-clearfix">
                    <sec:authentication property="principal.username" var="currentUserName"/>
					<div>${currentUserName}</div>
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
                           <div class="top-menu">
                               <ul class="order-lst opt-clearfix">
                                   <li>
                                        <div class="order-box">
                                            <p class="tit">입금대기</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                   </li>
                                   <li>
                                         <div class="order-box">
                                             <p class="tit">결제완료</p>
                                             <a href="#lnk">0</a>
                                         </div>
                                    </li>
                                    <li>
                                        <div class="order-box">
                                            <p class="tit">배송준비중</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="order-box">
                                            <p class="tit">배송중</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="order-box">
                                            <p class="tit">배송완료</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="order-box etc">
                                            <p class="tit">교환</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="order-box etc">
                                            <p class="tit">반품</p>
                                            <a href="#lnk">0</a>
                                        </div>
                                    </li>
                               </ul>   
                           </div>

                           <div class="order-detail">
                               <h2>전체 쇼핑내역</h2>
                               <a class="total-order" href="#lnk">0</a>
                               <div class="total-order-cont">
                                   <div class="order-date">
                                       <ul>
                                           <li><a href="#lnk">오늘</a></li>
                                           <li><a href="#lnk">1주일</a></li>
                                           <li><a href="#lnk">1개월</a></li>
                                           <li><a href="#lnk">3개월</a></li>
                                           <li><a href="#lnk">6개월</a></li>
                                           <li><a href="#lnk">1년</a></li>
                                       </ul>
                                   </div>
                                   <div class="search-form opt-clearfix">
                                        <div class="search-form-box">
                                            <div class="search-form-inp">
                                                <input type="text" title="검색어를 입력해 주세요" placeholder="검색어를 입력해 주세요">
                                                <button type="button" class="search-form-btn">검색</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="order-detail-box">
                                        <ul class="order-detail-lst">
                                            <li>
                                            <c:choose>
			                            	<c:when test="${empty orderList}">
			                            		<div class="empty-txt">주문 내역이 없습니다.</div>
			                            	</c:when>
		                            		<c:when test="${orderList != null}">
				                            <c:forEach items="${orderList}" var="order">
                                               <div class="order-detail-cont${rating }">
                                                   <table class="order-detail-tbl basic-tbl">
                                                       <caption>주문조회</caption>
                                                       <colgroup>
                                                           <col style="width:30%;">
                                                           <col style="width:15%;">
                                                           <col style="width:30%;">
                                                           <col style="width:25%;">
                                                       </colgroup>
                                                       <thead>
                                                           <tr>
                                                               <th scope="col">주문일(결제번호)</th>
                                                               <th scope="col" colspan="2">상품명/주문옵션/주문번호</th>
                                                               <th scope="col">주문상태</th>
                                                           </tr>
                                                       </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td><span class="date"><fmt:formatDate pattern="yyyy-MM-dd" value="${order.orderVO.orderDate}"/> </span></td>
                                                                <td><img src="${contextPath }/thumbnails.do?fileName=${order.orderVO.productImage}" alt="상품 사진"></td>
                                                                <td>
                                                                    <p class="name">
                                                                        <a href="#lnk" style="display: block;"><c:out value="${order.orderVO.productName}"/></a>
                                                                        <span class="number">(<c:out value="${order.orderVO.deliveryId }"/>)</span>
                                                                    </p>
                                                                </td>
                                                                <td>
                                                                    <span class="state">거래완료</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <a class="detail-view" href="#lnk">주문상세보기</a>
                                                                </td>
                                                                <td colspan="2">
                                                                    <a class="re-print" href="#lnk">구매영수증 출력</a>
                                                                </td>
                                                                <td>
                                                                	<c:choose>
                                                                		<c:when test="${empty order.commentVO.content }">
                                                                    		<a class="review" href="${contextPath }/member/productCommentForm?deliveryId=${order.orderVO.deliveryId}">구매후기작성</a>
                                                                    	</c:when>
                                                                    	<c:when test="${order.commentVO.content != null }">
                                                                    		<a class="review" href="${contextPath }/member/productCommentConfirm?deliveryId=${order.orderVO.deliveryId}">구매후기확인</a>
                                                                    	</c:when>
                                                                   	</c:choose>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="price" colspan="4">결제금액 : <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.orderVO.totalPrice}"/>원</span></td>
                                                            </tr>
                                                        </tbody>
                                                   </table>
                                               </div>
                                           </li>
                                          </c:forEach>
                                          </c:when>
                                          </c:choose>
                                        </ul>
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
