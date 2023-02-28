<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@include file="../common/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>

stylesheet">

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스-자유게시판</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<style>
      
      table{
      width:80%;
      }
      
      .topbar{
      	line-height: 45px;
      	background-color:snow;
      	border-bottom:1px solid gray;
      	width: 100%;
      	height: 40px;
      	display: flex; 
      	justify-content:space-between;
      	font-weight: bold;
      	font-size: large;
      	
      }
      
      .topbar .barleft{
      	display: flex; 
      	text-align: left;
      	justify-content: left;
      	margin-left:40px;
      }
      
      .topbar .barcenter{
      	display: flex; 
      	text-align: center;
      	justify-content: center;
      }
      
      .topbar .barright{
      	display: flex; 
      	text-align: right;
      	justify-content: right;
      	margin-right:40px;
      }
      
      .topbar_link{
      	text-align:right;
      	margin-right:150px;
      	display: flex;
      	justify-content: space-between;
      }
      
      .content-section{
      	font-size:50px;
      	width:60%;
      	height:700px;
      	background-color: white;
      	box-sizing:border-box;
      	display:block;
      	padding:40px;
       	box-shadow: 0 1px 3px 0 rgb(0 0 0 / 10%);
       	border-radius: 5px;
       	position: relative;
      }
      
      .title{
      	font-size:x-large;
      	font-weight: bold;
      	color:coral;
      	padding:20px;
      }
      .content{
      	padding:60px;
      }
      .topbar_link .like{
      	padding:20px;
      }
	.hash{
    		font-size: 15px;
    		position: absolute;
    		bottom: 8px;
    	}
    	.divide{
    		position:absolute;
    		width: 90%;
    		diplay:block;
    		height: 50px;
    		bottom:16px;
    		border-top: 1px solid grey;
    		padding:10px;
    	}
    	
    		.divide2{

    		width: 100%;
    		height: 80px;
    		border-bottom: 1px solid grey;
    		padding:10px;
    	}
     
   </style>
</head>

<body>
    <main id="main" class="main" style="height:1000px;">
    	
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
												<b>비밀번호</b> <input class="userpw" type="password"
													id="password" name="password">
											</div>
											<input type="submit" value="로그인">
											<div class="member-footer">
												<hr>
												<div>
													<a href="sign_up.jsp">회원가입</a> <a href="findIdgo.do">아이디
														찾기</a> <a href="updatePasswordGo.do">비밀번호 찾기</a>
												</div>
											</div>
										</form>
									</div>

								</div>

							</div>
						</div>
					</div>
    	
    	<div class="content-section" style ="min-height: 450px; height: 90%; width: 1000px; margin:0 auto;" >   	
    	<div class="topbar">
    		<div class="barleft">작성자: ${board.nickname }</div>
    		<div class="barcenter">${board.writedate }</div>
    		<div class="barright">❤ ${board.like_num }&nbsp&nbsp👁‍🗨${board.cnt}&nbsp&nbsp <a href="#" id="report">🚨</a> </div>
    	</div>
		<div class="title">
			${board.title } 
    	</div>
	<div class="divide2">
		<div style="float:left;">
			<a href = "ContentsDetail.do?type=${board.contentType }&id=${board.moviecode }" style="color:lightgray; font-size:x-large;">${info.title }</a>
		</div>
		<div style="float:right;">
    		 	<c:forEach items="${info.genres}" var = "tag">
    				<a href="HashTagSearch.do?tags=${tag }" id = "hashtags" style=" font-size:x-large;"> ${tag }</a>
    			</c:forEach>	
		</div>
	</div>
    	    		
    		
    	<div class="content" style="font-size:large;">
    		${board.content }
    	</div>
    	
    	<div class="divide" style="font-size: 20px;">  	
    	<c:forEach items="${ hashTag}" var = "tag">
    		<a href="HashTagSearch.do?tags=${tag.tags }" id = "hashtags" >#${tag.tags }</a>
    		</c:forEach>
    	</div>
    		</div>
    	<c:if test="${User.userId eq true }">	</c:if>
   		<div class="topbar_link" style="width: 1000px; margin:0 auto;">
   		<div class="like">
    		<div class="heart"></div>
    		<div class="animation-heart"></div>    
    	</div>
   		<div style="margin-top:10px;">
   		<c:if test="${User.userId  eq board.userId }">
   			
   			<form action="deleteBoard.do?bseq=${board.bseq }" method="POST">
   				<input type="hidden" name="deletenum" id="deletenum" value="${board.boardnum }">
   				<div>
   				<input type="button" onClick="location.href='getUpdate.do?bseq=${board.bseq }'" value="수정하기"  class="custom-btn btn-1">
   				<input type="submit" value="삭제하기 "  class="custom-btn btn-1">
   				</div>
   			</form>
		</c:if>
   				<a href="#" onClick="history.back()">목록</a> <a href="#">|</a> <a href="#">댓글</a>
   		</div>
   	</div>
    

    </main>
	<br>
<c:import url="../common/footer.jsp"></c:import>
   
   <!-- 좋아요 버튼 -->
   <script src="<c:url value="/resources/assets/js/likebutton.js"/>"></script>
   	<link rel="stylesheet" href="<c:url value="/resources/assets/css/likebutton.css"/>">
  	<script type="text/javascript">
		$("#report").on("click",function(e){
			const url = "Report.do"
			window.open(url,'신고하기','width=500, height=700, scrollbars=yes,resizable=no');
		})
	</script>
</body>
</html> 		