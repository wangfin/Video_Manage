<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <title>添加课程信息</title>
    
    <script>
        $(document).ready(function () {
            $("#back").click(function(){
                window.location.href="/Video_Manage/JSP/Teacher/adminLesson.jsp";
            });
            $("#reset").click(function(){
                $("input").val("");
                $("textarea").val("");
            });
            var tea_id=<%=request.getSession().getAttribute("userid") %>;
           $("#save").click(function(){
           var lesson_id=$("#lesson_id").val();
           var lesson_type=$("#lesson_type").val();
           var lesson_name = $("#lesson_name").val();
           var lesson_data = $("#lesson_data").val();
           var lesson_info = $("#lesson_info").val();
           		$.ajax({ 
           		 type: "post", //以post方式与后台沟通
            	 url : "/Video_Manage/servlet/LessonServlet", //与此servlet页面沟通
          		 dataType:'text',//从servlet返回的值以 text方式 解释
            	 data: 'tea_id='+tea_id+'&fun=1'+
            	 '&lesson_id='+lesson_id+
            	 '&lesson_type='+lesson_type+
            	 '&lesson_name='+lesson_name+
            	 '&lesson_data='+lesson_data+
            	 '&lesson_info='+lesson_info, //发给servlet的数据
            	 success: function(result){
            		 if(result.trim() == "成功"){
            		 	$("#myModal").modal();
            		 }else if(result.trim() == "错误"){
            		 	$("#myModal0").modal();
            		 }
            	 }
		  	});
           });
        });
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
  	if(request.getSession().getAttribute("userid") == null)//session中的用户如果不存在或者过期则需要重新登录
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
                            <a href="javascript:window.location.href="><i class="icon-key"></i> 修改密码</a>
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
                            <span>添加课程信息</span> 
                            <button type="button" class="btn btn-info" id="back">返回课程列表</button>
                        </div>
                        <div class="divContent">
                            <div class="row">
                                <div class="col-xs-2 Lab">课程编号</div>
                                <div class="col-xs-4 Editor"><input id="lesson_id" /></div>
                                <div class="col-xs-2 Lab">课程类别</div>
                                <div class="col-xs-4 Editor">
                                <select id="lesson_type">
                                	  <option value ="基础学科">基础学科</option>
									  <option value ="专业学科">专业学科</option>
									  <option value="选修学科">选修学科</option>
									  <option value="高级学科">高级学科</option>
                                </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2 Lab">课程名称</div>
                                <div class="col-xs-10 Editor"><input id="lesson_name"/></div>
                                <div class="col-xs-2 Lab">参考资料</div>
                                <div class="col-xs-10 Editor"> <input id="lesson_data"/></div>
                                <div class="col-xs-2 Lab">内容简介</div>
                                <div class="col-xs-10  Editor">
                                    <textarea rows="4" id="lesson_info"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="btnFootAction clearfix">
                            <button class="pull-right btn btn-success"  id="save"><i class="icon-save"></i> 保存</button>
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
                <button onclick="javascript:window.location.href='/Video_Manage/JSP/Teacher/adminLesson.jsp';" type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
              </div>
            </div>
          </div>
        </div>
	
	<!--弹出层-->
        <div class="modal fade" id="myModal0" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4>抱歉，好像您已经创建了这门课程</h4>
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
