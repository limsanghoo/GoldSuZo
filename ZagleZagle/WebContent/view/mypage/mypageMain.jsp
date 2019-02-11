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



#myg_header div.myg_header h1 {
	
overflow: hidden;
display: block;
height: 80px;
width: 80px;

text-indent: -999em;



}


#myg_header {
	
    margin-top: 110px;
    width: 100%;
    height: 130px;
    background-color: #d8e0f0;
    border-bottom: 2px solid #2eca6a;
}

#myg_header div.myg_header {
    position: relative;
    z-index: 991;
    margin: 0px auto;
    width: 980px;
}

#myg_header div.myg_header .header_sch .grade .txt_grade {
    line-height: 15px;
    display: inline-block;
    _padding-top: 1px;
}

#myg_header div.myg_header .header_sch {
    width: 385px;

}


#myg_header div.myg_header .header_sch .grade strong {
    color: rgb(34, 34, 34);
    letter-spacing: -1px;
}

.icon_grade {
    display: inline-block;
    *display: inline;
}

.icon_grade span.vip {
    color: #ce5c8d;
}






#myg_header div.myg_header .myg_mymenu ul li {
    height: 77px;
    line-height: 0;
    font-size: 0px;
    float: left;
}

#myg_header div.myg_header .myg_mymenu ul li.totalActiveScore a {
    background-position: 0 -64px;
}

#myg_header div.myg_header .myg_mymenu ul li a {
    display: block;
    padding-top: 62px;
    height: 15px;
    width: 103px;
 
    font: 11px/16px dotum,"돋움",-apple-system,BlinkMacSystemFont,sans-serif;
    text-align: center;
    color: #888;
    letter-spacing: -1px;
    font-size-adjust: none;
    font-stretch: normal;
}

#myg_header div.myg_header .myg_mymenu ul li.restScore a {
    background-position: -103px -64px;
}

#main_menu .menu_list li a {
    height: 60px;
    border-top-color: rgb(38, 129, 255);
    border-bottom-color: rgb(0, 86, 205);
    border-top-width: 1px;
    border-bottom-width: 1px;
    border-top-style: solid;
    border-bottom-style: solid;
    display: block;
}

#myg_header div.myg_header .myg_mymenu ul li a:hover {
    text-decoration: none;
}


script {
    display: none;
}

#main_menu .menu_list {
    width: 148px;
    border-bottom-color: rgb(0, 50, 98);
    border-bottom-width: 1px;
    border-bottom-style: solid;
    float: left;
}
#main_menu .menu_list li {
    background: rgb(0, 107, 255);
    width: 100%;
    float: left;
}
#main_menu .menu_list li a:hover {
    background: url(//pics.gmkt.kr/pc/ko/myg/img_myg.png) no-repeat 0px -22px;
    border-color: rgb(5, 76, 188);
}
#main_menu .menu_list li a.mn1 {
    border-top-color: currentColor;
    border-top-width: 0px;
    border-top-style: none;
}

.myg_header img{
       margin-top: 5px;
    padding-top: 10px;
    height: 70px;
    width: 70px;
    
    border-radius: 50%;
      }

#myg_row {

      background-color: lavender;
    height: 700px;
    padding-left: 32%;
    padding-right: 10%;
    padding-top: 16%;
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


</style>
	
	
	
	


	
	
	
	
	
	
	



</head>
<body>


<jsp:include page="/view/layout/toolbar.jsp" />


	

	<a name="top"></a>

	<!-- 마이페이지 헤더 -->
	<div id="myg_header">
	
		<div class="myg_header">
			<img src="/common/images/profile/${user.profile}" >
			
			<div class="header_sch">
				<p class="grade">
					<span class="text_grade">
						<strong>${user.userNickname}</strong>
						님의 등급은<br>
						<span class="icon_grade">
						<span class="grade"></span>
						
						
						<c:if test="${user.grade=='0'}">
						
					 <strong class="text" style="color: #854200">흙수저</strong>
					 
					 </c:if>
					 
					 	
						<c:if test="${user.grade=='1'}">
						
					 <strong class="text" style="color: #9cc6600">동수저</strong>
					 
					 </c:if>
						
						<c:if test="${user.grade=='2'}">
	       
	     			 <strong class="text" style="color: #c0c0c0">은수저</strong> 
	     			 
	     			 </c:if>
	     			 
	     			 	<c:if test="${user.grade=='3'}">
	       
	      			 <strong class="text" style="color: #ffd700">금수저</strong>
	       
					</c:if>
						
						
						</span>
						입니다.
				</span>
			</div>
			
			
			
			
			
			
		
	</div> <!-- #mypage header div 끝 -->
</div>

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
 









	
	
	
	



</body>
</html>