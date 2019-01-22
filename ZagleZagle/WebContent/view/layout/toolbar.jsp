<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">


<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     
     </style>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
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
		 	
		 	$("a:contains('전체게시물')").on("click" , function() {
				//$(self.location).attr("href","http://localhost:3000/");
				self.location = "/board/listBoard?view=all"
		 		
			});
		 	
		 	$("a:contains('동네게시물')").on("click" , function() {
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
<body>
<div class="navbar  navbar-default navbar-fixed-top">
	
	<div class="container">
	       
		<a class="navbar-brand" href="/index.jsp">ZagleZagle</a>
		
		<!-- toolBar Button Start //////////////////////// -->
		<div class="navbar-header">
		    <button class="navbar-toggle collapsed" data-toggle="collapse" data-target="#target">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		    </button>
		</div>
		<!-- toolBar Button End //////////////////////// -->
		
	    <!--  dropdown hover Start -->
		<div 	class="collapse navbar-collapse" id="target" 
	       			data-hover="dropdown" data-animations="fadeInDownNew fadeInRightNew fadeInUpNew fadeInLeftNew">
	         
	         	<!-- Tool Bar 를 다양하게 사용하면.... -->
	             <ul class="nav navbar-nav">
	             
	              <!--  게시물관리 -->
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" >
	                         <span >전체게시물</span>
	                     </a>
	                     
	              </li>
	              
	              <c:if test="${sessionScope.user.userNo != null}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" >
	                         <span >동네게시물</span>
	                     </a>
	                     
	              </li>
	              </c:if>
	               
	                 
	              <!-- 중고장터 DrowDown -->
	              <c:if test="${sessionScope.user.userNo != null}">
	              <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >중고장터</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">판매상품목록</a></li>
	                         <li><a href="#">구매상품목록</a></li>
	                         <li class="divider"></li>
	                         <li><a href="#">etc..</a></li>
	                     </ul>
	                 </li>
	                 <!-- onAir DrowDown -->
	                 <li class="dropdown">
	                     <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                         <span >onAir</span>
	                         <span class="caret"></span>
	                     </a>
	                     <ul class="dropdown-menu">
	                         <li><a href="#">방송목록보기</a></li>
	                         <li><a href="#">후원환급하기</a></li>
	                         <li class="divider"></li>
	                     </ul>
	                 </li>
	                 
	                 <!--  MyPage DrowDown -->
	                  <li class="dropdown">
	                  <a  href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
	                  <span >마이페이지</span>
	                     <span class="caret"></span>
	                     </a>
	                      <ul class="dropdown-menu">
	                       <li><a href="#">작성 게시물 보기</a></li>
	                        <li><a href="#">작성 댓글 보기</a></li>
	                         <li><a href="#">스크랩 게시물 보기</a></li>
	                          <li><a href="#">좋아요 게시물 보기</a></li>
	                           <li><a href="#">계좌번호 등록(신규)</a></li>
	                           <li><a href="#">계좌번호 수정</a></li>
	                         <li class="divider"></li>
	                             </ul>
	                 		</li>
	                 
	                 
	               </c:if>
	               <li><a href="#">채팅</a></li>
	               <li><a href="#">강남1</a></li>
	               <li><a href="#">강남2</a></li>
	               <li><a href="#">서초3</a></li>
	             </ul>
	             
	            <center>
					<a href="/board/testUser">
					<input id="sessionTest" type="button" value="세션 테스트">
					</a>
					userNickname : ${user.userNickname}
				</center>
	             
	             
	             <ul class="nav navbar-nav navbar-right">
	             	<c:if test="${sessionScope.user.userNo==null}"><li><a href="#">로그인</a></li></c:if>
	                <c:if test="${sessionScope.user.userNo!=null}"><li><a href="#">로그아웃</a></li></c:if>
	            </ul>
		</div>
		<!-- dropdown hover END -->	       
	    
	    
	    
	    
	</div>
</div>
</body>
</html>