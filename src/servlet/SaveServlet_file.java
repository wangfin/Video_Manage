package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBDAO;

public class SaveServlet_file extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SaveServlet_file() {
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

		request.setCharacterEncoding("UTF-8");//防止输入中文乱码
		response.setCharacterEncoding("UTF-8");//防止输出中文乱码
		response.setContentType("text/html;charset=utf-8");//防止输出中文乱码
		
		DBDAO dbdao = new DBDAO();//新建数据库逻辑类
		String file_id = request.getParameter("file_id");
		String file_name = request.getParameter("file_name");
		String file_data = request.getParameter("file_data");
		String file_info = request.getParameter("file_info");
		String lesson_id = request.getParameter("lesson_id");
		String file_url = (String) request.getSession().getAttribute("file_url");
		int teacher_id = (Integer) request.getSession().getAttribute("userid");
		//String teacher_name = (String) request.getSession().getAttribute("username");
		
		dbdao.addFileToDB(teacher_id, lesson_id, file_id, file_name, file_data, file_info, file_url);
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
