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
<script>
$(function() {
	  $('.myreview-list-container').on('click', function() {
	    const bseq = $(this).data('bseq');
	    window.location.href = `/getBoard.do?bseq=` + bseq;
	  });
	});
</script>
<title>리뷰어스 - 나의 리뷰</title>
<style>
	.myreview-poster-img {
		width: 120px;
		border-radius: 0px;
	}
	
	.myreview-list-container{
		display: flex;
		padding: 20px;
		border-bottom: 1px solid silver;
	}
	
	.myreview-list-container:hover{
		background-color: rgb(235, 235, 235);
		cursor: pointer;
	}
	
	.myreview-title{
		font-size: 24px;
		font-weight: 600;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 200px;
	}
	
	.myreview-footer-container{
		display: flex;
		justify-content: space-between;
		height: 20%;
	}
	
	.myreview-footer-like-wrap{
		display: flex;
	}
	
	.myreview-footer-like-wrap i {
		margin-right: 2px;
	}
	
	.myreview-footer-right{
		display: flex;
		color: grey;
	}
	
	.myreview-title-wrap {
		height: 20%;
		margin: -5px 0px;
	}
	
	.myreview-content-wrap {
		height: 55%;
		padding: 12px 0px;
	}
	
	.myreview-text-container{
		width: 100%;
		padding: 0px 20px;
	}
	
	.myreview-footer-views, .myreview-footer-like, .myreview-footer-dislike{
		margin: 0px 5px;
	}
	
	.myreview-thumbup{
		color: rgb(37, 161, 214);;
	}
	.myreview-thumbdown{
		color: rgb(241, 0, 0);
	}
	
	.myreview-views{
		color: grey;
	}
	
	.myreview-genre{
		color: grey;
		font-size: 16px;
	}
	
	.myreview-dot{
		margin: 0px 5px;
	}
	
	.myreview-content-textarea{
	  width: 600px;
	  display: -webkit-box;
	  -webkit-box-orient: vertical;
	  -webkit-line-clamp: 3;
	  overflow: hidden;
	  text-overflow: ellipsis;
	}
	
	.myreview-main-container{
	  height: 860px;
	  overflow: auto;
	}
	
	.myreview-basic-info{
		margin: 0px !important;
		padding: 30px 20px !important;
		border-top: 2px solid coral;
		border-bottom: 2px solid coral;
	}
	
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">
	<div class="mypage-container">
		<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />
		<div class="mypage-content">
			<div class="mypage-edit-container">
				<div class="myfavorite-title">내가 작성한 리뷰</div>
				<div class="myreview-basic-info">
					<div class="myreview-main-container">
						<c:if test="${empty detailList}">
							<div class="mycontents-empty-container">
								<div class="mycontents-empty-text">컨텐츠가 존재하지 않습니다.</div>
							</div>
						</c:if>
						<c:forEach items="${detailList}" var="detail" varStatus="status">
						<div class="myreview-list-container" data-bseq="${myReviewList[status.index].getBseq()}">
							<div class="myreview-poster-img-wrap">
								<c:if test="${detail.poster_path == null or detail.poster_path == ''}">
								  <img id="myreview-poster-img" class="myreview-poster-img" src="/resources/images/blankThumbnail.png">
								</c:if>
								<c:if test="${not empty detail.poster_path}">
								  <img id="myreview-poster-img" class="myreview-poster-img" src="${detail.poster_path}">
								</c:if>
							</div>
							<div class="myreview-text-container">
								<div class="myreview-title-wrap">
									<div class="myreview-title">${detail.title}</div>
								</div>
								<div class="myreview-genre-wrap">
									<div class="myreview-genre">${detail.genre}</div>
								</div>
								<div class="myreview-content-wrap">
									<div class="myreview-content-textarea">${myReviewList[status.index].getContent()}</div>
								</div>
								<div class="myreview-footer-container">
									<div class="myreview-footer-left">
										<div class="myreview-footer-like-wrap">
											<div class="myreview-footer-views"><i class="fa-solid fa-eye myreview-views"></i>${myReviewList[status.index].getCnt()}</div>
											<c:set var="totalLike" value="${myReviewList[status.index].getLike_num() - myReviewList[status.index].getUnlike_num()}"/>
											<c:choose>
											  <c:when test="${totalLike lt 0}">
											    <div class="myreview-footer-dislike"><i class="fa-solid fa-thumbs-down myreview-thumbdown"></i>${totalLike}</div>
											  </c:when>
											  <c:otherwise>
											    <div class="myreview-footer-like"><i class="fa-solid fa-thumbs-up myreview-thumbup"></i>${totalLike}</div>
											  </c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="myreview-footer-right">
										<div class="myreview-footer-nickname">${myReviewList[status.index].getNickname()}</div>
										<span class="myreview-dot">·</span>
										<div class="myreview-footer-writedate">
											<c:set var="dateString" value="${myReviewList[status.index].getWritedate()}" />
											<fmt:parseDate value="${dateString}" var="date" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${date}" pattern="YYYY-MM-dd" />
										</div>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>
					<!-- 페이징 -->
					<div class="page-container">
						<c:if test="${pageMaker.prev}">
							<a class="page-group-btn" href="/mypage/mystar?page=${pageMaker.startPage - 1}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"> <i class="fa-solid fa-chevron-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
							<c:choose>
								<c:when test="${page eq searchCriteria.page}">
									<a class="currentPage">${page}</a>
								</c:when>
								<c:otherwise>
									<a class="page-link" href="/mypage/mystar?page=${page}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<a class="page-group-btn" href="/mypage/mystar?page=${pageMaker.endPage + 1}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"><i class="fa-solid fa-chevron-right"></i></a>
						</c:if>
					</div>
					<!-- 페이징 끝 -->
				</div>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(document).ready(function() {
		  const img = $("#myreview-poster-img");
		  if (!img.attr("src")) {
		    img.attr("src", "/resources/img/blankThumbnail.png");
		  }
		});
	</script>
</body>
</html>