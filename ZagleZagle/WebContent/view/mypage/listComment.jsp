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
	       <h5>작성 댓글 보기</h5>
	    </div>
	    
	    
	    
	    <table class="table table-hover table-striped" >
	    <thead>
	     <tr>
            <th align="center">No</th>
            <th align="left" >댓글 내용</th>
            <th align="left">작성 날짜</th>
            
            <th align="left">삭제 여부</th>
            
          </tr>
        </thead>
		
			  <tbody>
      
      <c:set var="i" value="0" />
		   <c:forEach var="mypage" items="${list}">
		   
		   <div class="moal" data-toggle="modal" data-target="#${board.boardNo}modal1"></div>
		   
		   
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : 댓글 작성한 게시물로 이동" data-param="${mypage.comment.commentNo}">${mypage.comment.commentDetailText}</td>
			  <td align="left">${mypage.comment.commentRegDate}</td>
			  
		
<!-- 모달1 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}modal1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
	<!-- 모달1 헤더 시작 -->
      <div class="modal-header">
      <div class="row">
      
      	<div class="col-md-11 col-md-offset-1">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        
        <h4 class="modal-title" id="gridSystemModalLabel">
        <div class="col-md-4">
        <img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px;" align="middle"/>
		${board.user.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==board.user.userNo}">
		<div class="col-md-4 col-md-offset-4">
		<input type="button" value="수정" data-update="${board.boardNo}"/>
        <div class="btn btn-primary" data-toggle="modal" data-target="#${board.boardNo}modal2">삭제</div>
        </div>
        </c:if>
        
        </h4>
        </div>
      </div>
     <!-- 모달1 헤더 끝 -->
      
     <!-- 모달1 바디 시작 -->
      <div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${board.photo1 !=null}">
			<div><img src="${board.photo1}" style="width: 500px"/></div>
			<br/>
			</c:if>

			<c:if test="${board.photo2 !=null}">
			<div><img src="${board.photo2}" style="width: 500px"/></div>
			<br/>
			</c:if>
	
			<c:if test="${board.photo3 !=null}">
			<div><img src="${board.photo3}" style="width: 500px"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${board.boardDetailText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달1 끝 -->
			  
			  
			  
			  
			  
			  	</c:forEach>
			  
			  
			</table>
			
	</div>
		
	    
	
</body>
</html>