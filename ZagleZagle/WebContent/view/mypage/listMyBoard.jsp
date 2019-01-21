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
		
		

</script>



</head>
<body>


<jsp:include page="/view/mypage/mypageToolbar.jsp" />


<div class="container">
	
	<div class="page-header text-info">
	       <h5>작성 게시물 보기</h5>
	    </div>
	
	<table class="table table-hover table-striped" >
	    
		<thead>
		
		 <tr>
            <th align="center">No</th>
            <th align="left" >글 내용</th>
            <th align="left">작성 날짜</th>
          </tr>
        </thead>


		  <tbody>
      
      <c:set var="i" value="0" />
		  
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left">${ i }</td>
			  <td align="left"  title="Click : 게시물 상세정보" data-param="${mypage.boardNo}">${board.boardDetailText}</td>
			  <td align="left">${board.regDate}</td>
			</table>
	</div>

</body>
</html>