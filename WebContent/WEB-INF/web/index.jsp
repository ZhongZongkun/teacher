<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台首页</title>
<link href="/teacher/static/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/teacher/static/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="/teacher/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/teacher/static/js/change.js"></script>
<style type="text/css">
html{
	width: 100%;
	height: 100%;
	position: absolute;
}
.main{
	margin: 0px auto;
	width: 1000px;
	height: 600px;
	position: relative;
	overflow: hidden;
}
.main .leftbar{
	position: relative;
	float: left;
	margin-left: 0px;
	margin-top: 0px;
	width: 200px;
	height: 580px;
	background-color: white;
}
.main .rightbar{
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
thead tr td{
	font-size: 20px;
	font-weight: bolder;
}
td{
	text-align: center;
}
</style>
<script type="text/javascript">
function isFlag(){
	var flag = document.getElementById("flag").value;
	if(flag == "0"){
		document.getElementById("reward").style.display="none";
		document.getElementById("pushnews").style.display="none";
	}
}
</script>
</head>
<body onload="isFlag()">
	<s:include value="header.jsp"></s:include><!-- 头部导航 -->
	<hr style="width:100%;">
	<div class="main">

	<div class="leftbar">
		<ul class="list-group" style="width:200px;">
			<a href="/teacher/web/showInfoAction" class="list-group-item">
			    教师信息查看<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			</a>
			<a href="/teacher/web/changeInfoAction" class="list-group-item">
				教师信息修改<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
			</a>
			<a href="/teacher/web/showRPInfoAction" class="list-group-item">
				奖惩信息查看<span class="glyphicon glyphicon-sort" aria-hidden="true"></span>
			</a>
			<a href="/teacher/web/showLoginInfoAction" class="list-group-item">
				登录信息查看<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
			</a>
			<a href="/teacher/admin/pushNewsAction" class="list-group-item" id="pushnews">
				新闻发布<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
			</a>
			<a href="/teacher/admin/changRPAction" class="list-group-item" id="reward" >
				修改奖惩信息<span class="glyphicon glyphicon-yen" aria-hidden="true"></span>
			</a>
		</ul>
	</div>

	<div class="rightbar">
		<table class="table table-bordered table-hover table-striped table-condensed">
			<thead>
				<tr>
					<input type="hidden" id="flag" value='<%=session.getAttribute("flag")%>'>
					<td style="width:15%">公告序号</td>
					<td style="width:55%">公告标题</td>
					<td style="width:20%">发布时间</td>
					<td style="width:10%">操作</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#request.news" status="index">
				<tr>
					<td><s:property value="#index.index+1"/></td>
					<td>${title}</td>
					<td>${outtime}</td>
					<td><a href="show_news?newId=${id}" class="btn btn-info">详情</a></td>
					<!--<a href="download_get?fileId=${fileId}">${fileName}</a><br/>-->
				</tr>
				</s:iterator>
				
			</tbody>
		</table>
	
	</div>

	</div>
</body>
</html>