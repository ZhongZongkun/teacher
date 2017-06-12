	
function getDel(k){
		if(confirm("确定要删除这条记录吗？"))
		 {
			 $(k).parent().remove();  
		 }
	};

$(document).ready(function(){
	$("#cancelBasic").click(function(){
		var display = $("#basic").css('display');
		if(display == "none"){
		}else{
			 $("#showBasic").click();
		}
	});
	$(".addaedu").click(function(){
		$str='';
		$str+="<tr>";
		$str+="<td><input name='begin' type='date' value=''/></td>";
		$str+="<td><input name='end' type='date' value=''/></td>";
		$str+="<td><input name='statuss' type='text' value=''/></td>";
		$str+="<td colspan='2'><input name='school' type='text' value=''/></td>";
		$str+="<td onClick='getDel(this)'><button class='btn btn-danger' >删除</button></td>";
		$str+="</tr>";
		$("#edu").append($str);
	});
	
	$(".addfam").click(function(){
		$str='';
		$str+="<tr>";
		$str+="<td colspan='3'><input name='names' type='text' value=''/></td>";
		$str+="<td colspan='2'><input name='relation' type='text' value=''/></td>";
		$str+="<td onClick='getDel(this)'><button class='btn btn-danger' >删除</button></td>";
		$str+="</tr>";
		$("#fam").append($str);
	});
	
	$("#cancelEdu").click(function(){
		var display = $("#education").css('display');
		if(display == "none"){
		}else{
			 $("#showEducation").click();
		}
	});
	
	$("#cancelFam").click(function(){
		var display = $("#family").css('display');
		if(display == "none"){
		}else{
			 $("#showFamily").click();
		}
	});
	
	$("#showBasic").click(function(){
		var edisplay = $("#education").css('display');
		var fdisplay = $("#family").css('display');
		if(edisplay != "none"){
			$("#showEducation").click();
		}
		if(fdisplay != "none"){
			$("#showFamily").click();
		}
	});
	
	$("#showFamily").click(function(){
		var edisplay = $("#education").css('display');
		var bdisplay = $("#basic").css('display');
		if(edisplay != "none"){
			$("#showEducation").click();
		}
		if(bdisplay != "none"){
			$("#showBasic").click();
		}
	});
	
	$("#showEducation").click(function(){
		var fdisplay = $("#family").css('display');
		var bdisplay = $("#basic").css('display');
		if(fdisplay != "none"){
			$("#showFamily").click();
		}
		if(bdisplay != "none"){
			$("#showBasic").click();
		}
	});
	
	
});
