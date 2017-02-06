package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBDAO;

public class DeleteServlet_file extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteServlet_file() {
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
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String lesson_id = request.getParameter("lesson_id");
		String lesson_name1 = request.getParameter("lesson_name");
		String file_id = request.getParameter("file_id");//获取文章id
		//System.out.println("lesson_name=" + lesson_name1);
		
		DBDAO dbdao = new DBDAO();//新建逻辑类
		dbdao.deleteFile(file_id);//删除
		
		String myurl = null;
		System.out.println("lesson_name=" + lesson_name1);
	
		//request.setAttribute("url", myurl);
       // String url = java.net.URLEncoder.encode(lesson_name1,"utf-8"); 
    	myurl = "/JSP/Teacher/adminClass.jsp?lesson_name=" + lesson_name1 + "&lesson_id="+lesson_id;
		
		request.getRequestDispatcher(myurl).forward(request, response);
		
		
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
