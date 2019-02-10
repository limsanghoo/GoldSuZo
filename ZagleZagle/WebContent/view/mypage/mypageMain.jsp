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
height: 100px;
background: url(//192.168.0.18:8080/common/images/mypage/mypageLogo.jpg) no-repeat;
text-indent: -999em;



}


#myg_header {
	padding-top : 13%;
    width: 100%;
    height: 121px;
 	background-color: #d8e0f0;
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
    padding-top: 20px;
    float: left;
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

</style>
	
	
	
	


	
	
	
	
	
	
	



</head>
<body>


<jsp:include page="/view/layout/toolbar.jsp" />


	

<div id=wrap" class=mygwrap">
	<a name="top"></a>

	<!-- 마이페이지 헤더 -->
	<div id="myg_header">
	
		<div class="myg_header">
			<h1>나의 활동정보 myD</h1>
			<div class="header_sch">
				<p class="grade">
					<span class="text_grade">
						<strong>${user.userName}</strong>
						님의 등급은
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
			
			<div class="myg_mymenu">
				<ul>
					<li class="totalActiveSocre">
					 <span class="blindtext">활동 점수</span>
					 <a>
					<img src="/common/images/mypage/push-pin.png" width="50px;" height="50px;]">
					<span>${user.totalActiveScore}</span>
					점
					</a>
				   </li>
				   
				   <li class="restScore">
				   <span class="blindtext">등업까지</span>
				   
				   <a>
				   <span>   
				   
				   
			 <c:if test="${user.grade=='3'}">
	       
			0
	       
			</c:if>
			
			<c:if test="${user.grade=='2'}">
	       
	 
	       
	       	 ${299-user.totalActiveScore} 점 남았습니다.
	       
			</c:if>
	       	
	       	<c:if test="${user.grade=='1'}">
	       
	 
	  		${199-user.totalActiveScore} 점 남았습니다.
	       
	       
			</c:if>
	       	
	       	<c:if test="${user.grade=='0'}">
	       
	    
	   
	       	${99-user.totalActiveScore} 점 남았습니다.
	       
			</c:if>
				   
				   
				   
				    </span>
				   
				   </a>
				   </li>
				   
				   
				   
				</ul>
			
			</div>  <!-- mypage menu div 끝 -->
			
			
		</div> <!--  myapge header div 끝 -->
		
	</div> <!-- #mypage header div 끝 -->
	
	
	<div id="contentswrap">
		<div id="contents">
		 	<div id="main_menu">
		 		<span class="bg_menu_else"></span>
		 		<ul class="menu_list">
		 			<li id="menu1">
		 				<a href="#" class="mn1"> <span>작성한 게시물 보기</span>
		 			</a>
		 			</li>
		 			
		 			<li id="menu6">
		 				<a href="#" class="mn6">
		 					<span>댓글 작성한 게시물</span>
		 				
		 				</a>
		 			</li>
		 			
		 			<li id="menu3">
		 				<a href="#" class="mn3">
		 					<span> 스크랩 게시물</span>
		 				
		 				</a>
		 			</li>
		 			
		 				<li id="menu4">
		 				<a href="#" class="mn4">
		 					<span> 좋아요 게시물</span>
		 				
		 				</a>
		 			</li>
		 			
		 					<li id="menu5">
		 				<a href="#" class="mn4">
		 					<span>계좌번호 등록</span>
		 				
		 				</a>
		 			</li>
		 			
		 			</ul>
		
		 			
		 			
		 			
		 		
	
	
	
</div> <!-- wrap 끝 -->	


	







	
	
	
	



</body>
</html>