<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<div id="replyItem<c:out value="${replyvo.rseq}"/>" 
	 style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*replyvo.redepth}"/>px; display: inline-block">	
	<c:out value="${replyvo.writer}"/> <c:out value="${replyvo.regdate}"/>
	<a href="#" onclick="replyDelete('<c:out value="${replyvo.rseq}"/>')">삭제</a>
	<a href="#" onclick="replyUpdate('<c:out value="${replyvo.rseq}"/>')">수정</a>
	<a href="#" onclick="replyReply('<c:out value="${replyvo.rseq}"/>')">댓글</a>
	<br/>
	<div id="reply<c:out value="${replyvo.rseq}"/>"><c:out value="${replyvo.content}"/></div>
	
</div><br/>