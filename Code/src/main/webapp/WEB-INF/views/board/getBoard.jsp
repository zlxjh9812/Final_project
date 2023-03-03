<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@include file="../common/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스-자유게시판</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<style>

	input {
	  width: 150px;
	  height: 32px;
	  font-size: 20px;
	  border: 0;
	  border-radius: 15px;
	  outline: none;
	  text-align:center;
	  padding-left: 10px;
	  background-color: rgb(233, 233, 233);
	}
 	
	  .text_box {
	  position:relative; 
	  display:inline-block; 
	  width:100%;
	  }
	  .text_box textarea {
	  width:100%; 
	  height:152px; 
	  color:#666; 
	  font-family:"ht_r"; 
	  font-size:18px; 
	  line-height:28px; 
	  padding:20px; 
	  border:1px solid #e4dcd3; 
	  outline:0; 
	  resize:none
	  }
	  .text_box .count {
	  position:absolute; 
	  right:20px; 
	  bottom:20px; 
	  color:#666; 
	  font-family:"ht_r"; 
	  font-size:15px;
	  }	
  	
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
    <main id="main" class="main" style="margin-top:0px;">
    	<div style=" width: 1000px; margin:0 auto;">
    	<c:if test="${User.userId != null}">
   	    	<div style="border: 1px solid; width: 1000px; padding: 3px">
				<form id="form1" name="form1">
					<input type="hidden" id="bseq1" name="bseq" value="<c:out value="${board.bseq}"/>"> 
					
					작성자: <input type="text" id="writer1" name="writer"  value="${User.nickname }" size="15" readonly><br/>
					<div class="text_box">
						<textarea style="resize: none" id="content1" name="content" rows="3" cols="100" maxlength="200" placeholder="댓글을 달아주세요."></textarea>
					<div class="count"><span>0</span>/200</div>
					</div>
					<a onclick="formSubmit()">저장</a>

				</form>
			</div>
			</c:if>
    	
    	<div id="replyList"> 
			<c:forEach var="replyList" items="${replyList}" varStatus="status">
				<div id="replyItem<c:out value="${replyList.rseq}"/>"
							style="border: 1px solid gray; width: 1000px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${10*replyList.redepth}"/>px; display: inline-block">	
					<c:out value="${replyList.writer}"/> <c:out value="${replyList.regdate}"/>
					    	<c:if test="${User.nickname  eq replyList.writer }">
					<a onclick="replyDelete('<c:out value="${replyList.rseq}"/>')">삭제</a>
					<a onclick="replyUpdate('<c:out value="${replyList.rseq}"/>')">수정</a>
							</c:if>
							<c:if test="${User.userId != null}">
					<a onclick="replyReply('<c:out value="${replyList.rseq}"/>')">댓글</a>
						</c:if>
					<br/>
					<div id="reply<c:out value="${replyList.rseq}"/>"><c:out value="${replyList.content}"/></div>
				</div><br/>
			</c:forEach>
		</div>

		<div id="replyDiv" style="width: 99%; display:none">
			<form id="form2" name="form2" action="replyWrite.do" method="post">
				<input type="hidden" id="bseq2" name="bseq" value="<c:out value="${board.bseq}"/>"> 
				<input type="hidden" id="rseq2" name="rseq"> 
				<div class="text_box">
					<textarea style="resize: none" id="content2" name="content" rows="3" cols="100" maxlength="200"></textarea>
					<div class="count"><span>0</span>/200</div>
				</div>
				<a onclick="replyUpdateSave()">저장</a>
				<a onclick="replyUpdateCancel()">취소</a>
			</form>
		</div>
			
		
		<div id="replyDialog" style="width: 99%; display:none">
			<form id="form3" name="form3" action="replyWrite.do" method="post">
				<input type="hidden" id="bseq3" name="bseq" value="<c:out value="${board.bseq}"/>"> 
				<input type="hidden" id="rseq3" name="rseq"> 
				<input type="hidden" id="reparent3" name="reparent"> 
				작성자: <input type="text" id="writer3" name="writer"  value="${User.nickname }" size="15" readonly> <br/>
				<div class="text_box">
					<textarea style="resize: none" id="content3" name="content" rows="3" cols="100" maxlength="500"></textarea>
					<div class="count"><span>0</span>/200</div>
				</div>
				<a onclick="replyReplySave()">저장</a>
				<a onclick="replyReplyCancel()">취소</a>
			</form>
		</div>
   	</div>
   	    </main>
   	
    <div style="margin-bottom:10%;">
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	
   <!-- 좋아요 버튼 -->
   <script src="<c:url value="/resources/assets/js/likebutton.js"/>"></script>
   	<link rel="stylesheet" href="<c:url value="/resources/assets/css/likebutton.css"/>">
  	<script type="text/javascript">
		$("#report").on("click",function(e){
			const url = "Report.do"
			window.open(url,'신고하기','width=500, height=700, scrollbars=yes,resizable=no');
		})
	</script>
	
	<script>
	
	$('.text_box textarea').keyup(function(){
		  var content = $(this).val();
		  $('.text_box .count span').html(content.length);
		  if (content.length > 200){
		    alert("최대 200자까지 입력 가능합니다.");
		    $(this).val(content.substring(0, 200));
		    $('.text_box .count span').html(200);
		  }
		});

