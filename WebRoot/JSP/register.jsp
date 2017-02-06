<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="bootstrap/style/css/bootstrap.min.css"/>
	<style type="text/css">
		#container1{
			float:left;
			height:500px;
			width:500px;
			
			padding-left:50px;
			padding-right:50px;
		}
	
		.box1
		{
			margin:50px auto;
			/*padding: 0px 300px 200px 200px;*/
			height: 60%;
			width: 500px;
			border: solid 1px #B1CEBC;
		}
	
		.innerbox1
		{
			height: 70px;
			width: 200px;
			/*border: solid 2px red;*/
			position:relative;
			
		}
		
		h1{
			text-align:center;
		}
	</style>
	
	<script type="text/javascript">
		function reg()
		{
			var request = new XMLHttpRequest();//创建XHR对象
			request.open("POST", "servlet/RegServlet");//post方式发送，默认异步
			var data = "username=" + document.getElementById("username").value 
		                  + "&password=" + document.getElementById("password").value
		                  + "&confirmp=" + document.getElementById("confirmp").value;//获取数据
			request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			request.send(data);
			request.onreadystatechange = function()
			{
				if(request.readyState===4)//表示请求已经完成
				{
					if(request.status===200)//用户请求被正确接收
					{ 
						document.getElementById("createResult").innerHTML = request.responseText;
						//获取响应的报文，使用innerHTML向searchResult中插入,通过上边判断请求成功之后，在html中显示提示
						/*alert("注册成功！！");
						setTimeout(location.href = "login_success.jsp",5000);//跳转页面*/
					} 
					else
				 	{
						alert("发生错误：" + request.status);
					}
				} 
			};
			
		}
	</script>
  </head>
 
  
  <body>
    <div class="box1">
    	<a href="index.jsp">
	    	<button type="button" class="btn btn-default btn-lg">
	    		<span class="glyphicon glyphicon-arrow-left"></span>返回
			</button>
    	</a>
		<h1>学生注册</h1>
		<br>
		<div id="container1">
				<div class="input-group">
	  				<span class="input-group-addon">请输入您的用户名：</span>
	  				<input id="username" type="text" class="form-control" style="width:200px;" placeholder="Username">
				</div>
	    		<br>
	    		<div class="input-group">
	  				<span class="input-group-addon">请输入您的密码：</span>
	  				<input id="password" type="password" class="form-control" style="width:210px;" placeholder="Password">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon">请确认密码：</span>
					<input id="confirmp" type="password" class="form-control" style="width:230px;" name="checkcode">
				</div>
				<br>
				<input type="button" value="注册" id="register" class="btn btn-info" onclick="reg()"/>
				
				<div class="innerbox1">
					<p id="createResult"></p>
					<!-- <button id="save">注册</button> -->
				</div>
			</div>
	</div>
	
  </body>
</html>
