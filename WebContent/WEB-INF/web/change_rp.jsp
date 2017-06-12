<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台首页</title>
<link href="/teacher/static/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="/teacher/static/js/jquery-2.1.4.min.js"></script>
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
				<a href="/teacher/admin/pushNewsAction" class="list-group-item"
					id="pushnews"> 新闻发布<span class="glyphicon glyphicon-send"
					aria-hidden="true"></span>
				</a>
				<a href="/teacher/admin/changRPAction" class="list-group-item active"
					id="reward"> 修改奖惩信息<span class="glyphicon glyphicon-yen"
					aria-hidden="true"></span>
				</a>
			</ul>
		</div>

		<div class="rightbar">
			<ol class="breadcrumb">
				<li><a href="/teacher/web/indexAction">首页</a></li>
				<li class="active">奖惩修改</li>
			</ol>
			
			<form class="form-inline">
			  <div class="form-group" style="margin-left:20px;"><b>选择部门</b>
			  
			   <select class="form-control" id="depart" style="width:150px;"> 
			   <option  value="%">选择部门</option>
				<s:iterator  value="#request.dep">	
				<option value="${id}">${name }</option>
				</s:iterator>
				</select>
			  </div>
			    <div class="form-group" id="profession" style="margin-left:20px;"><b>选择职称</b>
			   <select class="form-control" style="width:150px;"> 
			   <option  value="%">选择职称</option>
				<s:iterator  value="#request.pro">	
				<option value="${id}">${name }</option>
				</s:iterator>
				</select>
			  </div>
			  
			  <div class="form-group" style="margin-left:20px;"><b>选择职务</b>
			   <select class="form-control"  id="job"  style="width:150px;"> 
			   <option  value="%">选择职务</option>
				<s:iterator value="#request.job">	
				<option value="${id}">${name }</option>
				</s:iterator>
				</select>
			  </div>
			  	<button id="search" type="button" style="margin-left:20px;" class="btn btn-success">查找</button>
			</form>
			<hr>
			<table class="table table-bordered table-hover table-striped table-condensed">
				<thead>
				<tr>
					<td>序号</td><td>姓名</td><td>单位</td><td>职称</td><td>职务</td><td>工资</td><td>操作</td>
				</tr>
				</thead>
				<tbody id="rebody">
					<s:iterator value="#request.tlist" status="index">
					<tr>
						<td><s:property value="#index.index+1"></s:property></td>
						<td>${name}</td>
						<td>${departname}</td>
						<td>${professionname}</td>
						<td>${jobname}</td>
						<td>${solary}</td>
						<td><form action="admin/ShowRPAction" method="POST">
						<input name="tid" type="hidden" value="${id}">
						<input  type="submit" class="btn btn-info" value="修改" />
						</form></td>
					</tr>
					</s:iterator>
				</tbody>
			</table>

		</div>

	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#search").click(function(){
			var departid = $('#depart option:selected').val();
			var jobid = $('#job option:selected').val();
			var professionid = $('#profession option:selected').val();
			//alert(departid);
			//alert(jobid);
			//alert(professionid);
			/*$.ajax({  
	            url:"/teacher/admin/ajaxSearch",  
	            type:'post',  
	            data:"departid="+departid+"&jobid=+"+jobid+"&professionid="+professionid,
	            dataType:'json',  
	            success:function (data) {  
	            	var json = $.parseJSON(data.result);
					//alert(json);
	            }  
	        });*/
			 $.getJSON("/teacher/admin/ajaxSearch","departid="+departid+"&jobid="+jobid+"&professionid="+professionid+"",function(data){
				$("#rebody").html('');
				var cha = $.parseJSON(data.result);
				$.each(cha, function (key, value) {
					$str="";
					$str +="<tr>";
					$str +="<td>"+(key+1)+"</td>";
					$str +="<td>"+value.name+"</td>";
					$str +="<td>"+value.departname+"</td>";
					$str +="<td>"+value.professionname+"</td>";
					$str +="<td>"+value.jobname+"</td>";
					$str +="<td>"+value.solary+"</td>";
					$str +="<td><form action='admin/ShowRPAction' method='POST'><input name='tid' type='hidden' value='"+value.id+"'><input  type='submit' class='btn btn-info' value='修改' /></form></td>";
					$("#rebody").append($str);
				});
				//alert(cha);
			}); 
		});
	});
	</script>
</body>
</html>