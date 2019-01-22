
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   


<html>
<head>
<title>스트리밍 목록조회</title>
<style>
 
  body{
  background-image: url("https://wallpapershome.com/images/pages/pic_h/16144.jpg");
  } 
  @import url(https://fonts.googleapis.com/css?family=Patrick+Hand+SC);
*{
  box-sizing:border-box; 
}
 
    button{
      align-self:center;
      background:transparent;
      padding:1rem 1rem;
      margin:0 1rem;
      transition:all .5s ease;
      color:#5D3B3B;     
      font-size:5rem;  
      letter-spacing:1px;
      outline:none;
      box-shadow: 20px 38px 34px -26px hsla(0,0%,0%,.2);
      border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
   } 
       button:hover{
         box-shadow:2px 8px 4px -6px hsla(0,0%,0%,.3);
      } 
      button.lined.thick{
         border:solid 6px #41403E;        
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

function fncGetRefundList(currentPage) {
	var list = "${list}";
	alert(list);  
    $("#currentPage").val(currentPage)
   
    
    $("form").attr("method", "POST").attr("action", "/stream/listRefund").submit();
}
  
</script> 
</head>



<body>
  <input type="hidden" id="currentPage" name="currentPage" value=""/>
		
   	<!-- ToolBar End /////////////////////////////////////-->
 <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >스트리머넘버</th>
            <th align="left">스트리머닉네임</th>
            <th align="left">은행이름</th>
            <th align="left">계좌번호</th>
            <th align="left">환급신청 금액</th>
            <th align="left">상태</th>
          </tr>
               
        </thead>  
        
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="refund" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : 회원정보 확인">${refund.streamerNo}</td>
			  <td align="left">${refund.streamerNickname}</td>
			  <td align="left">${refund.bankname}</td>
			  <td align="left">${refund.account}</td>
			  <td align="left">${refund.price}</td>
			  <c:if test="${refund.checkRefund =='0'}">
              <td align="left">환급진행중</td>
              </c:if>
              <c:if test="${refund.checkRefund =='1'}">
               <td align="left">환급완료</td>
              </c:if> 
		    </tr>
          </c:forEach>
        </tbody>
      </table> 
 	  <jsp:include page="/view/stream/pageNavigator.jsp"/> 
</body>
</html>