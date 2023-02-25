<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
	body{
		background: #212121;
		color: white;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${reportDetail }" var="list">
신고자 : <span>${list.userId }</span><br>
 <h3>분류 : ${list.reportOption }</h3>
 <h3>내용: ${list.reportDetail }</h3>
	<hr>
</c:forEach>
</body>
</html>