<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>DongneVangne</title>
<head>
<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	 <!-- Favicons -->
  <link href="/common/css/estateagency-master/img/favicon2.png" rel="icon">
  <link href="/common/css/estateagency-master/img/apple-touch-icon2.png" rel="apple-touch-icon">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<script>
	window.onload = function(){

	$.ajax(
			{
				url : "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=KmLTDQE5pCDwajoI5Z87PQ&t_code=${buy.companyCode}&t_invoice=${buy.trackingNo}",
				method : "GET",
				header : {
					"accept" : "application/json;charset=UTF-8"
				},
				success : function(data, status){
					console.log(data);
					$("#receiver").append(data.receiverName+" / "+data.receiverAddr);
					$("#sender").append(data.senderName);
					
					var a='';
					
					var trackingDetails = data.trackingDetails;
					
					$.each(trackingDetails, function(i){
						
						a +='<div class="row">'
						a +='<div class="col-xs-8 col-md-4" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: center;" id="time">'+trackingDetails[i].timeString+'</div>';
						a +='<div class="col-xs-8 col-md-4" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: center;" id="where">'+trackingDetails[i].where+'</div>';
				  		a +='<div class="col-xs-8 col-md-4" style="text-align: center;" id="kind">'+trackingDetails[i].kind+'</div>';
				  		a +='</div><br/>';
					});
					
					$(".col-12").append(a);
				}
				
			});
	}
	</script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

    </style>
<title>Insert title here</title>
</head>
<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">
	    <div class="col-12">
	    
	    <div class="row">
			<H2><strong>배송조회</strong></H2>
		</div>
		
	    <div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
	    <br/>
	    
		<div class="row">
	  		<div class="col-xs-8 col-md-1"  style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>받는분</strong></div>
			<div class="col-xs-4 col-md-5" id="receiver"></div>

	  		<div class="col-xs-8 col-md-2" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: right;"><strong>보내는분</strong></div>
			<div class="col-xs-4 col-md-4" id="sender"></div>
		</div>

		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		<br/>
	    
		<div class="row">
	  		<div class="col-xs-8 col-md-4" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: center;"><strong>시간</strong></div>
			<div class="col-xs-8 col-md-4" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; text-align: center;"><strong>위치</strong></div>
	  		<div class="col-xs-8 col-md-4" style="text-align: center;"><strong>배송상태</strong></div>
		</div>

		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		<br/>
		
</div>
</div>
</body>
</html>