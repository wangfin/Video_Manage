<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>failure</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	登录失败，请检查用户名或密码
  	<br>
    <span id="sec"></span>秒后返回主页
	 <a onclick="ret()" href="index.jsp">返回</a>
	 
	  <script type="text/javascript">  
	   var t = 5;
	   function show()
	   {
	       document.getElementById("sec").innerHTML = t--;
	    
	    if(t < 0)
	    {
	      window.history.back(1); 
	    }
	    setTimeout("show()", 1000);//每秒调用一次
	   }
	   //获取显示秒数的元素，通过定时器来更改秒数。
	   
	   //通过window的location和history对象来控制网页的跳转。
	   setTimeout("show()", 0);//自动触发计时器
	 </script> 
  </body>
</html>
