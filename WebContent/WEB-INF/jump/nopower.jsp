<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<script type="text/javascript">
	var i= 3;  
	function remainTime(){  
		i--;
	    if(i==0){  
	        document.getElementById("jump").click();
	    } 
	    setTimeout("remainTime()",1000);  
	}  
	remainTime();
</script>
</head>
<body>
<body>
	<div align="center">
		<h3>操作失败,你没有权限,<strong id="endtime">3</strong>秒后即将返回首页,或点击下面连接立即返回</h3>
		<a id="jump" href="/teacher/web/indexAction">点此立即返回</a>
	</div>
</body>


</html>