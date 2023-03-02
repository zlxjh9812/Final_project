<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mypage--main-container {
	display: flex;
	align-items: center;
	justify-content: space-around;
	text-align: center;
}

.myhome--myact__wrap {
	align-items: center;
	width: 180px;
	height: 200px;
	border: 1px solid silver;
}

.myact--title {
	margin-top: 40px;
}

.myact {
	margin-top: 40px;
}

.category-title {
	display: flex;
	margin: 0 auto;
	width: 1200px;
	padding-top: 60px;
}
</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<title>리뷰어스 - 마이페이지</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">
	<div class="mypage-container">
		<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />
		<div class="mypage-content">
			<div class="mypage-edit-container">
				<div class="basic-info">
					<div class="mypage--main-container">
						<div class="myhome--myact__wrap">
							<div class="myact--title">좋아요 누른 컨텐츠</div>
							<div class="myact mycount__favorate">0</div>
						</div>
						<div class="myhome--myact__wrap">
							<div class="myact--title">내가 쓴 리뷰</div>
							<div class="myact mycount__count">0</div>
						</div>
						<div class="myhome--myact__wrap">
							<div class="myact--title">내가 평가한 컨텐츠</div>
							<div class="myact mycount__count">0</div>
						</div>
					</div>
				</div>
				<div class="basic-info">좋아요 누른 컨텐츠</div>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>