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
.collapse{
margin-top:10px;
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
			<a href="/teacher/web/changeInfoAction" class="list-group-item active">
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
		<ol class="breadcrumb">
			<li><a href="indexAction">首页</a></li>
			<li class="active">教师信息修改</li>
		</ol>
		<button class="btn btn-primary" id="showBasic" type="button" data-toggle="collapse" data-target="#basic" aria-expanded="false" aria-controls="collapseExample">
		  基本信息修改
		</button>
		<button class="btn btn-warning" id="showEducation" type="button" data-toggle="collapse" data-target="#education" aria-expanded="false" aria-controls="collapseExample">
		  修改教育经历
		</button>
		<button class="btn btn-warning" id="showFamily" type="button" data-toggle="collapse" data-target="#family" aria-expanded="false" aria-controls="collapseExample">
		  修改家庭关系
		</button>
			<div class="collapse" id="basic">
			  <div class="well">
			  <s:form action="change_basic">
			  <table class="table table-bordered table-hover table-striped table-condensed">
			  <s:iterator value="#request.teacher" status="index">
			    <thead>
				<tr><td colspan="6">基本信息</td></tr>
				</thead>
				<tbody>
				<tr>
					<td>姓名</td><td><input name="name" type="text" value="${name}"></td><td>年龄</td><td>${age}</td><td>性别</td>
					<td>
					<label class="radio-inline"><input type="radio" name="sex" value="1" <s:if test="#request.teacher.sex==1">checked</s:if>>男</label>
					<label class="radio-inline"><input type="radio" name="sex"  value="0" <s:if test="#request.teacher.sex==0">checked</s:if>>女</label>
					</td>
				</tr>
				<tr>
					<td>出生年月</td><td><input name="birthday" type="date" value="${birthday}"></td>
					<td>政治面貌</td><td><input name="status" type="text" value="${status }"></td>
					<td>学历</td><td><input name="education" type="text" value="${education }"></td>
				</tr>
				<tr>
					<td>部门</td><td>${depart}</td><td>职称</td><td>${profession}</td>
					<td>职务</td><td>${job }</td>
				</tr>
				<tr>
					<td>电话</td><td><input name="phone" type="text" value="${phone }"></td>
					<td>邮箱</td><td><input name="email" type="text" value="${email }"></td>
					<td>地址</td><td><input name="address" type="text" value="${address }"></td>
				</tr>
				<tr><td colspan="3"><input class="btn btn-info" onclick= "return confirm('确定修改?');" type="submit" value="确定修改"></td>
				<td colspan="3"><input class="btn btn-success" id="cancelBasic" type="button" value="取消修改"></td></tr>
				</tbody>
				</s:iterator>
				</table>
				
				</s:form>
				
			  </div>
		</div>
			
		<div class="collapse" id="education">
		<div class="well" >
		<s:form action="change_education">
		<table style="width:700px;" class="table table-bordered table-hover table-striped table-condensed" >
			
			<thead>
			<tr><td colspan="6">教育经历</td></tr>
			<tr  style="width:750px;">
				<td>开始时间</td><td>结束时间</td><td>学历</td><td colspan="2">学校</td><td>操作</td>
			</tr>
			</thead>
			<tbody id="edu">
			
			<s:iterator value="#request.myeducation">
			<tr>
				<td><input name="begin" type="date" value="${begin }" /></td>
				<td><input name="end" type="date" value="${end }"/></td>
				<td><input name="statuss" type="text" value="${status }" /></td>
				<td colspan="2"><input name="school" type="text" value="${school}" />
				</td><td onClick="getDel(this)"><button class="btn btn-danger" >删除</button></td>
			</tr>
			</s:iterator>
			</tbody>
		</table>
		<table  class="table table-bordered table-hover table-striped table-condensed">
		<tr><td colspan="6" class="addaedu"><a class="btn btn-default">添加一条记录</a></td></tr>
		<tr><td colspan="3"><input onclick= "return confirm('确定修改?');" class="btn btn-info" type="submit" value="确定修改"></td>
		<td colspan="3"><input class="btn btn-success" id="cancelEdu" type="button" value="取消修改"></td></tr>
		</table>
		</s:form>
		</div>
		</div>
		
	<div class="collapse" id="family">
		<div class="well">
		<s:form action="change_family">
		<table class="table table-bordered table-hover table-striped table-condensed">
			<thead>
			<tr><td colspan="6">家庭关系</td></tr>
			<tr>
				<td colspan="3">姓名</td><td colspan="2">关系</td><td>操作</td>
			</tr>
			</thead>
			<tbody  id="fam">
			
			<s:iterator value="#request.myfamily">
			<tr>
				<td  colspan="3"><input type="text" name="names" value="${name}" /></td>
				<td colspan="2"><input type="text" name="relation" value="${relation }"/></td>
				<td onClick='getDel(this)'><button class="btn btn-danger" >删除</button></td>
			</tr>
			</s:iterator>
			</tbody>
		</table>
		<table  class="table table-bordered table-hover table-striped table-condensed">
		<tr><td colspan="6" class="addfam"><a class="btn btn-default">添加一条记录</a></td></tr>
		<tr><td colspan="3"><input class="btn btn-info" onclick= "return confirm('确定修改?');" type="submit" value="确定修改"></td>
		<td colspan="3"><input class="btn btn-success" id="cancelFam" type="button" value="取消修改"></td></tr>
		</table>
		</s:form>
		</div>
	</div>
		
	</div>

	</div>
</body>
</html>