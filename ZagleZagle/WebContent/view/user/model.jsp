<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


<script type="text/javascript">

	JsonNode userInfo = UserRestController.getKaKaoUserInfo(accessToken); 
	
 	String id = UserRestController.path("id").asText();
 	String name = null;
 	
   console.log{"${id}"}
   
   JsonNode properties = userInfo.path("properties");
 	
 	
</script>


</head>
<body>

"${id}"
컨트롤러 기능 확인용
</body>
</html>