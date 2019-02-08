<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>



<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">


$(function() {

	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})


		
		$("#myboard").on("click", function() {
			
			self.location = "/mypage/listMyBoard"
		});
	
		$("#commentBoard").on("click", function() {
		
		self.location = "/mypage/listComment"
		});
	
		$("#scrapBoard").on("click", function() {
		
		self.location = "/mypage/listScrap"
		});
		
		$("#likeBoard").on("click", function() {
			
		self.location = "/mypage/listLike"
		});
			

		$("#addAccount").on("click", function() {
			
		self.location = "/mypage/addAccount"
		});
			
		$("#updateAccount").on("click", function() {
			
		self.location = "/mypage/updateAccount"
		});
					
		
});

</script>



</head>
<body>

<div class="toolbar container">

<div class="row">

  <img src="/common/images/mypage/contract.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" title="작성 게시물로 이동" id="myboard">
  

</div>

<div class="row">


   <img src="/common/images/mypage/signature.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" 
      title="댓글 작성한 게시물로 이동" id="commentBoard">

</div>

<br>

<div class="row">
<img src="/common/images/mypage/scrap.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" title="스크랩 게시물로 이동" id="scrapBoard">

</div>
<br>
<div class="row">
      <img src="/common/images/mypage/likelike.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" title="좋아요한 게시물로 이동" id="likeBoard">
     
</div>
<br>
<div class="row">
          <img src="/common/images/mypage/addAccount.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" title="계좌번호 등록" id="addAccount">
      
</div>
<br>
<div class="row">
         <img src="/common/images/mypage/updateAccount.png" style="width:100px; height:100px;" data-toggle="tooltip" data-placement="top" title="계좌번호 수정" id="updateAccount">
     
</div>
<br>
</div>
</body>
</html>