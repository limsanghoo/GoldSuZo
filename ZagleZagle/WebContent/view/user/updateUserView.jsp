<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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

	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		////////////////////////////////////////////////////////////////////////////////////////////
			function fncUpdateUser() {
		
			
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser?userNo=${user.userNo}&snsNo=${user.snsNo}").submit();
			}
		
	</script>



</head>
<body>

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">회원정보수정</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	      <!-- form Start /////////////////////////////////////-->
	      		<form class="form-horizontal">
	      		
	      	
		
		
	      		
		
			 <div class="form-group">
		    <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">프로필사진</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="profile" name="profile">
		    </div>
		  </div>
		  
		      <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이 름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경할이름">
		    </div>
		  </div>
		  
		  
		    <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="변경닉네임">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="userAddr" class="col-sm-offset-1 col-sm-3 control-label">주 소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userAddr" name="userAddr" value="${user.userAddr}" placeholder="변경주소">
		    </div>
		  </div>
		 
		
		    <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" placeholder="변경번호">
		    </div>
		  </div>
		 
		 
		 
		
		 
		  <div class="form-group">
		    <label for="userBirth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userBirth" name="userBirth" value="${user.userBirth}" placeholder="생년월일">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userSex" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userSex" name="userSex" value="${user.userSex}" placeholder="성별">
		    </div>
		  </div>
		  
		    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		
		</div>


</body>
</html>