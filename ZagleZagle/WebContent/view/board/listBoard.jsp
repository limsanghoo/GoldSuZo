<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>listBoard</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

</head>

<body>

<c:set var="i" value="0" />
<c:forEach var="board" items="${list}">
	<c:set var="i" value="${ i+1 }" />
		
	<div class="bs-example" data-example-id="thumbnails-with-custom-content">
	<div class="col-sm-6 col-md-4">
	
	<div class="thumbnail">
	
	<a href="http://192.168.0.36:8080/board/getBoard?boardNo=${board.boardNo}">
	
	<p>
	<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px;" align="middle"/>
	${board.user.userNickname}
	</p>
	
	<div class="caption">
	
	<c:if test="${board.coord !=null && board.photo1 !=null}">
	<p align="center">${board.coord}</p>
	</c:if>
	
	<c:if test="${board.coord ==null && board.photo1 !=null}">
	<img src="/common/images/board/${board.photo1}" style="height: 300px; width:300px;" align="middle"/>
	</c:if>
	
	<p align="center">${board.boardDetailText}</p>
	<p align="center">${board.hashTag}</p>
	
	</div>
	</a>
	</div><!-- 썸네일 -->
	
	</div>
	</div>
</c:forEach>
</body>


</html>