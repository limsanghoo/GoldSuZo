
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   


<html>
<head>
<title>��Ʈ���� �����ȸ</title>
<style>
  #color {
    background: yellow;
    font-weight: bold;
    cursor: pointer;
    padding: 5px;
  }
  </style>

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<script type="text/javascript">
$(function() {
	
	var modal = document.getElementById('myModal');
	var moda2 = document.getElementById('myModal2');
	$("#upload").on("click", function() {
	
		   modal.style.display = "block";
	
	});
	$('span[class="close"]').on("click", function() {
		 var span = document.getElementsByClassName("close")[0];  
	            modal.style.display = "none";
	    
	}); 
	
	$("#upload2").on("click", function() {
		
		   modal.style.display = "block";
	
	});
	
}); 
</script>
</head>



<body>
   	<!-- ToolBar End /////////////////////////////////////-->
<form class="form-inline" name="detailForm">

		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin:15px; padding:15px;">
��Ʈ���� �� ���ε� �ϱ�
</button>
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
        <h4 class="modal-title" id="myModalLabel">��Ʈ���ֹ� �����</h4>
      </div>
      <div class="modal-body">
       			<label for="txt-user-text" class="col-form-label">����</label><br/> 
       			   <input type="text" class="form-control" id="streamTtitle" value="" placeholder="������ �Է��ϼ���"><br/>
 				
       			<label for="txt-user-text" class="col-form-label">����</label> <br/> 
 				   <input type="text" class="form-control" id="streamContent" value="" placeholder="������ �Է��ϼ���"> <br/>
 				
 			
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-default" data-dismiss="modal" id="upload">���ε��ϱ�</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div></div>	
		
	
		
		
<div class="row" id="dd">
<c:set var="i" value="0" />
<c:forEach var="obj" items="${list}">
<div class="col-sm-6 col-md-4"> <div class="thumbnail"> 
<img alt="50x50" data-src="holder.js/100x200" src='/stream/star2.gif' style="height: 250px; width: 50%; display: block;">
<div class="caption"> <h1>${obj.streamTitle}</h1><img id="profile" src='"/stream/'+${obj.streamerProfile}+'"'><h2>${obj.streamNickname}</h2><h3>${obj.streamer}</h3><p>����:${obj.streamContent}</p><p>��û�ڼ�:${obj.streamViewCount}<p><p>���ƿ��:${obj.streamLikeCount}</p><a class="btn btn-default" name="get" role="button">����</a> 
</div>  
</div> </div>
</c:forEach>  
</div>  
</form> 
</body>
</html>