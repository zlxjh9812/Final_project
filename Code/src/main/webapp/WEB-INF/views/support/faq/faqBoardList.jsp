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
<div class="faq-container">
		<div class="faq-title-container">
			<div class="faq-title faq-title-main d-none d-lg-block">리뷰어스 고객지원</div>
			<div class="faq-title">궁금하신 사항을 검색해보세요.</div>
			<div class="search-bar">
				<form class="faq-search-form" action="#">
					<select class="faq-select" name="searchType">
						<option value="tc" class="faq-option"
							<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>
							selected>전체</option>
						<option value="t" class="faq-option"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c" class="faq-option"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					</select> <input class="faq-search-bar" placeholder="검색어를 입력해주세요."
						type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}">
				</form>
			</div>
		</div>
		<div class="faq-main-container">
			<div class="faq-main__contents">
				<div class="faq-menu-wrap">
					<div class="faq-menu-top">
						<div class="faq-menu-btn" id="searchType-faq-all">전체</div>
						<div class="faq-menu-btn" id="searchType-faq-account">계정관련</div>
						<div class="faq-menu-btn" id="searchType-faq-service">서비스 이용</div>
					</div>
					<div class="faq-menu-bottom">
						<div class="faq-menu-btn" id="searchType-faq-system">시스템 장애</div>
						<div class="faq-menu-btn" id="searchType-faq-regulation">운영정책</div>
						<div class="faq-menu-btn" id="searchType-faq-etc">기타</div>
					</div>
				</div>
				<c:if test="${user.role eq '관리자'}">
					<div class="faq-write-btn-wrap">
						<button class="faq-write-btn" type="button" onclick="location.href='/support/faq/write'">FAQ 작성</button>
					</div>
				</c:if>
				<dl class="faq-board">
					<c:forEach var="board" items="${boardList}">
						<dt class="accordion">
						<c:choose>
						  <c:when test="${board.subject eq 'account'}">
						    <c:set var="subject" value="계정관련" />
						  </c:when>
						  <c:when test="${board.subject eq 'service'}">
						    <c:set var="subject" value="서비스 이용" />
						  </c:when>
						  <c:when test="${board.subject eq 'system'}">
						    <c:set var="subject" value="시스템 장애" />
						  </c:when>
						  <c:when test="${board.subject eq 'regulation'}">
						    <c:set var="subject" value="운영정책" />
						  </c:when>
						  <c:otherwise>
						    <c:set var="subject" value="기타" />
						  </c:otherwise>
						</c:choose>
							<span class="quetion-logo">Q</span> <span class="preface">${subject}</span> <span class="title"><c:out value="${board.title}" /></span>
						</dt>
						<dd class="panel">
							<div class="faq-content-box">
								<c:out value="${board.content}" />
							</div>
							<div class="faq-submenu-container">
								<i class="fa-solid fa-eraser faq-edit-btn" onclick="location.href='/support/faq/${board.boardId}/edit'"></i>
								<i id="faq-board-delete-btn" class="fa-regular fa-trash-can" data-board-id="${board.boardId}"></i>
							</div>
						</dd>
					</c:forEach>
				</dl>
				<!-- 페이징 -->
				<div class="page-container">
					<c:if test="${pageMaker.prev}">
						<a class="page-group-btn" href="/support/faq?page=${pageMaker.startPage - 1}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"> <i class="fa-solid fa-chevron-left"></i>
						</a>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="page">
						<c:choose>
							<c:when test="${page eq searchCriteria.page}">
								<a class="currentPage">${page}</a>
							</c:when>
							<c:otherwise>
								<a class="page-link" href="/support/faq?page=${page}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}">${page}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<a class="page-group-btn" href="/support/faq?page=${pageMaker.endPage + 1}&perPageNum=${searchCriteria.perPageNum}&searchType=${searchCriteria.searchType}&keyword=${searchCriteria.keyword}"><i class="fa-solid fa-chevron-right"></i></a>
					</c:if>
				</div>
				<!-- 페이징 끝 -->
			</div>
		</div>
		<div class="faq-footer">
			<div class="faq-title">찾으시는 내용이 없으신가요?</div>
			<div class="faq-title">자세한 내용을 함께 보내주시면 신속히 답변드리겠습니다.</div>
			<button class="qna-link-btn">1:1 문의하기</button>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<!-- 아코디언 효과 -->
	<script>
		var acc = document.getElementsByClassName("accordion");
		for (var i = 0; i < acc.length; i++) {
			acc[i].addEventListener("click", function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			});
		}
	</script>
	<script>
	$('#searchType-faq-all, #searchType-faq-account, #searchType-faq-service, #searchType-faq-system, #searchType-faq-regulation, #searchType-faq-etc').click(function() {
		  const searchType = $(this).attr('id').split('-')[2];
		  const keyword = searchType === 'all' ? '' : $(this).attr('id').split('-')[2];
		  console.log(keyword);
		  const url = `/support/faq?page=1&perPageNum=10&searchType=subject&keyword=` + keyword;
		  window.location.href = url;
		});
	
	$(function() {
		var keyword = getUrlParameter('keyword');
		if (keyword === '') {
			$('.mycontent-select-all').css('color', 'white').css('background-color', 'coral');
		} else if (keyword === 'movie') {
			$('.mycontent-select-movie').css('color', 'white').css('background-color', 'coral');
		} else if (keyword === 'tv') {
			$('.mycontent-select-tv').css('color', 'white').css('background-color', 'coral');
		}
	});
	
	function getUrlParameter(name) {
		  name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
		  var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
		  var results = regex.exec(location.search);
		  return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
		};
	
	$(function() {
		  const searchType = getUrlParameter('searchType');
		  const keyword = getUrlParameter('keyword');
		  
		  if (searchType === 'subject') {
		    if (keyword === 'all' || keyword === '' || keyword === null) {
		      $('#searchType-faq-all').css({'background-color': 'coral', 'color': 'white'});
		    } else if (keyword === 'account') {
		      $('#searchType-faq-account').css({'background-color': 'coral', 'color': 'white'});
		    } else if (keyword === 'service') {
		      $('#searchType-faq-service').css({'background-color': 'coral', 'color': 'white'});
		    } else if (keyword === 'system') {
		      $('#searchType-faq-system').css({'background-color': 'coral', 'color': 'white'});
		    } else if (keyword === 'regulation') {
		      $('#searchType-faq-regulation').css({'background-color': 'coral', 'color': 'white'});
		    } else if (keyword === 'etc') {
		    $('#searchType-faq-etc').css({'background-color': 'coral', 'color': 'white'});
		    } else {
		    	$('#searchType-faq-all').css({'background-color': 'coral', 'color': 'white'});
		    }
		  } else {
		    	$('#searchType-faq-all').css({'background-color': 'coral', 'color': 'white'});
		    }
		});
	
	$(function(){
	 	$("#faq-board-delete-btn").on("click", function() {
		    var boardId = $(this).data("board-id");
		    if (confirm("정말로 삭제하시겠습니까?")) {
		        $.ajax({
		            url: "/support/faq/" + boardId + "/delete",
		            method: "POST",
		            success: function(response) {
		                location.reload();
		            },
		            error: function(xhr, status, error) {
		                alert("서버와 통신에 실패했습니다.");
		            }
		        });
		    }
		});
	})
	</script>
</body>
</html>