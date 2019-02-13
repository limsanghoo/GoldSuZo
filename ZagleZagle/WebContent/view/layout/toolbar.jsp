<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>EstateAgency Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

 
  <!-- 내가 추가한거임 -->
  <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
  
  
  <!-- JavaScript Libraries -->
  <script src="/common/css/estateagency-master/lib/jquery/jquery.min.js"></script>
  <script src="/common/css/estateagency-master/lib/jquery/jquery-migrate.min.js"></script>
  <script src="/common/css/estateagency-master/lib/popper/popper.min.js"></script>
  <script src="/common/css/estateagency-master/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="/common/css/estateagency-master/lib/easing/easing.min.js"></script>
  <script src="/common/css/estateagency-master/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="/common/css/estateagency-master/lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="/common/css/estateagency-master/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="/common/css/estateagency-master/js/main.js"></script>

  <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="/common/css/estateagency-master/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="/common/css/estateagency-master/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/animate/animate.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="/common/css/estateagency-master/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="/common/css/estateagency-master/css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->


<script type="text/javascript">


$(function() {
    
    $("#Kakao").on("click", function() {
       
       alert("클릭 완료")
       
       
       var  URL = "https://kauth.kakao.com/oauth/authorize?client_id=c3883a306a9faad67b127d7631568b29&redirect_uri=http://192.168.0.26:8080/user/kakaologin&response_type=code"
       popWin
       = window.open(URL,   "popWin",  "left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
             "scrollbars=no,scrolling=no,menubar=no,resizable=no")
           
              opener.window.location = url;
       close();
             
             
    });
 
  }); 



$(function() {

	
	
	$("a:contains('LOGOUT')").on("click",function() {
		
	
		
			var snsNo = $(this).data("param");
			
			alert(snsNo)
		
		if(snsNo.startsWith("K")) {
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/logout/json").submit();
			
		}else if(snsNo.startsWith("N")){
			
			$("form").attr("method" , "POST").attr("action" , "/user/Nlogout").submit();
		}else{
			$("form").attr("method" , "POST").attr("action" , "/user/logout").submit();
		}
		
	});
	
	
	$("a:contains('전체 게시물')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/board/listBoard?view=all"
		
	});
	
	$("a:contains('동네 게시물')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/board/listBoard?view=town"
		
	});
	
	$("a:contains('ON동네')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/stream/listStream"
		
	});
	
	$("a:contains('환급 관리')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/stream/listRefund"
		
	});
	
	
	$("a:contains('중고장터')").on("click" , function() {
		self.location = "/trade/listTrade"
		
	});
	
	
	$("a:contains('판매 상품')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listSell"
		
	});

	$("a:contains('구매 상품')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listBuy"
		
	});
	
//////////////////////////////////마이 페이지 Navigation 영역///////////////////////////////////////


	
	$("a:contains('마이페이지')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/mypageMainView"
		
	});

	
});


//채팅
$(function(){
    dragElement(document.getElementById("mydiv"));
    function dragElement(elmnt) {
var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
if (document.getElementById(elmnt.id + "header")) {
/* if present, the header is where you move the DIV from:*/
document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
} else {
/* otherwise, move the DIV from anywhere inside the DIV:*/
elmnt.onmousedown = dragMouseDown;
}

function dragMouseDown(e) {
e = e || window.event;
e.preventDefault();
// get the mouse cursor position at startup:
pos3 = e.clientX;
pos4 = e.clientY;
document.onmouseup = closeDragElement;
// call a function whenever the cursor moves:
document.onmousemove = elementDrag;
}

function elementDrag(e) {
e = e || window.event;
e.preventDefault();
// calculate the new cursor position:
pos1 = pos3 - e.clientX;
pos2 = pos4 - e.clientY;
pos3 = e.clientX;
pos4 = e.clientY;
// set the element's new position:
elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
}

function closeDragElement() {
/* stop moving when mouse button is released:*/
document.onmouseup = null;
document.onmousemove = null;
}
}
 })
 
 
 $(function(){
         $("#btn").hide();
         
         $("#btn:contains('퇴장')").on("click",function(){
            $("#mydiv").css("display","none");
            $(this).hide();
            $("#btn2").show();
         });

         
         $("#close").on("click",function(){
             $("#mydiv").css("display","none");
             $("#btn:contains('퇴장')").hide();
             $("#btn2").show();
          });
         
      });
      
