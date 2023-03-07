<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mypage/mycontents.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/mypage/mycontents.css">
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
				<div class="myfavorite-title">나의 관심 컨텐츠</div>
				<div class="basic-info">
					<div class="mycontent-select-container">
						<div class="mycontent-select-all searchType-empty">전체</div>
						<div class="mycontent-select-movie searchType-movie">영화</div>
						<div class="mycontent-select-tv searchType-tv">TV</div>
					</div>
					<form id="search-form" method="get" action="/mypage/myfavorite">
						<input type="hidden" name="page" value="1">
						<input type="hidden" name="perPageNum" value="16">
						<input type="hidden" name="searchType" value="">
						<input type="hidden" name="keyword" value="">
					</form>
					<div class="mycontents-container">
						<c:if test="${empty detailList}">
							<div class="mycontents-empty-container">
								<div class="mycontents-empty-text">컨텐츠가 존재하지 않습니다.</div>
							</div>
						</c:if>
						<ul class="mycontents-poster-list">
							<c:forEach items="${detailList}" var="detail">
								<li class="mycontents-poster-item"><a href="<c:url value='/ContentsDetail.do?type=${detail.contents_type}&id=${detail.contents_num}' />">
								<img class="mycontents-poster" src="${detail.poster_path}"></a><div class="mycontents-poster-title">${detail.title}</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- 페이징 -->
					<div class="page-container">
						<c:if test="${pageMaker.prev}">
							<a class="page-group-btn" href="/mypage/myfavorite?page=${pageMaker.startPage - 1}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"> <i class="fa-solid fa-chevron-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
							<c:choose>
								<c:when test="${page eq searchCriteria.page}">
									<a class="currentPage">${page}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/mypage/myfavorite?page=${page}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a class="page-group-btn" href="/mypage/myfavorite?page=${pageMaker.endPage + 1}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"><i class="fa-solid fa-chevron-right"></i></a>
						</c:if>
					</div>
					<!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>