<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
				

<script type="text/javascript">
	
	console.log('${KakaoId}')
	
	$(function() {
		
		
		$("#logout").on("click",function() {
			
			alert("Ŭ����")
			
			$("form").attr("method" , "POST").attr("action" , "/user/logout").submit();
			
		});
	
		
	});
	
 	$(function() {
 		
 		$(".getUserInfo").on("click", function() {
 			
 			
 			var userNo =$(this).data("param");
 			
 			console.log(userName);
 			
 			self.location="/view/user/getUser?userNo="+userNo
 			
 		});
 	});
  	
</script>


</head>
<body>
<form>
<input type="button" id="logout" name="logout" value="�α׾ƿ�">
</form>

	<h3 class=getUserInfo title="������Ȯ��" data-param="${user.userNo}">${user.userName}</h3>
  

��Ʈ�ѷ� ��� Ȯ�ο�
</body>
</html>