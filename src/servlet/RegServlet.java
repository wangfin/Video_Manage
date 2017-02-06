package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBDAO;

import entity.Student;


public class RegServlet extends HttpServlet {


	/**
	 * Constructor of the object.
	 */
	public RegServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");//防止输出中文乱码
		
		DBDAO dbdao = new DBDAO();//新建数据库逻辑类
		ArrayList<Student> list = dbdao.getAllStu();//获取User的ArrayList
		PrintWriter out = response.getWriter();
		
		String usernameser = request.getParameter("username");
		String passwordser = request.getParameter("password");
		String confirmpser = request.getParameter("confirmp");
		int count = 0;
		boolean flag = true;//标记用户名是否存在，防止遍历到最后一个时出现bug
		
		out.println("有response");
		out.println(list);
		if( list.size() >= 0)
		{
			
			for(int i = 0; i < list.size(); i++)//遍历整个List
			{
				count++;//统计遍历序号
				Student student = list.get(i);//获得list中的user类
				if(student.getStu_name().equals(usernameser))//进行信息校验
				{
					out.println("用户名已存在！！");
					flag = false;
					break;
				}
			}
			if(count >= list.size() && flag)
			{
				if(!passwordser.matches(".{6,}"))//密码的正则表达式
				{
					out.println("密码至少六位");
				}
				else
				{
					if(!passwordser.equals(confirmpser)) //验证密码是否相同
					{
						out.println("请保证两次输入的密码相同！！");
					}
					else
					{
						dbdao.addStuToDB(usernameser, passwordser);//将用户加入数据库
						out.println("注册成功<br>");
						out.println(usernameser+"\\"+passwordser);
						out.println("<a href = '#'>返回登录页面</a>");
						
					}
				}
				
			}
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
