<%@page import="entity.File_list"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="dao.DBDAO" %>
<%@ page import="entity.Video" %>
<%@ page import="entity.File_list" %>
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<!--CDN-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<title>Video</title>
	<link rel="stylesheet" href="bootstrap/style/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<style type="text/css">
		.video_name{
			font-size: 30px;
		}

		.myvideo{
			
			padding-left: 10%;
			padding-right: 18.8%;

		}

		.navigation{
			
			margin-top: 60px;
			right: 15%;
			position: fixed;
		}

		.navigation div{
			border: red solid 1px;
			height: 30px;
			width: 100%;

		}

		.writecom
		{
			margin-left: 10%;
			margin-right: 18.8%;
			margin-top: 1%;
			/*border: solid 2px yellow;*/
		}

		.inner_left
		{
			margin-left: 5%;
		}

		.inner_right
		{
			text-align:right;
			margin-right: 5%;
		}

		.return{
			margin-top: 105px;
			position: fixed;
			width: 8%;
			z-index:999;
		}

		.comment
		{
			margin-left: 10%;
			margin-right: 18.8%;
			/*border: solid 2px blue;*/
			margin-top: 1%;
		}

		.comdate
		{
			text-align:right;
		}
		.delete
		{
			/*当符合条件时才能显示*/
			text-align:right;
		}

		hr{
			border: 1px solid #443B3B;
		}
		/*Header样式*/
        body{ background-color:#f0f0f0; padding:0; margin:0; font-family:微软雅黑, Verdana; font-size:14px}
        .divHeader{ position:fixed; width:100%; z-index:999; background-color:#eee; padding:20px 0px ; border-bottom:1px solid #ddd}
        .divMiddle{ padding-top:120px}
        
        .divClassItem{ background-color:#fff; padding:5px; margin-bottom:30px}
        .divClassItem .divImg{}
        .divClassItem .divCaption{ font-size:1.2em; color:#222; padding:10px 10px}
        .divClassItem .divInfo{ padding:10px;  padding-top:0px}
        .divClassItem .divDesc{ color:#777; font-size:0.9em; padding:10px; padding-top:0px;overflow:hidden;text-overflow:ellipsis; -o-text-overflow:ellipsis;white-space:nowrap;width:100%; }
         .divContent{ padding:10px;margin-left: auto;margin-right: auto;}
         .tabContent{ width:60% }
            .tabContent tr th{ background-color:#fafafa; border:1px solid #ddd; padding:8px 0px ; text-align:center}
            .tabContent tr td{ background-color:#fff; border:1px solid #ddd; padding:5px 5px ; }
            .tabContent tr td ul.btnsInTd{ list-style:none ; padding:0; margin:0}
            .tabContent tr td ul.btnsInTd li{ float:left; padding:0px 5px; margin:0px 5px;border-right:1px solid #ddd} 
            .tabContent tr td ul.btnsInTd li:last-child{ border:0px}
            .tabContent tr td ul.btnsInTd li:hover{  color:Green; cursor:pointer}
            
         .panel{width:60%;margin-left: auto;margin-right: auto;margin-top:10px;}
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
                    <i class="icon-user"></i><%=request.getSession().getAttribute("username") %>,欢迎您&nbsp;id<%=request.getSession().getAttribute("userid") %>
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

	<div class="return">
		<a href="JSP/Video_Square.jsp">
			<button type="button" class="btn btn-default btn-lg" >
				<span class="glyphicon glyphicon-home"></span>返回广场
			</button>
		</a>
	</div>

	<div class="navigation">
			<ul class="ce">
	
			<% 
				String video_id = request.getParameter("video_id");
				String tea_id = request.getParameter("teacher_id");
				//int teacher_id = Integer.valueOf(tea_id).intValue();//将String转换为int
				//int teacher_id = Integer.parseInt(tea_id);
				String lesson_id = request.getParameter("lesson_id");
				Video nowvideo = new Video();
				
				DBDAO dbdao = new DBDAO();
				ArrayList<Video> list_video = dbdao.getAllVideo();//获取所有视频信息的列表
                if(list_video != null && list_video.size() > 0)
				{
					for(int i = 0; i < list_video.size(); i++)
					{
											
						Video video = list_video.get(i);//获取编号i的视频
						if(video_id.equals(video.getVideo_id()))
						{
							nowvideo = list_video.get(i);
						}
						
			%>
			  <li> <a href="/Video_Manage/JSP/Video_Show.jsp?tea_id=<%=video.getTeacher_id() %>&lesson_id=<%=video.getLesson_id() %>&video_id=<%=video.getVideo_id() %>"><%=video.getVideo_name() %></a> </li>
			 <%
						
					}
				}
			 %>
		</ul>
			
		
	</div>

	
<div class="myvideo" >
	<br><br>
	<br><br>
	<br><br>
	<div class="video_name">视频名称:<%=nowvideo.getVideo_name() %></div>

	<div class="embed-responsive embed-responsive-16by9" >
	
		<video class="embed-responsive-item" controls="controls" autostart=true >
			<source src="/Video_Manage/videos/<%=nowvideo.getVideo_url() %>" type="video/mp4"> 
			您的浏览器不支持此种视频格式。 	
		</video>
		<!-- <iframe  class="embed-responsive-item" name="fname" src="videos/4861173-1.mp4" ></iframe> -->
	</div>
</div>

	<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">视频描述</h3>
  </div>
  <div class="panel-body">
  	<%=nowvideo.getVideo_info() %>
  </div>
</div>
   
                        <div class="divContent" style=" padding:0px; padding-top:30px;padding-bottom:30px;" >
                            <table class="tabContent" style="margin-left: auto;margin-right: auto;">
                                <tr>
                                    <th style="width:120px">附件名称</th>
                                    <th style="width:220px">附件简介</th>
                                    <th style="width:50px">点击下载</th>
                                </tr>
                                
                                <%
                                	ArrayList<File_list> list_file = dbdao.getAllFile();//获取所有视频信息的列表
                                 	 if(list_file != null && list_file.size() > 0)
									{
										for(int i = 0; i < list_file.size(); i++)
										{
																
											File_list file = list_file.get(i);//获取编号i的附件
											if(file.getLesson_id().equals(lesson_id))
												{
                                 %>
                                <tbody>
                                    <tr>
                                        <td><%=file.getFile_name() %></td>
                                        <td><%=file.getFile_info() %></td>
                                        <td>
                                            <ul class="btnsInTd clearfix">
                                                <li><a href="/Video_Manage/servlet/DownloadServlet_file?filename=<%=file.getFile_url()%>"> <i class="icon-download"></i> 下载</a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                                <% 
                                			}
                                		}
                                	}
                                %>
                            </table>
                        </div> 
               <!--<div class="writecom">
	<hr>
	<div class="inner_left">
		提交评论<br>
		<form name="write" action="servlet/WriteComServlet?articleid" method="post">
			<textarea rows="4" cols="100" name="comment">不超过140个字</textarea>
			<br>
			<input type="submit" class="btn btn-success" value="提交" onclick="show_confirm()"/>
		</form>
	</div>
	<hr>
</div>


<div class="comment">
	<div class="inner_left">
		<div class="comcontent">
			dhasdaskldh
		</div>
		
		<div class="inner_right">
			用户:&nbsp;
		</div>

		<div class="inner_right">
			时间:&nbsp;
		</div>
			
		<div class="delete">
			<a href="" >删除</a>
		</div>
	</div>
	<hr>
</div>  -->



<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';"></div>
  </body>
</html>
