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

<script type="text/javascript" src="<c:url value = "/resources/Find.js" />"></script>
</head>
<body>
<script type="text/javascript">

</script>
<form action="findId.do" class="validation-form" id="frm" method = "post">
<div class="member">
       <!-- 1. 로고 -->
        <h1>#REVIEWERS</h1>

  
     

        <div class="field tel-number">
        
           <h4 style = "text-align: center;">회원님의 아이디</h4>
            <input type="text" value = "${id }" disabled="disabled">
        </div>
       
       

        <!-- 5. 이메일_전화번호 -->
        
    

        <!-- 6. 가입하기 버튼 -->
         <input type="button" value="메인 패이지로 돌아가기" id="joinbutton" onclick = "location.href='testMovie.do?type=movie'">
        <input type="button" value="비밀번호 찾기" id="joinbutton" onclick = "location.href='updatePasswordGo.do'">
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