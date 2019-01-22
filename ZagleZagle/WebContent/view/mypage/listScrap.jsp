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


		<script>
		
		
	
		//==> Board 정보 요청 Ajax 부분
		
		
		//==> 스크랩 취소 기능
		 $(function() {
	
	 $("span.glyphicon.glyphicon-ok").on("click", function() {
	 
	 alert("확인용")
 });

 });
		//==>스크랩 취소 끝
	

		
		</script>



</head>



<body>

<jsp:include page="/view/layout/mypageToolbar.jsp" />

<div class="container">

<div class="page-header text-info">
	       <h5>스크랩 게시물</h5>
	    </div>
	    
	         <table class="table table-hover table-striped" >
	    
	         <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >스크랩 내용</th>
            <th align="left">작성 날짜</th>
            <th align="left">취소</th>
  
          </tr>
        </thead>
	    
	    
      <c:set var="i" value="0" />
		   <c:forEach var="board" items="${listBoard}">
		   	
		   	<tr>
		   <c:set var="i" value="${ i+1 }" />
		 
		     <td align="left">${ i }</td>
		   	
		      <td align="left" title="Click : 게시물 상세정보" data-toggle="modal" data-target="#${board.boardNo}bbb">${board.boardDetailText}</td>
		      <td align="left">${board.boardRegDate} 				</td>
		      <td align="left"> <span class="glyphicon glyphicon-ok" aria-hidden="true">Click</span>
				 </td>
		      
		    </tr>
		    
		    
		      <!-- Modal -->
<div class="modal fade" id="${board.boardNo}bbb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog"  role="document">
    <div class="modal-content">
      <div class="modal-header">
      <div class="row">
      
   
     
     <h4 class="modal-title" id="gridSystemModalLabel">
       <div class="col-md-4">
      <img src="/common/images/profile/${user.profile}" style="height: 60px; width:60px;" align="left"/>
		${user.userNickname}
		</div>
		
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
      
		<div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${board.photo1 !=null}">
			<div><img src="${board.photo1}" style="width: 450px"/></div>
			<br/>
			</c:if>

			<c:if test="${board.photo2 !=null}">
			<div><img src="${board.photo2}" style="width: 450px"/></div>
			<br/>
			</c:if>
	
			<c:if test="${board.photo3 !=null}">
			<div><img src="${board.photo3}" style="width: 450px"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${board.boardDetailText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
		    
		    
		    
	    </c:forEach>
	    
	    </table>
		    
	
	</div>
</body>
</html>