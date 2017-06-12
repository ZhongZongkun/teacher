<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

</head>
<body>
<body>
	<%
		response.setHeader("Refresh", "3;url=/teacher/index.jsp");
	%>
	<div align="center" class="main">
		<h3>登录超时,3秒后即将返回首页,或点击下面连接立即返回</h3>
		<a href="/teacher/index.jsp">点此立即返回</a>
	</div>
</body>


</html>