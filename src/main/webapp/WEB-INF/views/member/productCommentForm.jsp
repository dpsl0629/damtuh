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
                    <div class="myPage-box comment-box opt-clearfix">
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
                                        <li><a href="#lnk">Q&A</a></li>
                                    </ul>
                                </div>
                            </div>
                       </div>
                       <div class="cont-container">
                       		<form id="comment-form" action="${contextPath }/member/commentConfirm">
                       			<div class="txt-box">
                       			<p class="tit">
                       				구매하신 상품 잘받으셨나요?<br>
                       				<span class="desc">상품평을 남겨주시면 다른 분들께 도움이 됩니다!</span>
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
	                       				 			<td><img src="${contextPath }/thumbnails.do?fileName=${orderDetail.productImage}"/></td>
	                       				 			<td><c:out value="${orderDetail.productName }"/></td>
	                       				 	</tbody>
	                       				 </table>
	                       			</div>
		                       		<div class="like-box">
		                       			<p class="tit">
		                       				상품은 어떠셨나요? 별점을 매겨주세요!
	                       				</p>
	                       				<div>
	                       					<a href="#lnk" class="like like1"></a>
	                       					<a href="#lnk" class="like like2"></a>
	                       					<a href="#lnk" class="like like3"></a>
	                       					<a href="#lnk" class="like like4"></a>
	                       					<a href="#lnk" class="like like5"></a>
	                   					</div>
		                       		</div>
		                       		<div class="review-box">
		                       			<input type="textarea" name="comment">
		                       		</div>
		                       		<input type="hidden" class="like-count" name="likeCount">
		                       		<input type="hidden" name="deliveryNum" value="${orderDetail.deliveryId }">
		                       		<input type="hidden" name="productNum" value="${orderDetail.productId }">
		                       		<button type="button" class="btn-result btn-green">리뷰 남기기</button>
	                       		</div>                
                       		</form>
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

		
		
		$(".btn-result").on("click", function(e) {
			var commentForm = $("#comment-form");
			var likeCount = 0;
			
			if($('.like1').is('.active') && $(".like2").is('.active') && $(".like3").is('.active') && $(".like4").is('.active') && $(".like5").is('.active')) {
				likeCount = 5;
			} else if ($('.like1').is('.active') && $(".like2").is('.active') && $(".like3").is('.active') && $(".like4").is('.active')) {
				likeCount = 4;
			} else if ($('.like1').is('.active') && $(".like2").is('.active') && $(".like3").is('.active')) {
				likeCount = 3;
			} else if ($('.like1').is('.active') && $(".like2").is('.active')) {
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