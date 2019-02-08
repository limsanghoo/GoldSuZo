<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<%String local=request.getParameter("weatherLocal"); %>

<script type="text/javascript">

$(function(){
	
	var local="<%=local%>";

	var localArray=local.split(" ");
	var city=localArray[0];
	var county=localArray[1];
	var village=localArray[2];
	
	$.ajax({
		
		
		url : "https://api2.sktelecom.com/weather/current/hourly",
		type : "get",
		dataType: "json",
		data : {city:city, county:county, village:village, version:"2"},
		headers	: {appkey:"a464e2e7-664a-4d99-a0b5-25dd8b3d84a4"},
		success : function(data){
			console.log(data);
			
			//global 모든 문자열, ignore 대소문자 무시
			var tc1=JSON.stringify(data.weather.hourly[0].temperature.tc);						
			var tc2=tc1.replace(/"/gi,"");
			
			var sky1=JSON.stringify(data.weather.hourly[0].sky.name);			
			var sky2=sky1.replace(/"/gi,"");
			
			var code1=JSON.stringify(data.weather.hourly[0].sky.code);
			var code2=code1.replace(/"/gi,"");

			
			//html 변경
			var realTc=$("#tc");
			realTc.html(tc2+"˚C");
			
			var realSky=$("#sky");
			realSky.html(sky2);
			
			var realCode=$("#code");
			
			if(code2=="SKY_O01")
			realCode.attr("src","/common/images/board/icons8-summer-96.png");
			
			if(code2=="SKY_O02" || code2=="SKY_O07")
			realCode.attr("src","/common/images/board/icons8-partly-cloudy-day-96.png");
			
			if(code2=="SKY_O03")
			realCode.attr("src","/common/images/board/icons8-cloud-96.png");
			
			if(code2=="SKY_O04" || code2=="SKY_O08" || code2=="SKY_O12")
			realCode.attr("src","/common/images/board/icons8-keep-dry-96.png");
			
			if(code2=="SKY_O05" || code2=="SKY_O09" || code2=="SKY_O13")
			realCode.attr("src","/common/images/board/icons8-snow-storm-96.png");
			
			if(code2=="SKY_O06" || code2=="SKY_O10" || code2=="SKY_O14")
			realCode.attr("src","/common/images/board/icons8-sleet-96.png");
			
			if(code2=="SKY_O11")
			realCode.attr("src","/common/images/board/icons8-storm-96.png");
					
			
			var weatherLocal=$("#weatherLocal");
			weatherLocal.html(city+" "+county+" "+village);
		}
	});
	
	
});

</script>


</head>

<body>


<table class="tg">
  <tr>
    <th class="tg-s268" id="weatherLocal" colspan="3" style="text-align: center;"></th>
  </tr>
  
  <tr>
    <td class="tg-0lax" colspan="3"><br/></td>
  </tr>
  
  <tr>
    <td class="tg-s268" colspan="3" rowspan="6" style="text-align: center;">   
    <img id="code" src=""/>
    </td>
  </tr>
  
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  <tr>
  </tr>
  
  <tr>
    <td class="tg-0lax" colspan="3"><br/></td>
  </tr>
  
  <tr>
    <td class="tg-0lax" id="tc" colspan="3" style="text-align: center;"></td>
  </tr>
  
  <tr>
    <td class="tg-0lax" id="sky" colspan="3" style="text-align: center;"></td>
  </tr>
</table>



</body>
</html>