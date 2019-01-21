<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>


	<script type="text/javascript">
	

	function fncAddAccount(){

		var account = $("input[name='account']").val();
		var name = $("input[name='bankName']").val();
		

		if(name == null || name.length<1){
			alert("은행이름을 입력해주세요.");
			return;
		}
	
		if(account == null || account.length<1){
			alert("계좌번호를 입력해주세요.");
			return;
		}

		$("form").attr("method", "POST").attr("action", "/mypage/addAccount?snsNo=${snsNo}").submit();
	}
	

	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "#addAccount" ).on("click" , function() {
			fncAddAccount();
		});
	});	



	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			$("form")[0].reset();
		});
	});	


	
	

	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 $("button.btn.btn-info").on("click" , function() {
			 
			 alert("클릭 됐음")
			popWin 
			= window.open("/view/mypage/nameCheck.jsp",
										"popWin", 
										"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		});
	});	
	
	
	
	</script>

</head>
<body>
	<div class="container">
	
	<h1 class="bg-primary text-center">계 좌 등 록</h1>

		<form class="form-horizontal" enctype="multipart/form-data">
		
		
	  <div class="form-group">
		    <label for="account" class="col-sm-offset-1 col-sm-3 control-label">계좌번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="account" name="account" placeholder="본인계좌 인증하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">입력전 실명인증 부터 해야 합니다.</strong>
		      </span>
		    </div>
		    <div class="col-sm-3">
		      <button type="button" class="btn btn-info">실명확인</button>
		    </div>
		  </div>
		
		<div class="form-group">
		    <label for="bankName" class="col-sm-offset-1 col-sm-3 control-label">은행이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="bankName" name="bankName" placeholder="은행이름을 입력하세요"> 
		     
		    </div>
		  </div>
		
		
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="addAccount">등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
	</div>
		

여기서 계좌등록 수행. 내일 진행

${user}

${realName}

</body>
</html>