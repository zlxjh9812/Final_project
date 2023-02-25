<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>#리뷰어스</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<!-- tag -->
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	 <script type="text/javascript" src="<c:url value="/resources/ckeditor/ckeditor.js"/>"></script>
  <script src="https://unpkg.com/@yaireo/tagify"></script>
	
<!-- BootStrap -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<!-- Vendor CSS Files -->

<link
	href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/vendor/boxicons/css/boxicons.min.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/vendor/quill/quill.snow.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/vendor/quill/quill.bubble.css"/>"
	rel="stylesheet">
<link
	href="<c:url value="/resources/assets/vendor/remixicon/remixicon.css"/>"
	rel="stylesheet">



<!-- Template Main CSS File -->
<link href="<c:url value="/resources/assets/css/style.css"/>"
	rel="stylesheet">
<!-- JS LINK -->
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/8e012a278c.js"></script>
<script type="text/javascript" src="<c:url value="/resources/main.js"/>"></script>


<!-- =======================================================
  * Template Name: NiceAdmin - v2.5.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;

.login {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, 80%);
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	background-color: rgb(251, 247, 242);
	line-height: 1.5em;
	color: #222;
	margin: 0;
}

.modal-content {
	border-radius: 15px;
	background-color: rgb(251, 247, 242);
}

.modal-content a {
	text-decoration: none;
	color: #222;
}

.login {
	border-radius: 10px;
}

/*member sign in*/
.member {
	width: 400px;
	/* border: 1px solid #000; */
	margin: auto; /*중앙 정렬*/
	padding: 0 20px;
	margin-bottom: 20px;
	text-align: center;
	display: block;
	color: coral;
	padding: 15px;
}

.member .logo {
	/*로고는 이미지라 인라인 블록이니까 마진 오토 안됨 블록요소만 됨 */
	display: block;
	margin: 50px auto;
}

.member .field {
	margin: 5px 0; /*상하로 좀 띄워주기*/
}

.member b {
	/* border: 1px solid #000; */
	display: block; /*수직 정렬하기 */
	margin-bottom: 5px;
}

/*input 중 radio 는 width 가 100%면 안되니까 */
.member input:not (input[type=radio] ), .member select {
	border: 1px solid #dadada;
	padding: 15px;
	width: 100%;
	margin-bottom: 5px;
	border-radius: 10px;
}

.member input[type=submit] {
	margin-top: 10px;
}

.member input[type=button], .member input[type=submit] {
	font-size: 18px;
	border-radius: 10px;
	background-color: coral;
	color: #fff
}

.member-footer a {
	font-size: 13px;
}

.member input:focus, .member select:focus {
	border: 1px solid #2db400;
}

.field.birth div { /*field 이면서 birth*/
	display: flex;
	gap: 10px; /*간격 벌려줄때 공식처럼 사용핟나 */
}

/* .field.birth div > * {  gap 사용한거랑 같은 효과를 줌 
    flex:1;
} */
.field.tel-number div {
	display: flex;
}

.field.tel-number div input:nth-child(1) {
	flex: 2;
}

.field.tel-number div input:nth-child(2) {
	flex: 1;
}

.field.gender div {
	border: 1px solid #dadada;
	padding: 15px 5px;
	background-color: #fff;
}

.placehold-text {
	display: block; /*span 으로 감싸서 크기영역을 블록요소로 만들어ㅜ저야한다*/
	position: relative;
	/* border: 1px solid #000; */
}

.placehold-text:before {
	content: "";
	position: absolute; /*before은 inline 요소이기 때문에 span으로 감싸줌 */
	right: 20px;
	top: 13px;
	pointer-events: none; /*자체가 가지고 있는 pointer event 를 없애준다 */
}

