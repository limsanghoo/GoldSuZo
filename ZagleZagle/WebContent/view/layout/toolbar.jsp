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
//============= logout Event  처리 =============	
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a:contains('로그인')").on("click" , function() {
		login.click();
	}); 

	$("a:contains('로그아웃')").on("click",function() {
		
		alert("클릭됨")
		
			var snsNo = $(this).data("param");
			
			alert(snsNo)
		
		if(snsNo.startsWith("K")) {
			
			alert("K로시작하는거 인식")
			$("form").attr("method" , "POST").attr("action" , "/user/logout/json").submit();
			
		}else if(snsNo.startsWith("N")){
			alert("N으로시작하는거 인식")
			$("form").attr("method" , "POST").attr("action" , "/user/Nlogout").submit();
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
	
	$("a:contains('방송 목록 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "http://192.168.0.21:8080/stream/listStream"
		
	});
	
	$("a:contains('중고장터')").on("click" , function() {
		self.location = "/trade/listTrade"
		
	});
	
	
	$("a:contains('판매상품목록')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listSell"
		
	});

	$("a:contains('구매상품목록')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listBuy"
		
	});
	
//////////////////////////////////마이 페이지 Navigation 영역///////////////////////////////////////

	$("a:contains('작성 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listMyBoard"
		
	});

	$("a:contains('좋아요 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listLike"
		
	});
	
	$("a:contains('스크랩 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listScrap"
		
	});
	
	$("a:contains('댓글 작성한 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listComment"
		
	});
	
	$("a:contains('계좌번호 등록(신규)')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/addAccount"
		
	});
	
	$("a:contains('계좌번호 수정')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/updateAccount"
		
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
         $("#btn:contains('숨기기')").on("click",function(){
            $("#mydiv").css("display","none");
            $(this).hide();
            $("#btn2").show();
         });
         
      });
      
$(function(){

         $("#btn2:contains('보이기')").on("click",function(){
        	if(document.getElementById("chatting")==null){
        		$("#mydiv").append('<iframe id="chatting" src="/chat/getChat?room=${user.userAddr}" align="right" style="height:100%; width: 100%;" frameborder="0" scrolling="no"></iframe>');
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
}

#mydiv {
  position: absolute;
  z-index: 9;
  text-align: center;
  background-color: rgba(0,0,0,0);
  height: 700px;
  width: 600px;
}

#mydivheader {
	margin-top:150px;
  cursor: move;
  z-index: 10;
  background-color: rgba(0,0,0,0.3);
  color: #fff;
}

</style> 
  
  
  
</head>

<body>

  <div class="click-closed"></div>

  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a href="/index.jsp" class="navbar-brand text-brand" style="padding-top: 0; padding-bottom: 0;">Dongne<span class="color-b">Vangne</span></a>

      <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link">전체 게시물</a>
          </li>
          
          <c:if test="${sessionScope.user.userNo != null}">
          <li class="nav-item">
            <a class="nav-link">동네 게시물</a>
          </li>
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	중고장터
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item">판매상품목록</a>
              <a class="dropdown-item">구매상품목록</a>
            </div>
          </li>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	ON동네 Air
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item">방송 목록 보기</a>
              <a class="dropdown-item">후원 환급하기</a>
            </div>
          </li>
          
          
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              	My Page
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item">작성 게시물 보기</a>
              <a class="dropdown-item">댓글 작성한 게시물 보기</a>
              <a class="dropdown-item">스크랩 게시물 보기</a>
              <a class="dropdown-item">좋아요 게시물 보기</a>
              <a class="dropdown-item">계좌번호 등록(신규)</a>
              <a class="dropdown-item">계좌번호 수정</a>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="btn">채팅 숨기기</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" id="btn2">채팅 보이기</a>
          </li>
          
          
                   
          </c:if>
          
        <div id="mydiv" style="display: none;">
   			<div id="mydivheader">-여기를 눌러 이동-</div>
		</div>
          
          
        </ul>
      </div>
    </div>
  </nav>
  <!--/ Nav End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  
  <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  
  
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

</body>
</html>
