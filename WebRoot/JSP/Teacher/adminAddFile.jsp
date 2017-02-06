<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% String lesson_id = request.getParameter("lesson_id");//获得课程id
 String lesson_name = request.getParameter("lesson_name");//获得课程id%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <title>添加附件</title>
    <script>
        $(document).ready(function () {
        	var lesson_id = "<%=lesson_id%>";
        	var lesson_name = "<%=lesson_name%>";
            $("#back").click(function(){
               window.location.href="/Video_Manage/JSP/Teacher/adminClass.jsp?lesson_id=" + lesson_id+ "&lesson_name=" + lesson_name;
            });
            $("#reset").click(function(){
                $("input").val("");
                $("textarea").val("");
            });
        });
    </script>
    
    <script>
    function upload()
		{
			var lesson_id = "<%=lesson_id%>";
        	var lesson_name = "<%=lesson_name%>";
			var myurl =  "/Video_Manage/JSP/Teacher/adminClass.jsp?lesson_id=" + lesson_id + "&lesson_name="+ lesson_name ;
			if(document.getElementById("file_id").value == null || document.getElementById("file_name").value == null ||
				document.getElementById("file_data").value == null || document.getElementById("file_info").value == null)
			{
				alert("请填写完整");
				}
			else
			{
				var request = new XMLHttpRequest();//创建XHR对象
			request.open("POST", "servlet/SaveServlet_file");//post方式发送，默认异步
			var data = "file_id=" + document.getElementById("file_id").value 
		                 + "&lesson_id=<%=lesson_id%>" 
		                 + "&lesson_name=<%=lesson_name%>"
		                  + "&file_name=" + document.getElementById("file_name").value
		                  + "&file_data=" + document.getElementById("file_data").value
		                  + "&file_info=" + document.getElementById("file_info").value;
		                  
		                  //获取数据 + "&lesson_id=" + document.getElementById("lesson_id").value
		                  
			request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			request.send(data);
			request.onreadystatechange = function()
			{
				if(request.readyState===4)//表示请求已经完成
				{
					if(request.status===200)//用户请求被正确接收
					{ 
						/*跳转*/
						location.href = myurl;
					} 
					else
				 	{
						alert("发生错误：" + request.status);
					}
				} 
			};
			
		}
		}
			
		</script>
    <style>
        body{ background-color:#f0f0f0; padding:0; margin:0; font-family:微软雅黑, Verdana; font-size:14px}
        .divHeader{ position:fixed; width:100%; z-index:999; background-color:#eee; padding:20px 0px ; border-bottom:1px solid #ddd}
        .divMiddle{ padding-top:120px; padding-bottom:20px}
        
        .divClassItem{ background-color:#fff; padding:5px; margin-bottom:30px}
        .divClassItem .divImg{}
        .divClassItem .divCaption{ font-size:1.2em; color:#222; padding:10px 10px}
        .divClassItem .divInfo{ padding:10px;  padding-top:0px}
        .divClassItem .divDesc{ color:#777; font-size:0.9em; padding:10px; padding-top:0px;overflow:hidden;text-overflow:ellipsis; -o-text-overflow:ellipsis;white-space:nowrap;width:100%; }
        
        
            .divMain{ padding-left:180px; }
            
            .divPage{}
            .divPage .divNav{ height:50px; line-height:50px ; background-color:#fff; padding:auto; }
            .divPage .divContent{ padding:15px}
            .divPage .divContent .Lab{ text-align:right}
            .divPage .divContent .Editor{ padding-bottom:10px}
            .divPage .divContent .Editor input,select,textarea{ width:100%}
            .divPage .btnFootAction{ padding:15px; border-top:1px solid green}
            .divPage .btnFootAction button{ margin-right: 20px}

        #back{float: right; margin: 9px;}
    </style>
  </head>
  
  <body>
   <%
  	if(request.getSession().getAttribute("userid") == null)//sesion中的用户如果不存在或者过期则需要重新登录
  	{
  		response.sendRedirect("../teacherLogin.jsp");//重定向
  		return;//直接返回不执行后面的代码
	}
  	%>
    <div class="divHeader">
        <div class="container clearfix">
            <div class="divLogo pull-left">
                <img src="images/logo64g.png" />
            </div>
            <div class="divUserPan pull-right">
                <div class="divUserInfo">
                    <i class="icon-user"></i><%=request.getSession().getAttribute("username") %>,欢迎您&nbsp;id<%=request.getSession().getAttribute("userid") %>
                </div>
                <div class="divActions" style="width:200px">
                    <div class="row">
                        <div class ="col-xs-6">
                            <a ><i class="icon-key"></i> 修改密码</a>
                        </div>
                        <div class ="col-xs-6">
                            <a href="javascript:window.location.href='/Video_Manage/servlet/LoginOutServlet_Tea';"><i class="icon-power-off"></i> 重新登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="divMiddle">
        <div class="container">
            <div class="divMain">
                <!--主页内容-->
                <div class="divPage">
                 <!-- 课程信息 -->
                    <div class="divSection">
                        <div class="divNav" style="padding-left:15px">
                            <span><a href="JSP/Teacher/adminLesson.jsp">我的课程</a></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span>数据库原理与应用</span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span>添加附件</span> 
                            <button type="button" class="btn btn-info" id="back">返回课程信息页面</button>
                        </div>
                        
                        <div class="divContent">
                            <div class="col-xs-2 Lab">选择上传附件<br><span style="color:green">
                            	(请传输<span style="color:red">zip</span>或
                            	<br><span style="color:red">rar</span>格式)
                            </span></div>
	                                <!-- <input type="file"> -->
	                                <!-- 二进制流传输 -->
	                                <form action="servlet/UploadServlet_file?lesson_id=<%=lesson_id%>&lesson_name=<%=lesson_name %>" method="post" enctype="multipart/form-data">
	                                	<input type="file" name="myvideo" class="btn">
	                                	<button type="submit"  class="btn btn-success" style="margin-left:200px;">上传</button>
	                                	<span style="color:red">反馈：${result}</span>
										<!--<input type="submit" value="上传" class="btn btn-success" style="margin-left:200px;">  -->
	                                </form>
	                               <hr>
                            
                            <div class="row">
                                <div class="col-xs-2 Lab">附件编号</div>
                                <div class="col-xs-4 Editor"><input type="text" id="file_id"/></div>
                             
                            </div>
                            <div class="row">
                                <div class="col-xs-2 Lab">附件名称</div>
                                <div class="col-xs-10 Editor"><input type="text" id="file_name"/></div>
                                <div class="col-xs-2 Lab">参考资料</div>
                                <div class="col-xs-10 Editor"> <input type="text" id="file_data"/></div>
                                <div class="col-xs-2 Lab">内容简介</div>
                                <div class="col-xs-10  Editor">
                                    <textarea rows="4" id="file_info"></textarea>
                                </div>
                                
                        </div>
                        <div class="btnFootAction clearfix">
                        
                            <button class="pull-right btn btn-success" data-toggle="modal" data-target="#myModal" onclick="upload()"><i class="icon-save"></i> 保存</button>
                            <button class="pull-right btn btn-warning" id="reset"><i class="icon-reply"></i> 取消</button>
                        
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
        <!--弹出层-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4>保存成功</h4>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
              </div>
            </div>
          </div>
        </div>
  </body>
</html>
