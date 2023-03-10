<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/sidebar.jsp" %>

<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<!-- css -->

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src='<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js" />'></script>
<script src='<c:url value="/resources/assets/js/jquery.rateit.js" />'></script>
<script src='<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />'></script>

<link href="<c:url value="/resources/assets/js/jquery.rateit.js" />" rel="stylesheet"> 
<link href="<c:url value="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/js/lightbox.js" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/js/scroll.js" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/js/detail.js" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/js/cmtLike.js" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/css/lightbox.css" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/css/mj.css" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/css/rateit.css" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/css/style.css" />" rel="stylesheet"> 
<link href="<c:url value="/resources/assets/css/sujin.css" />" rel="stylesheet"> 

<link href="<c:url value="/resources/assets/css/yunee.css" />" rel="stylesheet">

<head>
	<title>상세정보</title>
</head>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="<c:url value="/resources/assets/css/yunee.css" />" rel="stylesheet">
<link href="<c:url value="/resources/assets/js/detail.js" />" rel="stylesheet">   
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
  crossorigin="anonymous"
/>

<style>
*{
   font-family: 'SUIT-Medium';
}
.css-9dnzub{
   width: 1000px;
}
.css-1aaqvgs-InnerPartOfListWithImage{
   width: 450px;
}
</style>
<main id="main" class="main" style="background-color: rgb(251, 247, 242)">
<div class="css-16jhzm7-Self e1ezac430">
   <div class="css-1ihluk0-Content e1ezac431">
      <div class="css-1iyk86f-Background e1ezac432">
         <section class="css-x864dh-Self e1svyhwg0">
            <div class="css-cshjoi-PosterContainer e1svyhwg1">
      
               <div class="css-oqg1df-BlurPosterBlock e1svyhwg2">
                  <div color="#19131E" class="css-1brjyj2-LeftBackground e1svyhwg6"></div>
                  <c:forEach var="images" begin="0" end="0">
                     <div class="css-8cob0z-BlurPoster e1svyhwg4"
                        style="background-image:url('${info.backdrop_path }');">
                        <div color="#19131E" class="css-vf68xy-LeftGradient e1svyhwg8"></div>
                        <div color="#988970" class="css-hhk7ai-RightGradient e1svyhwg9"></div>
                     </div>
                  </c:forEach>
                  <div color="#988970" class="css-13i7zir-RightBackground e1svyhwg7"></div>
                  <div class="css-1ubeqqm-DimmedLayer e1svyhwg3"></div>
               </div>
               <div class="css-569z5v">
                  <div class="css-1po9d5k">
                     <div class="css-1d6udxb">
                        <div class="css-11zdk8l-PosterWithRankingInfoBlock e1svyhwg10">
                           <div class=" css-28gyaj-StyledLazyLoadingImage ezcopuc0">
                              <img alt="포스터" src="${info.poster_path }"
                                 class="css-qhzw1o-StyledImgezcopuc1"
                                 style="vertical-align: top; width: 100%; height: 100%; opacity: 1; object-fit: cover; transition: opacity 420ms ease 0s;">
                           </div>
                           <div class="css-r6qxq2-ContentMetaInfoBlock e1svyhwg11">
                              <ul class="css-1v9zk7c-RankingInfoList e1svyhwg14">
                                 <li><em></em></li>
                              </ul>
                              <h1 class="css-j40qn0-TitleOnPosterBlock e1svyhwg12">평균
                                 ★${Math.ceil((info.vote_average)/2*10)/10}</h1>
                              <div class="css-11h0kfd-Detail e1svyhwg18">
                                 <fmt:formatDate value="${info.release_date }"
                                    pattern="yyyy-MM-dd" />
                                 · ${info.genres }
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="css-1p7n6er-Pane e1svyhwg15" style ="background-color: rgb(251, 247, 242);" >
               <div class="css-569z5v">
                  <div class="css-1po9d5k">
                     <div class="css-1d6udxb">
                        <div class="css-13h49w0-PaneInner e1svyhwg16">
                           <h1 class="css-171k8ad-Title e1svyhwg17">${info.title }</h1>
                           <div class="css-11h0kfd-Detail e1svyhwg18">
                              <fmt:formatDate value="${info.release_date }"
                                 pattern="yyyy-MM-dd" />
                              ·${info.genres }
                           </div>
                           <div class="css-og1gu8-ContentRatings e1svyhwg20"
                              style="white-space: nowrap;">평균
                              ★${Math.ceil((info.vote_average)/2*10)/10}</div>
                           <div class="css-5qj1gb-ContentActionSection e1svyhwg19">
                              <div class="css-1jlb6q">
                                 <div class="css-yt2kjp">
                                    <div class="css-1k5zzs9">
                                       <span id="do_rating">평가하기</span>
                                       <!-- 평가 문구 노출영역 -->
                                       <span id="rating_text"></span>
                                    </div>
                                    
                                    <!--=======별점 부분=======-->
											<%--평가 기록이 없으면(starVO == null) 평가할수있는 별점 div를 표시, 
	기록이 있으면(starVO != null) starVO에서 star(별점)을 불러와 점수에 따라 별점 width 변화
	설정: ContentsController --%>
											<div class="star_area">
												<input type="hidden" value="${starVO.star_num }"
													id="starnum_star">
												<c:if test="${starVO == null}">
													<%--평가기록 없을때 --%>
													<div class="rateit" id="starRate"
														data-contentsid="${info.contents_num}"
														data-rateit-mode="font" style="font-size: 38px;"></div>
													<script type="text/javascript">	
			/* 비회원 체크 후 alert 호출  */
			  $("#starRate").bind('rated', function (event, value) {
				  /*console.log($('#user_id').val()+' 유저 아이디');
				  var user_id = ${user_id};*/
				  if(!$('#user_id').val()){ // 비회원상태: user_id=0
					  console.log("Click");
					  Swal.fire({			
						  title: ' ',						  
						  text: '평가하시려면 로그인이 필요해요.',
						 imageUrl: '${pageContext.request.contextPath}/resources/images/star_icon.png',
						  imageWidth: 70,
						  imageHeight: 70,						  
						  imageAlt: 'Custom image',
						  confirmButtonColor: '#84d7fa',
						  confirmButtonText: '알겠어요',
						  width: 400,
						  padding: '2em'
						  })
					  //alert('평가하시려면 로그인이 필요해요.');
					  $('.rateit-selected').css('width',''); //클릭된 별점 reset
				  };				 
			  });			
			</script>
												</c:if>
												<c:if test="${starVO != null}">
													<%--평가기록 있을때 --%>
													<div class="rateit" id="starRate"
														data-contentsid="${info.contents_num}"
														data-rateit-mode="font" style="font-size: 38px;"></div>
													<script type="text/javascript">
			$(function(){
				$('#do_rating').hide(); //평가하기문구hide
				var rate = ${starVO.star};				
				if(rate==0.5){
					$('.rateit-selected').css('width','18.9965px');
					$('#rating_text').text('최악이에요');	
					}
				if(rate==1){
					$('.rateit-selected').css('width','37.993px');
					$('#rating_text').text('싫어요');	
					}
				if(rate==1.5){
					$('.rateit-selected').css('width','56.9895px');
					$('#rating_text').text('재미없어요');	
					}
				if(rate==2){
					$('.rateit-selected').css('width','75.986px');
					$('#rating_text').text('별로예요');	
					}
				if(rate==2.5){
					$('.rateit-selected').css('width','94.9825px');
					$('#rating_text').text('부족해요');	
					}
				if(rate==3){
					$('.rateit-selected').css('width','113.979px');
					$('#rating_text').text('보통이에요');	
					}
				if(rate==3.5){
					$('.rateit-selected').css('width','132.976px');
					$('#rating_text').text('볼만해요');	
					}
				if(rate==4){
					$('.rateit-selected').css('width','151.972px');
					$('#rating_text').text('재미있어요');	
					}
				if(rate==4.5){
					$('.rateit-selected').css('width','170.969px');
					$('#rating_text').text('훌륭해요!');	
					}
				if(rate==5){
					$('.rateit-selected').css('width','189.965px');
					$('#rating_text').text('최고예요!');					
				}
			});
			</script>
												</c:if>
											</div>
											<script type="text/javascript">	
		$(function(){
			//(1)별점입력 및 변경
			$('.star_area .rateit').bind('rated', function (e) { //rated reset		
		        var ri = $(this);
	      		console.log(ri.rateit('value'));
				var checkComment = ${checkComment};
		       /*var user_id = ${user_id};*/	        
				var value = ri.rateit('value'); 
				var star_num = $('#starnum_comment').val();
				 
					console.log($('#user_id').val());
		          $.ajax({
		            url: 'board/starRating.do', 
		            data: { 
						star: value,
						contents_num : $('#contents_num').val(), //저장:getInfoUtil/id설정:calendar.jsp
						contents_type : $('#contents_type').val(),
						userId : $('#user_id').val(),
						checkComment : checkComment,
						star_num : star_num
						}, 
		            dataType : 'json',
		            type: 'POST',
		            success: function (param) { 
		            	if(param.result == 'logout'){
							alert('로그인 후 사용하세요!');
		            	}else if(param.result == 'success'){ //별점기록없으면 insert
		            		$('#starnum_star').val(param.star_num);
		            	}else if(param.result == 'success2'){ //별점기록있으면  update
		            	}else{
							alert('별점입력 오류 발생');
						}	
		            },
		            error: function () {
		            	alert('네트워크 오류 발생');
		            }
		        });  //end of ajax
				
		    });//별점입력끝 
		    
		    //(2)별점 취소 (0.5점 클릭->취소버튼 노출->취소가능)
			 $("#starRate").bind('reset', function () { //reset버튼클릭시 이벤트 발생
				 var user_id = ${user_id};
			 
		    	 $('#rating_text').text('평가하기');	//평가하기문구다시노출 
		    	 $('#rateit-reset-2').css("visibility","hidden"); //리셋버튼감추기
			});	 
			    
			//(3)별점에 따른 평가 문구 설정	    	
		    $("#starRate").bind('rated', function (event, value) { //rated시 이벤트 발생
		    	
		    	$('#rateit-reset-2').css("visibility","hidden"); //리셋버튼hide		    	
		    	$('#do_rating').hide(); //평가하기문구hide
		    	
			   	 if(value === 5 ){ 
			   	 	$('#rating_text').text('최고예요!');		   
			   	 }
			   	 if(value === 4.5){
			   		 $('#rating_text').text('훌륭해요!');		   
			   	 }
			   	 if(value === 4 ){
			   		 $('#rating_text').text('재미있어요');		   
			   	 }
			   	 if(value === 3.5 ){
			   		 $('#rating_text').text('볼만해요');		   
			   	 }
			   	 if(value === 3 ){
			   		 $('#rating_text').text('보통이에요');		   
			   	 }
			   	 if(value === 2.5){
			   		 $('#rating_text').text('부족해요');		   
			   	 }
			   	 if(value === 2){
			   		 $('#rating_text').text('별로예요');		   
			   	 }
			   	 if(value === 1.5){
			   		 $('#rating_text').text('재미없어요');		   
			   	 }
			   	 if(value === 1){
			   		 $('#rating_text').text('싫어요');		   
			   	 }
			   	 if(value === 0.5){ 
			   		 $('#rating_text').text('최악이에요');	
			  
												//0.5 hover시 리셋버튼 클릭어려워서 0.5클릭 시 리셋버튼 뜨게 설정
																			$(
																					'#rateit-reset-2')
																					.css(
																							"visibility",
																							"visible");
																		}
																	});//평가문구끝
												});
											</script>
											<!--======별점 부분 끝======-->
                                    
                                 </div>
                              </div>
                              <div class="css-s5x9hn-ContentActionDivider e1svyhwg21"></div>
                              <div class="css-12uh5q5-ButtonBlock e1svyhwg22">
                                 <button id="like_insert"
                                    class="<c:if test="${check ==1 }">css-15hndx7-StylelessButton-ContentActionButton</c:if>
                                    <c:if test="${check!=1 }">css-1tc9iuk-StylelessButton-ContentActionButton e1svyhwg23</c:if>"
                                   >
                                   <script type="text/javascript">
                                   user_num = $('#user_id').val();
                                    check = $('#check').val();
                                   $("#like_insert").on("click", function(e) {
                                	   console.log($('#check').val()); 
                                   	console.log($('#user_id').val());
                                       if (!$('#user_id').val()) {
                                           Swal.fire({
                                               title: ' ',
                                               text: '내 보관함에 작품을 담으려면 로그인이 필요해요.',
                                                imageUrl: window.ctx + '/resources/images/bookmark_icon.png',
                                               imageWidth: 70,
                                               imageHeight: 70,
                                               imageAlt: 'Custom image',
                                               confirmButtonColor: '#84d7fa',
                                               confirmButtonText: '알겠어요',
                                               width: 400,
                                               padding: '2em'
                                           })
                                           return;
                                       }
                                       if ($('#user_id').val()) {
                                           $
                                               .ajax({
                                                   url: 'board/contentsLike.do',
                                                   type: 'post',
                                                   dataType: 'json',
                                                   data: {
                                                       contents_num: $('#contents_num').val(),
                                                       contents_type: $('#contents_type').val(),
                                                       mem_num: $('#user_id').val(),
                                                       userId : $('#user_id').val(),
                                                       check: $('#check').val()
                                                   },
                                                   success: function(param) {
                                                       if (param.result == 'success') { // 보고싶어요
                                                    	   $('#check').val(1);
                                                           $('#like')
                                                               .removeClass(
                                                                   'css-1tc9iuk-StylelessButton-ContentActionButton')
                                                               .addClass(
                                                                   'css-15hndx7-StylelessButton-ContentActionButton');
                                                           $('#off').hide();
                                                           $('#on').show();
                                                       } else if (param.result == 'cancel') { // 보고싶어요 취소
                                                    	   $('#check').val(0);
                                                           $('#like')
                                                               .removeClass(
                                                                   'css-15hndx7-StylelessButton-ContentActionButton')
                                                               .addClass(
                                                                   'css-1tc9iuk-StylelessButton-ContentActionButton');
                                                           $('#on').hide();
                                                           $('#off').show();
                                                       }
                                                   }
                                               });
                                       }
                                   });
                                   </script>
                                    <div
                                       class="Icon icPlus rotatingIcon css-1q1i623-SVG e1282e850">
                                       <div>
                                          <div id="on" style="display: none;">
                                             <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                height="24" viewbox="0 0 24 24" fill="none"
                                                class="injected-svg"
                                                data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0xOC41OTY5IDcuMTQ5NDFINS4yNjc2MUM1LjAxMzkgNy4xNDk0MSA0LjgwNzk4IDcuMzU1MzMgNC44MDc5OCA3LjYwOTA0VjIwLjAzNjVDNC44MDc5OCAyMC40MDk4IDUuMjI5MDEgMjAuNjI2NyA1LjUzMzI4IDIwLjQxMDdMMTEuOTMyMyAxNS44NzA1TDE4LjMzMTIgMjAuNDEwN0MxOC42MzU1IDIwLjYyNjcgMTkuMDU2NSAyMC40MDk4IDE5LjA1NjUgMjAuMDM2NVY3LjYwOTA0QzE5LjA1NjUgNy4zNTUzMyAxOC44NTA2IDcuMTQ5NDEgMTguNTk2OSA3LjE0OTQxWiIgZmlsbD0iY3VycmVudENvbG9yIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMTguMTM3MyAzSDUuNzI3MjVDNS4yMTg4OSAzIDQuODA3OTggMy40MTE4MyA0LjgwNzk4IDMuOTE5MjZWNS4yOTgxNUM0LjgwNzk4IDUuNTUxODcgNS4wMTM5IDUuNzU3NzkgNS4yNjc2MSA1Ljc1Nzc5SDE4LjU5NjlDMTguODUwNiA1Ljc1Nzc5IDE5LjA1NjUgNS41NTE4NyAxOS4wNTY1IDUuMjk4MTVWMy45MTkyNkMxOS4wNTY1IDMuNDExODMgMTguNjQ0NyAzIDE4LjEzNzMgM1oiIGZpbGw9ImN1cnJlbnRDb2xvciIvPgo8L3N2Zz4K"
                                                xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <path
                                                   d="M18.5969 7.14941H5.26761C5.0139 7.14941 4.80798 7.35533 4.80798 7.60904V20.0365C4.80798 20.4098 5.22901 20.6267 5.53328 20.4107L11.9323 15.8705L18.3312 20.4107C18.6355 20.6267 19.0565 20.4098 19.0565 20.0365V7.60904C19.0565 7.35533 18.8506 7.14941 18.5969 7.14941Z"
                                                   fill="currentColor"></path>
                                                <path
                                                   d="M18.1373 3H5.72725C5.21889 3 4.80798 3.41183 4.80798 3.91926V5.29815C4.80798 5.55187 5.0139 5.75779 5.26761 5.75779H18.5969C18.8506 5.75779 19.0565 5.55187 19.0565 5.29815V3.91926C19.0565 3.41183 18.6447 3 18.1373 3Z"
                                                   fill="currentColor"></path>
                                                </svg>
                                          </div>
                                          <div id="off" style="display: none;">
                                             <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                height="24" viewbox="0 0 24 24" fill="none"
                                                class="injected-svg"
                                                data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTIwLjUgMTMuMDkyOUgxMy4xNDI4VjIwLjVIMTAuODU3MVYxMy4wOTI5SDMuNVYxMC44MDcxSDEwLjg1NzFWMy41SDEzLjE0MjhWMTAuODA3MUgyMC41VjEzLjA5MjlaIiBmaWxsPSJjdXJyZW50Q29sb3IiLz4KPC9zdmc+Cg=="
                                                xmlns:xlink="http://www.w3.org/1999/xlink">
                                                <path
                                                   d="M20.5 13.0929H13.1428V20.5H10.8571V13.0929H3.5V10.8071H10.8571V3.5H13.1428V10.8071H20.5V13.0929Z"
                                                   fill="currentColor"></path>
                                                </svg>
                                          </div>
                                       </div>
                                    </div>
                                    보고싶어요
                                 </button>
                                <!-- ======코멘트 모달 설정부분======-->
											<c:if test="${checkComment != 1}">
												<!-- 등록폼호출 -->
												<button data-bs-target="#commentModal"
													data-bs-toggle="modal"
													class="css-orm7r7-StylelessButton-ContentActionButton-ContentCommentButtonOnSm e1svyhwg25"
													style="color: black;">
													<div class="Icon icPencil css-1q1i623-SVG e1282e850">
														<div>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																class="injected-svg"
																data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTMgMTcuMjUyNVYyMS4wMDI1SDYuNzVMMTcuODEgOS45NDI1TDE0LjA2IDYuMTkyNUwzIDE3LjI1MjVaTTIwLjcxIDcuMDQyNUMyMS4xIDYuNjUyNSAyMS4xIDYuMDIyNSAyMC43MSA1LjYzMjVMMTguMzcgMy4yOTI1QzE3Ljk4IDIuOTAyNSAxNy4zNSAyLjkwMjUgMTYuOTYgMy4yOTI1TDE1LjEzIDUuMTIyNUwxOC44OCA4Ljg3MjVMMjAuNzEgNy4wNDI1WiIgZmlsbD0iY3VycmVudENvbG9yIi8+Cjwvc3ZnPgo="
																xmlns:xlink="http://www.w3.org/1999/xlink">
																		<path
																	d="M3 17.2525V21.0025H6.75L17.81 9.9425L14.06 6.1925L3 17.2525ZM20.71 7.0425C21.1 6.6525 21.1 6.0225 20.71 5.6325L18.37 3.2925C17.98 2.9025 17.35 2.9025 16.96 3.2925L15.13 5.1225L18.88 8.8725L20.71 7.0425Z"
																	fill="currentColor"></path>
															</svg>
														</div>
													</div>
													코멘트
												</button>
											</c:if>
											<c:if test="${checkComment == 1}">
												<!-- 수정폼호출 -->
												<button data-bs-target="#commentUpdateModal"
													data-bs-toggle="modal"
													class="css-orm7r7-StylelessButton-ContentActionButton-ContentCommentButtonOnSm e1svyhwg25"
													style="color: #1eb0d9;">
													<div class="Icon icPencil css-1q1i623-SVG e1282e850">
														<div>
															<svg xmlns="http://www.w3.org/2000/svg" width="24"
																height="24" viewBox="0 0 24 24" fill="none"
																class="injected-svg"
																data-src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTMgMTcuMjUyNVYyMS4wMDI1SDYuNzVMMTcuODEgOS45NDI1TDE0LjA2IDYuMTkyNUwzIDE3LjI1MjVaTTIwLjcxIDcuMDQyNUMyMS4xIDYuNjUyNSAyMS4xIDYuMDIyNSAyMC43MSA1LjYzMjVMMTguMzcgMy4yOTI1QzE3Ljk4IDIuOTAyNSAxNy4zNSAyLjkwMjUgMTYuOTYgMy4yOTI1TDE1LjEzIDUuMTIyNUwxOC44OCA4Ljg3MjVMMjAuNzEgNy4wNDI1WiIgZmlsbD0iY3VycmVudENvbG9yIi8+Cjwvc3ZnPgo="
																xmlns:xlink="http://www.w3.org/1999/xlink">
																		<path
																	d="M3 17.2525V21.0025H6.75L17.81 9.9425L14.06 6.1925L3 17.2525ZM20.71 7.0425C21.1 6.6525 21.1 6.0225 20.71 5.6325L18.37 3.2925C17.98 2.9025 17.35 2.9025 16.96 3.2925L15.13 5.1225L18.88 8.8725L20.71 7.0425Z"
																	fill="currentColor"></path>
															</svg>
														</div>
													</div>
													코멘트수정
												</button>
											</c:if>
										<button onClick="location.href='cgetBoardList.do?type=${info.contents_type }&id=${info.contents_num }'"
													class="css-orm7r7-StylelessButton-ContentActionButton-ContentCommentButtonOnSm e1svyhwg25"
													style="color: black;">
													<div class="Icon cardlist css-1q1i623-SVG e1282e850">
														<div>
															<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
															  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
															  <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
															</svg>
														</div>
													</div>
													해당영화 리뷰 바로가기
										</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </section>
         <div class="css-1bn16fq-ContentSections e1ezac433" style="
    background-color: rgb(251, 247, 242);
