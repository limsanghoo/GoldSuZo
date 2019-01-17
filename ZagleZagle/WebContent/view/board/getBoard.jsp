<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>getBoard</title>

<style>
	#goListBoard{
		position: static;
    	float:right;
	}
</style>


</head>

<body>


<a href="/board/listBoard">
<input type="button" value="전체 게시물" id="goListBoard">
</a>

<br/>

<div>
${board.coord}
</div>

<div>
	<c:if test="${board.photo1 !=null}">
	<img src="${board.photo1}" style="width: 500px"/>
	<input type="button" value="링크추가"/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="${board.photo2}" style="width: 500px"/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="${board.photo3}" style="width: 500px"/>
	</c:if>
</div>

<div>
${board.boardDetailText}
</div>




</body>
</html>