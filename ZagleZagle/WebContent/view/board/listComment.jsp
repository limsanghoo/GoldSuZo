<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listComment</title>
</head>
<body>

<form name="addComment">

	<input type="text" name="commentDetailText" placeholder="댓글을 입력해주세요">
	<input type="button" name="addComment" value="등록">
	<input type="hidden" name="userNo" value="${user.userNo}">
	<input type="hidden" name="boardNo" value="${board.boardNo}">
</form>




</body>
</html>