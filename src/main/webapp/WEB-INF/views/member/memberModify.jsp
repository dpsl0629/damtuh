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
                    <div class="join-box">
                        <form id="modifyConfirm" action="/member/modifyConfirm" class="join-form">
                            <fieldset>
                                <legend>회원가입</legend>
                                <div class="join-cont">
                                    <div class="input-field">
                                        <div class="input-tit">
                                            <label class="tit">이름</label>
                                        </div>
                                        <div class="input-box">
                                            <input type="text" value="${memberVO.name}" class="name disabled" name="name" placeholder="이름" readonly>
                                        </div>
                                    </div>
                                    <div class="input-field">
                                        <div class="input-tit">
                                            <label class="tit">아이디</label>
                                        </div>
                                        <div class="input-box">
                                            <div class="input-col">
                                                <input type="text" class="disabled" name="id" placeholder="아이디" value="${memberVO.id}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-field password">
                                        <div class="input-tit">
                                            <label class="tit">비밀번호</label>
                                        </div>
                                        <div class="input-box">
                                            <input type="password" class="pw" name="pw" placeholder="비밀번호">
                                        </div>
                                    </div>
                                    <p class="desc">특수문자, 영어 대문자, 숫자 포함 9~12자</p>
                                     <div class="input-field password">
                                        <div class="input-tit">
                                            <label class="tit">비밀번호 확인</label>
                                        </div>
                                        <div class="input-box">
                                            <input type="password" class="confirm-pw" placeholder="비밀번호 확인">
                                        </div>
                                    </div>
                                    <p class="pw-check">비밀번호가 일치하지 않습니다.</p>
                                    <div class="input-field  input-phone">
                                        <div class="input-tit">
                                            <label class="tit">핸드폰 번호</label>
                                        </div>
                                        <div class="input-box">
                                            <div class="input-col">
                                                <input type="text" name="phone" value="" placeholder="'-'을 제외한 핸드폰 번호를 입력해주세요.">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-field  input-phone">
                                        <div class="input-tit">
                                            <label class="tit">생년월일</label>
                                        </div>
                                        <div class="input-box">
                                            <div class="input-col">
                                                <input type="text" value="${memberVO.birth }" class="datepicker-here disabled" data-position="right top" name="birth" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-field input-email">
                                        <div class="input-tit">
                                            <label class="tit">이메일</label>
                                        </div>
                                        <div class="input-box">
                                            <div class="input-col">
                                                <input type="text" class="email"  name="email" placeholder="이메일">
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
                                        </div>
                                    </div>
                                    <div class="input-field input-button input-address">
                                        <div class="input-tit">
                                            <label class="tit">주소</label>
                                        </div>
                                        <div class="input-box">
                                            <div class="input-col">
                                                <input type="text" name="zipcode" id="sample6_postcode" value="" placeholder="우편번호">
                                            </div>
                                            <div class="input-col">
                                                <button type="button" onclick="sample6_execDaumPostcode()">주소찾기</button>
                                            </div>
                                        </div>
                                        <div class="address-etc">
                                            <input type="text" name="address1" id="sample6_address" value="" placeholder="주소1">
                                            <input type="text" name="address2" id="sample6_detailAddress" value="" placeholder="나머지 주소">
                                        </div>
                                    </div>
                                </div>
                                <div class="button_wrap">
                                    <button type="submit" class="btn-member">회원가입</button>
                                </div>
                            </fieldset>
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
</script>
