<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" >
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


	

<script type="text/javascript">
function fncGetList(currentPage) {
	//document.getElementById("currentPage").value = currentPage;
   	//document.detailForm.submit();		
   	$("#currentPage").val(currentPage)
   	$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
}

$(function() {
	 
	//==> 검색 Event 연결처리부분
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
	 //$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
		//fncGetList(1);
	});
		
	
		
		$( "td:nth-child(2)" ).on("click" , function() {
			
			
			var boardNo = $(this).data("param");
			console.log(boardNo);
			//Debug..
			alert(  $( this ).text().trim() );
			
			
			self.location ="/board/getBoard?boradNo="+boardNo;
	});
		
		
		$(document).ready(function(){
		    $("#myModal").click(function(){
		        $("#myModal").modal();
		    });
		});
		

	

</script>


<style>
	div.page-header {
		padding-top : 50px:
	}
	
	


	
	
	
	
	
	
	
</style>


</head>
<body>


<jsp:include page="/view/layout/toolbar.jsp" />



<jsp:include page="/view/layout/mypageToolbar.jsp" />


<div class="container" >
	
	<div class="page-header text-info" style="font-style: italic;">
	       <h5 style="font-size: x-large;">작성 게시물 보기</h5>
	    </div>
	
	<table class="table table-hover table-striped" >
	    
		<thead>
		
		 <tr>
            <th align="center" style="font-size: large;">No</th>
            <th align="left" style="font-size: large;">글 내용</th>
            <th align="left"style="font-size: large;">작성 날짜</th>
          </tr>
        </thead>


		  <tbody class="tt">
      
      <c:set var="i" value="0" />
		  
		    <c:forEach var="board" items="${listBoard}">
		  
		  
		  
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left" style="font-size: medium;">${ i }</td>
			 	 
			  <td class="abcd" align="left"  style="font-size: medium;" title="Click : 게시물 상세정보" data-toggle="modal" data-target="#${board.boardNo}aaa">${board.boardDetailText}</td>
			  	
			  <td align="left" style="font-size: medium;" >${board.boardRegDate}</td>
			  
			 
			  
			  
			  </tr>
			  
			  <!-- Modal -->
<div class="modal fade" id="${board.boardNo}aaa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
 
			   <div class="modal-footer">
      <input type="text" value>
      </div>
      <!-- 모달1 푸터 끝 -->
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달1 끝 -->
			  
			  
		
			  	</c:forEach>
			  
			</table>
			
			
			
	</div>

	
	<jsp:include page="/common/pageNavigation.jsp" />
	
</body>
</html>