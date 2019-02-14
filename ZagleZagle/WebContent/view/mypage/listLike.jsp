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


	<!--  sweetAlert -->  	
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   	

		<script>
		/////page navigation//////

		function fncGetList(currentPage) {
		
		
		
		$("#currentPage").val(currentPage)
		

		
		$("form").attr("method" , "POST").attr("action" , "/mypage/listLike").submit();
	}
		
		////////////좋아요 취소///////////
		 $(function() {
				
			 $("span.glyphicon.glyphicon-ok").on("click", function() {
			 
			var checkLike = '1';	 
			var boardNo = $(this).data("param")
			var userNo = $(this).data("param2")
		
			
					swal({
				  title: "좋아요를 취소하시겠습니까?",
			
					
				  buttons: true,
				  buttons: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				  
						 
						 $.ajax({
							
							url: '/board/json/updateLike/'+userNo+'/'+boardNo+'/'+checkLike,
							type: 'get',
							success: function(data){
								
							self.location="/mypage/listLike"
								
							}
						 
						 })
				 
				  } else {
				    swal("취소하셨습니다.");
				  }
				});
	
	
			
		
			 
		 });

		 });
		
		///댓글 리스트 불러오기
		
		
			 $(function() {
			
		
	
				$("td:nth-child(2)").bind("click",function(){
					var preBoardNo=$(this).data('target');
					
					//#${board.boardNo}modal1 자르기
					var boardNo=preBoardNo.substring(1,8);
					
					commentList(boardNo);
				})
				
				///신고 하기
				$("input[value='신고']").bind("click",function(){
					
					if("${user.userNo}"==""){
						swal("","로그인 후 이용 가능합니다.", "error");
						return;
					}
					
					var boardNo=$(this).data('report');
					
					var data = document.querySelector("#"+boardNo+"report").value;

				    window.open("/view/board/addReport.jsp?val="+data, "addReport", "width=500, height=400, resizable=yes" );
				});
				
				
				//게시물 수정
				$("input[value='수정']").bind("click",function(){
		var boardNo=$(this).data('update');
	
		self.location="/board/updateBoard?boardNo="+boardNo;
	})
				

});
		
		


	//////////좋아요 취소 끝////////////
		
		</script>



</head>


<style>

.my_container {

   padding-top: 1%;
    padding-left: 15%;
    margin: auto;
    max-width: 1600px;
}

.detail{

 width: 700px;
    text-overflow: ellipsis;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    word-wrap: normal !important;
    display: block;
    height: 1.2cm;

}
 

</style>


<body>

<jsp:include page="/view/layout/toolbar.jsp" />
<jsp:include page="/view/layout/mypageToolbar.jsp" />

<div class="my_container">

<div class="page-header text-info">
	       <h5>
	         <img src="/common/images/mypage/love.png" style="width:50px; height:50px;">
	       좋아요한 게시물 보기</h5>
	    </div>
	    
	         <table class="table table-hover table-striped" >
	    
	         <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >게시물 내용</th>
            <th align="left">작성 날짜</th>
            <th align="left">취소</th>
  
          </tr>
        </thead>
	    
	    
      <c:set var="i" value="0" />
		   <c:forEach var="board" items="${listBoard}">
		   	
		   	
		   	
		   	
		   	<tr>
		   <c:set var="i" value="${ i+1 }" />
		 
		
		 
		 
		     <td align="left">${ i }</td>
		   	
		      <td align="left"  class="detail" title="Click : 게시물 상세정보"data-toggle="modal" data-target="#${board.boardNo}scrap">${board.boardDetailText}</td>
		      <td align="left" >${board.boardRegDate}</td>
		      <td align="left"> 		<span class="glyphicon glyphicon-ok" aria-hidden="true" data-param="${board.boardNo}" data-param2="${user.userNo}">Click</span></td>
		      
		    </tr>
		
	
			
<!-- 모달1 시작 -->
<div class="modal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel" id="${board.boardNo}scrap">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
	<!-- 모달1 헤더 시작 -->
    
      <div class="row">
      
      	<div class="col-md-11 col-md-offset-1">
        <span aria-hidden="true" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 15px; margin-right:5px; margin-bottom:15px; display: inline;">&times;</span>       
        </div>
      </div> 
      
        <h4 class="row modal-title" id="gridSystemModalLabel">
         
        <div class="col-sm-2">
        <img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px; border-radius: 70px; vertical-align: middle; margin-left: 15px;"/>
        </div>
        
        <div class="col-sm-3">
		${board.user.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==board.user.userNo}">
		<div class="col-sm-7" style="padding-left: 60px;">
		<input class="btn btn-a" type="button" value="수정" data-update="${board.boardNo}"/>
        <span class="btn btn-b" data-toggle="modal" data-target="#${board.boardNo}modal2">삭제</span>
        </div>
        </c:if>
        
        <!-- 신고 버튼 -->
        <c:if test="${user.userNo!=board.user.userNo}">
        <div class="col-sm-5 col-md-offset-2">    
        <input type="button" name="report" class="btn btn-c" value="신고" data-report="${board.boardNo}"/>
        <input type="hidden" id="${board.boardNo}report" value="${board.boardNo}${board.user.userNo}">
        </div>
        </c:if>     
         
        </h4>
          
     <!-- 모달1 헤더 끝 -->
      
     <!-- 모달1 바디 시작 -->
      <div class="modal-body" style="text-align: center">  

		<div>
			<c:if test="${board.photo1 !=null}">
			<div><img src="${board.photo1}" style="width: 100%"/></div>
			<br/>
			</c:if>

			<c:if test="${board.photo2 !=null}">
			<div><img src="${board.photo2}" style="width: 100%"/></div>
			<br/>
			</c:if>
	
			<c:if test="${board.photo3 !=null}">
			<div><img src="${board.photo3}" style="width: 100%"/></div>
			<br/>
			</c:if>
		</div>

		<p>
			${board.boardDetailText}
		</p>
     
       
      </div>
      <!-- 모달1 바디 끝 -->
      
      <!-- 모달1 푸터 시작 -->
      <div>
      
		<!-- listComment로 파라미터 보내기 -->      
     	<jsp:include page="/view/board/listComment.jsp">
     		<jsp:param name="boardNo" value="${board.boardNo}"/>
     	</jsp:include>
    	
      </div>
      <!-- 모달1 푸터 끝 -->
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 모달1 끝 -->
		
		    
	    </c:forEach>
	    
				<form>
			  	  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			  </form>
	
	    
	    </table>
		   	 <!-- PageNavigation Start... -->
	<jsp:include page="/common/pageNavigation.jsp"/>
	<!-- PageNavigation End... -->
		     
		    
	
	</div>
</body>
</html>