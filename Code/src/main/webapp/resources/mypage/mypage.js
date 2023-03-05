// 마이페이지 관련 JS
$(function() {

	// URI별 메뉴 효과
	var menuLinks = {
		'/mypage' : '#mypage',
		'/mypage/edit' : '#edit',
		'/mypage/myfavorate' : '#myfavorate',
		'/mypage/mypost' : '#mypost',
		'/mypage/mycomment' : '#mycomment',
		'/mypage/myqna' : '#myqna'
	};
	var link = menuLinks[window.location.pathname];
	if (link) {
		$(link).css({
			'border-left' : '4px solid coral',
			'color' : 'coral'
		});
	}

	// 마이페이지 드롭다운 효과
	$('.myactive-dropdown-toggle').click(function(e) {
		e.preventDefault();
		var dropdownList = $(this).siblings('.myactive-dropdown-list');
		dropdownList.slideToggle(200, function() {
			$(this).toggleClass('active');
		});

		var plusIcon = $(this).find('.fa-plus');
		var minusIcon = $(this).find('.fa-minus');

		if (plusIcon.is(':visible')) {
			plusIcon.hide();
			minusIcon.show();
		} else {
			minusIcon.hide();
			plusIcon.show();
		}

		$(this).toggleClass('active');
	});

	// 비밀번호는 빈 문자열로 대체
	$(".changePw-btn").click(function() {
		$(this).hide();
		$(".changePw-form").css('display', 'block');
		$("#changePw-cancel-btn").show();
	});

	$('#changePw-cancel-btn').click(function() {
		$(this).hide();
		$('.userPw, .confirmPw').val('');
		$('.pwCheck').text("");
		$(".changePw-form").hide();
		$('.changePw-btn').show();
	});
	
	$("#changeEmail-btn").click(function() {
		$(this).hide();
		$(".changeEmail-form").css('display', 'block');
		$("#changeEmail-cancel-btn").show();
	});
	
	$('#changeEmail-cancel-btn').click(function() {
		var currentEmail = $('#currentEmail').val();
		$(this).hide();
		$('.email').val(currentEmail);
		$(".changeEmail-form").hide();
		$('.changeEmail-btn').show();
	});
	
	var isNameDuplicate = false;

	$('.userPw, .confirmPw').on('keyup', function() {
		  var isPwMatched = false;
		  if ($('.userPw').val() && $('.confirmPw').val()) {
		    if ($('.userPw').val() === $('.confirmPw').val()) {
		      $('.pwCheck').text('비밀번호가 일치합니다.').css('color', 'green');
		      isPwMatched = true;
		    } else {
		      $('.pwCheck').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		      isPwMatched = false;
		    }
		  } else {
		    $('.pwCheck').empty();
		    isPwMatched = false;
		  }

		  validateForm(isPwMatched);
		});
	  
	// 닉네임 중복검사
	$("#userName").keyup(function() {
	  checkNameDuplicate();
	});

	function checkNameDuplicate() {
		  var nickname = $("#userName").val();
		  var currentNickname = $("#currentName").val();
		  if (nickname == currentNickname) {
		    $("#nameDuplicateCheck").text("현재 사용중인 닉네임과 동일합니다.").css("color", "red");
		    $("#userName").css("outline", "1px solid red");
		    return;
		  }
		  $.ajax({
		    url: "/checkNameDuplicate",
		    type: "POST",
		    data: {
		    	nickname: nickname
		    },
		    success: function(result) {
		      if (result) {
		        $("#nameDuplicateCheck").text("사용 가능한 닉네임입니다.").css("color", "green");
		        $("#userName").css("outline", "1px solid green");
		        isNameDuplicate = false;
		      } else {
		        $("#nameDuplicateCheck").text("이미 사용 중인 닉네임입니다.").css("color", "red");
		        $("#userName").css("outline", "1px solid red");
		        isNameDuplicate = true;
		      }
		      validateForm();
		    },
		    error: function() {
		      $("#nameDuplicateCheck").text("서버와 통신 오류가 발생했습니다.");
		      isNameDuplicate = false;
		      validateForm();
		    }
		  });
		}
	
	// 수정 폼 검증
	$('form').submit(function(event) {
		  event.preventDefault();
		  var isPwMatched = $('.userPw').val() == $('.confirmPw').val();
		  var isNameDuplicate = $('#nameDuplicateCheck').text() == "이미 사용 중인 닉네임입니다.";
		  
		  if (isPwMatched && !isNameDuplicate) {
		    $(this).unbind('submit').submit();
		  } else {
		    if (!isPwMatched) {
		      alert("비밀번호를 확인해주세요");
		    }
		    if (isNameDuplicate) {
		      alert("이름이 중복됩니다");
		    }
		  }
		});
	
	function validateForm() {
		  var isPwMatched = $('.userPw').val() == $('.confirmPw').val();
		  if (isPwMatched && !isNameDuplicate) {
			  event.preventDefault();
		  } else {
			  event.preventDefault();
		  }
		}

		$('#editSubmitBtn').click(function() {
			console.log("하이")
			var errorMessageTitle = "회원정보 수정에 실패했습니다.\n\n원인:\n";
			var errorMessage = "";
			
			if ($('.userPw').val() != $('.confirmPw').val()) {
			  errorMessage += "비밀번호 형식에 맞지 않거나, 검증에 실패했습니다.\n";
			}
			
			if (isNameDuplicate) {
			  errorMessage += "사용 불가능한 닉네임이거나, 이미 사용중인 닉네임입니다.\n";
			}
			
			if (!isAuthNumVerified){
			  errorMessage += "이메일 인증이 완료되지 않았습니다.\n";
			}

			if (errorMessage) { // 에러 메시지가 있는 경우
			  alert(errorMessageTitle + errorMessage);
			  event.preventDefault(); // form 전송 이벤트 중지
			} else {
			  $('#editSubmitBtn').prop("disabled", false);
			  alert("변경 사항이 저장되었습니다.");
			}
	});

	// 파일을 업로드 해야만 변경 버튼이 노출
	var originalImage = $("#preview").attr("src");

	$("#imageFile").change(function() {
		$("#submitBtn").show();
		$("#submitCancelBtn").show();
		$("#submitCancelBtn").on("click", function() {
			$("#submitBtn").hide();
			$("#imageFile").val("");
			$("#preview").attr("src", originalImage);
			$("#submitCancelBtn").hide();
		});
	});

	// 업로드 파일 미리보기
	$("#imageFile").on("change", function(event) {
		var file = event.target.files[0];
		var reader = new FileReader();

		reader.onload = function(e) {
			$("#preview").attr("src", e.target.result);
		}
		reader.readAsDataURL(file);
	});

	// 파일 유무 검증 후 전송
	$('#fileUploadForm').submit(function(e) {
		e.preventDefault();

		var fileInput = document.getElementById('imageFile');
		if (!fileInput.value) {
			alert('변경할 프로필 사진을 추가해주세요.');
			return false;
		}

		var formData = new FormData($(this)[0]);

		$.ajax({
			url : $(this).attr('action'),
			type : $(this).attr('method'),
			data : formData,
			async : false,
			cache : false,
			contentType : false,
			processData : false,
			success : function(data) {
				$("#submitBtn").hide();
				$("#submitCancelBtn").hide();
				alert("프로필 사진이 변경되었습니다.");
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("프로필 사진 변경에 실패했습니다.");
			}
		});
		return false;
	});
	
	$(function() {
		// 뒤로가기 버튼
		$(".btn__cancel").click(function() {
			history.back();
		});

		// 회원가입 버튼
		$(".btn__sign-up").click(function() {
			$(location).attr("href", "/member/sign-up");
		});

		// 하단 팝업
		$(".pop-up__bottom").show(function() {
			$(this).delay(700).fadeOut(2000);
		});

		$(".imgModBtn").on("click", function() {
			var file = $("#file").val();
			if (file == "") {
				alert("파일을 선택해주세요.");
				return;
			}
			$("#userImageForm").submit();
		});
	});
	
});