function chkInputValue(id, msg){
	if ( $.trim($(id).val()) == "") {
		alert(msg+" 입력해주세요.");
		$(id).focus();
		return false;
	}
	return true;
}
function formSubmit(){
	if ( ! chkInputValue("#content1", "글 내용을")) return;
	
	var formData = $("#form1").serialize();
	
	$.ajax({
		url: "replyWrite.do", 
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#writer1").val("");
				$("#content1").val("");
				$("#replyList").append(result);
				alert("저장되었습니다.");
				location.reload();
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})		
}

function replyDelete(rseq){
	if (!confirm("삭제하시겠습니까?")) {
		return;
	}
	$.ajax({
		url: "replyDelete.do",
		type:"post", 
		data: {"rseq": rseq},
		success: function(result){
			if (result=="OK") {
				$("#replyItem"+rseq).remove();
				alert("삭제되었습니다.");
				location.reload();
			} else{
				alert("댓글이 있어서 삭제할 수 없습니다.");
			}
		}
	})
}

var updateRseq = updateContent = null;
function replyUpdate(rseq){
	hideDiv("replyDialog");
	
	$("#replyDiv").show();
	
	if (updateRseq) {
		$("#replyDiv").appendTo(document.body);
		$("#reply"+updateRseq).text(updateContent);
	} 
	
	$("#rseq2").val(rseq);
	$("#content2").val($("#reply"+rseq).text());
	$("#reply"+rseq).text("");
	$("#replyDiv").appendTo($("#reply"+rseq));
	$("#content2").focus();
	updateRseq   = rseq;
	updateContent = $("#content2").val();
} 

function replyUpdateSave(){
	if ( ! chkInputValue("#content2", "글 내용을")) return;
	
	var formData = $("#form2").serialize();
	$.ajax({
		url: "replyWrite.do", 
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				$("#reply"+updateRseq).text($("#content2").val());
				$("#replyDiv").hide();
				alert("저장되었습니다.");
				location.reload();
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})
} 

function replyUpdateCancel(){
	hideDiv("#replyDiv");
	
	$("#reply"+updateRseq).text(updateContent);
	updateRseq = updateContent = null;
} 

function hideDiv(id){
	$(id).hide();
	$(id).appendTo(document.body);
}

function replyReply(rseq){
	$("#replyDialog").show();
	
	if (updateRseq) {
		replyUpdateCancel();
	} 
	
	$("#reparent3").val(rseq);
	$("#content3").val("");
	$("#replyDialog").appendTo($("#reply"+rseq));
	$("#writer3").focus();
} 
function replyReplyCancel(){
	hideDiv("#replyDialog");
} 

function replyReplySave(){
	if ( ! chkInputValue("#content3", "글 내용을")) return;

	var formData = $("#form3").serialize();
	$.ajax({
		url: "replyWrite.do",
		type:"post", 
		data : formData,
		success: function(result){
			if (result!=="") {
				var parent = $("#reparent3").val();
				$("#replyItem"+parent).after(result);
				$("#replyDialog").hide();
				alert("저장되었습니다.");
				$("#writer3").val("");
				$("#content3").val("");
				location.reload();
			} else{
				alert("서버에 오류가 있어서 저장되지 않았습니다.");
			}
		}
	})	
}
</script>
</body>
</html> 		