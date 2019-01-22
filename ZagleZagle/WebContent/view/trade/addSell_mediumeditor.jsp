<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MediumEditor | demo</title>
    <link rel="stylesheet" href="css/demo.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">

	<!-- Font Awesome for awesome icons. You can redefine icons used in a plugin configuration -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
	
	<!-- CSS -->
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/medium-editor.min.css">
	<link rel="stylesheet" href="/common/js/medium-editor/dist/css/themes/beagle.css">
	<link rel="stylesheet" href="/common/js/medium-editor-insert-plugin/dist/css/medium-editor-insert-plugin.min.css">
	
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/handlebars@4.0.12/dist/handlebars.runtime.min.js"></script>
	
	<script src="/common/js/jquery-sortable/source/js/jquery-sortable-min.js"></script>
	
	<script src="/common/js/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
	<script src="/common/js/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
	<script src="/common/js/blueimp-file-upload/js/jquery.fileupload.js"></script>
	
	<script src="/common/js/medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin.min.js"></script>

</head>

<body>

    <div id="container">
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
		<hr/>
        <div class="editable">
        asdfffffffffffffffffffffffffffffffff
        </div>
	</div>
    
    <script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
    <script>
    var editor = new MediumEditor('.editable');
    $(function () {
        $('.editable').mediumInsert({
            editor: editor
        });
    });
    </script>
</body>
</html>
