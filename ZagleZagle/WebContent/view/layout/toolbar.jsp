<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/common/css/html5up-helios/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="/common/css/html5up-helios/assets/css/noscript.css" /></noscript>
	
	
	<style>
		/* #page-wrapper{
			height:80px;
			background-image: url("/common/css/html5up-helios/images/header.jpg");
			background-repeat: no-repeat;
			background-size: 100%;
		} */
	</style>



	<script type="text/javascript">
	
		//============= logout Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a:contains('로그인')").on("click" , function() {
				$(self.location).attr("href","/user/loginView");
				
				//self.location = "/user/logout"
			}); 
		 	$("a:contains('로그아웃')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			});
		 	$("a:contains('채팅')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/getChat"
		 		
			}); 
		 	$("a:contains('강남1')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser"
		 		
			}); 
		 	$("a:contains('강남2')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser2"
		 		
			}); 
		 	$("a:contains('서초3')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/testUser3"
		 		
			}); 
		 	
		 	$("a:contains('전체 게시물')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/board/listBoard?view=all"
		 		
			});
		 	
		 	$("li:contains('동네 게시물')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/board/listBoard?view=town"
		 		
			});
		 	
		 	
   //////////////////////////////////마이 페이지 Navigation 영역///////////////////////////////////////
   
		 	$("a:contains('작성 게시물 보기')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/mypage/listMyBoard"
		 		
			});
   
   
   
		 });
		

	</script>
		
	</head>
	<body class="homepage is-preload">
		<div id="page-wrapper">

			<!-- Header -->
				<!-- <div id="header"> --> <!-- 배경 생김 -->
				<div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
							
							<!-- 게시물 -->
								<li><a>전체 게시물</a></li>
															
								<c:if test="${sessionScope.user.userNo != null}">
								<li>동네 게시물</li>
								</c:if>
								
							<!-- 중고장터 -->	
								<c:if test="${sessionScope.user.userNo != null}">
								<li><a href="#">중고장터</a>
									<ul>
										<li><a href="#">판매상품목록</a></li>
										<li><a href="#">구매상품목록</a></li>
										<!-- <ul>
												<li><a href="#">Lorem ipsum dolor</a></li>
												<li><a href="#">Phasellus consequat</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
										</ul> -->										
									</ul>
								</li>
								</c:if>
								
							<!-- 스트리밍 -->
								<c:if test="${sessionScope.user.userNo != null}">
								<li><a href="#">ON동네 Air</a>
									<ul>
										<li><a href="#">방송목록보기</a></li>
										<li><a href="#">후원환급하기</a></li>
									</ul>
								</li>
								</c:if>
	
							<!-- 마이페이지 -->
								<c:if test="${sessionScope.user.userNo != null}">
								<li><a href="#">My Page</a>
									<ul>
										<li><a href="#">작성 게시물 보기</a></li>
										<li><a href="#">작성 댓글 보기</a></li>
										<li><a href="#">스크랩 게시물 보기</a></li>
										<li><a href="#">좋아요 게시물 보기</a></li>
										<li><a href="#">계좌번호 등록(신규)</a></li>
										<li><a href="#">계좌번호 수정</a></li>										
									</ul>
								</li>
								</c:if>
							
							
					<li><a href="#">채팅</a></li>
	                <li><a href="#">강남1</a></li>
	                <li><a href="#">강남2</a></li>
	                <li><a href="#">서초3</a></li>
							
							
					<c:if test="${sessionScope.user.userNo==null}"><li><a href="#">로그인</a></li></c:if>
	                <c:if test="${sessionScope.user.userNo!=null}"><li><a href="#">로그아웃</a></li></c:if>		
								
							</ul>
						</nav>

				</div>

		</div>

		<!-- Scripts -->
			<script src="/common/css/html5up-helios/assets/js/jquery.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/jquery.dropotron.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/jquery.scrolly.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/jquery.scrollex.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/browser.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/breakpoints.min.js"></script>
			<script src="/common/css/html5up-helios/assets/js/util.js"></script>
			<script src="/common/css/html5up-helios/assets/js/main.js"></script>

	</body>
</html>