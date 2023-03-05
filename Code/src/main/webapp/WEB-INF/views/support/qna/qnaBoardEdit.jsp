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

.fileIsEmpty{
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
	height: 180px;
}

.qna-content {
	resize: none;
	width: 100%;
	height: 450px;
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

.myuploadimg{
	width: 100px;
	margin-right: 50px;
}

.existing-file-container{
	padding: 20px;
	display: flex;
	justify-content: center;
	
}

.existing-file-wrap{
	height: 140px;
	position: relative;
	margin: 0px 30px;
}

.existing-file-wrap button{
	position: absolute;
	z-index: 1;
	top: 0;
	right: 0;
	color: red;
	background-color: transparent;
	border: none;
	font-size: 16px;
	cursor: pointer;
	
}

.existing-file-wrap button i {
	background-color: red;
	color: white;
	border-radius: 50%;
	padding: 2px 5px;
}

.existing-file-wrap img{
	width: 100px;
}

.qna-fileupload-btn {
	background-color: rgba(45, 152, 240, 1);
	border: none;
	color: white;
	border-radius: 8px;
	margin-left: 8px;
}

.qna-fileupload-title-container input[type="file"] {
	padding: 0;
}

.qna-fileupload-btn {
	display: none;
}

.qna-fileupload-title-container label {
	background-color: rgba(45, 152, 240, 1);
	border: none;
	color: white;
	padding: 3px 8px;
	border-radius: 8px;
	margin-left: 8px;
	cursor: pointer;
}

</style>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/mypage/mypage.css">
<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/mypage/mypage.js"></script>
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
				<form id="testtest" method="post" enctype="multipart/form-data">
					<input type="hidden" name="writer" value="${User.nickname }">
					<input type="hidden" name="writerId" value="${User.userId }">
					<div class="basic-info">
						<div class="qna-subject-container">
							<div class="qna-subject-title">문의 유형</div>
							<select name="subject">
								<option value="">선택해주세요.</option>
								<option value="account">계정</option>
								<option value="content">컨텐츠 이용</option>
								<option value="system_error">시스템 장애</option>
								<option value="regulation">이용약관</option>
								<option value="police">신고</option>
								<option value="etc">기타</option>
							</select>
						</div>
						<div class="qna-title-container">
							<div class="qna-title-title">제목</div>
							<input name="title" type="text" class="qna-title-input" value="${board.title }">
						</div>
						<div class="qna-content-container">
							<div class="qna-content-title">문의 내용</div>
							<textarea name="content" class="qna-content"><c:out value="${board.content}" /></textarea>
						</div>
					</div>
					<div class="basic-info">
						<div class="qna-fileupload-container file-preview-container">
							<div class="qna-fileupload-title-container">
								<div class="qna-fileupload-title">파일 첨부</div>
								<label class="qna-fileupload-label" for="files">파일 추가</label>
								<input type="file" name="files" id="files" class="qna-fileupload-btn" multiple>
							</div>
							<div class="qna-fileupload-edit-container">
								<div id="preview-container" class="fileupload-preview preview-container">
								<div class="existing-file-container">
									<c:forEach items="${fileUploads}" var="fileUpload">
										<div class="existing-file-wrap">
											<img src="${pageContext.request.contextPath}${fileUpload.filePath}">
											<button type="button" id="existing-file-delete-btn" data-fileid="${fileUpload.fileId }">
											<i class="fa-solid fa-xmark"></i></button>
										</div>
									</c:forEach>
								</div>
								</div>
							</div>
						</div>
					</div>
					<div class="qna-write-btn-container">
						<button id="cancel-btn" class="qna-btn qna-btn__cancel" onclick="confirmCancel()">삭제</button>
						<button type="submit" id="qna-btn" class="qna-btn" data-boardid="${board.boardId}">수정완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
$(function(){
  
 var fileList = [];
var formData = new FormData();

  // 새로운 파일 미리보기 생성
  $('input[type="file"]').change(function(e) {
    var files = e.target.files;
    $.each(files, function(i, file) {
      fileList.push(file);
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(e) {
    	  var template = 
    	                 '<img src="' + e.target.result + '">' +
    	                 '<button type="button" class="preview-delete-btn" data-file="' + file.name + '"><i class="fa-solid fa-xmark"></i></button>';
    	                 
    	  var addDiv = $('<div class="existing-file-wrap">').html(template);
    	  $('.existing-file-container').append(addDiv);
    	}
    });
  });

  // 미리보기 삭제
  $(document).on('click', '.preview-delete-btn', function() {
    var index = $(this).parent().index();
    fileList.splice(index, 1);
    $(this).parent().remove();
  });
  
  // 기존 파일 삭제
  $(document).on("click", "#existing-file-delete-btn", function() {
	    var fileId = $(this).data("fileid");
	    console.log(fileId);
	    $(this).closest(".existing-file-wrap").remove();
	    formData.append("deletedFileIds", fileId);
	  });

  $('#qna-btn').click(function(event) {
    event.preventDefault(); 
	  
	  if ($('select[name="subject"]').val() == '') {
		    alert('문의 유형을 선택해주세요.');
		    event.preventDefault();
		    return false;
		  }

		  // 제목 입력 검증
		  if ($('input[name="title"]').val().trim() == '') {
		    alert('제목을 입력해주세요.');
		    event.preventDefault();
		    return false;
		  }

		  // 문의 내용 입력 검증
		  if ($('textarea[name="content"]').val().trim() == '') {
		    alert('문의 내용을 입력해주세요.');
		    event.preventDefault();
		    return false;
		  }

    var boardId = $(this).data('boardid');
    console.log(boardId);
    var url = '/support/qna/' + boardId + '/edit';
    console.log(url);
    formData.append('writer', $('[name="writer"]').val());
    formData.append('writerId', $('[name="writerId"]').val());
    formData.append('subject', $('[name="subject"]').val());
    formData.append('title', $('[name="title"]').val());
    formData.append('content', $('[name="content"]').val());
    console.log(formData);
    $.each(fileList, function(i, file) {
      formData.append('files', file);
    });

    // 수정 폼 전송
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      processData: false,
      contentType: false,
      success: function(data) {
        alert('문의글 작성이 완료되었습니다.');
        window.location.href = '/support/qna';
      },
      error: function(xhr, status, error) {
        alert("서버와 통신 오류가 발생했습니다.");
        console.log(xhr.responseText);
      }
    });
  });
});
</script>

</body>
</html>