<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mycontents.css">
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
				<div class="basic-info mycurrent-container-border">
					<div class="mypage--main-container">
						<div class="myhome--myact__wrap myhome--myact__review">
							<div><i class="fa-regular fa-pen-to-square"></i></div>
							<div class="myact--title">내가 쓴 리뷰</div>
							<a href="/mypage/myreview" class="myact mycount__count">${countInfo.countAllMyReview}</a>
						</div>
						<div class="myhome--myact__wrap myhome--myact__favorite">
							<div><i class="fa-solid fa-heart"></i></div>
							<div class="myact--title">나의 관심 컨텐츠</div>
							<a href="/mypage/myfavorite" class="myact mycount__count">${countInfo.countAllMyLike}</a>
						</div>
						<div class="myhome--myact__wrap myhome--myact__star">
							<div><i class="fa-solid fa-star"></i></div>
							<div class="myact--title">내가 평가한 컨텐츠</div>
							<a href="/mypage/mystar" class="myact mycount__count">${countInfo.countAllMyStar}</a>
						</div>
					</div>
				</div>
				<div class="basic-info mycurrent-container-border">
					<div class="mycurrent-contents-title-container">
						<div class="mycurrent-contents-title">최근 작성한 리뷰</div>
						<div class="mycurrent-contents-title-more"><a href="/mypage/myreview">전체보기<i class="fa-solid fa-square-plus"></i></a></div>
					</div>
					<c:if test="${empty reviewDetailList}">
						<div class="recent-content-empty">
							<div class="recent-content-empty-text">작성한 리뷰가 존재하지 않습니다.</div>
						</div>
					</c:if>
					<ul class="mycurrent-contents-poster-list">
						<c:forEach items="${reviewDetailList}" var="reviewDetail" varStatus="status">
							<li class="mycontents-poster-item mycurrent-contents-card" data-bseq="${myReviewList[status.index].getBseq()}">
								<c:if test="${reviewDetail.poster_path == null or reviewDetail.poster_path == ''}">
								  <img class="mycontents-poster" src="/resources/images/blankThumbnail.png">
								</c:if>
								<a href="<c:url value='/ContentsDetail.do?type=${reviewDetail.contents_type}&id=${reviewDetail.contents_num}' />">
									<c:if test="${not empty reviewDetail.poster_path}">
									  <img class="mycontents-poster" src="${reviewDetail.poster_path}">
									</c:if>
								</a>
								<div class="mycurrentcontents-poster-title">${reviewDetail.title}</div>
								<div class="mycurrent-review-mycontent">${myReviewList[status.index].getContent()}</div>
								<div class="mycurrent-review-footer-container">
								<div class="mycurrent-review-footer-left">
									<div class="mycurrent-review-footer-like-wrap">
										<c:set var="totalLike" value="${myReviewList[status.index].getLike_num() - myReviewList[status.index].getUnlike_num()}"/>
										<c:choose>
										  <c:when test="${totalLike lt 0}">
										    <div class="myreview-footer-dislike"><i class="fa-solid fa-thumbs-down myreview-thumbdown"></i>${totalLike}</div>
										  </c:when>
										  <c:otherwise>
										    <div class="myreview-footer-like"><i class="fa-solid fa-thumbs-up myreview-thumbup"></i>${totalLike}</div>
										  </c:otherwise>
										</c:choose>
										<div class="mycurrent-review-footer-views"><i class="fa-solid fa-eye mycurrentreview-views"></i>${myReviewList[status.index].getCnt()}</div>
									</div>
								</div>
								<div class="mycurrent-review-footer-right">
									<c:set var="dateString" value="${myReviewList[status.index].getWritedate()}" />
									<fmt:parseDate value="${dateString}" var="date" pattern="yyyy-MM-dd" />
									<script>
											  var now = new Date();
											  // 표시할 날짜 구하기
											  var dateString = "${dateString}";
											  var date = new Date(dateString);
											  var timeDiff = now.getTime() - date.getTime();
											  var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
											  if (daysDiff == 0) {
											    var formattedDate = "오늘";
											  } else if (daysDiff == 1) {
											    var formattedDate = "어제";
											  } else if (daysDiff < 4) {
											    var formattedDate = daysDiff + "일 전";
											  } else {
											    var year = date.getFullYear().toString().slice(-2);
											    var month = ("0" + (date.getMonth() + 1)).slice(-2);
											    var day = ("0" + date.getDate()).slice(-2);
											    var formattedDate = year + "." + month + "." + day;
											  }
											  document.write(formattedDate);
									</script>
								</div>
							</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="basic-info mycurrent-container-border">
					<div class="mycurrent-contents-title-container">
						<div class="mycurrent-contents-title">최근 관심있는 컨텐츠</div>
						<div class="mycurrent-contents-title-more"><a href="/mypage/myfavorite">전체보기<i class="fa-solid fa-square-plus"></i></a></div>
					</div>
					<c:if test="${empty detailList}">
						<div class="recent-content-empty">
							<div class="recent-content-empty-text">관심있는 컨텐츠가 존재하지 않습니다.</div>
						</div>
					</c:if>
					<ul class="mycurrent-contents-poster-list">
						<c:forEach items="${detailList}" var="detail">
							<li class="mycontents-poster-item"><a href="<c:url value='/ContentsDetail.do?type=${detail.contents_type}&id=${detail.contents_num}' />"> <img class="mycontents-poster" src="${detail.poster_path}"></a>
							<div class="mycurrentcontents-poster-title">${detail.title}</div></li>
						</c:forEach>
					</ul>
				</div>
				<div class="basic-info mycurrent-container-border">
					<div class="mycurrent-contents-title-container">
						<div class="mycurrent-contents-title">최근 평가한 컨텐츠</div>
						<div class="mycurrent-contents-title-more"><a href="/mypage/mystar">전체보기<i class="fa-solid fa-square-plus"></i></a></div>
					</div>
					<c:if test="${empty starDetailList}">
						<div class="recent-content-empty">
							<div class="recent-content-empty-text">평가한 컨텐츠가 존재하지 않습니다.</div>
						</div>
					</c:if>
					<ul class="mycurrent-contents-poster-list">
						<c:forEach items="${starDetailList}" var="starDetail" varStatus="status">
							<li class="mycontents-poster-item"><a href="<c:url value='/ContentsDetail.do?type=${starDetail.contents_type}&id=${starDetail.contents_num}' />"> <img class="mycontents-poster" src="${starDetail.poster_path}"></a>
							<div class="mycurrentcontents-poster-title">${starDetail.title}</div>
							<div class="mycurrentcontents-stars"><i class="fa-solid fa-star mycontents-star"></i>${myStarList[status.index].getStar()}</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(function() {
	  $('.mycurrent-contents-card').on('click', function() {
	    const bseq = $(this).data('bseq');
	    window.location.href = `/getBoard.do?bseq=` + bseq;
	  });
	});
</script>
</body>
</html>