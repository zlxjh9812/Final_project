<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@include file="../common/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>#리뷰어스-글작성</title>
<meta content="" name="description">
<meta content="" name="keywords">


<!-- tag -->
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	 <script type="text/javascript" src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
  <script src="https://unpkg.com/@yaireo/tagify"></script>
	


<style>

.container {
	padding: 20px;
	width: 900px;
 	height: 80%; 
 	margin-top: 40px; 
	background-color: white;
	border-radius: 12px;
	font-family: 'Jua', sans-serif;
}

.container input {
	padding: 10px 12px;
}

.container .title {
	color: coral;
	padding: 12px 20px;
	font-size: 32px;
	border-bottom: 2px solid coral;
	font-family: 'Jua', sans-serif;
}

.container .write-form {
	padding: 10px;
}

.write-form-top{
	display: flex;
	justify-content: space-between;
}

.write-form {
	font-size: 18px;
	color: rgba(0, 0, 0, 0.65);
}

.write-form-top input {
	width: 300px;
	margin: 20px 0px;
}

.form-title input, .form-hashtag input {
	width: 100%;
}

.form-title, .form-hashtag, .form-content {
	margin: 18px 0;
}

.form-content input {
	width: 100%;
	height: 300px;
}

.form-btn-wrap {
	display: flex;
	justify-content: center;
}

.form-cancel-btn {
	background-color: lightgrey;
	color: rgba(0, 0, 0, 0.65);
	padding: 8px 20px;
	border: none;
	border-radius: 8px;
	margin: 0 12px;
}

.form-submit-btn {
	padding: 8px 20px;
	background-color: coral;
	color: white;
	border: none;
	border-radius: 8px;
	margin: 0 12px;
}
.tagify {
	width: 100%;
}

#overview-cancel{
	visibility: hidden;
}


</style>

</head>
<script>
	$(document).ready(function() {

		$('.slider').slick({
			autoplay : true,
			autoplaySpeed : 5000,
			slidesToShow : 6,
			slidesToScroll : 3,
		});
		// 글쓰기 editor 및 사진 업로드 기능
		const input = document.querySelector('input[name=basic]');
	    let tagify = new Tagify(input); // initialize Tagify
	    
	    // 태그가 추가되면 이벤트 발생
	    tagify.on('add', function() {
	      console.log(tagify.value); // 입력된 태그 정보 객체
	    })
		CKEDITOR.editorConfig = function( config )
		{
			config.toolbarCanCollapse = false;
			config.toolbarStartupExpanded = false;
			config.enterMode = CKEDITOR.ENTER_BR;
			config.fillEmptyBlocks = false;
			CKEDITOR.dtd.$removeEmpty['i'] = false;
			config.removeButtons = '';
			config.toolbar = [
				{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
				{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
				{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
				{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe', 'Youtube' ] },
				'/',
				{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
				{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
				{ name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
				{ name: 'about', items: [ 'About' ] }
			];
			config.extraPlugins = 'imageresizerowandcolumn';
			config.resize_enabled = false;
			config.removePlugins = 'resize';

		};
		CKEDITOR.config.height = 500;
		CKEDITOR.config.width = '100%';
			CKEDITOR.replace('content',
			{filebrowserUploadUrl: '${pageContext.request.contextPath }/fileupload.do',
				  toolbar: [
					  	{ name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
						{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
						{ name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
						{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe', 'Youtube' ] },
						'/',
						{ name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
						{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
						{ name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
					
						],
				extraPlugins: 'imageresizerowandcolumn'
			});
			
	

	});
</script>

<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#uploadFile").on("change", handleImgFileSelect);
        $("#overview-cancel").on("click", MiRiBoGiCanCel);
    });

    function MiRiBoGiCanCel() {
        $("#miribogiimg").attr("src", "");
        $("#uploadFile").val("");
        $("#overview-cancel").css("visibility","hidden");
    }
    
    
    function handleImgFileSelect(e) {
        $("#overview-cancel").css("visibility", "visible");
    	var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#miribogiimg").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
        
        // 파일을 업로드 해야만 변경 버튼이 노출
 //       var originalImage = $("#miribogiimg").attr("src");

//            $("#overview-cancel").on("click", function() {
//                $("#uploadFile").val("");
//                $("#miribogiimg").attr("src", originalImage);
//               $("#overview-cancle").css("visibility","hidden");
//            });
    }   
</script>



<body>



	<main id="main" class="main">
	 <!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">

				<div class="modal-body">
					<div class="member">
						<form action="login.do" method="post">
							<h2>#REVIEWERS</h2>
							<h1>로그인</h1>
							<div class="field">
								<b>아이디</b> <span class="placehold-text"><input
									type="text" id="UserId" name="UserId"></span>
							</div>
							<div class="field">
								<b>비밀번호</b> <input class="userpw" type="password" id="password"
									name="password">
							</div>
							<input type="submit" value="로그인">
							<div class="member-footer">
								<hr>
								<div>
									<a href="sign_up.jsp">회원가입</a> <a href="findId.do">아이디 찾기</a> <a
										href="updatePasswordGo.do">비밀번호 찾기</a>
								</div>
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	
	<!-- 글 작성 폼 -->
	<div class="container">
		<div class="title">글쓰기</div>
	<form action="insertBoard.do" method="post" enctype="multipart/form-data">
		
	<input type = "hidden" id = "nickname" name="nickname" value = "${UserInfo.nickname }">
 	<input type="hidden" id = "userId" name="userId" value = "${User.userId }">
			
			<div class="form-title">
				<div>제목</div>
				<input name="title" type="text" placeholder="제목을 입력해주세요." required>
			</div>
			
			<div style="justify-content: space-between; display: flex;">
				<div>
					<input type = "file" name = "uploadFile" id = "uploadFile"><br>
					<img id="miribogiimg" style="height: 100px; width: auto;" >
					<button class="miribogi" type="button" id="overview-cancel">취소하기</button>
					
				</div>
			<div>
				<div class="search-bar">
					<div>리뷰할 콘텐츠</div>
					<input type="hidden" id="moviecode" name="moviecode" value="0">
					     <input type="search" id="autocomplete" name="searchKeyword" aria-label="Search">
					<select id="Search" name="SC">
						<option value="none" selected>--선택--</option>
						<option value="movie">영화 리뷰</option>
						<option value="tv">TV 프로그램 리뷰</option>
						<option value="webtoon">웹툰 리뷰</option>
						<option value="community">자유게시판 글작성</option>
					</select>
				</div>
			</div>
			
			</div>
			<div class="form-hashtag">
				<div>#태그</div>
				<input name='basic'>
			</div>
			<div class="form-content">
				<div>내용</div>
				<textarea id="content" name="content" required></textarea>
			</div>
			<div class="form-btn-wrap">
				<input type = "button" onclick='history.back(-1);' value = "취소" class="form-cancel-btn">
				<button class="form-submit-btn" type="submit">글쓰기</button>
			</div>
		</form>
	</div>
	<!-- 글 작성 폼 끝 -->

	</main>
	<!-- End #main -->


	<c:import url="footer.jsp"></c:import>
	<script src="<c:url value="/resources/assets/js/insertAuto.js"/>"></script>
	




</body>
</html>
