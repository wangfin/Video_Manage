package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

public class UploadServlet_video extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UploadServlet_video() {
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
				//设置上传文件保存路劲
				String filePath = getServletContext().getRealPath("/")+"videos";
				String url = null;
				String lesson_id = request.getParameter("lesson_id");//始终持有lesson_id
				String lesson_name = request.getParameter("lesson_name");
				System.out.println("servlet-----"+"lesson_name" + lesson_name);
				File file = new File(filePath);
				if(!file.exists())//如果不存在则创建
				{
					file.mkdir();
				}
				//System.out.println(filePath);
				SmartUpload su = new SmartUpload();
				//初始化对象
				su.initialize(getServletConfig(), request, response);
				//设置上传文件大小
				su.setMaxFileSize(1024*1024*1024);
				//设置所有文件的大小
				//su.setTotalMaxFileSize(1024*1024*100);
				//设置上传文件类型
				su.setAllowedFilesList("mp4");
				
				String result = "上传成功！请勿重复上传防止覆盖";
				try {
					//设置禁止上传文件类型
					su.setDeniedFilesList("rar,jsp,js");
					
					//上传文件
					su.upload();
					int count = su.save(filePath);
					System.out.println("上传成功"+ count + "个文件");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					result = "上传失败！";
					if(e.getMessage().indexOf("1015") != -1){
						result = "上传失败：上传视频类型不正确！请上传mp4!";
					}else if(e.getMessage().indexOf("1010") != -1){
						result = "上传失败：上传视频类型不正确！请上传mp4";
					}else if(e.getMessage().indexOf("1110") != -1){
						result = "上传失败：上传视频大小大于允许上传的最大值！";
					}else if(e.getMessage().indexOf("1105") != -1){
						result = "上传失败：上传视频的总大小大于允许上传总大小的最大值！";
					}
					
					e.printStackTrace();
				} 
				//获得上传文件信息
				
				for(int i = 0; i < su.getFiles().getCount(); i++)
				{
					com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
					System.out.println("------------------------");
					System.out.println("表单当中的name的值:" + tempFile.getFieldName());
					System.out.println("上传文件名:" + tempFile.getFileName());
					System.out.println("上传文件的大小:" + tempFile.getSize());
					System.out.println("上传文件的拓展名：" + tempFile.getFileExt());
					System.out.println("上传文件的全名：" + tempFile.getFilePathName());
					System.out.println("------------------------");
					url = tempFile.getFilePathName();
				}
				System.out.println(System.getProperty("file.encoding"));
				
				String myurl =  "/JSP/Teacher/adminAddVideo.jsp?lesson_id="+lesson_id+"&lesson_name"+lesson_name;
				//String myurl =  "/JSP/Teacher/adminAddVideo.jsp?lesson_name="+lesson_name;
				request.getSession().setAttribute("video_url", url.toString());//将用户名存储到会话中
				request.setAttribute("result", result + url);
				request.getRequestDispatcher(myurl).forward(request, response);
				//response.sendRedirect(request.getContextPath()+"/login_failure.jsp");
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
