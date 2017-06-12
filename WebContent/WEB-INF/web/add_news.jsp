<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="cn.zzk.bean.Teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台首页</title>
<link href="/teacher/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
html {
	width: 100%;
	height: 100%;
	position: absolute;
}

.main {
	margin: 0px auto;
	width: 1000px;
	height: 600px;
	position: relative;
	overflow: hidden;
}

.main .leftbar {
	position: relative;
	float: left;
	margin-left: 0px;
	margin-top: 0px;
	width: 200px;
	height: 580px;
	background-color: white;
}

.main .rightbar {
	width: 780px;
	height: 580px;
	position: relative;
	float: right;
	margin-top: 0px;
	margin-left: 20px;
	/*
	background-color: #ddd;
	*/
}

thead tr td {
	font-size: 20px;
	font-weight: bolder;
}

td {
	text-align: center;
}
</style>
<script type="text/javascript">
	function isFlag() {
		var flag = document.getElementById("flag").value;
		if (flag == "0") {
			document.getElementById("reward").style.display = "none";
			document.getElementById("pushnews").style.display = "none";
		}
	}
</script>
</head>
<body onload="isFlag()">
	<s:include value="header.jsp"></s:include>
	<!-- 头部导航 -->
	<hr style="width: 100%;">
	<div class="main">

		<div class="leftbar">
			<ul class="list-group" style="width: 200px;">
				<a href="/teacher/web/showInfoAction" class="list-group-item">
					教师信息查看<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
				</a>
				<a href="/teacher/web/changeInfoAction" class="list-group-item">
					教师信息修改<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
				</a>
				<a href="/teacher/web/showRPInfoAction" class="list-group-item">
					奖惩信息查看<span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
				</a>
				<a href="/teacher/web/showLoginInfoAction"
					class="list-group-item"> 登录信息查看<span
					class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</a>
				<a href="/teacher/admin/pushNewsAction" class="list-group-item active"
					id="pushnews"> 新闻发布<span class="glyphicon glyphicon-send"
					aria-hidden="true"></span>
				</a>
				<a href="/teacher/admin/changRPAction" class="list-group-item"
					id="reward"> 修改奖惩信息<span class="glyphicon glyphicon-yen"
					aria-hidden="true"></span>
				</a>
			</ul>
		</div>

		<div class="rightbar">
			<ol class="breadcrumb">
				<li><a href="/teacher/web/indexAction">首页</a></li>
				<li class="active">添加新闻</li>
			</ol>
			<table
				class="table table-bordered table-hover table-striped table-condensed">
				<tbody>
					<s:form class="form-horizontal" action="add_newsAction">
						标题:<input type="text" class="form-control" name="title"><br/>
						内容:<textarea class="form-control" rows="5" name="content"></textarea><br/>
					    发布人:<input class="form-control" type="text" name="author" value="${ sessionScope.teacher.name}" readonly><br/>
						<input style="margin-left:44%;" type="submit" class="btn btn-success" onclick= "return confirm('确定发布新闻?');" value="发布新闻">
					</s:form>

				</tbody>
			</table>

		</div>

	</div>
</body>
</html>