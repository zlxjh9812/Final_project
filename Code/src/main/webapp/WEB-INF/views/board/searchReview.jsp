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
<link href ="<c:url value="/resources/assets/css/table.css"/>" rel="stylesheet">
<title>검색 결과</title>
</head>
<body>
    <main id="main" class="main">
      <c:choose>
    <c:when test="${searchname eq 'free'}">
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
                <c:forEach items="${result }" var="result">
			   <tr>
			      <td>${result.writedate }</td>
			      <td>${result.nickname }</td>
			      <td align="left"><a href="getBoard.do?bseq=${result.bseq }">${result.title }</a></td>
			      <td>${result.cnt }</td>	
			      <td>${result.like_num }</td>	
			   </tr>
			   </c:forEach>
			                </tbody>
			            </table>
<button type="button" class="custom-btn btn-1" style="float:inline; margin-right:3px; margin-top:20px;" onClick="location.href='#'" id="write">글쓰기</button>


        </div>
    </div>
    </c:when>
    <c:otherwise>
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
                      <img alt="경호 확인 필요" src="/img/${result.filename }" class="css-qhzw1o-StyledImg ezcopuc1">
                      
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
 								<div class="css-m9i0qw">👍 :${result.like_num}</div>
 								<div class="css-m9i0qw">👎 :${result.unlike_num}</div>
 							</div>
 					</div>
 				</a>
 			</li>
 		</c:forEach>
 		</ul>
 	</div>
 </div>
    </c:otherwise>
    </c:choose>
     
</main>
              
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>