$(function(){

         $("#btn2:contains('입장')").on("click",function(){
        	 
        	 var local="${searchBoard.local}";
        	 
        	 if(local==""){
        		 local="${user.userAddr}";
        	 }
        	 
        	if(document.getElementById("chatting")==null){
        		$("#mydiv").append('<iframe id="chatting" src="/chat/getChat?room='+local+'" align="right" style="height:100%; width: 100%;" frameborder="0" scrolling="no"></iframe>');
        	 }
        	 
            $("#mydiv").css("display","inline");
            $(this).hide();
            $("#btn").show();
         });
      });
</script>
 
 
<style>

html{
font-size: 100%;
background-size: cover;
}

#mydiv {
  position: absolute;
  z-index: 9;
  text-align: center;
  background-color: rgba(0,0,0,0);
  height: 800px;
  width: 600px;

}

#mydivheader {
  cursor: move;
  z-index: 10;
  background-color: rgba(0,0,0,0.3);
  color: #fff;
  margin-top: 0px;
  border-top-width: 150px;

}

.container{
	max-width: 1500px;
}

.navbar-default.navbar-trans, .navbar-default.navbar-reduce {
    border-bottom: 2px solid #2eca6a;
}

</style> 
  
  
  
</head>

<body style="padding-right: 0px;">

  <!-- <div class="click-closed"></div> -->

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
    
    <c:if test="${user.userNo!=null}">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
     </c:if>
     
      <a href="/index.jsp" class="navbar-brand text-brand" style="padding-top: 0; padding-bottom: 0;">Dongne<span class="color-b">Vangne</span></a>

      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav" style="cursor:pointer">   

          <c:if test="${sessionScope.user.userNo != null}">
          
          <li class="nav-item">
            <a class="nav-link">전체 게시물</a>
          </li>
          
          
          <li class="nav-item">
            <a class="nav-link">동네 게시물</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	중고장터
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item">판매 상품</a>
              <a class="dropdown-item">구매 상품</a>
            </div>
          </li>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	ON동네 Air
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item">환급 관리</a>
            </div>
          </li>
          
          
          <li class="nav-item">
          	<a class="nav-link">마이페이지</a>
          	</li>
          
          
          <c:if test="${param.view=='town'}"> 
          <li class="nav-item">
            <a class="nav-link" id="btn2">마을회관 입장</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="btn">마을회관 퇴장</a>
          </li>
          </c:if>
                      
          </c:if>
          
        <!-- 채팅창 -->       
        <div class="col-lg-8 col-centered" id="mydiv" style="display: none;">
        	<div id="close" style="float: left; color: white;">&nbsp;닫기</div>
   			<div id="mydivheader">- 여기를 눌러 이동 -</div>
		</div>		       
        </ul>
      </div>
      
      <!-- 로그인 로그아웃-->
      
      <div style="list-style: none; cursor:pointer;">
		<c:if test="${user.userNo!=null}">
		 	<li class="nav-item">
					<h5 style="font-style: italic; color: black;"><a href="/user/getUser2?userNo=${user.userNo}">${user.userName}</a>님 환영합니다</h5>
			</li>
					
			<li class="nav-item">					
	                <a class="nav-link" data-param="${user.snsNo}">LOGOUT</a>		                
		 	</li>
		 </c:if>      
      
     	 <c:if test="${user.userNo==null}">  			
			<li class="button primary" id="login" data-toggle="modal" data-target="#modal1" style="">
			<a class="nav-link">LOGIN</a>
			</li>
		</c:if>
			
		 	
      </div>
      
      
    </div>
  </nav>
<!--/ Nav End /--> 
  


  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>
  
<!-- 모달 시작 -->
<div class="modal"  aria-hidden="true" style="display: none; z-index: 1060;" id="modal1">
    	<div class="modal-dialog modal-md">
    	
          <div class="modal-content">
          
            <div class="modal-body">
            	<div class="snsLoginButton" align="center">
             	<img id="Kakao" src="/common/images/KakaoTalk.png" height="50" width="50"/>
             	
             	<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=ICC6WpwdQLzHUQn5KfEC&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fuser%2FnaverCallback&state=state">
             	<img height="50" src="/common/images/NaverSmall.jpg" height="50" width="50" >
             	</a>
             	
             	<img src="/common/images/smallGoogle.jpg" height="50" width="50" id="GGG"/>
             	</div>
             	
             	<br/><br/><br/>
             	
             	<div style="text-align: center">
             		<strong style="color: black; font-style: oblique;">SNS 로그인만 가능합니다.</strong>
             	</div>
            </div><!-- 모달바디 끝 -->	
          </div>
        </div>
</div>
<!-- 모달 끝 -->
  

  

  
  
   
  
  
  



</body>
</html>
