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
     
</main>
              
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>