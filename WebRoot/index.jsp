<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to Silly boys’ Video</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
    <script>
        $(document).ready(function () {
            var aDivH = $(".divLogin").outerHeight();
            var aWinH = $(window).height();
            var aH = 0.55 * (aWinH - aDivH);
            $(".divLogin").css("margin-top", parseInt(aH) + "px");
        });
    </script>
    
  </head>
  
	
	<style type="text/css">
	
		body{ background-color:#f0f0f0; padding:0; margin:0; font-family:微软雅黑, Verdana; font-size:14px}
        .divInner{ width:600px; margin:0px auto;}
        
        .divLogin {}
        .divLogin .divHeader{ padding-bottom:20px}
        .divLogin .divMiddle{ padding:20px 0px; background-color:#fefefe}
        .divLogin .divMiddle .divForms{}
        .divLogin .divMiddle .divForms .divTitle{ color:Green; font-size:1.2em; padding:10px; border-bottom:1px solid green}
        .divLogin .divMiddle .divForms .divInput{  padding:10px 25px 10px 60px; position:relative}
        .divLogin .divMiddle .divForms .divInput .Lab{ position:absolute; left:5px ; top:14px}
        .divLogin .divMiddle .divForms .divInput .Icon{position:absolute; right:5px ; top:15px}
        .divLogin .divMiddle .divForms .divInput input{ width:100%; border:1px solid #ddd; padding-left :5px}
        .divLogin .divMiddle .divForms .divBtn{ padding:10px; border-top:1px solid green}
        .div1{color:Green;  text-align:right}
	</style>
	<link rel="stylesheet" href="bootstrap/style/css/bootstrap.min.css"/>
	
  <body>
    <div class="divLogin">
        <div class="divHeader">
            <div class="divInner">
                <img src="images/logo64g.png" />
				
				<div class="div1">
					<a href="JSP/teacherLogin.jsp">
						<button class="btn btn-success ">教师管理入口</button>
					</a>
				</div>
				
            </div>
        </div>
        <div class="divMiddle">
            <div class="divInner"> 
                <div class="row">
                    <div class="col-xs-7">
                        <img src="images/diannao.png" style="width:100%" />
                    </div>
                    <div class="col-xs-5">
                        <div class="divForms">
                            <div class="divTitle"> 
                                <i class="icon-sitemap"></i> 学生登录入口
                            </div>
                            <form action="servlet/LoginServlet" method="post">
	                            <div class="divInput">
	                                <div class="Lab" >用户名</div>
	                                <div class="Icon"><i class="icon-user"></i></div>
	                                <input type="text" name="username"/>
	                            </div>
	                            <div class="divInput">
	                                <div class="Lab">密码</div>
	                                <div class="Icon"><i class="icon-key"></i></div>
	                                <input type="password" name="password"/>
	                            </div>
	                            <div class="divBtn">
	                                <input type="submit" value="登录" class="btn btn-success btn-block" >
	                            </div>
                            </form>
                             <div class="divBtn">
                             	<a href="JSP/register.jsp">
                             		<button class="btn btn-primary btn-block">
                                    	<i class="icon-check"></i> 注册账号
                                	</button>
                             	</a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
        <p id="createResult"></p>
        <div class="divFooter">
            <div class="divInner" style="padding-top:30px; text-align:center">
                copy right @河海大学物联网工程学院 2017
            </div>
        </div>
    </div>
  </body>
</html>
