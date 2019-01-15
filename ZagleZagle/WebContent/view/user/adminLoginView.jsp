<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, 
															maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	  
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	$( function() {
		
		$("#userNd").focus();
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("button").on("click" , function() {
			var id=$("input:text").val();
			var pw=$("input:password").val();
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userNo").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#snsNo").focus();
				return;
			}
			
			$("form").attr("method","POST").attr("action","/user/adminLogin").attr("target","_parent").submit();
		});
	});	
	
	</script>

</head>
<body>
	
	<div class="container">
		<div class="jumbotron">	 	 	
		 	 		<h1 class="text-center">관&nbsp;&nbsp;리&nbsp;&nbsp;자&nbsp;&nbsp;로 &nbsp;&nbsp;그 &nbsp;&nbsp;인</h1>
		
		  <form class="form-horizontal">
		  
					  <div class="form-group">
					    <label for="userNo" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userNo" id="userNo"  placeholder="관리자번호" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="snsNo" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="snsNo" id="snsNo" placeholder="패스워드"  onkeydown='javascript:onEnterSubmit()'>

					    </div>
					  </div>
					  
					    <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-6 text-center">
					      <button type="button" class="btn btn-primary" >로 &nbsp;그 &nbsp;인</button>
					  </div>
					  </div>
					  
					  </form>
					  </div>
					  </div>
		
		

</body>
</html>