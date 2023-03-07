<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
       <%@include file="../common/sidebar.jsp" %>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 게시판</title>
<script type="text/javascript" src="<c:url value="/resources/InsertAuthority.js"/>">
window.onload = function(){
	console.log(${boardList})
	  }
</script>
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
                                    <b>비밀번호</b> <input class="userpw" type="password"
                                       id="password" name="password">
                                 </div>
                                 <input type="submit" value="로그인">
                                 <div class="member-footer">
                                    <hr>
                                    <div>
                                       <a href="sign_up.jsp">회원가입</a> <a href="findId.do">아이디
                                          찾기</a> <a href="updatePasswordGo.do">비밀번호 찾기</a>
                                    </div>
                                 </div>
                              </form>
                           </div>

                        </div>

                     </div>
                  </div>
               </div>
 
 <div class="css-1gkas1x-Grid e1689zdh0">
 	<div class="css-1y901a1-Row emmoxnt0">
 		<ul class="css-27z1pm-VisualUI-ContentGrid e14whxmg0" style="width:80%;margin:auto;">
 		<c:forEach items="${boardList }" var="board">
 			<li class="css-1hp6p72">
 				<a title="${board.title }" href="getBoard.do?bseq=${board.bseq }">
 					<div class="css-1qmeemv">
 						<div class="css-1rdb949-StyledLazyLoadingImage ezcopuc0">
 						<c:choose>
                   <c:when test="${board.filename != '2'}">
                      <img alt="경호 확인 필요" src="/img/${board.filename }" class="css-qhzw1o-StyledImg ezcopuc1">
                      
                   </c:when>
                   <c:otherwise>
 							<img src="${board.reviewPic }" class="css-qhzw1o-StyledImg ezcopuc1">
                   </c:otherwise>
                   </c:choose>
 						</div>
 					</div>
 					<div class="css-ixy093">
 						<div class="css-niy0za">제목:<a href="cgetBoard.do?bseq=${board.bseq }">${board.title }</a></div>
 						<div class="css1vvt4am">작성자: ${board.nickname }</div>
 							<div>
 								<div class="css-m9i0qw">👍:${board.like_num }&nbsp👎 : ${board.unlike_num }</div>
 							</div>
 					</div>
 				</a>
 			</li>
 		</c:forEach>
 		</ul>
 	</div>
 </div>
  
        <br>
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li class="page-item paginate_button previous">
				<a class="page-link" href="${pageMaker.startPage -1}">Previous</a>
			</li>
		</c:if>
		<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num" >
		<li class="page-item paginate_button  ${pageMaker.vo.pageNum == num ? "active":""} ">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class="page-item paginate_button next">
				<a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
			</li>
		</c:if>
	</ul>
</div>

<%-- <form id='pageForm' action="getBoardList.do?num=${boardnum}" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.vo.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.vo.amount}'>
	<input type='hidden' name= 'boardnum' value='${boardnum}'> 

	<input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.vo.searchCondition }"/>'> 
	<input type='hidden' name='searchKeyword'	value='<c:out value="${ pageMaker.vo.searchKeyword }"/>'>
</form>
 --%>
<script>
	$(function(){
		$(".paginate_button a").on("click",
			function(e) {
				e.preventDefault();
//				console.log('click');
				$("#pageForm").find("input[name='pageNum']").val($(this).attr("href"));
				$("#pageForm").submit();
			}
		);
	});
</script>

<button class="custom-btn btn-1" onClick="location.href='#'" id="write">리뷰 작성</button>
                </main><!-- End #main -->


                
              
              
		<c:import url="../common/footer.jsp"></c:import>
  
  
  

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>
</html>