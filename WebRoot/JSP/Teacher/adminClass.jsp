<%@page import="com.sun.java_cup.internal.runtime.virtual_parse_stack"%>
<%@page import="entity.Lesson_list"%>
<%@page import="entity.File_list"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Video" %>
<%@ page import="dao.DBDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminClass.jsp' starting page</title>
    
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

    <title>课程页面</title>
    <script>
        $(document).ready(function () {
            $("#sure1").click(function(){
                $('#myModal2').modal('show');
                $('#myModal').modal('toggle');
            });
            $("#sure2").click(function(){
                $('#myModal2').modal('show');
                $('#myModal1').modal('toggle');
            });
            $("#addVideo").click(function(){
                window.location.href="JSP/Teacher/adminAddVideo.jsp";
            });
            $("#addFile").click(function(){
                window.location.href="JSP/Teacher/adminAddFile.jsp";
            });
            $("#tb1 ul li:first-child").click(function(){
                window.location.href="JSP/Teacher/adminChangeFile.jsp";
            });
            $("#tb2 ul li:first-child").click(function(){
                window.location.href="JSP/Teacher/adminChangeVideo.jsp";
            });
            $("#Les").click(function(){
                scrollOffset($("#MyLes").offset());
                $("#Les").attr("class", "active"); //设置Les元素的class为 "active" 
                $("#File").removeClass();
                $("#Video").removeClass();
            });
            $("#File").click(function(){
                scrollOffset($("#MyFile").offset());
                $("#File").attr("class", "active"); //设置Les元素的class为 "active" 
                $("#Les").removeClass();
                $("#Video").removeClass();
            });
            $("#Video").click(function(){
                scrollOffset($("#MyVideo").offset());
                $("#Video").attr("class", "active"); //设置Les元素的class为 "active" 
                $("#File").removeClass();
                $("#Les").removeClass();
            });
            // jQuery 定位让body的scrollTop等于pos的top，就实现了滚动 
            function scrollOffset(scroll_offset) { 
            $("body,html").animate({ 
                scrollTop: scroll_offset.top -110 
                }, 0); 
            } 
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
            .divMain .divLeftMenuPan{ position:fixed; width:160px; background-color:#fff ; margin-left:-180px}
            .divMain .divPage{} 
            
            .divLeftMenuPan{}
            .divLeftMenuPan .divMenuHeader{ background-color:Green; color:#fff; font-size:1.1em ; font-weight:bold; padding:15px}
            .divLeftMenuPan .divMenuBody{}
            .divLeftMenuPan .divMenuBody ul{ list-style:none; padding:0; margin:0}
            .divLeftMenuPan .divMenuBody ul li{ padding:15px; border-top:1px solid #ddd;}
            .divLeftMenuPan .divMenuBody ul li.active{ color:green; font-weight:bold; border-left:2px solid green} 
            
            .divPage{}
            .divPage .divNav{ height:50px; line-height:50px ; background-color:#fff; padding:auto; }
            .divPage .divContent{ padding:15px}
            .divPage .divContent .Lab{ text-align:right}
            .divPage .divContent .Editor{ padding-bottom:10px}
            .divPage .divContent .Editor input,select,textarea{ width:100%;border-width:0;background-color:#f0f0f0;}
            .divPage .btnFootAction{ padding:15px; border-top:1px solid green}
            .divPage .btnFootAction button{ margin-right: 20px}
            
            .tabContent{ width:100% }
            .tabContent tr th{ background-color:#fafafa; border:1px solid #ddd; padding:8px 0px ; text-align:center}
            .tabContent tr td{ background-color:#fff; border:1px solid #ddd; padding:5px 5px ; }
            .tabContent tr td ul.btnsInTd{ list-style:none ; padding:0; margin:0}
            .tabContent tr td ul.btnsInTd li{ float:left; padding:0px 5px; border-right:1px solid #ddd} 
            .tabContent tr td ul.btnsInTd li:last-child{ border:0px}
            .tabContent tr td ul.btnsInTd li:hover{  color:Green; cursor:pointer}

            .divSection{padding-bottom: 10px;}
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
                            <a href="javascript:"><i class="icon-key"></i> 修改密码</a>
                        </div>
                        <div class ="col-xs-6">
                            <a href="servlet/LoginOutServlet_Tea"><i class="icon-power-off"></i> 重新登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 		<% String lesson_id = request.getParameter("lesson_id");//获得课程id
           String lesson_name = request.getParameter("lesson_name");//获得课程id
           DBDAO dbdao = new DBDAO();//创建逻辑类
                    %>
    <div class="divMiddle">
        <div class="container">
            <div class="divMain">
                <div class="divLeftMenuPan">
                    <div class="divMenuHeader">
                        <i class="icon-list"></i> 系统功能
                    </div>
                    <div class="divMenuBody">
                        <ul>
                            <li class="active" id="Les" style="cursor:pointer;">
                                <i class="icon-edit"></i>课程信息
                            </li>
                            <li id="File" style="cursor:pointer;">
                                <i class="icon-paste"></i>附件列表
                            </li>
                            <li id="Video" style="cursor:pointer;">
                                <i class="icon-film"></i>课程视频
                            </li>
                        </ul>
                    </div>
                </div>
                <!--主页内容-->
                <div class="divPage">
                 <!-- 课程信息 -->
                    <div class="divSection" id="MyLes">
                        <div class="divNav" style="padding-left:15px">
                            <span><a href="JSP/Teacher/adminLesson.jsp">我的课程</a></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span><%=lesson_name %></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span>课程信息</span><a name="Les"></a> 
                        </div>
                        <%
								DBDAO getDao = new DBDAO();//新建逻辑类
								int id = ((Integer)request.getSession().getAttribute("userid")).intValue();
								//String  lesson_id = request.getParameter("lesson_id");
								ArrayList<Lesson_list> list = getDao.SearchClass(id,lesson_id);//获取所有文章信息的列表
								Lesson_list less = list.get(0);
							 %>
							 <script>$(document).ready(function () {
							 			$("#select1").val("<%=less.getLesson_type() %>");
							 		});
							 	</script>
							 
                        <div class="divContent">
                            <div class="row">
                                <div class="col-xs-2 Lab">课程编号</div>
                                <div class="col-xs-4 Editor"><input value=<%=less.getLesson_id() %>></div>
                                <div class="col-xs-2 Lab">课程类别</div>
                                <div class="col-xs-4 Editor"><select id="select1">
	                                  <option value ="基础学科">基础学科</option>
									  <option value ="专业学科">专业学科</option>
									  <option value="选修学科">选修学科</option>
									  <option value="高级学科">高级学科</option>
                                </select></div>
                            </div>
                            <div class="row">
                                <div class="col-xs-2 Lab">课程名称</div>
                                <div class="col-xs-10 Editor"><input value=<%=less.getLesson_name() %>></div>
                                <div class="col-xs-2 Lab">参考资料</div>
                                <div class="col-xs-10 Editor"> <input value=<%=less.getLesson_data() %>></div>
                                <div class="col-xs-2 Lab">内容简介</div>
                                <div class="col-xs-10  Editor">
                                    <textarea rows="4"  id="text1"><%=less.getLesson_info() %></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- <div class="btnFootAction clearfix">
                            <button class="pull-right btn btn-success"><i class="icon-save"></i> 保存</button>
                            <button class="pull-right btn btn-warning"><i class="icon-reply"></i> 取消</button>
                        </div> -->
                    </div>
                    <!-- 附件列表 -->
                   
                    <div class="divSection" id="MyFile">
                        <div class="divNav" style="padding-left:15px">
                            <span><a href="JSP/Teacher/adminLesson.jsp">我的课程</a></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span><%=lesson_name %></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span>附件列表</span><a name="Fil"></a> 
                        </div>
                        <div class="divContent" style=" padding:0px; padding-top:10px;" >
                            <table class="tabContent">
                                <tr>
                                    <th style="width:120px">附件编码</th>
                                    <th style="width:220px">附件名称</th>
                                    <th>备注</th>
                                    <th style="width:180px">操作</th>
                                </tr>
                                <tbody id="tb1">
                                <% 
                                	
                                	ArrayList<File_list> list_file = dbdao.getAllFile();//获取所有视频信息的列表
                                	if(list_file != null && list_file.size() > 0)
									{
										for(int i = 0; i < list_file.size(); i++)
										{
											
											File_list file = list_file.get(i);//获取编号i的附件
											if(file.getTeacher_id() == (Integer)request.getSession().getAttribute("userid"))
											{
                                %>
                                
                                    <tr>
                                        <td><%=file.getFile_id() %></td>
                                        <td><%=file.getFile_name() %></td>
                                        <td><%=file.getFile_info() %> </td>
                                        <td>
                                            <ul class="btnsInTd clearfix">
                                                
                                                <li>
	                                                <a href="servlet/DeleteServlet_file?file_id=<%=file.getFile_id() %>&lesson_id=<%=lesson_id %>&lesson_name=<%=lesson_name %>">
	                                                	<i class="icon-remove"></i> 删除
	                                                </a>
                                                </li>
                                                 <li>
	                                                <a href="servlet/DownloadServlet_file?filename=<%=file.getFile_url() %>">
	                                               		 <i class="icon-download"></i> 下载 	
	                                                </a>
                                               </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <%
                                    	}
                                    	}
                                    }
                                     %>
                                
                                </tbody>
                            </table>
                            <div class="btnFootAction clearfix">
                            <a href="JSP/Teacher/adminAddFile.jsp?lesson_id=<%=lesson_id %>&lesson_name=<%=lesson_name %>">
                            	<button class="pull-right btn btn-primary" id="addFile"><i class="icon-edit"></i> 添加</button>
                            </a>
                            </div>
                        </div> 
                    </div>
                    
                    
                    <!--  课程视频 -->
                     <div class="divSection" id="MyVideo">
                        <div class="divNav" style="padding-left:15px">
                            <span><a href="JSP/Teacher/adminLesson.jsp">我的课程</a></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span><%=lesson_name %></span> 
                            <span><i class="icon-chevron-right"></i></span>
                            <span>课程视频</span> <a name="Vid"></a>
                        </div>
                        <div class="divContent" style=" padding:0px; padding-top:10px" >
                            <table class="tabContent">
                                <tr>
                                    <th style="width:120px">视频编码</th>
                                    <th style="width:220px">视频名称</th>
                                    <th>备注</th>
                                    <th style="width:180px">操作</th>
                                </tr>
                                <tbody id="tb2">
                                <% 
                                	
                                	ArrayList<Video> list_video = dbdao.getAllVideo();//获取所有视频信息的列表
                                	if(list_video != null && list_video.size() > 0)
									{
										for(int i = 0; i < list_video.size(); i++)
										{
											Video video = list_video.get(i);//获取编号i的视频
											if(video.getTeacher_id() == (Integer)request.getSession().getAttribute("userid"))
											{
											
                                %>
                                    <tr>
                                        <td><%=video.getVideo_id() %></td>
                                        <td><%=video.getVideo_name()%></td>
                                        <td><%=video.getVideo_info()%> </td>
                                        <td>
                                            <ul class="btnsInTd clearfix">
                                                <li data-toggle="modal" data-target="#myModal1">
	                                                <a href="servlet/DeleteServlet_video?video_id=<%=video.getVideo_id() %>&lesson_id=<%=lesson_id %>&lesson_name=<%=lesson_name %>">
	                                                	<i class="icon-remove"></i> 删除
	                                                </a>
                                                </li>
                                                
                                                <li>
	                                                <a href="servlet/DownloadServlet_video?filename=<%=video.getVideo_url() %>">
	                                               		 <i class="icon-download"></i> 下载 	
	                                                </a>
                                               </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    
                                   <%	
                                   			}
                                   		}
                                  	 }
                                    %>
                                    
                                  
                                </tbody>
                            </table>
                            
                            <div class="btnFootAction clearfix">
									<a href="JSP/Teacher/adminAddVideo.jsp?lesson_id=<%=lesson_id %>&lesson_name=<%=lesson_name %>">
                           			<button class="pull-right btn btn-primary" id="addVideo"><i class="icon-edit"></i> 添加</button>
                           		</a>
                            </div>
                            
                        </div> 
                    </div>
                </div>



            </div>
        </div>
    </div>
    <div class="divFooter">
        
    </div>
     <!--附件列表删除层-->
    <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4>是否删除</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="sure1">确认</button>
          </div>
        </div>
      </div>
    </div>
    <!--视频课程删除层-->
    <div class="modal" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4>是否删除</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            <button type="button" class="btn btn-primary" id="sure2">确认</button>
          </div>
        </div>
      </div>
    </div>
    <!--删除确认层-->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4>删除成功</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
