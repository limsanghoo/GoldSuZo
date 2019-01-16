<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>


<html lang="ko">

<head>
	<meta charset="UTF-8">
	
	
	
	<!-- bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  Bootstrap, JQuery CDN -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<script type="text/javascript">
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddUser();
		});
	});	
	
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]").on("click" , function() {
			self.location = "http://192.168.0.16:8080/index.jsp"
		});
	});	
	
	function fncAddUser() {
		
		var name=$("input[name='userName']").val();
		var nickName=$("input[name='userNickname']").val();
		
		var value = "";	
		if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
		}

		$("input:hidden[name='phone']").val( value );
		
		$("form").attr("method" , "POST").attr("action" , "/user/addUser?snsNo=${snsNo}").submit();
	}
		
	/////라디오 박스값 DB에 넘기기
	
	
      $(document).ready(function () {
        $('#userSex').click(function () {
          // getter
          var userSex = $('input[name="userSex"]:checked').val();
          alert(userSex);
        });

        $('#userSex1').click(function () {
          // setter
          // 선택한 부분을 세팅할 수 있다.
          $('input[name="userSex"]').val(['여']);
        });
      });
    

	
	</script>
	
	
</head>
<body>

<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	<h1 class="bg-primary text-center">회 원 가 입</h1>
	
	<!-- form Start /////////////////////////////////////-->
	
	<form class="form-horizontal">
	
	
	 <div class="form-group">
		    <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">프로필사진</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="profile" name="profile" >
		  </div>
		 </div>
	
	 <div class="form-group">
	   <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName">
		  
		    </div>
	
	</div>
	
	 <div class="form-group">
	   <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="중복확인하세요">
		  		 <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">입력전 중복확인 부터..(구현해야함!)</strong>
		      </span>
		    </div>
		    
	
	</div>
	
	 <div class="form-group">
	   <label for="userSex" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		    <div class="col-sm-4">
		       <input type = "radio" name = "userSex" value = "남" id="userSex"> 남    
       			<input type = "radio" name = "userSex" value = "여" id="userSex1"> 여<br>

		      <br>
		      
		


		  
		    </div>
	
	</div>
	
	 <div class="form-group">
	   <label for="userAddr" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userAddr" name="userAddr">
		  
		    </div>
	
	</div>
	
	 <div class="form-group">
	   <label for="userBirth" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userBirth" name="userBirth">
		  
		    </div>
	
	</div>
	
	<div class="form-group">
	   <label for="snsName" class="col-sm-offset-1 col-sm-3 control-label">SNS이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="snsName" name="snsName">
		  
		    </div>
	
	</div>
		  
	
	
	
	<div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="번호">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="번호">
		    </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		  
		  	  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
	
	
	

</div>
		



</body>
</html>