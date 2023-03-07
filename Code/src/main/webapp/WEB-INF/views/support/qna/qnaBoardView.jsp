<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.qna-write-btn-container {
	display: flex;
	justify-content: center;
}

.qna-btn {
	background-color: coral;
	border: none;
	color: white;
	border-radius: 8px;
	padding: 10px 14px;
	cursor: pointer;
	margin: 0 5px;
}

.qna-subject {
	display: flex;
}

.qna-title-title, .qna-subject-title {
	width: 80px;
	min-width: 80px;
	font-size: 16px;
	font-weight: 600;
	color: rgba(0, 0, 0, 0.75);
}

.fileIsEmpty {
	font-size: 16px;
	font-weight: 600;
	color: rgba(0, 0, 0, 0.5);
}

.qna-title-title, .qna-content-title {
	margin: 8px 0px;
}

.qna-subject-container select {
	width: 150px;
}

.qna-content-container {
	margin-top: 10px;
}

.qna-fileupload-title, .qna-content-title {
	font-size: 16px;
	font-weight: 600;
	color: rgba(0, 0, 0, 0.75);
}

.qna-title-container, .qna-content-container {
	margin: 16px 0px;
}

.qna-btn__cancel {
	background-color: rgba(160, 160, 160, 1);
	color: white;
}

.qna-title-container {
	margin-bottom: 24px;
}

.qna-subject-container {
	align-items: center;
	display: flex;
}

.qna-title-container input {
	width: 100%;
}

.qna-fileupload-title-container {
	display: flex;
	align-items: center;
	margin-bottom: 12px;
}

.qna-fileupload-title {
	display: flex;
}

.fileupload-preview {
	background-color: rgba(250, 250, 250, 1);
	height: 150px;
}

.qna-content {
	resize: none;
	width: 100%;
	height: 450px;
	padding: 12px;
	border-color: lightgrey;
}

.qna-answer-content-area {
	resize: none;
	width: 100%;
	min-height: 200px;
	padding: 12px;
	border-color: lightgrey;
}

.qna-content:focus {
	outline: none;
}

.qna-fileupload-btn {
	background-color: rgba(45, 152, 240, 1);
	border: none;
	color: white;
	border-radius: 8px;
	margin-left: 8px;
}

.preview-image {
	max-width: 100px;
}

#file-list {
	height: 100%;
	align-items: center;
	display: flex;
	justify-content: center;
}

.myuploadimg {
	width: 100px;
	margin-right: 50px;
}

.qna-answer-title-container, .qna-question-title-container {
	display: flex;
	align-items: center;
	border-bottom: 1px solid silver;
	padding-bottom: 20px;
	padding: 10px;
}

.qna-question-title-container {
	
}

.qna-answer-title {
	font-size: 24px;
	font-weight: 600;
}

.answer-logo-wrap, .question-logo-wrap {
	margin-right: 20px;
}

.answer-logo-wrap i {
	font-size: 48px;
	background-color: rgb(3, 193, 87);
	color: white;
	padding: 15px 22px;
	border-radius: 50%;
	padding: 15px 22px;
}

.question-logo-wrap i {
	font-size: 42px;
	background-color: coral;
	color: white;
	padding: 15px 22px;
	border-radius: 50%;
	padding: 15px 22px;
}

.qna-writer-container {
	
}

.qna-answer-writer-wrap {
	display: flex;
	align-items: center;
	padding: 5px 0px;
}

.qna-answer-writer__role {
	font-size: 16px;
	margin-left: 10px;
	background-color: silver;
	color: white;
	border-radius: 8px;
	padding: 0px 8px;
	margin-left: 10px;
}

.qna-answer-title-subjecet {
	color: coral;
}

.qna-answer-writer__role span {
	
}

.qna-answer-title-wrap {
	display: flex;
	align-items: center;
}

.qna-answer-title-subjecet {
	font-size: 24px;
	font-weight: 600;
	margin-right: 10px;
}

.category-title {
	display: flex;
	margin: 0 auto;
	width: 1200px;
	padding-top: 60px;
}

.user-icon-small-wrap {
	width: 40px;
    height: 38px;
    border-radius: 50%;
    border: 1px solid silver;
    margin-right: 6px;
}

