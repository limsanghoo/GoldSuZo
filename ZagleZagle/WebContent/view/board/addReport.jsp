<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="UTF-8" />

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" > -->

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  -->

<title>addReport</title>
</head>
<body>
<form name="addReport">
<select class="form-control" id="reportReason" name="reportReason">
		      	<option value="0">신고 사유를 선택해주세요</option>
		      	<option value="1">욕설</option>
		      	<option value="2">광고</option>
		      	<option value="3">음란</option>
		      	
		      	
</select>
</form>
</body>
</html>