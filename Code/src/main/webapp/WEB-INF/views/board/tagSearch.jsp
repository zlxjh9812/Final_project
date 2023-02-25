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
<title>리뷰 검색 결과</title>
</head> 
</head>
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
 		<c:forEach items="${result }" var="result">
 			<li class="css-1hp6p72">
 				<a title="${result.title }" href="getBoard.do?bseq=${result.bseq }">
 					<div class="css-1qmeemv">
 						<div class="css-1rdb949-StyledLazyLoadingImage ezcopuc0">
 						 						<c:choose>
                   <c:when test="${result.filename != '2'}">
                      <img alt="경로 확인 필요" src="${pageContext.servletContext.contextPath}/upload/thumbnail/${result.filename }" class="css-qhzw1o-StyledImg ezcopuc1">
                      
                   </c:when>
                   <c:otherwise>
 							<img src="${result.reviewPic }" class="css-qhzw1o-StyledImg ezcopuc1">
                   </c:otherwise>
                   </c:choose>
 						</div>
 					</div>
 					<div class="css-ixy093">
 						<div class="css-niy0za"><strong>${ result.title }</strong></div>
 						<div class="css1vvt4am">작성자 : ${result.nickname }</div>
 							<div>
 								<div class="css-m9i0qw">👍 :${result.like_num}&nbsp👎 :${result.unlike_num}</div>	
 							</div>
 					</div>
 				</a>
 			</li>
 		</c:forEach>
 		</ul>
 	</div>
 </div>

    
    
   <!-- 인기영화 슬라이드 끝 -->

  </main><!-- End #main -->

 <c:import url="footer.jsp"></c:import>
</body>
</html>