.userpw {
	background: url(./images/images2/icon-01.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.userpw-confirm {
	background: url(./images/images2/icon-02.png) no-repeat center right
		15px;
	background-size: 20px;
	background-color: #fff;
}

.member-footer {
	text-align: center;
	font-size: 12px;
	margin-top: 20px;
}

.member-footer div a:hover {
	text-decoration: underline;
	color: #2db400
}

.member-footer div a:after {
	content: '|';
	font-size: 10px;
	color: #bbb;
	margin-right: 5px;
	margin-left: 7px;
	/*살짝 내려가 있기 때문에 위로 올려주기 위해 transform 사용하기*/
	display: inline-block;
	transform: translateY(-1px);
}

.member-footer div a:last-child:after {
	display: none;
}

border-radius










:





 





15
px










;
background-color










:





 





rgb










(251
,
247,
242);
@media ( max-width :768px) {
	.member {
		width: 100%;
	}
}

.item img {
	display: inline-block;
	width: 100%;
	height: 100%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
	border-radius: 0px;
}

.item {
	display: inline-block;
	width: 250px;
	margin-top: 40px;
	margin-left: 2%;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
}

.ui-autocomplete {
	position: fixed;
	z-index: 9050 !important;
}

.item .image {
	width: 100%;
	height: 200px;
	background-color: #ddd;
	background-repeat: no-repeat;
	background-position: 50% 50%;
	background-size: cover;
}

.item .cont {
	padding: 20px;
}

.item strong {
	display: block;
	margin: 0 0 10px 0;
	font-size: 16px;
	letter-spacing: -1px;
}

.item p {
	font-size: 13px;
	letter-spacing: -1px;
}

.item a {
	display: inline-block;
	margin-top: 10px;
	padding: 5px 10px;
	background: #eee;
	font-size: 13px;
	letter-spacing: -1px;
}

.item a:hover {
	background: #325cb2;
	color: #fff;
}

img {
	width: 100%;
	/*         height: 100%; */
	border-radius: 25px;
}

.slider {
	width: 80%;
	height: 15%;
	margin: 0px auto;
	margin-left: 270px;
}

.slider .slick-slide {
	margin: 10px;
}

.slick-prev:before, .slick-next:before {
	color: #444444;
}

select {
	margin-left: 20px;
	font-family: "Noto Sansf KR", sans-serif;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #444;
	background-color: #fff;
	padding: 0.6em 1.4em 0.5em 0.8em;
	border: 1px solid #aaa;
	border-radius: 0.5em;
}

.container {
	padding: 20px;
	width: 900px;
	height: 100%;
	margin-top: 100px;
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
</style>

</head>
<script type="text/javascript">
				$(document).ready(function() {
				
					  
					
				});// idCheck
				</script>

<script>
	$(document).ready(function() {
		var list1 = new Array();
		const input = document.querySelector('input[name=basic]');
	    var tagify = new Tagify(input); // initialize Tagify
		<c:forEach items="${hashTag}" var="item1">

		 tagify.addTags(["${item1}"]);
		 
		</c:forEach>

		$('.slider').slick({
			autoplay : true,
			autoplaySpeed : 5000,
			slidesToShow : 6,
			slidesToScroll : 3,
		});
		// 글쓰기 editor 및 사진 업로드 기능
		
	   
			
	   
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
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="testMovie.do?type=movie"
				class="logo d-flex align-items-center"> <span
				class="d-none d-lg-block">#Reviewers</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div>
			<!-- 검색 -->
			<div class="search-bar">
				<form class="search-form d-flex align-items-center"
					action="search.do" id="searchHeader">
					<input type="search" id="autocompleteText" name="searchKeyword"
						aria-label="Search">
					<button type="submit" value="search">
						<i class="bi bi-search"></i>
					</button>

					<select id="SC" name="SC">
						<option value="movie" selected>영화</option>
						<option value="tv">TV</option>
						<option value="review">리뷰</option>
						<option value="tag">태그</option>
						<option value="SearchId">아이디검색</option>
					</select>
				</form>

			</div>
		</div>
		<!-- 검색 끝 -->


		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none">
					<!-- 검색 클릭 버튼 --> <a class="nav-link nav-icon search-bar-toggle "
					href="#"> <i class="bi bi-search"></i>
				</a>
				</li>
				<!-- End Search Icon-->



				<li class="nav-item dropdown pe-3"><c:choose>
						<c:when test="${User.userId  eq null }">
							<!-- Button trigger modal -->
							<button type="button" class="btn" data-toggle="modal"
								data-target="#exampleModalCenter">로그인</button>
							<button type="button" onclick="location.href='sign_up.do'">회원가입</button>
						</c:when>
						<c:otherwise>
							<a class="nav-link nav-profile d-flex align-items-center pe-0"
								href="#" data-bs-toggle="dropdown"> <img
								src="assets/img/profile-img.jpg" alt="Profile"
								class="rounded-circle"> <span
								class="d-none d-md-block dropdown-toggle ps-2">${UserInfo.nickname }</span>
							</a>
							<!-- End Profile Iamge Icon -->

							<ul
								class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
								<li class="dropdown-header">
									<h6>${User.userId }</h6> <span>${UserInfo.nickname }</span>
								</li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li><a class="dropdown-item d-flex align-items-center"
									href="users-profile.html"> <i class="bi bi-person"></i> <span>내
											프로필</span>
								</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li><a class="dropdown-item d-flex align-items-center"
									href="users-profile.html"> <i class="bi bi-gear"></i> <span>계정
											설정</span>
								</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li><a class="dropdown-item d-flex align-items-center"
									href="pages-faq.html"> <i class="bi bi-question-circle"></i>
										<span>도움말</span>
								</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>

								<li><a class="dropdown-item d-flex align-items-center"
									href="logout.do"> <i class="bi bi-box-arrow-right"></i> <span>로그
											아웃</span>
								</a></li>

							</ul>
							<!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->
				</c:otherwise>
				</c:choose>


			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse"
				href="testMovie.do?type=movie"> <i class="bi bi-grid"></i> <span>메인
						페이지</span><i class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="testMovie.do?type=movie"> <i
							class="bi bi-circle"></i><span>인기 영화</span>
					</a></li>
					<li><a href="testMovie.do?type=tv"> <i
							class="bi bi-circle"></i><span>인기 TV프로그램</span>
					</a></li>
					<li><a href="testMovie.do?type=webtoon"> <i
							class="bi bi-circle"></i><span>인기 웹툰</span>
					</a></li>
				</ul></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-menu-button-wide"></i> <span>컨텐츠 리뷰</span> <i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="getBoardList.do?boardnum=1"> <i
							class="bi bi-circle"></i><span>영화</span>
					</a></li>
					<li><a href="getBoardList.do?boardnum=2"> <i
							class="bi bi-circle"></i><span>TV프로그램</span>
					</a></li>
					<li><a href="getBoardList.do?boardnum=3"> <i
							class="bi bi-circle"></i><span>웹툰</span>
					</a></li>

				</ul></li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span>커뮤니티</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="getBoardList.do?boardnum=4"> <i
							class="bi bi-circle"></i><span>자유 게시판</span>
					</a></li>

				</ul></li>
			<!-- End Forms Nav -->


			<li class="nav-item"><a class="nav-link collapsed"
				href="mypage.do"> <i class="bi bi-person"></i> <span>마이페이지</span>
			</a></li>
			<!-- End Profile Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed" href="cs.do">
					<i class="bi bi-question-circle"></i> <span>고객센터</span>
			</a></li>
			<!-- End F.A.Q Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="login.do" data-toggle="modal"
				data-target="#exampleModalCenter"> <i
					class="bi bi-box-arrow-in-right"></i> <span>로그인</span>
			</a></li>
			<!-- End Login Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main"> <!-- Modal -->
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
	<form action="updateBoard.do" method="post">
		
	<input type = "hidden" id = "nickname" name="nickname" value = "${UserInfo.nickname }">
 	<input type="hidden" id = "userId" name="userId" value = "${User.userId }">
	<input type = "hidden" id = "bseq" name = "bseq" value = "${board.bseq }">
			<div class="form-title">
				<div>제목</div>
				<input name="title" type="text" placeholder="제목을 입력해주세요." value = "${board.title }">
			</div>
			<div>
					<input type = "file" name = "filename" id = "filename"><br>
					<img id="miribogiimg" style="height: 100px; width: auto;" >
					<button class="miribogi" type="button" id="overview-cancel">취소하기</button>
					
				</div>
			<div class="search-bar">
				<div>리뷰할 콘텐츠</div>
				<input type="hidden" id="moviecode" name="moviecode" value="${board.moviecode }">
				     <input type="search" id="autocomplete" name="searchKeyword" aria-label="Search" value = "${info.title }">
				<select id="Search" name="SC">
					<option value="none">--선택--</option>
					<option value="movie" selected>영화 리뷰</option>
					<option value="tv">TV 프로그램 리뷰</option>
					<option value="webtoon">웹툰 리뷰</option>
					<option value="community">자유게시판 글작성</option>
				</select>
			</div>
			<div class="form-hashtag">
								<div>#태그</div>
				
				
				<input name='basic'  id = "basic" name = "basic">
			
			
			</div>
			<div class="form-content">
				<div>내용</div>
				<textarea id="content" name="content">
					${board.content }
				</textarea>
			</div>
			<div class="form-btn-wrap">
				<button class="form-cancel-btn" type="reset">취소</button>
				<button class="form-submit-btn" type="submit">업데이트</button>
			</div>
		</form>
	</div>
	<!-- 글 작성 폼 끝 -->

	</main>
	<!-- End #main -->
















	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<!-- <script src="<c:url value="/resources/assets/vendor/apexcharts/apexcharts.min.js"/>"></script> -->
	<script
		src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>


	<!-- <script src="<c:url value="/resources/assets/vendor/echarts/echarts.min.js"/>"></script> -->

	<script
		src="<c:url value="/resources/assets/vendor/quill/quill.min.js"/>"></script>

	<script
		src="<c:url value="/resources/assets/vendor/php-email-form/validate.js"/>"></script>

	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/autoComplete.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/insertAuto.js"/>"></script>
	




</body>
</html>
