<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!--#include virtual="/html/include/sub-head.html"-->

<div class="contents">
    <div class="join-box">
        <form id="join-form" action="/member/joinConfirm" class="join-form" method="post">
            <fieldset>
                <legend>회원가입</legend>
                <div class="join-cont">
                    <div class="input-field">
                        <div class="input-tit">
                            <label class="tit">이름</label>
                        </div>
                        <div class="input-box">
                            <input type="text" class="name" name="name" placeholder="이름">
                        </div>
                    </div>
                    <div class="input-field input-button input-id">
                        <div class="input-tit">
                            <label class="tit">아이디</label>
                        </div>
                        <div class="input-box">
                            <div class="input-col">
                                <input type="text" name="id" placeholder="아이디">
                            </div>
                            <div class="input-col">
                                <button type="button">중복확인</button>
                            </div>
                        </div>
                    </div>
                        <p class="id-check1">사용 가능한 아이디입니다.</p>
                        <p class="id-check2">이미 있는 아이디입니다.</p>
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
                                <input type="text" class="datepicker-here" data-position="right top" name="birth">
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
                         <button class="btn-number send-email" class="" type="button">인증번호 받기</button>
                        <div class="input-field input-button">
                            <div class="input-box">
                                <div class="input-col">
                                    <input type="text" id="email-code">
                                </div>
                                <div class="input-col">
                                    <button type="button" class="confirm-email">확인</button>
                                </div>
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
<script>
	$(".input-id button").on("click", function() {
		var memberId = $("input[name='id']").val();			// .id_input에 입력되는 값
		var data = {memberId:memberId};		// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		console.log(data);
		
		var csrfToken = $("meta[name='_csrf']").attr("content");
		  $.ajaxPrefilter(function(options, originalOptions, jqXHR){
		    if (options['type'].toLowerCase() === "post") {
		        jqXHR.setRequestHeader('X-CSRF-TOKEN', csrfToken);
		    }
		  });
		  
		$.ajax({
			type : "post",
			url : "memberIdChk",
			data: data,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8;",
			async: false,
			dataType:'text',
			success : function(result){
				if(result != 'fail'){
					$('.id-check1').css("display","block");		
					$('.id-check2').css("display","none");		
				} else {
					$('.id-check1').css("display","none");		
					$('.id-check2').css("display","block");		
				}
			},
			// success 종료
			fail:function(result) {
				console.log("실패");
			}// success 종료
		}); // ajax 종료	
	});
</script>
<script>

$(document).ready(function() {
	var emailData;
	var email;
	var joinForm = $("#join-form");
	var emailCheck = false;
	
	$(".input-email select").on("change", function() {
		$(".email").focus();
	});
	
	$(".pw").on("change", function() {

	 var pw = $(".pw").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 console.log(pw);
	 if(pw.length < 9 || pw.length > 12){

	  alert("9자리 ~ 12자리 이내로 입력해주세요.");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이 입력해주세요.");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	  return false;
	 }else {
		console.log("통과"); 
	    return true;
	 }

	});
	
	$(".name").on("change", function() {
		var pattern = /([^가-힣ㄱ-ㅎㅏ-ㅣ\x20])/i;
		
		console.log($(".name").val());

		if(pattern.test($(".name").val())) {
			alert("성함은 한글로만 작성해주세요.");
		}
		
	});
	
	$(".confirm-pw").on("change", function() {
		console.log($(".name").val());
		if($(".confirm-pw").val() != $(".pw").val()) {
			$(".pw-check").css("display", "block");
		}
	});

	
	$(".send-email").on("click", function() {
		alert("인증번호가 전송되었습니다. 바르게 입력해주세요.");
		email = $(".email").val();
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
		
		$.ajax({
			type : "GET",
			url:"emailCheck?email=" + email,
			async:false,
			success:function(data){
				emailData = data;
	        }

		}); // ajax 종료
		
	});
	

	$(".confirm-email").on("click", function() {
		var code = $("#email-code").val();
		console.log(code);
		console.log(emailData);
		console.log(email);
		if(emailData==code) {
			alert("일치합니다.");
			emailCheck = true;
		} else {
			alert("바르게 입력해주세요.");
			emailCheck = false;
		}
	});
	
	
	$(".btn-member").on("click", function(e) {
		e.preventDefault();
		
		if(emailCheck) {
			alert("오케이");
			joinForm.find("input[name='email']").attr('value', email);
			joinForm.submit();
		} else if(!$(".name").val()) {
			alert("이름을 입력해주세요");
		} else if(!$(".pw").val()) {
			alert("비밀번호를 입력해주세요");
		} else {
			alert("노");
		}
		alert(emailData);
		alert(email);
	});
	
});
</script>