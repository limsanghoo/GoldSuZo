<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MediumEditor | demo</title>
    <link rel="stylesheet" href="css/demo.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="bower_components/medium-editor/dist/css/medium-editor.css">
    <link rel="stylesheet" href="bower_components/medium-editor/dist/css/themes/default.css" id="medium-editor-theme">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/css/medium-editor.min.css" type="text/css" media="screen" charset="utf-8">
</head>

<script src="//cdn.jsdelivr.net/npm/medium-editor@latest/dist/js/medium-editor.min.js"></script>

<body>

    <div id="container">
        <h1>MediumEditor</h1>
        <div>
   <input type="text" name="hashTag" id="hashTag" value=""/>
</div>
<div>
   <input type="text" name="hashTag" id="hashTag" value=""/>
</div>
<div>
   <input type="text" name="hashTag" id="hashTag" value=""/>
</div>
        <div class="editable">
        
        </div>
    </div>
    
    <script src="bower_components/medium-editor/dist/js/medium-editor.js"></script>
    <script>
        var editor = new MediumEditor('.editable'),
            cssLink = document.getElementById('medium-editor-theme');

        document.getElementById('sel-themes').addEventListener('change', function () {
            cssLink.href = 'bower_components/medium-editor/dist/css/' + this.value + '.css';
        });

        document.getElementById('version').innerHTML = 'This demo uses MediumEditor v' + MediumEditor.version;
    </script>
</body>
</html>
