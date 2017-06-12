<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="/teacher/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/teacher/static/css/login.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
.main{
margin-top:100px;
}
span.errorMessage{
color:red;
font-size:14px;
}
h3{
color:white;
}
</style>
</head>
<body>

<body style="background:#5C7D94;">
<div align="center" class="main">
<h3>教师管理系统登录</h3>
	<s:form action="/loginCheck">
		<s:textfield name="username" label="用户名" size="30"><span style="color:red;">${usernameerror}</span></s:textfield>
		<br/>
		<s:password name="password" style="margin-top:20px;" label="密码" size="30"><span style="color:red;">${passworderror}</span></s:password>
		<br/>
		<s:submit value="登录" style="margin-top:10px;" align="center" size="20" class="btn btn-success"></s:submit>
		<s:reset value="重置"  style="margin-top:10px;" align="center" size="20" class="btn btn-warning"></s:reset>
	</s:form>
	</div>
</body>


</html>