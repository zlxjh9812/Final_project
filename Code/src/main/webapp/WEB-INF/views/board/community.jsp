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
<!-- 게시판 css -->
<link href ="<c:url value="/resources/assets/css/table.css"/>" rel="stylesheet">
<link href ="stylesheet" href="<c:url value="/resources/assets/css/button.css"/>">
<script type="text/javascript" src="<c:url value="/resources/InsertAuthority.js"/>"></script>

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
 	<div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-writer">작성자</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-cnt">조회수</th>
                    <th scope="col" class="th-cnt">추천수</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList }" var="board">
			   <tr>
			      <td>${board.writedate }</td>
			      <td>${board.nickname }</td>
			      <td align="left"><a href="getBoard.do?bseq=${board.bseq }">${board.title }</a></td>
			      <td>${board.cnt }</td>	
			      <td>${board.like_num }</td>	
			   </tr>
			   </c:forEach>
			                </tbody>
			            </table>
<button type="button" class="custom-btn btn-1" style="float:inline; margin-right:3px; margin-top:20px;" onClick="location.href='#'" id="write">글쓰기</button>


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
<form id='pageForm' action="getBoardList.do?num=${boardnum}" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.vo.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.vo.amount}'>
	<input type='hidden' name= 'boardnum' value='${boardnum}'> 

	<input type='hidden' name='searchCondition' value='<c:out value="${ pageMaker.vo.searchCondition }"/>'> 
	<input type='hidden' name='searchKeyword'	value='<c:out value="${ pageMaker.vo.searchKeyword }"/>'>
</form>

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


                        
              
                </main><!-- End #main -->
              
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>