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
<script type="text/javascript">

$(function(){
	$("input[value='수정']").bind("click",function(){
		var boardNo=$(this).data('param1');
		self.location="/board/updateBoard?boardNo="+boardNo;
	})
});

</script>
</head>

<body>

<!-- 리스트 시작 -->
<c:set var="i" value="0" />
<c:forEach var="board" items="${list}">
	<c:set var="i" value="${ i+1 }" />
		
	<div class="bs-example" data-example-id="thumbnails-with-custom-content">
	<div class="col-sm-6 col-md-4">
	
	<div class="thumbnail" data-toggle="modal" data-target="#${board.boardNo}">

	
	<p>
	<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px;" align="middle"/>
	${board.user.userNickname}
	</p>
	
	<div class="caption">
	
	<c:if test="${board.coord !=null && board.photo1 !=null}">
	<p align="center">${board.coord}</p>
	</c:if>
	
	<c:if test="${board.coord ==null && board.photo1 !=null}">
	<img src="/common/images/board/${board.photo1}" style="width:100%;" align="middle"/>
	</c:if>
	
	<p align="center">${board.boardDetailText}</p>
	<p align="center">${board.hashTag}</p>
	
	</div>	
	</div>
	
<!-- 모달 시작 -->
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
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
		
		<div class="col-md-4 col-md-offset-4">
		<input type="button" value="수정" data-param1="${board.boardNo}"/>
        <input type="button" value="삭제"/>
        </div>
        
        </h4>
        </div>
      </div>
      
      <div class="modal-body">     
      <jsp:include page="/board/getBoard?boardNo=${board.boardNo}"/>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달 끝 -->	
	
	</div>
	</div>
	
</c:forEach>
<!-- 리스트 끝 -->



</body>


</html>