">
            <div class="css-bs9kkj">
               <div class="css-1po9d5k">
                  <div class="css-uvsgck">
                     <div class="css-1jnrrnc-ContentSectionsBlock e1ezac437">
                        <div
                           class="css-1jwavn9-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock">
                           <section class="css-1tywu13">
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0"
                                    style="padding-top: 5px;">
                                    <header class="css-1ue9xs6">
                                       <h2 class="css-1wtjsst">기본 정보</h2>
                                       <div class="css-s289sk">
                                          <div class="css-1ugqy9j">
                                             <button
                                                style="color: #1eb0d9; border: none; background: none; cursor: pointer; display: none;"
                                                id="status" onclick="more()">더보기</button>
                                          </div>
                                       </div>
                                    </header>
                                 </div>
                              </div>
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <article class="css-1k6vajx-Overview eokm2780">
                                       <div class="css-wvh1uf-Summary eokm2781">
                                          ${info.title }<br> <span
                                             class="css-1t00yeb-OverviewMeta eokm2782"><fmt:formatDate
                                                value="${info.release_date }" pattern="yyyy-MM-dd" />
                                             · ${info.genres }</span><br> <span
                                             class="css-1t00yeb-OverviewMeta eokm2782">${info.runtime }</span>
                                       </div>
                                       <div class=" css-k82gae-StyledSelf eb5y16b0">
                                          <div class="css-kywn6v-StyledText" id="overview">${info.overview }
                                             <c:if test="${empty info.overview }">정보가 없습니다.</c:if>
                                          </div>
                                       </div>
                                    </article>
                                    <hr class="css-g67iqr" style="padding-top: 15px;">
                                 </div>
                              </div>
                           </section>
                           <section class="css-1tywu13" id="content_credits">
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <header class="css-1ue9xs6">
                                       <h2 class="css-1wtjsst">출연/제작</h2>
                                    </header>
                                 </div>
                              </div>
                              <div class="css-usdi1z">
                                 <div class="css-9dnzub scroll">
                                    <div class="css-174lxc3">
                                       <div class="css-1gkas1x-Grid e1689zdh0">
                                          <div class="css-13avw3k-PeopleUlRow e5xrf7a1">
                                             <ul
                                                class="e5xrf7a0 css-1br354h-VisualUl-PeopleStackableUl">
                                                <c:forEach var="crew" items="${crew }" begin="0" end="1"
                                                   step="1">
                                                   <li class="css-54rr1e"><a
                                                      class="css-1aaqvgs-InnerPartOfListWithImage" href=""><div
                                                            class="css-cssveg">
                                                            <div class="profilePhotoBlock css-13zlig9">
                                                               <div class="css-1wfv1im-ProfilePhotoImage">
                                                                  <c:if test="${!empty crew.profile_path }">
                                                                     <img class="css-1mt3oap-ProfilePhotoImage"
                                                                        src="https://image.tmdb.org/t/p/original/${crew.profile_path }">
                                                                  </c:if>
                                                                  <c:if test="${empty crew.profile_path }">
                                                                     <img class="css-1mt3oap-ProfilePhotoImage"
                                                                        src="<c:url value="/resources/image/face.png"/>">
                                                                  </c:if>
                                                               </div>
                                                            </div>
                                                         </div>
                                                         <div class="css-zoy7di">
                                                            <div class="css-qkf9j">
                                                               <div class="css-17vuhtq">${crew.name }</div>
                                                               <div class="css-1evnpxk-StyledSubtitle">감독</div>
                                                            </div>
                                                            <div></div>
                                                         </div></a></li>
                                                </c:forEach>
                                                <c:forEach var="cast" items="${cast }" begin="0"
                                                   end="14" step="1">
                                                   <li class="css-54rr1e"><a
                                                      class="css-1aaqvgs-InnerPartOfListWithImage" href=""><div
                                                            class="css-cssveg">
                                                            <div class="profilePhotoBlock css-13zlig9">
                                                               <div class="css-1wfv1im-ProfilePhotoImage">
                                                                  <c:if test="${!empty cast.profile_path }">
                                                                     <img class="css-1mt3oap-ProfilePhotoImage"
                                                                        src="https://image.tmdb.org/t/p/original/${cast.profile_path }">
                                                                  </c:if>
                                                                  <c:if test="${empty cast.profile_path }">
                                                                     <img class="css-1mt3oap-ProfilePhotoImage"
                                                                        src="<c:url value="/resources/image/face.png"/>">
                                                                  </c:if>
                                                               </div>
                                                            </div>
                                                         </div>
                                                         <div class="css-zoy7di">
                                                            <div class="css-qkf9j">
                                                               <div class="css-17vuhtq">${cast.name }</div>
                                                               <div class="css-1evnpxk-StyledSubtitle">출연</div>
                                                            </div>
                  
                                                         </div></a></li>
                                                </c:forEach>
                                                <div class="css-6qnjre"></div>
                                             </ul>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="arrow_button css-1b9dnd0 left"
                                    style="display: none;">
                                    <button type="button" class="css-vp7uyl"
                                       style="margin-bottom: 15px;">
                                       <img
                                          src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
                                          alt="forward">
                                    </button>
                                 </div>
                                 <div class="arrow_button css-pf83cl right"id = "sbm-btn">
                                    <button type="button" class="css-vp7uyl"
                                       style="margin-bottom: 15px;">
                                       <img
                                          src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
                                          alt="forward">
                                    </button>
                                 </div>
                              </div>
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <hr class="css-g67iqr">
                                 </div>
                              </div>
                           </section>
                           <section class="css-1tywu13">
                              <div class="css-wpsvu8">
                                 <section class="css-e2gdle-Self e2ouywk0">
                                    <div class="css-1wjbj9j-Self e1adaxwi0"></div>
                                 </section>
                                 <div
                                    class="css-1nhig6u-RoundedCornerBlock-RoundedCornerBlock">
                                    <div class="css-1wdbx6y-LastDividerDisable e1ezac438">
                                       <div class="css-1gkas1x-Grid e1689zdh0">
                                          <div class="css-1y901al-Row emmoxnt0">
                                             <header class="css-1ue9xs6">
                                                <h2 class="css-1wtjsst">이미지</h2>
                                                <span class="css-wzn7fp">${fn:length(image) }</span>
                                             </header>
                                          </div>
                                       </div>
                                       <div class="css-usdi1z">
                                          <div class="css-1x04fwb scroll">
                                             <div class="css-174lxc3">
                                                <div class="css-1gkas1x-Grid e1689zdh0">
                                                   <div class="css-1y901al-Row emmoxnt0">
                                                      <ul class="css-1cduxg0-VisualUl">
                                                         <c:forEach var="images" items="${image}">
                                                            <li class="css-1cw0vk0"><div
                                                                  class="css-1qwe0o7-StyledSelf e1q5rx9q0">
                                                                  <a
                                                                     href="https://image.tmdb.org/t/p/original${images }"
                                                                     data-lightbox="roadtrip"> <span
                                                                     class="css-bhgne5-StyledBackground e1q5rx9q1"
                                                                     style="background-image: url('https://image.tmdb.org/t/p/original${images }');"></span></a>
                                                               </div></li>
                                                         </c:forEach>
                                                         <div class="css-ml096x"></div>
                                                      </ul>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="arrow_button css-1b9dnd0 left"
                                             style="display: none;">
                                             <button type="button" class="css-vp7uyl"
                                                style="margin-bottom: 20px;">
                                                <img
                                                   src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
                                                   alt="forward">
                                             </button>
                                          </div>
                                          <div class="arrow_button css-pf83cl right">
                                             <button type="button" class="css-vp7uyl"
                                                style="margin-bottom: 20px;">
                                                <img
                                                   src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
                                                   alt="forward">
                                             </button>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="css-1s816gj-VisibleBlockOnlyMdScreen e1ezac4311"></div>
                              </div>
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <hr class="css-g67iqr">
                                 </div>
                              </div>
                           </section>
									<c:if test="${!empty commentList }">
										<section class="css-1tywu13">
											<div class="css-1gkas1x-Grid e1689zdh0">
												<div class="css-1y901al-Row emmoxnt0">
													<header class="css-1ue9xs6">
														<h2 class="css-1wtjsst">코멘트</h2>
													</header>
												</div>
											</div>
											<div class="css-usdi1z">
												<div class="css-1x04fwb scroll">
													<div class="css-174lxc3">
														<div class="css-1gkas1x-Grid e1689zdh0">
															<div class="css-1y901al-Row emmoxnt0">
																<ul
																	class="ew8mnl61 css-nh9j5x-VisualUl-CommentHorizontalUl">
																	<c:forEach var="commentList" items="${commentList }"
																		varStatus="status">
																		<li class="css-1fryc54"><div class="css-17dwc6k">
																				<div class="css-4obf01" style="flex-direction: row;">
																					<div class="css-1cvf9dk">
																						<a
																							title="${cmt_memberList[status.index].name }의 프로필"
																							class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																							href="${pageContext.request.contextPath}/member/myPage.do?user_num=${commentList.userId}"><div
																								class="css-107z6xc">
																								
																									<c:if
																										test="${empty cmt_memberList[status.index].profileImg}">
																										
																									</c:if>
																									<c:if
																										test="${!empty cmt_memberList[status.index].profileImg}">
																										
																									</c:if>
																								
																							</div>
																							<div class="css-1agoci2">
																								${cmt_memberList[status.index].name }<span
																									src="" class="css-amcv0d"></span>
																							</div></a>
																					</div>
																					<c:if test="${commentList.star > 0 }">
																						<div class="css-yqs4xl">
																							<img
																								src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxwYXRoIGZpbGw9IiM0QTRBNEEiIGZpbGwtcnVsZT0iZXZlbm9kZCIgZD0iTTEyIDE3Ljk4bC02LjAxNSA0LjM5MmMtLjUwOC4zNzItMS4xOTQtLjEyNi0uOTk4LS43MjVsMi4zMTctNy4wODEtNi4wMzUtNC4zNjdjLS41MS0uMzY5LS4yNDctMS4xNzUuMzgyLTEuMTc0bDcuNDQ3LjAxNiAyLjI4Ni03LjA5MWMuMTkyLS42IDEuMDQtLjYgMS4yMzMgMGwyLjI4NiA3LjA5IDcuNDQ3LS4wMTVjLjYyOS0uMDAxLjg5LjgwNS4zOCAxLjE3NGwtNi4wMzMgNC4zNjcgMi4zMTYgNy4wOGMuMTk2LjYtLjQ5IDEuMDk4LS45OTkuNzI2TDEyIDE3Ljk4eiIvPgo8L3N2Zz4K"
																								width="16px" height="16px" alt="star"><span>${commentList.star }
																							</span>
																						</div>
																					</c:if>
																				</div>
																				<div class="css-ob93md">
																					<a class="css-1f9m1s4-StylelessLocalLink eovgsd01"
																						href="cmtDetail.do?contents_type=${param.contents_type }&contents_num=${param.contents_num }&comment_num=${commentList.comment_num }"><div
																							class=" css-12rbc09-StyledSelf eb5y16b0">
																							<div class="css-qxbzku-StyledText">${commentList.content }
																							</div>
																						</div></a>
																				</div>
																				<div class="css-1atijos">
																					<span
																						src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGcgZmlsbD0iIzc4Nzg3OCI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik02Ljc1IDkuNDg1aC0zYTEgMSAwIDAgMC0xIDF2MTBhMSAxIDAgMCAwIDEgMWgzYTEgMSAwIDAgMCAxLTF2LTEwYTEgMSAwIDAgMC0xLTFNMjAuNjU3IDguNTY2YTIuMzYzIDIuMzYzIDAgMCAwLTEuNzc5LS44MTNIMTYuNjJsLjE2NC0uNjI3Yy4xMzctLjUyOC4yMDEtMS4xMi4yMDEtMS44NjMgMC0xLjkxOS0xLjM3NS0yLjc3OC0yLjczOC0yLjc3OC0uNDQ0IDAtLjc2Ni4xMjMtLjk4Ni4zNzYtLjIuMjI3LS4yODIuNTMtLjI0My45MzVsLjAzIDEuMjMtMi45MDMgMi45NGMtLjU5My42LS44OTQgMS4yMy0uODk0IDEuODcydjkuNjQ3YS41LjUgMCAwIDAgLjUuNWg3LjY4N2EyLjM4OCAyLjM4OCAwIDAgMCAyLjM0OC0yLjA3bDEuNDQ1LTcuNDUyYTIuNDQgMi40NCAwIDAgMC0uNTc0LTEuODk3Ii8+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
																						width="18px" height="18px" class="css-64x8kr"></span><em
																						class="countLike"><c:if
																							test="${commentList.countLike >0}">${commentList.countLike}</c:if>
																						<c:if test="${commentList.countLike ==0 }">0</c:if></em>
																				</div>
																				<div class="css-hy68ty">
																					<input type="hidden"
																						value="${commentList.comment_num }"
																						class="comment_num"> <input type="hidden"
																						value="${commentList.checkCmtLike }"
																						class="checkCmtLike">
																					<button style="font-size: 13px;"
																						class="<c:if test="${commentList.checkCmtLike == 1}">css-jj4q3s-StylelessButton-UserActionButton cmtLike</c:if>
																			<c:if test="${!empty user_id || commentList.checkCmtLike == 0}">css-1h18l7j-StylelessButton cmtLike</c:if>">&nbsp;좋아요&nbsp;</button>
																				</div>

																			</div></li>

																	</c:forEach>
																	<div class="css-ml096x"></div>
																</ul>
															</div>
														</div>
													</div>
												</div>
												<div class="arrow_button css-1b9dnd0 left"
													style="display: none;">
													<button type="button" class="css-vp7uyl"
														style="margin-bottom: 40px;">
														<img
															src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIgdHJhbnNmb3JtPSJyb3RhdGUoMTgwIDYgOCkiLz4KICAgICAgICA8cGF0aCBmaWxsPSIjMjkyQTMyIiBzdHJva2U9IiMyOTJBMzIiIHN0cm9rZS13aWR0aD0iLjM1IiBkPSJNMy40MjkgMTMuNDA5TDQuMzU0IDE0LjI1OCAxMC42OCA4LjQ2IDExLjE0MyA4LjAzNiA0LjM1NCAxLjgxMyAzLjQyOSAyLjY2MiA5LjI5MSA4LjAzNnoiIHRyYW5zZm9ybT0icm90YXRlKDE4MCA2IDgpIi8+CiAgICA8L2c+Cjwvc3ZnPgo="
															alt="forward">
													</button>
												</div>
												<div class="arrow_button css-pf83cl right">
													<button type="button" class="css-vp7uyl"
														style="margin-bottom: 40px;">
														<img
															src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMiIgaGVpZ2h0PSIxNiIgdmlld0JveD0iMCAwIDEyIDE2Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZD0iTTAgMEgxMlYxNkgweiIvPgogICAgICAgIDxwYXRoIGZpbGw9IiMyOTJBMzIiIHN0cm9rZT0iIzI5MkEzMiIgc3Ryb2tlLXdpZHRoPSIuMzUiIGQ9Ik0zLjQyOSAxMy40MDlMNC4zNTQgMTQuMjU4IDEwLjY4IDguNDYgMTEuMTQzIDguMDM2IDQuMzU0IDEuODEzIDMuNDI5IDIuNjYyIDkuMjkxIDguMDM2eiIvPgogICAgPC9nPgo8L3N2Zz4K"
															alt="forward">
													</button>
												</div>
											</div>
											<div class="css-1gkas1x-Grid e1689zdh0">
												<div class="css-1y901al-Row emmoxnt0">
													<hr class="css-g67iqr">
												</div>
											</div>
										</section>
									</c:if>
                           <section class="css-rwltgb">
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <header class="css-1ue9xs6">
                                       <h2 class="css-1wtjsst"> 비슷한 작품</h2>
                                    </header>
                                 </div>
                                 
                              </div>
                              <div class="css-1gkas1x-Grid e1689zdh0">
                                 <div class="css-1y901al-Row emmoxnt0">
                                    <ul class="css-27z1qm-VisualUl-ContentGrid e14whxmg0">
                                       <c:forEach var="reco" items="${reco }" begin="0" end="9"
                                          step="1">
                                          <li class="css-1hp6p72"><a title="${reco.title }"
                                             href="ContentsDetai.do?type=${reco.contents_type }&id=${reco.contents_num}"><div
                                                   class="css-1qmeemv">
                                                   <div
                                                      class=" css-1rdb949-StyledLazyLoadingImage ezcopuc0">
                                                      <img src="${reco.poster_path }"
                                                         class="css-qhzw1o-StyledImg ezcopuc1">
                                                   </div>
                                                </div>
                                                <div class="css-ixy093">
                                                   <div class="css-niy0za">${reco.title }</div>
                                                   <div>
                                                      <div class="css-m9i0qw">평균
                                                         ★${Math.ceil((reco.vote_average)/2*10)/10}</div>
                                                      <div class="css-1vvt4am">
                                                         <c:if test="${reco.contents_type eq 'movie' }">영화</c:if>
                                                         <c:if test="${reco.contents_type eq 'tv' }">TV 시리즈</c:if>
                                                      </div>
                                                   </div>
                                                </div></a></li>
                                       </c:forEach>
                                    </ul>
                                 </div>
                              </div>
                           </section>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="css-ppmf8q-HiddenBlockOnlyMdScreen e1ezac4310"></div>
            </div>
         </div>
         
      </div>
   </div>
</div>
</main>
<!--코멘트 모달 틀-->
<div class="modal fade" id="commentModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-comment">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/board/comment.jsp" />
		</div>
	</div>
</div>
 
<!--코멘트 수정폼 모달 틀-->
<div class="modal fade" id="commentUpdateModal" tabindex="-1"
	role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-comment">
		<div class="modal-content">
			<jsp:include page="/WEB-INF/views/board/commentUpdate.jsp" />
		</div>
	</div>
</div>
<input type="hidden" value="${user_id}" id="user_id">
<input type="hidden" value="${check}" id="check">
<input type="hidden" value="${info.contents_num}" id="contents_num">
<input type="hidden" value="${info.contents_type}" id="contents_type">
