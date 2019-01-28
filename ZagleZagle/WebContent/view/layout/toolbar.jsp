<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
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
	$("li:contains('로그인')").on("click" , function() {
		login.click();
	}); 
	$("li:contains('로그아웃')").on("click" , function() {
		//$(self.location).attr("href","/user/logout");
		//self.location = "/user/logout"
	});
	$("li:contains('강남1')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/chat/testUser"
		
	}); 
	$("li:contains('강남2')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/chat/testUser2"
		
	}); 
	$("li:contains('서초3')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/chat/testUser3"
		
	}); 
	
	$("li:contains('전체 게시물')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/board/listBoard?view=all"
		
	});
	
	$("li:contains('동네 게시물')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/board/listBoard?view=town"
		
	});
	
	$("li:contains('방송 목록 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "http://192.168.0.12:8080/stream/listStream"
		
	});
	$("li:contains('판매상품목록')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listSell"
		
	});

	$("li:contains('구매상품목록')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/trade/listBuy"
		
	});
	
//////////////////////////////////마이 페이지 Navigation 영역///////////////////////////////////////

	$("li:contains('작성 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listScrap"
		
	});

	$("li:contains('좋아요 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listLike"
		
	});
	
	$("li:contains('스크랩 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listMyBoard"
		
	});
	
	$("li:contains('댓글 작성한 게시물 보기')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/listComment"
		
	});
	
	$("li:contains('계좌번호 등록(신규)')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/addAccount"
		
	});
	
	$("li:contains('계좌번호 수정')").on("click" , function() {
		//$(self.location).attr("href","http://localhost:3000/");
		self.location = "/mypage/updateAccount"
		
	});
////////////////////////////////////////////////////회원정보보기, Logout//////////////////////////////////////////////////////////


	$(function() {


		
		
$("li:contains('로그아웃')").on("click",function() {
	
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


});



});
</script>
  
  
  
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
      <a class="navbar-brand text-brand" href="index.html">Estate<span class="color-b">Agency</span></a>

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
          </c:if>
          
         
          
          
        </ul>
      </div>
    </div>
  </nav>
  <!--/ Nav End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

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

</body>
</html>
