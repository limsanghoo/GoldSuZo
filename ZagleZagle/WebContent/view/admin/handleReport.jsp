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
		
		alert("클릭")
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/admin/listBlackObject").submit();
	}

	
	
	 $( function() {
			
		//================ List User===================	

			$("li:contains('회원목록')").on("click" , function() {
				
				alert("클릭")
				
				self.location = "/admin/listUser"
			});
		
		//=================List Black Obejct=============
			
				$("li:contains('예비 블랙리스트')").on("click" , function() {
				
				alert("클릭")
				
				self.location = "/admin/listBlackObject"
			});
			
		//================ListBlackList===================
			
			
				$("li:contains('블랙리스트 목록')").on("click" , function() {
				
				alert("클릭")
				
				self.location = "/admin/listBlackList"
			});
			
		
			
		
			
		//================getBoard Ajax================//
		
	
			
			$("td:nth-child(2) i").on("click", function() {
				alert("click 확인")
				
				var boardNo = $(this).data("param")
				
				alert(boardNo)
				
				$.ajax(
					{
						url : "/board/json/getBoard/"+boardNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
						alert(JSONData.photo1)
						
						var photo = JSONData.photo1
						
						
							var displayValue ="<h6>"
														+"작성자 :"+JSONData.user.userNo+"<br/>"
														+"사진 정보 : <img src='"+photo+"'/><br/>"
														+"작성 내용 :"+JSONData.boardDetailText+"<br/>"
														+"해시태그 :"+JSONData.hashTag+"<br/>"
														+"작성 날짜 :"+JSONData.boardRegDate+"<br/>"
														+"</h6>"
							$( "#"+boardNo+"" ).html(displayValue);
							
						
						}
					});
				////////////////////////////////////////////////////////////////////////////////////////////////////////
			});
			
			
		
		
			$("td:nth-child(3) i").on("click", function() {
				alert("click 확인")
				
				var commentNo = $(this).data("param1")
				
				alert(commentNo)
				
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
							alert(JSONData)
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
			
			
////////////////////////////////////블라인드 게시물,댓글 삭제 처리//////////////////////////////////////////////////
			
			$("td:nth-child(4) i").on("click" , function() {
				
				
				var blindNo = $(this).data("param");
			
				var boardNo = $(this).data("param2");
		
				alert(boardNo)
				alert(blindNo)
				
				//////수정 필요///// commentNo 관련
				/////      if(blindNo != null) {
				/////		self.location="/admin/updateBlind?blindCode=1&blindNo="+blindNo;
			
				////}else {
				////		self.location="/admin/updateBlind2?blindCode=1&CommentNo="+CommentNo;
				////}
				/////
				
				
			
			self.location="/admin/updateBlind?blindCode=1&blindNo="+blindNo+"&boardNo="+boardNo;
			
		
		});
		
		
		
		$("td:nth-child(5) i").on("click" , function() {
					
				
				var blindNo = $(this).data("param1");
			    var boardNo = $(this).data("param3");
				
				
				alert(blindNo)
				
				
			
			self.location="/admin/updateBlind?blindCode=2&blindNo="+blindNo+"&boardNo="+boardNo;
			
		
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
                <a class="navbar-brand" href="/board/listBoard" title="ZagleZagle">ZagleZagle</a>
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
                    <li><a href="/admin/handleReport"><i class="fa fa-magic"></i>신고 처리</a></li>
                    <li class="nav nav-list nav-list-expandable">
                        <a><i class="fa fa-key"></i> 방문자 통계 <span class="caret"></span></a>
                        <ul class="nav navbar-nav">
                            <li><a href="#">Sub Item 1</a></li>
                            <li><a href="#">Sub Item 2</a></li>
                        </ul>
                    <li>
                </ul>
         
            </div>
        </nav>

        <div id="page-wrapper">
           
           <div class="container">
           		
          <div class="page-header text-info">
	       <h5>신고 처리</h5>
	    </div>
           		
        <table class="table table-hover table-striped" >
           
            <thead>
            <tr>
            <th align="center">No</th>
            <th align="left" >게시물No</th>
            <th align="left">댓글No</th>
            <th align="left">삭제</th>           
            <th align="left">해지</th>
   			</tr>
        </thead>
        
        <tbody>
   				
   			 <c:set var="i" value="0" />
   			 <c:forEach var="blind" items="${list}" >
   			 
   			 	<c:set var="i" value="${ i+1 }" />	
   			<tr>
   			<td align="left">${ i }</td>
   			
   			 <td align="left" >${blind.blindBoardNo.boardNo}
   			 
   			 <c:if test="${blind.blindBoardNo.boardNo != null}">
   			 <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${blind.blindBoardNo.boardNo}" 
   			 data-param="${blind.blindBoardNo.boardNo}"></i></div>
   			 <input type="hidden" value="${blind.blindBoardNo.boardNo}">
   			 </c:if>
   			 
   			 <c:if test="${blind.blindBoardNo.boardNo == null}">
   			 
   			 <div style="padding-left: 22px;"><i class="glyphicon glyphicon-option-horizontal"></i></div>
   			 </c:if>
   			 </td>
   			 
   			 
   			 
   			 
   			 
   			  <td align="left">${blind.blindCommentNo.commentNo}
   			  
   			  <c:if test="${blind.blindCommentNo.commentNo != null}">
   			   <div style="padding-left: 22px;"><i class="glyphicon glyphicon-chevron-down" id= "${blind.blindCommentNo.commentNo}" data-param1="${blind.blindCommentNo.commentNo}"></i></div>
   			 <input type="hidden" value="${blind.blindCommentNo.commentNo}">
   			 </c:if>	
   			 
   			  <c:if test="${blind.blindCommentNo.commentNo == null}">
   			  
   				<div style="padding-left: 22px;"><i class="glyphicon glyphicon-option-horizontal"></i></div>
   			 </c:if>	
   			 	
   			 	
   		
   			  </td>
			  <td align="left">
			  <div style="padding-left: 7px;"><i class="glyphicon glyphicon-fire" data-param="${blind.blindNo}" data-param2="${blind.blindBoardNo.boardNo}"></i></div>
			  
			  </td>
			  
			  <td align="left">
			  <div style="padding-left: 7px;"><i class="glyphicon glyphicon-leaf" data-param1="${blind.blindNo}" data-param3="${blind.blindBoardNo.boardNo}"></i></div>
			  
			  </td>
			 
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
    
</div>
    
    

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
