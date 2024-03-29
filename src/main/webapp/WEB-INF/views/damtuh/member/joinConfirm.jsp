<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<div class="contents">
	<div class="joinConfirm-box">
		<div class="tit-box">
			<p class="tit">가입 완료되었습니다.</p>
			<p class="desc">환영합니다.</p>
		</div>
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
</script>
<script>
	$(".input-id button").on("click", function() {
		var memberId = $("input[name='id']").val(); // .id_input에 입력되는 값
		var data = {
			memberId : memberId
		}; // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		console.log(data);

		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8;",
			async : false,
			dataType : 'text',
			success : function(result) {
				if (result != 'fail') {
					$('.id-check1').css("display", "block");
					$('.id-check2').css("display", "none");
				} else {
					$('.id-check1').css("display", "none");
					$('.id-check2').css("display", "block");
				}
			},
			// success 종료
			fail : function(result) {
				console.log("실패");
			}// success 종료
		}); // ajax 종료	
	});
</script>
<script>
	$(document).ready(function() {
		var emailData;
		var email;
		var joinForm = $("#joinForm");
		var emailCheck = false;

		$(".input-email select").on("change", function() {
			$(".email").focus();
		});

		$(".confirm-pw").on("change", function() {
			if ($(".confirm-pw").val() != $(".pw").val()) {
				s
				$(".pw-check").css("display", "block");
			}
		});

		$(".send-email").on("click", function() {
			email = $(".email").val();
			console.log("이메일 버튼");
			console.log(email);
			var state = $('#email-select option:selected').val();
			var text = $('#email-select option:selected').text();
			if (state == '3') {
				console.log("ddd");
				console.log(email);
			} else {
				email = email + "@" + text;
				console.log("sss");
				console.log(email);
			}

			$.ajax({
				type : "GET",
				url : "emailCheck?email=" + email,
				async : false,
				success : function(data) {
					emailData = data;
				}

			}); // ajax 종료

		});

		$(".confirm-email").on("click", function() {
			var code = $("#email-code").val();
			console.log(code);
			console.log(emailData);
			console.log(email);
			if (emailData == code) {
				alert("일치합니다.");
				emailCheck = true;
			} else {
				alert("바르게 입력해주세요.");
				emailCheck = false;
			}
		});

		$(".btn-member").on("click", function(e) {
			e.preventDefault();

			if (emailCheck) {
				alert("오케이");
				joinForm.find("input[name='email']").attr('value', email);
				joinForm.submit();
			} else if (!$(".name").val()) {
				alert("이름을 입력해주세요");
			} else if (!$(".pw").val()) {
				alert("비밀번호를 입력해주세요");
			} else {
				alert("노");
			}
			alert(emailData);
			alert(email);
		});

	});
</script>