<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="${path}/resources/support/faq.css" />
<meta charset="UTF-8">
<title>리뷰어스 - 고객센터</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">

	<div class="faq-write-container">
		<div class="faq-write-form-container">
			<div class="faq-write-main-title-wrap">
				<div class="faq-write-main-title">자주 묻는 질문 - 작성</div>
			</div>
		<form action="/support/faq/write" method="post">
			<input type="hidden" name="writer" value="${User.nickname}">
			<input type="hidden" name="writerId" value="${User.userId}">
			<div class="faq-write-content-container">
				<div class="faq-write-subject-wrap">
					<div class="faq-write-subject-title">분류</div>
					<select name="subject" class="faq-write-select">
						<option value="">선택해주세요.</option>
						<option value="account">계정관련</option>
						<option value="service">서비스 이용</option>
						<option value="system">시스템 장애</option>
						<option value="regulation">운영정책</option>
						<option value="etc">기타</option>
					</select>
				</div>
				<div class="faq-write-title-wrap">
					<div class="faq-write-title">제목</div>
					<input name="title" type="text" placeholder="제목을 입력해주세요.">
				</div>
				<div class="faq-write-content-wrap">
					<div class="faq-write-content-title">내용</div>
					<textarea name="content" placeholder="내용을 입력해주세요."></textarea>
				</div>
				<div class="faq-form-write-btn-wrap">
					<button class="faq-btn faq-cancel-btn">취소</button>
					<button class="faq-btn faq-submit-btn" type="submit">작성하기</button>
				</div>
			</div>
		</form>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(document).ready(function() {
		  $('.faq-submit-btn').click(function() {
		    var category = $('.faq-write-select').val();
		    var title = $('input[name=title]').val();
		    var content = $('textarea[name=content]').val();
		    
		    if (category === '') {
		      alert('분류을 선택해주세요.');
		      return false;
		    }
		    
		    if (title === '') {
		      alert('제목을 입력해주세요.');
		      return false;
		    }
		    
		    if (content === '') {
		      alert('내용을 입력해주세요.');
		      return false;
		    }
		  });
		  
		  $('.faq-cancel-btn').click(function() {
			    window.history.back();
			  });
		});
	</script>
</body>
</html>