<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PB Dashboard Home | Bootstrap Admin Theme</title>

    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/fonts/font-awesome/css/font-awesome.min.css" />



    <link id="themecss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />

    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/css/theme.css" />
    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/css/dashboard.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	
	<!--  sweetAlert -->  	
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script type="text/javascript">
	
	 $( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			

			$("#listUser").on("click" , function() {
				
				alert("클릭")
				
				$(self.location).attr("href","/admin/listUser");
			});
			
				
			$("#listBlackObject").on("click" , function() {
					
				
					
				$(self.location).attr("href","/admin/listBlackObject");
			});
			
			$("#listBlackList").on("click" , function() {
				
				
				$(self.location).attr("href","/admin/listBlackList");
			});
			
			
			$("#logOut").on("click" , function() {
				
				alert("로그아웃 하시겠습니까?")
				
				self.location = "/user/logout"
			});
			
			$("#handleReport").on("click" , function() {
				
				self.location = "/admin/handleReport"
			});
			
				$("#sponUser").on("click" , function() {
				
				
				
				$(self.location).attr("href","/stream/listRefund");
			});
			
			
		
		}); 
   
	 function fncGetList(currentPage) {
		   
		   //var list = "${list}";
		   //alert(currentPage)
		    $("#currentPage").val(currentPage)
		   
		    
		    $("form").attr("method", "POST").attr("action", "/stream/listRefund").submit();
		   }
		  
		$(function() {
		   $(".checkRefund").on("click", function() {
		  			
			   
			   	
			   swal({
					  title: "환급 하시겠습니까?",
					  
						
					  buttons: true,
					  buttons: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					  
						   var check = $(this).data("param");
					         var refundNo = $(this).data("param2");
					 
					         $.ajax({
						            
					               

					             url: "/stream/json/updateRefund?check="+check+"&refundNo="+refundNo,          
					             method: "get", 
					             dataType : 'json',
					               headers: {
					                    "Accept": "application/json", 
					                    "Content-Type": "application/json"
					                },
					               success: function(JSONData,status){       
					               //   alert('성공'); 
					                  location.reload();
					                //alert(status);   
					                //alert(JSONData);  
					              }
					         });    
					         
					         
					         
					  } else {
					    swal("환급을 취소하셨습니다.");
					  }
					});
				
			   
			   
			   
			   
			   
		       
		       //  alert(check+refundNo);        
		  
		          
		         });
		   });
	
	
	
	</script>
	
	<style>
	
	.container {
    margin-right: auto;
    margin-left: auto;
    padding-left: 15px;
    padding-right: 15px;
}
	
	button {

    width:90px;

    background-color: #f8585b;
    

    border: none;

    color:#fff;

    padding: 15px 0;

    text-align: center;

    text-decoration: none;

    display: inline-block;

    font-size: 15px;

    margin: 4px;

    cursor: pointer;
    
    border-radius:10px;

}



출처: https://nimolove.tistory.com/44 [니모네]
	
	</style>
	
	
</head>
<body>
    <div id="wrapper">
    
    
     
       <nav class="navbar navbar-default navbar-fixed-top" role="navigation">            
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/board/listBoard" title="DongneVangne">DongneVangne</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active"><a href="/admin/siteManage"><i class="glyphicon glyphicon-th"></i> Dashboard</a></li>
                    <li class="nav nav-list nav-list-expandable nav-list-expanded">
                        <a><i class="fa fa-user"></i> 회원목록 상세보기 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li><a href="/admin/listUser"><i class="fa fa-table"></i>회원목록</a></li>
                            <li><a href="/admin/listBlackObject"><i class="fa fa-edit"></i>예비 블랙리스트</a></li>
                            <li><a href="/admin/listBlackList"><i class="fa fa-edit"></i>블랙리스트 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="/admin/handleReport"><i class="fa fa-magic"></i> 신고 처리</a></li>
                                  <li id="sponUser"><a href="#"><i class="glyphicon glyphicon-usd"></i>환급한 회원 목록</a></li>
                </ul>
              
                   </li>
                </ul>
            </div>
        </nav>
     
     
     <div class="container">
     
       <div id="page-wrapper">
     
     
     <div id="margin">
        <h5 style="color: #153271;"><strong>환급리스트</strong></h5></div>
      <!-- ToolBar End /////////////////////////////////////-->
      <div id="margintable">
      <br>
 <table class="table table-hover table-striped">  
      
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
              <td align="left" class="checkRefund" data-param="0" data-param2="${refund.refundNo}"><button style="height:26px; text-align:center; padding-top:0;">
              
   
              
             <strong>환급진행중</strong> 
              
              </button></td> 
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
     
     
     	
            <!-- /.row -->
       </div>
        <!-- /#page-wrapper -->
        </div>
</div>
    <!-- /#wrapper -->

    <script type="text/javascript" src="/common/css/PBDashboard/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/common/css/PBDashboard/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

    <script type="text/javascript" src="/common/css/PBDashboard/js/theme.js"></script>
  
</body>
</html>
