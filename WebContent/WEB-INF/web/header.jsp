<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师管理系统</title>
</head>
<body>
	<div align="center">
		<h3>欢迎登录后台管理系统</h3>
		<table style="width: 1000px;">
			<tr>
				<s:hidden name="flag" value="%{#session.flag}"></s:hidden>
				<td>当前用户:<span style="color: red;">${nickname }</span></td>
				<td>登录IP:<span style="color: red;">${ip}(${time})</span></td>
				<td>当前系统时间:<span style="color: red;">
						<%
							java.util.Date currentTime = new java.util.Date();
							java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat(
									"yyyy-MM-dd HH:mm:ss");
							String dateString = formatter.format(currentTime);
							out.println(dateString);
						%>
				</span></td>
				<td><a href="/teacher/web/indexAction" class="btn btn-success" >首页</a></td>
				<td><a href="/teacher/web/logoutAction" class="btn btn-warning" >注销</a></td>
			</tr>
		</table>
	</div>

</body>
</html>