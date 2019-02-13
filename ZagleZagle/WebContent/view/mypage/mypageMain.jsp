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

	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>  

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



<style>

html {


background-color: whitesmoke;
}











script {
    display: none;
}

#plusfriend-addfriend-button{

position: absolute;

}

#myg_container {

height: 500px;

}

#myg_row {

    background-color: #dceadf;
    height: 780px;
       padding-left: 32%;
    padding-right: 10%;
    padding-top: 24%;
}

#myg_row .myg_row1  {

padding-left: 50px;
}


.myg_row1 {

  width:100px;
  height:100px;
  margin:10px auto;
  overflow:hidden;

}

.myg_row1 img{
	width:100px;
	height: 100px;

}

.myg_row1 img:hover{
cursor: pointer;
-webkit-transform:scale(1.7);
transform:sclae(1.7);
transition: transform .35s;
            -o-transition: transform .35s;
            -moz-transition: transform .35s;
            -webkit-transition: transform .35s;
            
}


#myg_container {

padding-top: 30%;

}

.foot {

background-color: #dcead;
}

</style>
	
	
	
	


	
	
	
	
	
	
	



</head>
<body>


<jsp:include page="/view/layout/toolbar.jsp" />




<div id="myg_row">	
	
	
  <span class="myg_row1">
  
  		
      <img src="/common/images/mypage/board.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" title="작성 게시물로 이동" id="myboard">
  
     </span>
   

  


  	
  <span class="myg_row1">


      <img src="/common/images/mypage/cocococo.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" 
      title="댓글 작성한 게시물로 이동" id="commentBoard">
 
  </span>
      
  

	


	
  <span class="myg_row1">


      <img src="/common/images/mypage/scrapscarp.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" title="스크랩 게시물로 이동" id="scrapBoard">

</span>
 





	
  <span class="myg_row1">

      <img src="/common/images/mypage/love.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" title="좋아요한 게시물로 이동" id="likeBoard">

   </span>
    
    	
  <span class="myg_row1">

      <img src="/common/images/mypage/addaccount2.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" title="계좌번호 등록" id="addAccount">
      
	</span>
	
	
  <span class="myg_row1">
      <img src="/common/images/mypage/chageacc.png" style="width:50px; height:50px;" data-toggle="tooltip" data-placement="top" title="계좌번호 수정" id="updateAccount">
    

</span>
  

    
    
  
    </div> <!--  div id row 끝 -->
 
 	

	
	
    <div class="foot">
 	
 	<jsp:include page="/view/layout/footer.jsp"></jsp:include>
 	
 	
 	</div>
	
	



</body>
</html>