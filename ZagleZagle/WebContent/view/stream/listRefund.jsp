
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   


<html>
<head>
<title>스트리밍 목록조회</title>
  
<style>
@import url("https://fonts.googleapis.com/css?family=Noto+Sans+KR"); 
body {
  font-family:"Noto Sans KR", sans-serif;
  color: #555555; 
}

h1{
 padding-left :40px; 
}

 	#margin{
 	margin :40 3rem; 
 	color : white;
 padding-top :100px;
 	}
 .homepage{
	padding-top :100px;
    background-color: #935d8c;
    background-image: url(images/overlay.png), -moz-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), -webkit-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), -ms-linear-gradient(45deg, #e37682 15%, #5f4d93 85%);
    background-image: url(images/overlay.png), linear-gradient(45deg, #e37682 15%, #5f4d93 85%);    
	color: rgba(255, 255, 255, 0.65);
 
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
      
      .h1{
      padding: 20px; 
      margin: 20; 
       font-color:white;
       font-size:60px;  
       
      }
   
  </style>  


  
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

   
    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

<script type="text/javascript">

function fncGetList(currentPage) {
	
	//var list = "${list}";
	//alert(currentPage)
    $("#currentPage").val(currentPage)
   
    
    $("form").attr("method", "POST").attr("action", "/stream/listRefund").submit();
	}
  
$(function() {
	$(".checkRefund").on("click", function() {
		//   alert("클릭합니다~");
		   var check = $(this).data("param");
		   var refundNo = $(this).data("param2");
		 //  alert(check+refundNo); 	    
		   $.ajax({
				
	  		    

	  		  url: "/stream/json/updateRefund?check="+check+"&refundNo="+refundNo,		    
	  		  method: "get", 
	  		  dataType : 'json',
	  		    headers: {
	  	            "Accept": "application/json", 
	  	            "Content-Type": "application/json"
	  	        },
	  		    success: function(JSONData,status){ 		
	  		    //	alert('성공'); 
	  		    	location.reload();
	 				//alert(status);   
	 				//alert(JSONData);  
	  			}
			});  
		    
			});
	});
</script> 
</head>



<body>
<jsp:include page="/view/layout/toolbar.jsp" /> 
  

  <div id="margin">
  		<h1>환급리스트</h1></div>
   	<!-- ToolBar End /////////////////////////////////////-->
   	<div id="margintable">
 <table class="table">  
      
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
			  <td align="left">${refund.streamerNo}</td> 
			  <td align="left">${refund.streamerNickname}</td>
			  <td align="left">${refund.bankname}</td>
			  <td align="left">${refund.account}</td>
			  <td align="left">${refund.price}</td>
			  <c:if test="${refund.checkRefund =='0'}">
              <td align="left" data-param="0" data-param2="${refund.refundNo}">
               <c:if test="${refund.streamerNo =='US10000'}">
           	   <button  class="checkRefund"  style="height:26px; text-align:center; padding-top:0;">환급진행중</button>
           	   </c:if> 
           	   <c:if test="${refund.checkRefund !='US10000'}">
           	   	환급진행중
           	   </c:if>
           	   </td> 
              </c:if>
              <c:if test="${refund.checkRefund =='1'}"> 
               <td align="left" data-param="1" data-param2="${refund.streamerNo}">환급완료</td>
              </c:if> 
		    </tr>
		    
          </c:forEach>
           <form>
			  	  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			  </form> 
			  </div>
        </tbody>
      </table> 
      </div>  
 	 <jsp:include page="/common/pageNavigation.jsp"/> 
 	 <jsp:include page="/view/layout/footer.jsp"></jsp:include>
</body>
</html>