<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

   <!-- 카카오 로그인 SDK -->
   <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
   	<!-- 카카오 로그인 SDK 끝 -->



<script type="text/javascript">
 		
 
 		console.log('${code}')
 	   	
 	
 			//달러 레디 기억
 		
          $(function (){                              
 			
 			
 			var data={ "grant_type" : "authorization_code",
								"client_id" : "c3883a306a9faad67b127d7631568b29",
								"redirect_uri" : "http://localhost:8080/user/kakaologin",
								"code" : "${code}"
 			};
 			
 			$.ajax({
						url : "https://kauth.kakao.com/oauth/token" ,
						type: "POST",
						dataType : "json" ,
						data : JSON.stringify(data),
						  headers : {
	                           "Accept" : "application/json",
	                           "Content-Type" : "application/json"
	                        },
						success : function(JSONData , status) {

						alert("Data :"+staus);
						}
						});


	  });
					
	

	
</script>





</head>
<body>

	콜백 코드 받으려고 만든 임시 jsp
</body>
</html>