
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   


<html>
<head>
<title>스트리밍 목록조회</title>
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


<script type="text/javascript">
    
    </script>
</head>



<body>
   	<!-- ToolBar End /////////////////////////////////////-->
	 <form class="form-inline" name="detailForm">
 
<div class="row" id="dd">
<c:set var="i" value="0" />
<c:forEach var="obj" items="${list}">
<div class="col-sm-6 col-md-4"> <div class="thumbnail"> 
<img alt="50x50" data-src="holder.js/100x200" src='/stream/star2.gif' style="height: 250px; width: 50%; display: block;">
<div class="caption"> <h1>${obj.streamTitle}</h1><img id="profile" src='"/stream/'+${obj.streamerProfile}+'"'><h2>${obj.streamNickname}</h2><h3>${obj.streamer}</h3><p>내용:${obj.streamContent}</p><p>시청자수:${obj.streamViewCount}<p><p>좋아요수:${obj.streamLikeCount}</p><a class="btn btn-default" name="get" role="button">들어가기</a> 
</div>  
</div> </div>
</c:forEach>  
</div>  
      
 </form> 

</body>
</html>