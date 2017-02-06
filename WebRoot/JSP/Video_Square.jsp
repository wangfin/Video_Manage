<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="dao.STUDAO" %>
<%@ page import="entity.Video" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Video_Square</title>
    
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
    
    <script>
        $(document).ready(function () {
        });
    </script>
    
    <style>
        body{ background-color:#f0f0f0; padding:0; margin:0; font-family:微软雅黑, Verdana; font-size:14px}
        .divHeader{ position:fixed; width:100%; z-index:999; background-color:#eee; padding:20px 0px ; border-bottom:1px solid #ddd}
        .divMiddle{ padding-top:120px}
        
        .divClassItem{ background-color:#fff; padding:5px; margin-bottom:30px}
        .divClassItem .divImg{}
        .divClassItem .divCaption{ font-size:1.2em; color:#222; padding:10px 10px}
        .divClassItem .divInfo{ padding:10px;  padding-top:0px}
        .divClassItem .divDesc{ color:#777; font-size:0.9em; padding:10px; padding-top:0px;overflow:hidden;text-overflow:ellipsis; -o-text-overflow:ellipsis;white-space:nowrap;width:100%; }
    </style>
    
  </head>
  
  <body>
  <%
  	if(request.getSession().getAttribute("userid") == null)//session中的用户如果不存在或者过期则需要重新登录
  	{
  		response.sendRedirect("../index.jsp");//重定向
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
                    <i class="icon-user"></i> <%=request.getSession().getAttribute("username") %>,欢迎您&nbsp;id<%=request.getSession().getAttribute("userid") %>
                </div>
                <div class="divActions" style="width:200px">
                    <div class="row">
                        <div class ="col-xs-6">
                            <a href="javascript:"><i class="icon-key"></i> 修改密码</a>
                        </div>
                        <div class ="col-xs-6">
                            <a href="servlet/LoginOutServlet"><i class="icon-power-off"></i> 重新登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="divMiddle">
        <div class="container">
            <div class="divClassList">
                <div class="row">
                
                 <%
								STUDAO getDao = new STUDAO();//新建逻辑类
								//int id = ((Integer)request.getSession().getAttribute("userid")).intValue();
								ArrayList<Video> list = getDao.Video_list();//获取所有视频信息的列表
								if(list != null && list.size() > 0)
								{
									for(int i = 0; i < list.size(); i++)//遍历列表，展示所有的视频
									{
										Video video = list.get(i);//获取编号i的视频
							 %>
                    <div class="col-lg-4" >
                        <div class="divClassItem">
                            <div class="divImg">
                                <a href="JSP/Video_Show.jsp?tea_id=<%=video.getTeacher_id() %>&lesson_id=<%=video.getLesson_id() %>&video_id=<%=video.getVideo_id() %>"><img src="images/default.jpg" style="width:100%" /></a>
                            </div>
                            <div class="divCaption">
                                <%=video.getVideo_name() %>
                            </div>
                            <div class="divInfo  clearfix">
                                <div class="pull-left" >
                                    <i class="icon-sitemap"></i> 参考资料 <b><%=video.getVideo_data() %></b>
                                </div>
                                <!-- <div class="pull-right">
                                    <i class="icon-video-camera"></i> 数量 <b>20</b>
                                </div> -->
                            </div>
                            <div class="divDesc">
                               <%=video.getVideo_info() %>
                            </div>
                        </div>
                    </div>
                    
                    				<%
									}
								}
							 %>
                  </div>
               </div>
             </div>
          </div>
  </body>
</html>
