<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>getBoard</title>

<link rel="stylesheet" href="css/demo.css">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

</head>

<body>

<jsp:include page="/view/layout/toolbar.jsp"/>

<br/>

<div class="container" style="margin-top:150px">

<div>
<img src="/common/images/profile/${board.user.profile}" style="height: 60px; width:60px; border-radius: 70px; display: inline; vertical-align: middle"/>
	<span style="height:100%; font-weight: bold; display: inline; vertical-align: middle;">&nbsp;${board.user.userNickname}</span>
</div>

<div>
	<c:if test="${board.photo1 !=null}">
	<img src="${board.photo1}" style="width: 100%; padding-top: 10px;"/>
	<br/>
	</c:if>

	<c:if test="${board.photo2 !=null}">
	<img src="${board.photo2}" style="width: 100%; padding-top: 10px;"/>
	<br/>
	</c:if>
	
	<c:if test="${board.photo3 !=null}">
	<img src="${board.photo3}" style="width: 100%; padding-top: 10px;"/>
	<br/>
	</c:if>
</div>


<div style="padding-top: 10px;">
${board.boardDetailText}
</div>

<br/>

<div>
${board.hashTag}
</div>

<br/>

</div>



</body>
</html>