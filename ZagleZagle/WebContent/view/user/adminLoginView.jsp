<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
      

	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon2.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon2.png" rel="apple-touch-icon">
	
	
	<script type="text/javascript">
	
	
	
	$( function() {
		
	
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
 background-color: green;
   
}

#col-Login{
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
  background-color: rgba( 255, 255, 255, 0.5 )
}

input {
  margin: 40px 25px;
  width: 200px;
  display: block;
  border: none;
  padding: 10px 0;
  border-bottom: solid 1px #1abc9c;
  -webkit-transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  transition: all 0.3s cubic-bezier(0.64, 0.09, 0.08, 1);
  background: -webkit-linear-gradient(top, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
  background: linear-gradient(to bottom, rgba(255, 255, 255, 0) 96%, #1abc9c 4%);
  background-position: -200px 0;
  background-size: 200px 100%;
  background-repeat: no-repeat;
  color: #0e6252;
}

input:focus, input:valid {
 box-shadow: none;
 outline: none;
 background-position: 0 0;
}

input::-webkit-input-placeholder {
 font-family: 'roboto', sans-serif;
 -webkit-transition: all 0.3s ease-in-out;
 transition: all 0.3s ease-in-out;
}

input:focus::-webkit-input-placeholder, input:valid::-webkit-input-placeholder {
 color: #1abc9c;
 font-size: 11px;
 -webkit-transform: translateY(-20px);
 transform: translateY(-20px);
 visibility: visible !important;
}


</style>


    <body>
    
    
    
        <section class="container-fluid">
            <div class="row justify-content-center">
            
       		

                <div class="col-2 rounded border shadow p-3 mb-3" id="col-Login">
                <form>
                                <div class="container" align="justify">
								
				
						<input placeholder="            Admin ID"	 type="text" id="userNo" name="userNo" required >
						<input placeholder="            Password" type="password" id="snsNo" name="snsNo" required>
						
                 		<div class="row justify-content-center" >
					   	 <button type="submit" class="btn btn-success btn-xs">로그인</button>                              
 						</div>
							</div>
                                
                                     
  
                       
                            
                </div>
                
              </form>  
            </section>
    </body>
</html>
