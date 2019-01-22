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
			$("li:contains('로그인')").on("click" , function() {
				$(self.location).attr("href","/user/loginView");
				
				//self.location = "/user/logout"
			}); 
		 	$("li:contains('로그아웃')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			});
		 	$("li:contains('채팅')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/chat/getChat"
		 		
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
   
   
   

		 	$(function() {
		 		
		 		$(".getUserInfo").on("click", function() {
		 			
		 			
		 			var userNo =$(this).data("param1");
		 			alert(userNo)
		 			console.log(userNo);
		 			
		 			self.location="/user/getUser2?userNo="+userNo
		 		
		 		});
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
								<li><a>동네 게시물</a></li>
								</c:if>
								
							<!-- 중고장터 -->	
								<c:if test="${sessionScope.user.userNo != null}">
								<li><a>중고장터</a>
									<ul>
										<li><a>판매상품목록</a></li>
										<li><a>구매상품목록</a></li>
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
								<li>ON동네 Air
									<ul>
										<li><a>방송 목록 보기</a></li>
										<li><a>후원 환급하기</a></li>
									</ul>
								</li>
								</c:if>
	
							<!-- 마이페이지 -->
								<c:if test="${sessionScope.user.userNo != null}">
								<li>My Page
									<ul>
										<li><a>작성 게시물 보기</a></li>
										<li><a>댓글 작성한 게시물 보기</a></li>
										<li><a>스크랩 게시물 보기</a></li>
										<li><a>좋아요 게시물 보기</a></li>
										<li><a>계좌번호 등록(신규)</a></li>
										<li><a>계좌번호 수정</a></li>										
									</ul>
								</li>
								</c:if>
							
							
					<li>채팅</li>
	                <li>강남1</li>
	                <li>강남2</li>
	                <li>서초3</li>
					
					<li>
					<h4 class=getUserInfo data-param1="${user.userNo}" style="font-style: italic;">${user.userName} 님 환영합니다.</h4></li>
							
					<c:if test="${sessionScope.user.userNo==null}"><li>로그인</li></c:if>
					
					<li>
					<a id="logout">
	                <c:if test="${sessionScope.user.userNo!=null}"><li data-param="${user.snsNo}">로그아웃</li></c:if>		
	                </a>
					</li>
					
		
					
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