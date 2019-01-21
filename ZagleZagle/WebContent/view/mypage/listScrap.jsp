<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	 <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>
<body>

<jsp:include page="/view/mypage/mypageToolbar.jsp" />


<div class="container">
	
	<div class="page-header text-info">
	       <h5>스크랩 게시물 보기</h5>
	    </div>
	    
	    
	    
	    <table class="table table-hover table-striped" >
	    <thead>
	     <tr>
            <th align="center">No</th>
            <th align="left" >스크랩 게시물 내용</th>
            <th align="left">스크랩 날짜</th>
            
            <th align="left">취소 여부</th>
            
          </tr>
        </thead>
		
			  <tbody>
      
      <c:set var="i" value="0" />
		   <c:forEach var="mypage" items="${list}">
		
		   
		   
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : 댓글 작성한 게시물로 이동" data-param="${mypage.scrap.scrapNo}">${mypage.scrap.userNo}</td>
			  <td align="left">${mypage.scrap.userNo}</td>
			  
			  
			  
			  	</c:forEach>
			  
			  
			</table>
			
	</div>
		
	    ${list}
	
</body>
</html>