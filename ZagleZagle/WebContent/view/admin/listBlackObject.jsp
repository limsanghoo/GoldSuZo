<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/fonts/font-awesome/css/font-awesome.min.css" />



    <link id="themecss" rel="stylesheet" type="text/css" href="http://www.shieldui.com/shared/components/latest/css/light/all.min.css" />

    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/css/theme.css" />
    <link rel="stylesheet" type="text/css" href="/common/css/PBDashboard/css/dashboard.css" />
    
    <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon2.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon2.png" rel="apple-touch-icon">


	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script type="text/javascript">
	$(function(){
		$("td:nth-child(5) i").on("click",function(){
			
			
			var userNo = $(this).data("param2")
			
	
			$("#userdata").val(userNo);
		})
	})
	
	
	function fncAddBlackList() {
	
		
		

		var userNo = $("#userdata").val();
		
		
		var banReason=$("input[name='"+userNo+"banReason']").val();
		
		$("input[name='banReason']").val(banReason);

	
		
		$("#addBlackUser").attr("method" , "POST").attr("action" , "/admin/updateUser2?blackCode=2&userNo="+userNo).submit();
	
		
	}
	
	
	
	
	function fncGetList(currentPage) {
		
	
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/admin/listBlackObject").submit();
	}

	
	
	 $( function() {
			
		//================ List User===================	

			$("li:contains('회원목록')").on("click" , function() {
				
			
				
				self.location = "/admin/listUser"
			});
		
		//=================List Black Obejct=============
			
				$("li:contains('예비 블랙리스트')").on("click" , function() {
				
			
				
				self.location = "/admin/listBlackObject"
			});
			
		//================ListBlackList===================
			
			
				$("li:contains('블랙리스트 목록')").on("click" , function() {
				
				
				
				self.location = "/admin/listBlackList"
			});
			
		
		//=================환급 회원=========================
		
				$("#sponUser").on("click" , function() {
					
					
					
					$(self.location).attr("href","/stream/listRefund");
				});
				
		
			
		//================userNo 에서 블랙리스트 대상 된 이유 출력 Event ================//
		
	
			
			$("td:nth-child(2) i").on("click", function() {
			
				
				var userNo = $(this).data("param")
				
		
				
				$.ajax(
					{
						url : "/admin/json/getReportList/"+userNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
						
							var displayValue ="";
							var temp ="";
							
							$.each(JSONData,function(index) {
							
							temp = "<h6>"
														+"   신고 사유 : "+JSONData[index].reportReason+"<br/>"
														+"</h6>";
							displayValue += temp;
							
							});
							
							$("h6")
							$( "#"+userNo+"" ).html(displayValue);
							
						
						}
					});
				////////////////////////////////////////////////////////////////////////////////////////////////////////
			});
			
		
			$("td:nth-child(3) i").on("click", function() {
	
				
				var userNo = $(this).data("param1")
				
			
				
				$.ajax(
					{
						url : "/admin/json/userBlindList/"+userNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
						
							var displayValue ="";
							var temp ="";
							
							$.each(JSONData,function(index) {
							
							temp = "<h6>"
														+"   신고 사유 : "+JSONData[index].reportReason+"<br/>"
														+"</h6>";
							displayValue += temp;
							
							});
							
							$("h6")
							$( "#"+userNo+"" ).html(displayValue);
							
						
						}
					});
				////////////////////////////////////////////////////////////////////////////////////////////////////////
				
				
				/////////////////////////////////////블랙 리스트 등록 하기///////////////////////////////////////////		
				
			});
			
			/*
			$("td:nth-child(5) i").on("click" , function() {
					
		

				
			
					var userNo = $(this).data("param2");
				
					
					
			
					
					
				
				self.location="/admin/updateUser2?blackCode=2&userNo="+userNo;
				
			
			});
			===> 모달로 처리해서 주석임 */
			
			
			$("td:nth-child(6) i").on("click" , function() {
				
			
			
				
				
				var userNo = $(this).data("param3");
			
				
				
		
				
				
			
			self.location="/admin/updateUser2?blackCode=3&userNo="+userNo;
			
		
		});
	
			
			
			
		
			
			});
	 
	 
	 
		
	

	
   
	
	
	
	</script>
	
	
	
	
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
                <a class="navbar-brand" href="/admin/siteManage" title="DongneVangne">DongneVangne</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active"><a href="view/siteManage.jsp"><i class="glyphicon glyphicon-th"></i> Dashboard</a></li>
                    <li class="nav nav-list nav-list-expandable nav-list-expanded">
                        <a><i class="fa fa-user"></i> 회원목록 상세보기 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li><a href="/admin/listUser"><i class="fa fa-table"></i>회원목록</a></li>
                            <li id="listBlackObject"><a href="#"><i class="fa fa-edit"></i>예비 블랙리스트</a></li>
                            <li><a href="/admin/listBlackList"><i class="fa fa-edit"></i>블랙리스트 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="bootstrap.html"><i class="fa fa-magic"></i>신고 처리</a></li>
                  
                  
                     <li id="sponUser"><a href="#"><i class="glyphicon glyphicon-usd"></i>환급한 회원 목록</a></li>
                </ul>
                
            </div>
        </nav>

        <div id="page-wrapper">
           
           <div class="container">
           
           <div class="page-header text-info">
	       <h5>블랙리스트 후보</h5>
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    <thead>
	     <tr>
            <th align="center">No</th>
            <th align="left" >회원No</th>
            <th align="left">이름</th>
            <th align="left">가입날짜</th>
             <th align="left">등록처리</th>
             <th align="left">해지처리</th>
          
          </tr>
        </thead>
        
        	 <tbody>
   				
   			 <c:set var="i" value="0" />
   			 <c:forEach var="user" items="${list}" >
   				
   			<c:set var="i" value="${ i+1 }" />	
   			<tr>
   			<td align="left">${ i }</td>
   			
			  <td align="left">${user.userNo}
			   <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${user.userNo}" data-param="${user.userNo}"></i></div>
			  <input type="hidden" value="${user.userNo}">
			  </td>
			  
			  <td align="left">${user.userName}
			   <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${user.userNo}" data-param1="${user.userNo}"></i></div>
			  <input type="hidden" value="${user.userNo}">
			  </td>
			  
			   <td align="left">${user.regDate}</td>
			   
			    <td align="left">
			    <i class="glyphicon glyphicon-plus-sign" style="padding-left: 17px;" data-param2="${user.userNo}"  data-toggle="modal" data-target="#${user.userNo}modal1"></i>
			    </td>
			    
			     <td align="left">
			     <i class="glyphicon glyphicon-minus-sign" style="padding-left: 17px;" data-param3="${user.userNo}"></i>
			     </td>
		
		   </tr>
		   
		   
		      <!--  신고 사유 모달창 -->
		      
    <div class="modal" aria-hidden="true" style="display: none; z-index: 1060;" id="${user.userNo}modal1">
	<div class="modal-dialog modal-md">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div id="userdata" style="display: none;"></div>
               <form id="addBlackUser">
              <div class="modal-body">
        
              <input type="text" style="width: 100%" name="${user.userNo}banReason" placeholder="제제 사유를 입력하세요"/>
              <input type="hidden" name="banReason" value=""/>
              </div>
     		</form>
              <div class="modal-footer">
              
              <button type="button" class="btn btn-primary" name="addBlackList" onclick="javascript:fncAddBlackList()" data-param4="${user.userNo}">블랙리스트 등록</button>
           
            </div>
    
          </div>
        </div>
        
</div>

	<!-- 모달3 끝 -->
		   
		   
		   
   			
   			  	</c:forEach>
			  
			  
			</table>
        </div>
        <!-- /#page-wrapper -->
        
       <!-- PageNavigation Start... -->
	<jsp:include page="/common/pageNavigation.jsp"/>
	<!-- PageNavigation End... -->
	
        
    </div>
    <!-- /#wrapper -->
    
 


    <script type="text/javascript" src="/common/css/PBDashboard/js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/common/css/PBDashboard/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

    <script type="text/javascript" src="/common/css/PBDashboard/js/theme.js"></script>
  
</body>
</html>
