/**
 * 
 */

	$(document).ready(function() {
		//id,비밀번호,별명 중복
		$("#frm").submit(function() {
			
			if ($('input[name=idChk]').val() === 'invalid') {
				alert("id가 중복되었거나 중복 체크하지 않았습니다.");
				return false;
			}
			if ($('input[name=password]').val() != $('input[name=password2]').val()) {
				
				alert("비밀번호가 서로 다릅니다");
				return false;
			}
			
			if ($('input[name=nickName]').val() === 'invalid') {
				alert("별명이 중복되었거나 중복 체크하지 않았습니다.");
				return false;
			}
			
			if ($('input[name=emilChk]').val() === 'invalid') {
				alert("이메일 인증이 완료되지 않았습니다");
				return false;
			}
		});
		
		$("input[name='UserId']").on("change", function(e) {
			$('input[name=idChk]').val("invalid");
		
		});//id 값이 변경될떄마다 중복체크
		
		$("input[name=nickName]").on("change", function(e) {
			
			$('input[name=nickName]').val("invalid");
		});//id 값이 변경될떄마다 중복체크
		
		$("#idCheck").on("click", function(e) {
			e.preventDefault(); //form태그안의 있는 버튼이라 그냥 submit되는거 방지
			const $resultMsg = $('#id-check-warn');
			console.log($("input[name='UserId']").val());
			
			$.ajax({
				url : "checkID.do",
				data : {
					"UserId" : $("input[name='UserId']").val()
				},
				success : function(data) {
					if (data === 1) {
						
						$resultMsg.html('아이디가 중복됩니다');
						$resultMsg.css('color','red');
						$('input[name=idChk]').val("invalid");
						
					} else {
						$resultMsg.html('사용가능한 아이디 입니다');
						$resultMsg.css('color','green');
						$('input[name=idChk]').val("valid");
						$("input[name='UserId']").attr('readonly',true);
						console.log(data);
					}
				},
				error : function(req, status, err) {
					console.log(req);
				}
			}); //ajax
		});// idCheck
		
		$("#nickNameCheck").on("click", function(e) {
			e.preventDefault(); //form태그안의 있는 버튼이라 그냥 submit되는거 방지
			const $resultMsg = $('#nickName-check-warn');
			$.ajax({
				url : "checkNickName.do",
				data : {
					"nickname" : $("input[name='nickname']").val()
				},
				success : function(data) {
					if (data === 1) {
						$resultMsg.html('별명이 중복됩니다');
						$resultMsg.css('color','red');
						$('input[name=nickName]').val("invalid");
					} else {
						$resultMsg.html('사용가능한 별명입니다');
						$resultMsg.css('color','green');
						$('input[name=nickName]').val("valid");
						$("input[name='nickname']").attr('readonly',true);
					}
				},
				error : function(req, status, err) {
					console.log(req);
				}
			}); //ajax
		});// nickName
		
		$('#mail-Check-Btn').click(function() {
			const eamil = $('#email').val(); // 이메일 주소값 얻어오기!
			console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
			const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
			
			$.ajax({
				type : 'get',
				url : 'emailCheck.do?email='+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
				success : function (data) {
					
					checkInput.attr('disabled',false);
					code =data;
					alert('인증번호가 전송되었습니다.')
				}			
			}); // end ajax
		}); // end send eamil
		// 인증번호 비교 
		// blur -> focus가 벗어나는 경우 발생
		$('.mail-check-input').blur(function () {
			const inputCode = $(this).val();
			const $resultMsg = $('#mail-check-warn');
		
			if(inputCode === code){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#mail-Check-Btn').attr('disabled',true);
				$('#email').attr('readonly',true);
				$('#email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				$('input[name=emilChk]').val("valid");
		        
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
		
		$('.userpw2').blur(function () {
			const $password1 = $('.userpw');
			const $password2 = $('.userpw2');
			const $resultMsg = $('#pw-check-warn');
				console.log($password1.val());
			if( $password1.val()  === $password2.val()){
				$resultMsg.html('비밀번호가 일치합니다.');
				$resultMsg.css('color','green');
				
				
		        
			}else {
				console.log( $password1.val() );
				console.log( $password2.val() );
				$resultMsg.html('비밀번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
		
	}); //ready