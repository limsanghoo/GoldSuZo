<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<script type="text/javascript">
 		
 
 		console.log('${code}')
 	   	
 		//달러 레디 기억
 		
 		
					$.ajax( 
							{
								url : "https://kauth.kakao.com/oauth/token ,
								method : "POST" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"상품명 : "+JSONData.prodName+"<br/>"
																+"가격  : "+JSONData.price+"<br/>"
																+"제조일자 : "+JSONData.manuDate+"<br/>"
																
																+"</h6>";
									$("h6").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
	
			});
	 });
 		
	

	
</script>





</head>
<body>

	콜백 코드 받으려고 만든 임시 jsp
</body>
</html>