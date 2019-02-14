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
	
	
	function fncGetList(currentPage) {
		
	
		
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/admin/listUser").submit();
	}

	
	
	 $( function() {
			
		 $("#listUser").on("click" , function() {

				
				$(self.location).attr("href","/admin/listUser");
			});
			
				
			$("#listBlackObject").on("click" , function() {
					
				
					
				$(self.location).attr("href","/admin/listBlackObject");
			});
			
			
			$("#sponUser").on("click" , function() {
				
				
				
				$(self.location).attr("href","/stream/listRefund");
			});
			
			
			
			$("#logOut").on("click" , function() {
				
				alert("로그아웃 하시겠습니까?")
				
				self.location = "/user/logout"
			});
			
			//==========================회원 정보 보기 Event 처리========================
				
				$("td:nth-child(2) i").on("click", function(){
					
					var userNo = $(this).data("param")
		
					
					$.ajax( 
							{
								url : "/user/json/getUser2/"+userNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
					
									
									var snsNo = JSONData.snsNo
							
									
									if(snsNo.startsWith("K")) {
										snsNo = "카카오"
									}else if(snsNo.startsWith("N")) {
										snsNo = "네이버"
									}else {
										snsNo = "구글"
									}
									
									var displayValue = "<h6>"
																+"   닉네임 : "+JSONData.userNickname+"<br/>"
																+"   생일 : "+JSONData.userBirth+"<br/>"
																+"   성별 : "+JSONData.userSex+"<br/>"
																+" SNS종류 :"+snsNo+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userNo+"" ).html(displayValue);
								}
								
								
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
					
					
					
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
                <a class="navbar-brand" href="/board/listBoard/" title="DongneVangne">DongneVangne</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active"><a href="/admin/siteManage"><i class="glyphicon glyphicon-th"></i> Dashboard</a></li>
                    <li class="nav nav-list nav-list-expandable nav-list-expanded">
                        <a><i class="fa fa-user"></i> 회원목록 상세보기 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li id="listUser"><a href="#"><i class="fa fa-table"></i>회원목록</a></li>
                            <li  id="listBlackObject"><a href="#"><i class="fa fa-edit"></i>예비 블랙리스트</a></li>
                            <li><a href="/admin/listBlackList"><i class="fa fa-edit"></i>블랙리스트 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="/admin/handleReport"><i class="fa fa-magic"></i> 신고 처리</a></li>
                    
                             <li id="sponUser"><a href="#"><i class="glyphicon glyphicon-usd"></i>환급한 회원 목록</a></li>
                </ul>
              
            </div>
        </nav>

        <div id="page-wrapper">
           
           <div class="container">
           
           <div class="page-header text-info">
	       <h5>회원 목록</h5>
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    <thead>
	     <tr>
            <th align="center">No</th>
            <th align="left" >회원No</th>
            <th align="left">이름</th>
            <th align="left">소셜No</th>
            <th align="left">가입날짜</th>
             <th align="left">삭제횟수</th>
          
          </tr>
        </thead>
        
        	 <tbody>
   				
   			 <c:set var="i" value="0" />
   			 <c:forEach var="user" items="${list}" >
   				
   			<c:set var="i" value="${ i+1 }" />	
   			<tr>
   			<td align="left">${ i }</td>
   			
			  <td align="left" >${user.userNo}<br>
			  <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${user.userNo}" data-param="${user.userNo}"></i></div>
			  <input type="hidden" value="${user.userNo}">
			  </td>
			  
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.snsNo}</td>
			   <td align="left">${user.regDate}</td>
			    <td align="left">${user.deleteCount}</td>
		
		   </tr>
   			
   			  	</c:forEach>
			  <form>
			  	  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
			  </form>
			  
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
  
    </script>
</body>
</html>
