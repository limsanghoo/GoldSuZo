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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
	
	<script src="https://cdn.jsdelivr.net/npm/handlebars@4.0.12/dist/handlebars.runtime.min.js"></script>
	
	<script src="/common/js/jquery-sortable/source/js/jquery-sortable-min.js"></script>
	
	<script src="/common/js/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
	<script src="/common/js/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
	<script src="/common/js/blueimp-file-upload/js/jquery.fileupload.js"></script>
	
	<script src="/common/js/medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin.min.js"></script>
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        div.editable{
        	border: 1px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

</head>

<body>

<div class="container">
	
		<h1 class="text-center">상 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" method="post" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="sellName" class="col-sm-4 text-center">상 품 명</label>
		    <div class="container col-sm-7">
		      <input type="text" class="form-control" id="sellName" name="sellName" placeholder="상품명">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="status" class="col-sm-4 text-center">판매방법</label>
			<div class="container col-sm-7">
			<select class="form-control" name="sellStyle">
				<option value="00" >택배거래</option>
				<option value="01" >직거래</option>
			</select>
				</div>
		  </div>

		  <div class="form-group">
		    <label for="sellPrice" class="col-sm-4 text-center">가 격</label>
		    <div class="col-sm-7">
		      <input type="text" class="form-control" id="sellPrice" name="sellPrice" placeholder="가격">
		    </div>
		  </div>

		  <div class="form-group">
		  <label for="sellText" class="col-sm-4 text-center">상세정보</label>
		  <div class="container col-sm-7">
        <div class="editable" id="sellText">
		여기에 글을 작성 해 주세요<br>+버튼을 눌러서 이미지를 업로드 할 수 있습니다.
		
        </div>
	</div>
	</div>

    
    <script src="/common/js/medium-editor/dist/js/medium-editor.js"></script>
    <script>
  
    var editor = new MediumEditor('.editable');
    $(function () {
    	$('.editable').click(function(){
    		$('.editable').empty();
    	});
        $('.editable').mediumInsert({
            editor: editor
        });
    });
    </script>
    
    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-inverse bt"  >등&nbsp;록</button>
			  <a class="btn btn-inverse btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
</div>
</body>
</html>