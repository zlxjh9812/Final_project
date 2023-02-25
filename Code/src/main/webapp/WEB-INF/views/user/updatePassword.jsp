<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 회원가입 폼 따기</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>

<link href="<c:url value="/resources/findId.css" />" rel="stylesheet">

<script type="text/javascript" src="<c:url value = "/resources/FindPassword.js" />"></script>
</head>
<body>
<script type="text/javascript">

</script>
<form action="updatePassword.do" class="validation-form" id="frm" method = "post">
<div class="member">
       <!-- 1. 로고 -->
        <h1>#REVIEWERS</h1>

  
     	<div class="field tel-number">
            <b>아이디</b>
           
            <input type="text" placeholder="아이디를 입력하세요" id = "UserId" name = "UserId">
        </div>

        <div class="field tel-number">
            <b>휴대전화</b>
           
            <input type="number" placeholder="전화번호 입력하세요" id = "tel" name = "tel">
        </div>
       
        <div class="field tel-number">
            <b>이메일</b>
            
            <div>
                <input type="email" placeholder="이메일 입력"  name="email" id="email">
                <input type="button" value="인증번호 받기" id="mail-Check-Btn">
            </div>
            <input type="number" placeholder="인증번호를 입력하세요" class = " mail-check-input" disabled="disabled" maxlength="6">
            <span id="mail-check-warn"></span>
        </div>

        <!-- 5. 이메일_전화번호 -->
        
    	   <div class="field">
            <b>비밀번호</b>
            <input class="userpw" type="password" id="password" name = "password" disabled="disabled">
        </div>
        
        <div class="field">
            <b>비밀번호 재확인</b>
            <input class="userpw2" type="password" id="password2" name = "password2" disabled="disabled">
              <span id="pw-check-warn"></span>
        </div>

        <!-- 6. 가입하기 버튼 -->
         <input type="submit" value="비밀번호 재 설정" id="joinbutton">
        <!-- 7. 푸터 -->
        <div class="member-footer">
            <div>
                <a href="#none">이용약관</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
                <a href="#none">업데이트예정</a>
            </div>
            <span><a href="#none">REVIEWERS TEAM</a></span>
        </div>
    </div>

	
	<input type="hidden" name="emilChk" value="invalid" />
</form>


</body>
</html>