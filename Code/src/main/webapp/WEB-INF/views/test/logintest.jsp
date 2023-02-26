

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="google-client_id" content="585825444581-ma3pfcguq60016nmeqggno0kk1u3diol.apps.googleusercontent.com">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function onSignIn(){
	var auth2 = gapi.auth2.getAuthInstance()
	if(auth2.isSignedIn.get()){
	 var profile = auth2.currentUser.get().getBasicProfile();
	 	googleLoginPro(profile)
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
}
</script>
  <a class="btn btn-google" id="googleBtn" onclick = "onSignIn()"><img style="width:190px" class="google" >구글</a>
  
  <script>
		$(".login_button").click(function() {
			/* 로그인 메서드 서버 요청 */
			$("#login_form").attr("action", "login");
			$("#login_form").submit();
		});
		
		const onClickGoogleLogin = (e) => {
			window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?client_id=585825444581-ma3pfcguq60016nmeqggno0kk1u3diol.apps.googleusercontent.com&redirect_uri=http://localhost:8000/biz/login/googel/auth&response_type=code&scope=email%20profile%20openid&access_type=offline")
		}
		
		const googleBtn = document.getElementById("googleBtn");
		googleBtn.addEventListener("click",onClickGoogleLogin);
		
		const onClickNaverLogin = (e) => {
			window.location.replace("https://nid.naver.com/oauth2.0/authorize?client_id=GF2vmLo7gThkjpDqkTMs&redirect_uri=http://localhost:9090/project/login/naver/auth&response_type=code&state=9kgsGTfH4j7IyAkg&scope=email%20profile%20openid&access_type=offline")
		}
		
		const naverBtn = document.getElementById("naverBtn");
		naverBtn.addEventListener("click",onClickNaverLogin);
		
		const onClickKakaoLogin = (e) => {
			window.location.replace("https://kauth.kakao.com/oauth/authorize?client_id=c2d7dca68a4ebec26ef05bbb1502fd2d&redirect_uri=http://localhost:9090/project/login/kakao/auth&response_type=code")
		}
		
		const kakaoBtn = document.getElementById("kakaoBtn");
		kakaoBtn.addEventListener("click",onClickKakaoLogin);
	</script>
</body>
</html>