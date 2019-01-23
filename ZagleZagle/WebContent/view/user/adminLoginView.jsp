<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="CSS/MiStilo.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
	
	 <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


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




<style>

body{
  background: url(https://docentes.ufps.edu.co/assets/img/bg/bg1.jpg) no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}
.row{
 margin-top: 10%;
}

p{
    font-family: serif;
 font-size:40px;
 text-shadow: 1px 2px #000;
   color: black;
 
}
label{
    font-family: monospace;
    font-size:15px;
}

button{
    font-family: monospace;
 text-shadow: 1px 2px #000;
   
}

#col-Login{
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}





<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
</style>


    <body>
        <section class="container-fluid">
            <div class="row justify-content-center  ">
            
       		

                <div class="col-3 rounded border shadow p-3 mb-5 bg-white " id="col-Login" >
                

                
                            <p class="text-center" style="font-style: oblique;"><strong>Admin Login</strong></p>
                            
                                 
                        
                            <form class="login-form"  method="POST">
                                <div class="form-group" id="errorLogin" >
                                
                                     
            			
                                
                                </div>
                                <div class="form-group">
                                    <label >관리자 아이디</label>
                                    <input type="text" id="userNo" name="userNo" class="form-control" placeholder="관리자번호" required>    
                                </div>
                                
                                     
            					<br>
                                
                                <div class="form-group">
                                    <label >비밀번호</label>
                                    <input type="password" class="form-control"  id="snsNo" name="snsNo"  placeholder="Password" onkeydown='javascript:onEnterSubmit()'>
                                </div>
                                
                                
                                     
          						 <br><br><br>
          						 
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary float-right">로그인</button>                              
                                </div>
                                
                       
                            </form>
                        </div>
                </div>
            </section>
    </body>
</html>
