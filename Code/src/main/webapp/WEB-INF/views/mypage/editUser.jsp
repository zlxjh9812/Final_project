<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<title>리뷰어스 - 회원정보수정</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">
		<div class="mypage-container">
		<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />
		<div class="mypage-content">
			<div class="mypage-edit-title">회원정보수정</div>
			<div class="mypage-edit-container">
				<form action="/mypage/edit" method="post" id="userEditForm">
					<div class="basic-info">
						<div class="basic-info-title">
							기본 정보<i class="fa-solid fa-circle-info"></i>
						</div>
						<div class="userId-input-container">
							<div class="edit-input-title">아이디</div>
							<div>${User.userId}</div>
							<button type="button" class="edit-input-btn edit-input-btn__cancel">변경불가</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">이름(실명)</div>
							<input type="text" name="name" id="realName" value="${User.name}" readonly> <input type="hidden" id="currentRealName" value="${User.name}">
							<button id="changeRealName-btn" class="edit-input-btn" type="button">이름 변경</button>
							<button id="changeRealName-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">닉네임</div>
							<input type="text" name="nickname" id="userName" value="${User.nickname}" readonly> <input type="hidden" id="currentName" value="${User.nickname}">
							<div class="nameDuplicateCheck" id="nameDuplicateCheck"></div>
							<button id="changeUserName-btn" class="edit-input-btn" type="button">닉네임 변경</button>
							<button id="changeUserName-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="userPw-input-container">
							<div class="edit-input-title">비밀번호</div>
							<i class="fa-solid fa-lock"></i>
							<button class="changePw-btn edit-input-btn" type="button">비밀번호 변경</button>
							<button id="changePw-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="changePw-form">
							<div class="newPw-wrap">
								<div class="edit-input-title edit-input-title__newPw">새 비밀번호</div>
								<input name="password" type="password" class="userPw"><br>
							</div>
							<div class="newPw-wrap newPw-wrap__check">
								<div class="edit-input-title edit-input-title__newPw">비밀번호 확인</div>
								<input name="confirmPw" type="password" class="confirmPw"><br>
								<div class="pwCheck"></div>
							</div>
						</div>
					</div>
					<div class="basic-info">
						<div class="basic-info-title">
							추가 정보<i class="fa-regular fa-square-plus"></i>
						</div>
						<div class="userName-input-container">
							<div class="edit-input-title">전화번호</div>
							<input type="text" name="tel" id="tel" value="${User.tel}" readonly> <input type="hidden" id="currentTel" value="${User.tel}">
							<button id="changeTel-btn" class="edit-input-btn" type="button">전화번호 변경</button>
							<button id="changeTel-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="email-input-container">
							<div class="edit-input-title">이메일</div>
							<input type="text" name="email" id="email" value="${User.email}" readonly> <input type="hidden" id="currentEmail" value="${User.email}">
							<button id="sendAuthCode-btn" class="sendAuthCode-btn edit-input-btn" type="button">인증번호 전송</button>
							<button id="changeEmail-btn" class="changeEmail-btn edit-input-btn" type="button">이메일 변경</button>
							<button id="changeEmail-cancel-btn" class="edit-input-btn edit-input-btn__cancel" type="button">변경취소</button>
						</div>
						<div class="changeEmail-form">
							<div class="newEmail-wrap">
								<div class="edit-input-title edit-input-title__newPw">인증번호</div>
								<input name="emailAuthCode" type="text" id="emailAuthCode" class="emailAuthCode"><br>
								<button id="checkAuthCode-btn" class="changeEmail-btn checkAuthCode-btn edit-input-btn" type="button">인증번호 확인</button>
							</div>
						</div>
					</div>
					<div class="edit-input-btn-container">
						<button class="edit-input-btn edit-input-btn__cancel" type="submit">취소</button>
						<button id="editSubmitBtn" class="edit-input-btn edit-input-btn__save" type="submit">변경사항 저장</button>
					</div>
					<input type="hidden" name="userId" id="userId" value="${User.userId}">
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(function() {
			// 정보 변경 취소 시 세션의 저장된 값으로 세팅
			$('#changeUserName-btn').click(
					function() {
						$('#userName').prop('readonly', false).css(
								'background-color', '#fff');
						$(this).hide();
						$('#changeUserName-cancel-btn').show();
					});

			$('#changeUserName-cancel-btn').click(
					function() {
						$('#userName').val('${User.nickname}').attr('readonly',
								'readonly');
						$(this).hide();
						$('#changeUserName-btn').show();
						$('#nameDuplicateCheck').text('');
						$("#userName").css("outline", "1px solid lightgrey");
					});

			$('#changeTel-btn').click(
					function() {
						$('#tel').prop('readonly', false).css(
								'background-color', '#fff');
						$(this).hide();
						$('#changeTel-cancel-btn').show();
					});

			$('#changeTel-cancel-btn').click(function() {
				$('#tel').val('${User.tel}').attr('readonly', 'readonly');
				$(this).hide();
				$('#changeTel-btn').show();
				$("#tel").css("outline", "1px solid lightgrey");
			});

			$('#changeRealName-btn').click(
					function() {
						$('#realName').prop('readonly', false).css(
								'background-color', '#fff');
						$(this).hide();
						$('#changeRealName-cancel-btn').show();
					});

			$('#changeRealName-cancel-btn').click(
					function() {
						$('#realName').val('${User.name}').attr('readonly',
								'readonly');
						$(this).hide();
						$('#changeRealName-btn').show();
						$("#realName").css("outline", "1px solid lightgrey");
					});

			$('#changeEmail-btn').click(
					function() {
						$('#email').prop('readonly', false).css('background-color', '#fff');
						$(this).hide();
						$('#changeEmail-cancel-btn').show();
						$('#sendAuthCode-btn').show();
					});
			
			$('#changeEmail-cancel-btn').click(function() {
				isAuthNumVerified = true;
				$sendAuthCodeBtn.text(sendAuthCodeBtnoriginTxt).removeAttr("style");
				$checkAuthCodeBtn.text(checkAuthCodeBtnoriginTxt).removeAttr("style");
				$('#emailAuthCode').prop('readonly', false);
				$('#emailAuthCode').val('');
				$('#email').val('${User.email}').attr('readonly', 'readonly');
				$('.sendAuthCode-btn').hide();
				$('#email').val('${User.email}').attr('readonly', 'readonly');
				$(this).hide();
				$('#changeEmail-btn').show();
				$("#email").css("outline", "1px solid lightgrey");
			});

		});
	</script>
	<script>
		var isAuthNumVerified = true;
		var $sendAuthCodeBtn = $("#sendAuthCode-btn");
		var $checkAuthCodeBtn = $("#checkAuthCode-btn");
		var sendAuthCodeBtnoriginTxt = $sendAuthCodeBtn.text();
		var checkAuthCodeBtnoriginTxt = $checkAuthCodeBtn.text();

		$(function() {
			$sendAuthCodeBtn.click(function() {
				isAuthNumVerified = !isAuthNumVerified;
				var email = $("#email").val();
				if (!isValidEmail(email)) {
					alert("올바른 이메일 형식이 아닙니다.");
					return;
				}
				$sendAuthCodeBtn.text("전송중...").css({
				    "color": "white",
				    "background-color": "rgba(160, 160, 160, 1)"
				});

				$.ajax({
					url : "/emailCheck.do",
					type : "POST",
					data : {
						email : email
					},
					success : function(data) {
						code = data;
						alert("인증번호가 전송되었습니다.");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("서버와 통신 오류가 발생했습니다.");
					},
					complete: function() {
				        $sendAuthCodeBtn.text("재전송").css({
				            "color": "white",
				            "background-color": "coral"
				        });
				    }
				});
			});

			$("#checkAuthCode-btn").click(function() {
				var inputAuthNum = $("#emailAuthCode").val();
 				if (inputAuthNum == "") {
					alert("인증번호를 입력해주세요.");
					return;
				}
				if (inputAuthNum === code) {
					alert("이메일 인증에 성공했습니다.");
					$('#email').prop('readonly', true);
					$('#emailAuthCode').prop('readonly', true);
					isAuthNumVerified = !isAuthNumVerified;
					$sendAuthCodeBtn.hide();
					$checkAuthCodeBtn.text("인증 완료").css({
			            "color": "white",
			            "background-color": "rgba(160, 160, 160, 1)"
					});
				} else {
					alert("인증번호가 일치하지 않습니다.");
				}
			});

			$("form").submit(function(event) {
 				if (!isAuthNumVerified) {
					alert("이메일 인증번호가 검증되지 않았습니다.");
					event.preventDefault();
				}
			});

		});

		function isValidEmail(email) {
			var matchAny = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			return matchAny.test(email);
		}
	</script>
</body>
</html>