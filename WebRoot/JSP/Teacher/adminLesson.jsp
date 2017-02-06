<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="dao.DBDAO" %>
<%@ page import="entity.Lesson_list" %>
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

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/font-awesome/3.2.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script>
    <script src="http://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <title>教师课程查看</title>
    <script>
        $(document).ready(function () {
            var tea_id=<%=request.getSession().getAttribute("userid") %>;
            var lesson_id = "";
            $("ul li").click(function(){ 
            	lesson_id = $(this).attr("value"); 
            });     //通过被点击的li标签的value
            $("#sure").click(function(){
                $.ajax({ 
           		 type: "post", //以post方式与后台沟通
            	 url : "/Video_Manage/servlet/LessonServlet", //与此servlet页面沟通
          		 dataType:'text',//从servlet返回的值以 text方式 解释
            	 data: 'tea_id='+tea_id+'&lesson_id='+lesson_id+'&fun='+"3", //发给servlet的数据，老师的id
            	 success: function(result){
            	                 $('#myModa2').modal('show');
                				 $('#myModal').modal('toggle');
                				 window.location.reload();
            	 }
		  		});
            });
            $("#add").click(function(){
            	window.location.href="/Video_Manage/JSP/Teacher/adminAddLesson.jsp";
            });
        });
    </script>
    <style>
        body{ background-color:#f0f0f0; padding:0; margin:0; font-family:微软雅黑, Verdana; font-size:14px}
        .divHeader{ position:fixed; width:100%; z-index:999; background-color:#eee; padding:20px 0px ; border-bottom:1px solid #ddd}
        .divMiddle{ padding-top:120px; padding-bottom:20px}
        
            .divMain{ padding-left:180px; } 
            
            .divPage{}
            .divPage .divNav{ height:50px; line-height:50px ; background-color:#fff; padding:auto; }
            .divPage .divContent{ padding:15px}
            .divPage .divContent .Lab{ text-align:right}
            .divPage .divContent .Editor{ padding-bottom:10px}
            .divPage .divContent .Editor input,select,textarea{ width:100%}
            .divPage .btnFootAction{ padding:15px; border-top:1px solid green}
            .divPage .btnFootAction button{ margin-right: 20px}
            
            .tabContent{ width:100% }
            .tabContent tr th{ background-color:#fafafa; border:1px solid #ddd; padding:8px 0px ; text-align:center}
            .tabContent tr td{ background-color:#fff; border:1px solid #ddd; padding:5px 5px ; }
            .tabContent tr td ul.btnsInTd{ list-style:none ; padding:0; margin:0}
            .tabContent tr td ul.btnsInTd li{ float:left; padding:0px 5px; margin:0px 5px;border-right:1px solid #ddd} 
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
                <!-- 课程列表 -->
                <div class="divSection">
                    <div class="divNav" style="padding-left:15px">
                        <span><a href="JSP/Teacher/adminLesson.jsp">我的课程</a></span> 
                    </div>
                    <div class="divContent" style=" padding:0px; padding-top:10px;" >
                        <table class="tabContent">
                            <tr>
                                <th style="width:120px">课程编码</th>
                                <th style="width:220px">课程名称</th>
                                <th>备注</th>
                                <th style="width:180px">操作</th>
                            </tr>
                            
                            <tbody id="tb">
                            <%
								DBDAO getDao = new DBDAO();//新建逻辑类
								int id = ((Integer)request.getSession().getAttribute("userid")).intValue();
								ArrayList<Lesson_list> list = getDao.SearchLesson(id);//获取所有课程信息的列表
								if(list != null && list.size() > 0)
								{
									for(int i = 0; i < list.size(); i++)//遍历列表，展示所有的课程
									{
										Lesson_list less = list.get(i);//获取编号i的课程
							 %>
						<tr>
                                    <td><%=less.getLesson_id() %></td>
                                    <td><a href="JSP/Teacher/adminClass.jsp?lesson_id=<%=less.getLesson_id() %>&lesson_name=<%=less.getLesson_name() %>"><%=less.getLesson_name() %></a></td>
                                    <td><%=less.getLesson_info() %> </td>
                                    <td>
                                        <ul class="btnsInTd clearfix">
                                            <li onclick="javascript:window.location.href='/Video_Manage/JSP/Teacher/adminChangeLesson.jsp?lesson_id=<%=less.getLesson_id() %>&lesson_name=<%=less.getLesson_name() %>';"><i class="icon-edit"></i> 修改</li>
                                            <li  data-toggle="modal" data-target="#myModal" value="<%=less.getLesson_id() %>"  id="del<%=i%>"><i class="icon-remove"></i> 删除</li>
                                        </ul>
                                    </td>
                                </tr>
						<%
			//		}
			
				}
			}
		 %>
                            </tbody>
                        </table>
                        <!--添加-->
                        <div class="btnFootAction clearfix">
                        <button class="pull-right btn btn-primary" id="add"><i class="icon-edit"></i> 添加</button>
                        </div>
                        <!--弹出层-->
                        <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4>是否删除</h4>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" id="sure">确认</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <!--弹出层-->
                        <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    </div> 
                </div>
                </div>
        </div>
    </div>
</div>
  </body>
</html>
