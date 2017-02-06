package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import dao.DBDAO;

public class LessonServlet extends HttpServlet {
	public LessonServlet() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//防止输入中文乱码
		response.setCharacterEncoding("UTF-8");//防止输出中文乱码
		response.setContentType("text/html;charset=utf-8");//防止输出中文乱码
		PrintWriter out = response.getWriter();
		DBDAO db = new DBDAO();
		int tea_id = Integer.parseInt(request.getParameter("tea_id"));
		String fun = request.getParameter("fun");
		String lesson_id = request.getParameter("lesson_id");
		String lesson_name = request.getParameter("lesson_name");
		String lesson_type = request.getParameter("lesson_type");
		String lesson_data = request.getParameter("lesson_data");
		String lesson_info = request.getParameter("lesson_info");
		if(fun.equals("1")){
			int count = db.Check(tea_id,lesson_id);
			if(count == 0){
				db.AddLesson(tea_id,lesson_id,lesson_name,lesson_info,lesson_type,lesson_data);
				out.println("成功");
			}else if (count>=1){
				out.println("错误");
			}else{
				out.println("添加错误");
			}
		}else if(fun.equals("2")){
			db.ChangeLesson(tea_id,lesson_id,lesson_name,lesson_info,lesson_type,lesson_data);
		}else{
			db.DeleteLesson(tea_id, lesson_id);
		}
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