.user-icon-small {
}

.qna-quetion-container{
	background-color: rgb(255,248,242);
}

.qna-answer-container{
	background-color: rgb(240,255,250);
}

.qna-footer-container{
	margin: 10px 0px;
	padding: 10px 0px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.qna-footer-writeDate-wrap{
	display: flex;
	justify-content: center;
}

.qna-iconmenu-container{
	display: flex;
	justify-content: center;
}

.qna-iconmenu-container i {
	margin: 0px 5px;
	font-size: 18px;
	padding: 10px;
	border: 1px solid silver;
	cursor: pointer;
}

.qna-footer-writeDate-title{
	margin-right: 8px;
}

.qna-answer-onclick{
	display: none;
}

.qna-answer-form-btn{
}

</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<style>
</style>
<title>리뷰어스 - 문의하기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<main class="main main-container" id="main">
	<div class="mypage-container">
		<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />
		<div class="mypage-content">
			<div class="mypage-edit-title">1:1 문의하기</div>
			<div class="mypage-edit-container">
				<input type="hidden" name="writer" value="${User.nickname }">
				<input type="hidden" name="writerId" value="${User.userId }">
				<div class="basic-info">
					<div class="qna-quetion-container">
						<div class="qna-question-title-container">
							<div class="question-logo-wrap">
								<i class="fa-solid fa-q"></i>
							</div>
							<div class="qna-writer-container">
								<div class="qna-answer-title-wrap">
									<div class="qna-answer-title-subjecet">[${board.subject}]</div>
									<div class="qna-answer-title">
										<c:out value="${board.title}" />
									</div>
								</div>
								<div class="qna-answer-writer-wrap">
									<div class="user-icon-small-wrap">
                                       <c:choose>
                                          <c:when test="${not empty writerImg}">
                                             <img src="<c:url value="${writerImg }"/>" alt="Profile" class="user-icon-small">
                                          </c:when>
                                          <c:otherwise>
                                             <img src="/resources/assets/img/blankUserImg.png" alt="Default Profile" class="user-icon-small">
                                          </c:otherwise>
                                       </c:choose>
                                    </div>
									<div class="qna-answer-writer__nickname">${board.writer }(${board.writerId })</div>
								</div>
							</div>
						</div>
					</div>
					<div class="qna-content-container">
						<div class="qna-content-title">문의 내용</div>
						<textarea name="content" class="qna-content" readonly><c:out value="${board.content}" /></textarea>
					</div>
					<div class="qna-fileupload-container file-preview-container">
						<div class="qna-fileupload-title-container">
							<div class="qna-fileupload-title">파일 목록</div>
						</div>
						<div class="fileupload-preview">
							<div id="file-list">
								<c:if test="${empty fileUploads}">
									<div class="fileIsEmpty">업로드한 파일이 없습니다.</div>
								</c:if>
								<c:forEach items="${fileUploads}" var="fileUpload">
									<a href="${pageContext.request.contextPath}${fileUpload.filePath}" class="myuploadimg-popup">
									<img src="${pageContext.request.contextPath}${fileUpload.filePath}" class="myuploadimg">
									</a>
								</c:forEach>
							</div>
						</div>
						<div class="qna-footer-container">
							<div class="qna-footer-writeDate-wrap">
								<div class="qna-footer-writeDate-title">작성일</div>
								<div class="qna-footer-writeDate"><fmt:formatDate value="${board.writeDate}" pattern="yy.MM.dd HH:mm" /></div>
							</div>
							<div class="qna-iconmenu-container">
							    <c:if test="${board.writerId eq User.userId}">
							        <i class="fa-solid fa-eraser" title="수정하기" onclick="location.href='/support/qna/${board.boardId}/edit'"></i>
							    </c:if>
							    <c:if test="${board.writerId eq User.userId || User.role eq '관리자'}">
							        <div><i class="fa-regular fa-trash-can delete-qna-board" title="삭제하기" data-board-id="${board.boardId}"></i></div>
							    </c:if>
								<c:if test="${User.role eq '관리자' && board.isAnswered eq 'N'}">
								    <i id="answer-btn" class="fa-regular fa-message" title="답변하기"></i>
								</c:if>
							</div> 
						</div>
					</div>
				</div>
				<div>
					<!-- 답변 영역 -->
							<div class="qna-answer-onclick">
							<div id="answer-box" class="basic-info">
								<div class="qna-answer-container">
									<div class="qna-answer-title-container">
										<div class="answer-logo-wrap">
											<i class="fa-solid fa-a"></i>
										</div>
										<div class="qna-writer-container">
											<div class="qna-answer-title">RE: ${board.title }</div>
											<div class="qna-answer-writer-wrap">
												<div class="qna-answer-writer__nickname">작성자: ${comment.writer }</div>
												<div class="qna-answer-writer__role">
													<span>관리자</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<form action="/support/qna/comment/write" method="post">
									<input type="hidden" id="boardId" name="boardId" value="${board.boardId }">
									<input type="hidden" id="writer" name="writer" value="${User.nickname }">
									<input type="hidden" id="writerId" name="writerId" value="${User.userId }">
									<div class="qna-content-title">답변 내용</div>
									<textarea class="qna-answer-content-area" name="content"></textarea>
									<button class="edit-input-btn qna-answer-form-btn" type="submit">답변하기</button>
								</form>
							</div>
							</div>
							<c:if test="${board.isAnswered == 'Y' && comment.isDeleted != null}">
								<div id="answer-box" class="basic-info">
								<div class="qna-answer-container">
									<div class="qna-answer-title-container">
										<div class="answer-logo-wrap">
											<i class="fa-solid fa-a"></i>
										</div>
										<div class="qna-writer-container">
											<div class="qna-answer-title">RE: ${board.title }</div>
											<div class="qna-answer-writer-wrap">
												<div class="qna-answer-writer__nickname">작성자: ${comment.writer }</div>
												<div class="qna-answer-writer__role">
													<span>관리자</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="qna-content-container">
								<div class="qna-content-title">답변 내용</div>
									<textarea name="content" class="qna-content" readonly><c:out value="${comment.content}" /></textarea>
								</div>
								<div class="qna-footer-container">
									<div class="qna-footer-writeDate-wrap">
										<div class="qna-footer-writeDate-title">답변일</div>
										<div class="qna-footer-writeDate"><fmt:formatDate value="${comment.writeDate}" pattern="yy.MM.dd HH:mm" /></div>
									</div>
									<div class="qna-iconmenu-container">
									    <c:if test="${comment.writerId eq User.userId}">
									        <div><i class="fa-solid fa-eraser get-comment-edit-form" title ="답변 수정" onclick="location.href='/support/qna/comment/${comment.commentId}/edit'"></i></div>
									    </c:if>
									    <c:if test="${board.writerId eq User.userId || User.role eq '관리자'}">
									       <div><i class="fa-regular fa-trash-can delete-qna-answer" title="삭제하기" data-comment-id="${comment.commentId}"></i></div>
									    </c:if>
										<c:if test="${User.role eq '관리자' && board.isAnswered eq 'N'}">
										    <i class="fa-regular fa-message" title="답변하기"></i>
										</c:if>
									</div> 
								</div>
								</div>
							</c:if>
					</div>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
  $(function() {
	// 게시글 삭제 아이콘 클릭 이벤트
		$(".delete-qna-board").on("click", function() {
		  var boardId = $(this).data("board-id");
		  if (confirm("문의글을 삭제하시겠습니까?")) {
		    $.ajax({
		      type: "POST",
		      url: "/support/qna/" + boardId + "/delete",
		      success: function(result) {
		        // 삭제 성공 시, 게시글 목록 페이지로 이동
		        window.location.href = "/support/qna";
		      },
		      error: function(xhr, status, error) {
		        // 에러 발생 시, 에러 메시지 출력
		        alert(xhr.responseText);
		      }
		    });
		  }
		});
	
	// 게시글 삭제 아이콘 클릭 이벤트
		$(".delete-qna-answer").on("click", function() {
		  var commentId = $(this).data("comment-id");
		  console.log(commentId);
		  if (confirm("문의글을 삭제하시겠습니까?")) {
		    $.ajax({
		      type: "POST",
		      url: "/support/qna/comment/" + commentId + "/delete",
		      success: function(result) {
		        // 삭제 성공 시, 게시글 목록 페이지로 이동
		        window.location.href = "/support/qna";
		      },
		      error: function(xhr, status, error) {
		        // 에러 발생 시, 에러 메시지 출력
		        alert(xhr.responseText);
		      }
		    });
		  }
		});
	
    // 아이콘 클릭 시 동작하는 함수
    function showAnswerForm() {
      // qna-answer-onclick 클래스를 가진 div 요소를 선택합니다.
      var answerContainer = document.querySelector(".qna-answer-onclick");
      // 해당 요소의 display 속성 값을 "block"으로 변경합니다.
      answerContainer.style.display = "block";

      // 아이콘 클릭 이벤트에 hideAnswerForm 함수를 등록합니다.
      var answerIcon = document.querySelector(".fa-regular.fa-message");
      answerIcon.removeEventListener("click", showAnswerForm);
      answerIcon.addEventListener("click", hideAnswerForm);
    }

    // 아이콘 클릭 시 동작하는 함수
    function hideAnswerForm() {
      // qna-answer-onclick 클래스를 가진 div 요소를 선택합니다.
      var answerContainer = document.querySelector(".qna-answer-onclick");
      // 해당 요소의 display 속성 값을 "none"으로 변경합니다.
      answerContainer.style.display = "none";

      // 아이콘 클릭 이벤트에 showAnswerForm 함수를 등록합니다.
      var answerIcon = document.querySelector(".fa-regular.fa-message");
      answerIcon.removeEventListener("click", hideAnswerForm);
      answerIcon.addEventListener("click", showAnswerForm);

      // textarea 내용 초기화
      answerContainer.querySelector("textarea").value = "";
    }

    // 아이콘 클릭 이벤트에 showAnswerForm 함수를 등록합니다.
    var answerIcon = document.querySelector(".fa-regular.fa-message");
    answerIcon.addEventListener("click", showAnswerForm);

    // 비동기 요청 처리
    $('#answer-btn').click(function() {
      $.ajax({
        url: '/support/qna/comment/write',
        type: 'GET',
        data: {
          boardId: '${board.boardId}',
          writer: '${User.nickname}',
          writerId: '${User.userId}'
        },
        success: function(data) {
          $('.qna-answer-onclick').html(data);
        }
      });
    });
  });
</script>
	<script>
	$(document).on('click', '.myuploadimg-popup', function(event) {
		  event.preventDefault(); // 링크의 기본 동작을 막음

		  // 팝업창의 크기를 이미지 크기에 맞게 조정
		  var width = $(this).children('img').width() + 500;
		  var height = $(this).children('img').height() + 500;

		  // 팝업창을 가운데에 위치시키기 위해 좌표 계산
		  var left = screen.width / 2 - width / 2;
		  var top = screen.height / 2 - height / 2;

		  // 팝업창 열기
		  window.open($(this).attr('href'), '', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
		});
	</script>
	<script>
		function confirmCancel() {
			if (confirm('정말 취소하시겠습니까?')) { // 사용자가 '예'를 누를 경우
				window.history.back(); // 페이지를 뒤로가기
			} else { // 사용자가 '취소'를 누를 경우
				return; // 취소 처리
			}
		}

		$(function() {
			var fileIndex = 0;
			var fileList = [];

			// 파일 선택 시 미리보기 이미지 생성
			$('.qna-fileupload-btn')
					.on(
							'change',
							function() {
								var files = $(this).get(0).files;
								if (files.length > 0) {
									for (var i = 0; i < files.length; i++) {
										var file = files[i];
										var reader = new FileReader();

										reader.onload = function(e) {
											var filePreview = '<div class="file-preview">'
													+ '<img src="' + e.target.result + '" class="preview-image">'
													+ '<span class="preview-text">'
													+ file.name
													+ '</span>'
													+ '<button class="preview-delete-btn">'
													+ '<i class="fas fa-trash"></i>'
													+ '</button>' + '</div>';

											fileList.push(file);
											$('#file-list').append(filePreview);

											// 파일 데이터를 고유한 이름으로 저장
											fileIndex++;
											var uniqueName = 'file_'
													+ fileIndex;
											file.uniqueName = uniqueName;
										};

										reader.readAsDataURL(file);
									}
								}
							});
		});
	</script>
</body>
</html>