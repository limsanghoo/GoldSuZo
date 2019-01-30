<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<style>
        div.editable{
        	border: 1px solid #777;
        }
</style>

	<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">

	<!-- Font Awesome for awesome icons. You can redefine icons used in a plugin configuration -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	
	<!-- CSS -->
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  

<script type="text/javascript">
		
$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "button:contains('등록')"  ).on("click" , function() {
		addSell();
	});
	$("button:contains('이전')").on("click", function() {
		 self.location="/trade/listTrade";
		});
});	
 
 function addSell(){
	 
	 var value = "";	
		if( $("input:text[name='phone1']").val() != ""  && $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
			var value = $("input[name='phone1']").val() 
								+'-'
								+ $("input[name='phone2']").val()
								+'-'
								+ $("input[name='phone3']").val();
		}

		$("input:hidden[name='sellPhone']").val( value );
		
		$("form").attr("method" , "POST").attr("action" , "/trade/addSell").submit();
 }
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/view/layout/toolbar.jsp"/>
   	<!-- ToolBar End /////////////////////////////////////-->
	<form class="form-horizontal" method="post" enctype="multipart/form-data">
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" style="margin-top:150px">
	<div class="col-12">
	
	<div class="row">
	<div class="col-lg-9">
	<H2><strong>상품등록</strong></H2>
	</div>
	
	<div class="col-lg-3 text-right">
		<button type="button" class="btn btn-b">등록</button>
		<button type="button" class="btn btn-a">이전</button>
	</div>
	
</div>

	    <div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
	    <br/>
		
		<div class="row">
	  		<div class="col-xs-8 col-md-1 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>상품명</strong></div>
			<div class="col-xs-4 col-md-4"><input type="text" class="form-control" id="sellName" name="sellName" placeholder="상품명"></div>
			
			<div class="col-xs-8 col-md-2 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>전화번호</strong></div>
			<div class="col-xs-4 col-md-5">
			     <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone1" name="phone1">
			    </div>
		    	<div class="col-sm-1 text-center">-</div>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone2" name="phone2">
			    </div>
		    	<div class="col-sm-1 text-center">-</div>
			    <div class="col-sm-3">
			      <input type="text" class="form-control" id="phone3" name="phone3">
			    </div>
		    	<input type="hidden" name="sellPhone"/>
		    </div>
		</div>
		
		<br/>

	    <div class="row">
	    <div class="col-xs-8 col-md-1 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>가격</strong></div>
			<div class="col-xs-3 col-md-3"><input type="text" class="form-control" id="sellPrice" name="sellPrice"></div>
			<div class="col-xs-1 col-md-1">원</div>

		    <div class="col-xs-8 col-md-2 text-right" style="border-right-width: 0.1em; border-right-style: solid; border-right-color: #777; padding-top: .5em; padding-bottom: .5em;"><strong>판매방식</strong></div>
			<div class="col-xs-4 col-md-5">
				<select class="form-control" name="sellStyle">
				<option value="10" >택배거래</option>
				<option value="20" >직거래</option>
			</select>
			</div>
		</div>
		
		<br/>

		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
		<br/>
	
	  	<div class="row">
	  		<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo1}"/>사진1
			</div>
			<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo2}" />사진2
			</div>
			<div class="col-xs-4 col-md-4">
	    	<img src="${board.photo3}"/>사진3
			</div>
		</div>
		
		<br/>
		
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
		<br/>
		
		<div class="row">
		<div class="col-xs-8 col-md-2" style="padding-top: .5em; padding-bottom: .5em;"><strong>상세정보</strong></div>
	
			<div class="col-xs-4 col-md-10" style="border-left-width: 0.1em; border-left-style: solid; border-left-color: #777; padding-top: .5em; padding-bottom: .5em;">
			<textarea class="editable" id="sellText" name="sellText">
			</textarea>
			</div>
		</div>
		<br/>
<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
    <script>
  
    var editor = new MediumEditor('.editable', {
    	extensions: {
            'imageDragging': {}
        },
        placeholder: {
            text: '여기에 내용을 작성 해 주세요',
            hideOnClick: true
        }
        
    
    });
    
    </script>
    
		<div class="row" style="border-top-width: 0.1em; border-top-style: solid; border-top-color: #2eca6a;"></div>
		
</div>
</div>
</form>

</body>

</html>
