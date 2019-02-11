<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<title>addLink</title>

<script type="text/javascript">

function action_coords(event) {
	var x2 = event.offsetX;

    var y2 = event.offsetY;

    $("#addLink").append(
    		 '<div class="tags_form" style="top: '+x2+'px; left: '+y2+'px; z-index: 100; position: relative;">'
    		 +'<div class="tag_icon gray"></div>'
    		 +'<div class="tag_information" style="display: block;">'
			 +'<div class="common_information">'
    		 +'<input class="position_x" type="hidden" name="card[tags_attributes][0][position_x]" id="card_tags_attributes_0_position_x" value="15.9000">'
    		 +'<input class="position_y" type="hidden" name="card[tags_attributes][0][position_y]" id="card_tags_attributes_0_position_y" value="30.0000">'
    		 +'</div>'
			 +'<div class="user_field">'
    		 +'<input value="764692" type="hidden" name="card[tags_attributes][0][user_id]" id="card_tags_attributes_0_user_id">'
    		 +'<input class="production_id" type="hidden" name="card[tags_attributes][0][production_id]" id="card_tags_attributes_0_production_id">'
    		 +'<input class="production_name" type="hidden" name="card[tags_attributes][0][name]" id="card_tags_attributes_0_name">'
    		 +'<input value="제품정보" class="brand_name" type="hidden" name="card[tags_attributes][0][brand]" id="card_tags_attributes_0_brand">'
    		 +'<textarea placeholder="브랜드/구입처/제품명/후기 등을 입력 해주세요." class="description" name="card[tags_attributes][0][description]" id="card_tags_attributes_0_description"></textarea>'
    		 +'</div>'
    		 +'<div class="buttons">'
    		 +'<div class="confirm">'
    		 +'확인'
    		 +'</div>'
    		 +'<div class="destroy">'
    		 +'삭제'
    		 +'</div></div></div></div>'
    		 );

}

</script>

</head>
<body>
<form name="addLink" id="addLink">


    <div id="image_panel">
      <img name="photo1" src="${board.photo1}" alt="None" onclick="action_coords(event)" style="height: 500px; vertical-align: middle;">

         



</div><!-- /image_panel -->

</form>
</body>
</html>