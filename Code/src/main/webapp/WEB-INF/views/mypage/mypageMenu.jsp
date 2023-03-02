<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mypage/mypage.js"></script>
<title>Insert title here</title>
</head>
<body>${pageContext.servletContext.contextPath}
	<div class="mypage-menu">
		<div class="mypage-menu__info">
			<div class="profile-img-wrap">
				<c:choose>
					<c:when test="${User.profileImg != null}">
						<div class="image-container">
							<img src="${User.profileImg}" id="preview" class="profile-img"> <label for="imageFile" class="file-label" id="file-label"><i class="fas fa-camera"></i></label>
						</div>
					</c:when>
					<c:otherwise>
						<div class="image-container">
							<img src="/resources/assets/img/blankUserImg.png" id="preview" class="profile-img"> <label for="imageFile" class="file-label" id="file-label"><i class="fas fa-camera"></i></label>
						</div>
					</c:otherwise>
				</c:choose>
				<form id="fileUploadForm" action="/mypage/mypicture-upload" method="post" enctype="multipart/form-data">
					<input type="file" name="uploadFile" id="imageFile" class="file-input">
					<button type="submit" class="fileUpload-btn" id="submitBtn">변경</button>
					<button type="button" class="fileUpload-cancel-btn" id="submitCancelBtn">취소</button>
				</form>
			</div>
			<div class="profile-info-wrap">
				<div class="profile-info__name">${User.nickname}</div>
				<div class="profile-info__id">(${User.userId})</div>
			</div>
		</div>
		<div class="mypage-menu__list">
			<a id="mypage" href="/mypage">마이페이지 홈</a>
			<a id="edit" href="/mypage/edit">회원정보수정</a>
			<div class="myactive-dropdown">
				<a href="#" class="myactive-dropdown-toggle">나의 활동 <i class="fa fa-plus"></i> <i class="fa fa-minus"></i>
				</a>
				<ul class="myactive-dropdown-list">
					<li><a id="myfavorate" href="#">나의 관심 컨텐츠</a></li>
					<li><a id="mypost" href="#">내가 쓴 게시물</a></li>
					<li><a id="mycomment" href="#">내가 쓴 댓글</a></li>
				</ul>
			</div>
			<a id="myqna" href="/support/qna">1:1 문의 내역</a>
			<form action="/logout.do" id="logout-form" method="post">
				<a onclick="document.getElementById('logout-form').submit();">로그아웃</a>
			</form>
		</div>
	</div>
</body>
</html>