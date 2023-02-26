<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@include file="common/sidebar.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>#리뷰어스</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
	

	
 </head>
 <body>  
   <main id="main" class="main">
   		<!-- Modal -->
               <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                     <div class="modal-content">
                        <div class="modal-body">
                           <div class="member">
                              <form action="login.do" method="post">
                                 <h2>#REVIEWERS</h2>
                                 <h1>로그인</h1>
                                 <div class="field">
                                    <b>아이디</b> <span class="placehold-text"><input type="text" id="UserId" name="UserId"></span>
                                 </div>
                                 <div class="field">
                                    <b>비밀번호</b> <input class="userpw" type="password" id="password" name="password">
                                 </div>
                                 <input type="submit" value="로그인">
                                 <div class="member-footer">
 <hr>
                                    <div>
                                       <a href="sign_up.do">회원가입</a> <a href="findId.do">아이디 찾기</a><a href="updatePasswordGo.do">비밀번호 찾기</a>
                                    </div>
                                 </div>
                              </form>
                           </div>

                        </div>

                     </div>
                  </div>
               </div>
    <!-- 인기영화 슬라이드 코드 -->
  <c:choose>
  		<c:when test="${type eq 'movie'}">  
	 	 	<h2 style="margin-left:270px; margin-top: 100px;">인기 영화</h2>
  		</c:when>
  		<c:otherwise>
	 	 	<h2 style="margin-left:270px; margin-top: 100px;">인기 TV 프로그램</h2>
  		</c:otherwise>
  </c:choose>
  <div>

    <button onClick="location.href='getReviewReport.do'" class="custom-btn btn-1">관리자 페이지</button>

    <div class="slider">
   	  <c:forEach var="release_date" begin="0" end="19" step="1" items="${release_date}">
     	<div><img src="${release_date.poster_path }" onClick="location.href='ContentsDetail.do?type=${release_date.contents_type }&id=${release_date.contents_num }'">
      		<div>${release_date.title }</div>
      	</div>
     </c:forEach>
    </div>
   </div>   
    <hr>  
    <div>
    	<h2 style="margin-left:270px;margin-top:100px; ">인기 리뷰</h2>  	
    	<div class="slider">
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
 							<div class="css-niy0za">제목:${board.title }</div>
 								<div>
 									<div class="css-m9i0qw">추천:${board.like_num }</div>
 									<div class="css1vvt4am">작성자 : ${board.nickname }</div>
 								</div>
 						</div>
 					</a>
 				</li>
 			</c:forEach>
    	</div>
    </div>
   <!-- 인기영화 슬라이드 끝 -->


  </main><!-- End #main -->


</body>
</html>
