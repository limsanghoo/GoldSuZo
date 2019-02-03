<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	

<script type="text/javascript">




$(function () {
	  $('[data-toggle="tooltip1"]').tooltip()
	});




</script>



<style>

html {


background-color: whitesmoke;
}

.container1 {

margin-top: 150px;
padding-left: 380px;

background-color: whitesmoke;

}

</style>
	
	
	
	


	
	
	
	
	
	
	



</head>
<body>


<jsp:include page="/view/layout/toolbar.jsp" />

	<div class="container1">
	
	
<div class="row" style="padding: 300px">	
	
  <div style="padding-right: 20px;" id="listMyboard">
      <img src="../common/images/mypage/contract.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="작성 게시물로 이동">
   
  		
  
  
      </div>
      
      <br/>
  


  
    	<div style="padding-right: 20px;">
  
      <img src="../common/images/mypage/signature.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="댓글 작성한 게시물로 이동">
   
  
      
  
 </div>
	



<div style="padding-right: 20px;">
   
      <img src="../common/images/mypage/scrap.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="스크랩 게시물로 이동">
      
 </div>
 






 <div style="padding-right: 20px;">

      <img src="../common/images/mypage/likelike.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="좋아요한 게시물로 이동">
     
 </div> <br/>
   
    
     <div style="padding-right: 20px;">
  
      <img src="../common/images/mypage/addAccount.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="계좌번호 등록">
      
  
 </div>
 
 
   
   <div>
      <img src="../common/images/mypage/updateAccount.png" style="width:100px; height:100px;" data-toggle="tooltip1" data-placement="top" title="계좌번호 수정">
    
  
 </div>
  

    
    
    </div> <!--  div row 끝 -->
  </div> <!-- container end -->






	
	
	
	



</body>
</html>