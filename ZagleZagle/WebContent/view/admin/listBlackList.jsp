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
		$("form").attr("method" , "POST").attr("action" , "/admin/listBlackList").submit();
	}
	

			
		
	
	
	 $( function() {
			
		//================ List User===================	

			$("li:contains('회원목록')").on("click" , function() {
				
	
				
				self.location = "/admin/listUser"
			});
		//=============================================	
			
		
		
		//====================블랙리스트 회원 정보 보기=========================//
			
		$("td:nth-child(3) i").on("click", function(){
					
					var userNo = $(this).data("param")
					alert(userNo)
					
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
									alert(JSONData.userName)
									
									var snsNo = JSONData.snsNo
									alert(snsNo)
									
									if(snsNo.startsWith("K")) {
										snsNo = "카카오"
									}else if(snsNo.startsWith("N")) {
										snsNo = "네이버"
									}else {
										snsNo = "구글"
									}
									
									var grade = JSONData.grade
									
								 	alert(grade)
									
									if(grade== 0) {
										grade = "흙수저"
									}else if(grade == 1) {
										grade = "동수저"
									}else if(grade == 2) {
										grade = "은수저" 
									}else if(grade == 3) {
										grade =  "금수저"
									}
										
									var displayValue = "<h6>"
																+"   이  름 :"+JSONData.userName+"<br/>"
																+"   닉네임 : "+JSONData.userNickname+"<br/>"
																+"   생일 : "+JSONData.userBirth+"<br/>"
																+"   성별 : "+JSONData.userSex+"<br/>"
																+" SNS종류 :"+snsNo+"<br/>"
																+" 가입날짜 : "+JSONData.regDate+"<br/>"
																+" 등 급 :"+grade+"<br/>" 
																+"</h6>";
									$("h6").remove();
									$( "#"+userNo+"" ).html(displayValue);
								}
								
								
						});
						////////////////////////////////////////////////////////////////////////////////////////////
						
			
		}); 
		
		//================ 블랙 리스트 삭제==================

		$("#deleteBlack").on("click" , function() {
			
			alert("확인용")
			var userNo =  $(this).data("param4");
			var blackNo = $(this).data("param5");
			alert(blackNo)
			alert(userNo)
			
			self.location = "/admin/updateBlackCheckCode?userNo="+userNo+"&blackNo="+blackNo;
		});
	//=============================================	

			
			
			
			
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
                <a class="navbar-brand" href="siteManage.jsp" title="ZagleZagle">ZagleZagle</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active"><a href="view/siteManage.jsp"><i class="glyphicon glyphicon-th"></i> Dashboard</a></li>
                    <li class="nav nav-list nav-list-expandable nav-list-expanded">
                        <a><i class="fa fa-user"></i> 회원목록 상세보기 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-table"></i>회원목록</a></li>
                            <li><a href="/admin/listBlackObject"><i class="fa fa-edit"></i>예비 블랙리스트</a></li>
                            <li><a href="/admin/listBlackList"><i class="fa fa-edit"></i>블랙리스트 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="/admin/handleReport"><i class="fa fa-magic"></i> 신고 처리</a></li>
                    <li class="nav nav-list nav-list-expandable">
                        <a><i class="fa fa-key"></i> 방문자 통계 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li><a href="#">Sub Item 1</a></li>
                            <li><a href="#">Sub Item 2</a></li>
                        </ul>
                    <li>
                </ul>
              
                   </li>
                </ul>
            </div>
        </nav>

        <div id="page-wrapper">
           
           <div class="container">
           
           <div class="page-header text-info">
	       <h5>블랙리스트</h5>
	    </div>
	    
	    <table class="table table-hover table-striped" >
	    
	    <thead>
	     <tr>
            <th align="center">No</th>
            <th align="left" >블랙리스트No</th>
            <th align="left">회원No</th>
            <th align="left">제재 사유</th>
            <th align="left">시작날짜</th>
             <th align="left">만기날짜</th>
             <th align="left">해지</th>
          
          </tr>
        </thead>
        
        	 <tbody>
   				
   			 <c:set var="i" value="0" />
   			 <c:forEach var="blackList" items="${list}" >
   				
   			<c:set var="i" value="${ i+1 }" />	
   			<tr>
   			<td align="left">${ i }</td>
			  <td align="left" >${blackList.blackNo}</td>
			  
			  <td align="left">${blackList.blackUser.userNo}
			  <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${blackList.blackUser.userNo}" data-param="${blackList.blackUser.userNo}"></i></div>
			  <input type="hidden" value="${blackList.blackUser.userNo}">
			  </td>
			  
			  <td align="left">${blackList.banReason}</td>
			   <td align="left">${blackList.banStartDay}</td>
			    <td align="left">${blackList.banExpireDay}</td>
			     <td align="left">  <i class="glyphicon glyphicon-ok" style="padding-left: 17px;" data-param3="${blackList.blackUser.userNo}"   
			     									data-toggle="modal" data-target="#${blackList.blackUser.userNo}modal1"></i> </td>
		
		
		   </tr>
		   
		   
		      
		      <!--  신고 사유 모달창 -->
    <div class="modal" aria-hidden="true" style="display: none; z-index: 1060;" id="${blackList.blackUser.userNo}modal1">
	<div class="modal-dialog modal-md">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
              <div class="modal-body">
           
           		<strong>해지 하시겠습니까?</strong>
              </div>
              <div class="modal-footer">
            	<a href="#" class="btn btn-primary" id="deleteBlack" data-param4="${blackList.blackUser.userNo}" 
            						data-param5="${blackList.blackNo}">삭제</a>
             
          
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
    <script type="text/javascript">
        jQuery(function ($) {
            $("#chart_live").shieldChart({
                seriesPalette: ["#67A9CE", "#4063AD"],
                exportOptions: {
                    image: false,
                    print: false
                },
                axisX: {
                    categoricalValues: ['2001', '2002', '2003', '2004', '2005', '2006', '2007', '2008', '2009', '2010', '2011', '2012']
                },
                axisY: {
                    axisTickText: {
                        format: "{text:c}"
                    },
                    title: {
                        text: "Price (EUR per kWh)"
                    }
                },
                tooltipSettings: {
                    chartBound: true
                },
                primaryHeader: {
                    text: "Electricity prices"
                },
                dataSeries: [{
                    seriesType: 'splinearea',
                    applyAnimation: false,
                    collectionAlias: 'Households',
                    data: [0.164, 0.173, 0.184, 0.167, 0.177, 0.189, 0.180, 0.183, 0.188, 0.160, 0.176, 0.178]
                }, {
                    seriesType: 'splinearea',
                    applyAnimation: false,
                    collectionAlias: 'Industry',
                    data: [0.103, 0.105, 0.112, 0.111, 0.102, 0.099, 0.110, 0.113, 0.117, 0.119, 0.123, 0.117]
                }]
            });

            $("#chart_browsers").shieldChart({
                seriesPalette: ["#4063AD", "#6AC16E", "#67A9CE", "#F2C73E", "#D8494C"],
                exportOptions: {
                    image: false,
                    print: false
                },
                chartAreaPaddingTop: 0,
                chartAreaPaddingBottom: 0,
                chartAreaPaddingLeft: 0,
                chartAreaPaddingRight: 0,
                primaryHeader: {
                    text: ""
                },
                chartLegend: {
                    enabled: false
                },
                seriesSettings: {
                    pie: {
                        enablePointSelection: true,
                        dataPointText: {
                            enabled: false
                        }
                    }
                },
                dataSeries: [{
                    seriesType: "pie",
                    applyAnimation: false,
                    collectionAlias: "Usage",
                    data: [
                        ["IE", 9.0],                        
                        { collectionAlias: "Firefox", y: 26.8, selected: true },
                        ["Chrome", 55.8],
                        ["Safari", 3.8],
                        ["Opera", 1.9]
                    ]
                }]
            });

            $("#progress").shieldProgressBar({
                value: 75,
                layout: "circular",
                layoutOptions: {
                    circular: {
                        borderWidth: 0,
                        color: "#4063AD",
                        backgroundColor: "#A2E6D7"
                    }
                },
                text: {
                    enabled: true,
                    template: '<b style="color:#363636;">{0:c0}%</b>'
                }
            });

            $("#tagcloud").shieldTagCloud({
                dataSource: {
                    data: [
                        {"name":"Barcode","groups":1,"demos":4,"url":"http://demos.shieldui.com/web/barcode/basic-usage"},
                        {"name":"Calendar","groups":1,"demos":5,"url":"http://demos.shieldui.com/web/calendar/basic-usage"},
                        {"name":"Chart","groups":25,"demos":131,"url":"http://demos.shieldui.com/web/area-chart/axis-marker"},
                        {"name":"ColorPicker","groups":1,"demos":8,"url":"http://demos.shieldui.com/web/colorpicker/basic-usage"},
                        {"name":"ComboBox","groups":1,"demos":7,"url":"http://demos.shieldui.com/web/combobox/basic-usage"},
                        {"name":"ContextMenu","groups":1,"demos":1,"url":"http://demos.shieldui.com/web/contextmenu/basic-usage"},
                        {"name":"DataSource","groups":1,"deos":5,"url":"http://demos.shieldui.com/web/datasource/basic-usage"},
                        {"name":"DatePicker","groups":1,"demos":4,"url":"http://demos.shieldui.com/web/datepicker/basic-usage"},
                        {"name":"Editor","groups":1,"demos":5,"url":"ttp://demos.shieldui.com/web/editor/basic-usage"},
                        {"name":"Grid","groups":8,"demos":56,"url":"http://demos.shieldui.com/web/grid-general/basic-usage"},
                        {"name":"MaskedTextBox","groups":1,"demos":4,"url":"http://demosshieldui.com/web/maskedtextbox/basic-usage"},
                        {"name":"Menu","groups":1,"demos":5,"url":"http://demos.shieldui.com/web/menu/basic-usage"},
                        {"name":"MonthYearPicker","groups":1,"demos":3,"url":"http://demos.shieldi.com/web/monthyearpicker/basic-usage"},
                        {"name":"NumericTextBox","groups":1,"demos":3,"url":"http://demos.shieldui.com/web/numerictextbox/basic-usage"}
                    ]
                },
                textTemplate: "{name}",
                frequencyTemplate: "{demos}",
                hrefTemplate: "{url}"
            });

            $("#calendar1").shieldCalendar();

			$("#switch1").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-default"
			});
			$("#switch2").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-success"
			});
            $("#switch3").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-primary"
			});
            $("#switch4").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-info"
			});
            $("#switch5").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-warning"
			});
            $("#switch6").shieldSwitch({
				onText: "",
				offText: "",
				cls: "pbd-switch btn-danger"
			});
        });
    </script>
</body>
</html>
