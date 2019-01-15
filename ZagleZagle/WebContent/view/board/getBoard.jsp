<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>getBoard</title>
</head>

<body>

<div>
${board.coord}
</div>

<div>
	<c:if test="${board.photo1 !=null}">
	<img src="/common/images/board/${board.photo1}" style="width: 500px"/>
	<input type="button" value="링크추가"/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="/common/images/board/${board.photo2}" style="width: 500px"/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="/common/images/board/${board.photo3}" style="width: 500px"/>
	</c:if>
</div>

<div>
${board.boardDetailText}
</div>






<%-- <div class="container">
	<div class="page-header">
		<h1>Carousel</h1>
	</div>
 <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

<div class="carousel-inner" role="listbox">
		<c:if test="${board.photo1 !=null}">
        <div class="item active">
          <img src="/common/images/board/${board.photo1}" width="1140" height="500" alt="First slide">
         </div>
         </c:if>
         
         <c:if test="${board.photo2 !=null}">
        <div class="item">
          <img src="/common/images/board/${board.photo2}" width="1140" height="500" alt="Second slide">
         </div>
         </c:if>
         
         <c:if test="${board.photo3 !=null}">
         <div class="item">
          <img src="/common/images/board/${board.photo3}" width="1140" height="500" alt="Third slide">
         </div>
         </c:if>
</div>

<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
 		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
   	 <span class="sr-only">Previous</span>
</a>

<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
</a>
</div>
</div> --%>




</body>
</html>