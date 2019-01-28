<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getsell</title>
<style>

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  

<script type="text/javascript">
</script>

</head>

<body>
        <div class="col-md-4">
        <img src="/common/images/profile/${sell.seller.profile}" style="height: 60px; width:60px;" align="middle"/>
		${sell.seller.userNickname}
		</div>
		
		<!-- 내 글만 수정, 삭제 -->
		<c:if test="${user.userNo==sell.seller.userNo}">
		<div class="col-md-4 col-md-offset-4">
		<input type="button" value="수정" data-update="${sell.sellNo}"/>
        <div class="btn btn-primary" data-toggle="modal" data-target="#modal2">삭제</div>
        </div>
        </c:if>

    

      

		<div>
			<c:if test="${sell.sellPhoto1 !=null}">
			<div><img src="${sell.sellPhoto1}" style="width: 500px"/></div>
			<br/>
			</c:if>

			<c:if test="${sell.sellPhoto2 !=null}">
			<div><img src="${sell.sellPhoto2}" style="width: 500px"/></div>
			<br/>
			</c:if>
	
			<c:if test="${sell.sellPhoto3 !=null}">
			<div><img src="${sell.sellPhoto3}" style="width: 500px"/></div>
			<br/>
			</c:if>
		</div>
		<hr/>
		<div>
		${sell.sellText}
</div>

<!-- 모달1 끝 -->
<!-- 모달2 시작 -->
<div class="modal"  aria-hidden="true" style="display: none; z-index: 1060;" id="modal2">
    	<div class="modal-dialog modal-md">
          <div class="modal-content">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <div class="container"></div>
            <div class="modal-body">
             	삭제하시겠습니까?
            </div>
            <div class="modal-footer">
              <a href="/board/deleteBoard?boardNo=${sell.sellNo}" class="btn btn-primary">삭제</a>
            </div>
          </div>
        </div>
</div>
<!-- 모달2 끝 -->
</body>
</html>
