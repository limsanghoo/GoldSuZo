<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-lite.js"></script>
  </head>
  <body>
  <h1>상품등록</h1>
        <div>
        	상품명
   			<input type="text" name="sellName" id="sellName" value=""/>
		</div>
		<div>
			휴대폰번호
  			<input type="text" name="sellPhone" id="sellPhone" value=""/>
		</div>
		<div>
			가격
  			<input type="text" name="sellPrice" id="sellPrice" value=""/>
		</div>
		<div>
			판매방법
			<select name="sellStyle"  class="ct_input_g">
				<option value="00" >택배거래</option>
				<option value="01" >직거래</option>
			</select>
		</div>
    <div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 100
      });
    </script>
  </body>
</html>