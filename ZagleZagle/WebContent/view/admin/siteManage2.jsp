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
	
	button{
      align-self:center;
      background:transparent;
      padding:1rem 1rem;
      
      transition:all .5s ease;
      color:#ea062f;     
      
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
