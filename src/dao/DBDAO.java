package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.File_list;
import entity.Lesson_list;
import entity.Student;
import entity.Teacher;
import entity.Video;

import util.DBHelper;

public class DBDAO {
	public ArrayList<Student> getAllStu() {
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ResultSet rs = null;// 数据集
		ArrayList<Student> list = new ArrayList<Student>();// 用户集合
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "select * from student";// sql语句获得所有用户
			stmt = conn.prepareStatement(sql);// 创建连接对象
			rs = stmt.executeQuery();// 获得一个数据集
			
			while (rs.next()) {
				// 初始化对象
				Student student = new Student();
				student.setId(rs.getInt("id"));// 设置用户id
				student.setStu_name(rs.getString("stu_name"));// 设置用户名称
				student.setStu_password(rs.getString("stu_password"));// 设置用户密码
				list.add(student);// 把一个商品加入集合
			}
			return list;// 返回集合

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	
	public void addStuToDB(String username, String password)// 增加用户数据到数据库
	{
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象

			String sql = "INSERT INTO student VALUES(NULL, ?, ?)";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, username);
			stmt.setString(2, password);
			int i = stmt.executeUpdate();
			System.out.println("成功添加了" + i + "行");

		} catch (Exception ex) {
			ex.printStackTrace();
			return;
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public ArrayList<Teacher> getAllTea() {
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ResultSet rs = null;// 数据集
		ArrayList<Teacher> list = new ArrayList<Teacher>();// 用户集合
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "select * from teacher";// sql语句获得所有用户
			stmt = conn.prepareStatement(sql);// 创建连接对象
			rs = stmt.executeQuery();// 获得一个数据集
			
			while (rs.next()) {
				// 初始化对象
				Teacher teacher = new Teacher();
				teacher.setId(rs.getInt("id"));// 设置用户id
				teacher.setTea_name(rs.getString("tea_name"));// 设置用户名称
				teacher.setTea_password(rs.getString("tea_password"));// 设置用户密码
				list.add(teacher);//把一个商品加入集合
			}
			return list;// 返回集合

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public ArrayList<File_list> getAllFile() {
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ResultSet rs = null;// 数据集
		ArrayList<File_list> list = new ArrayList<File_list>();// 用户集合
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "select * from file_list";// sql语句获得所有文件
			stmt = conn.prepareStatement(sql);// 创建连接对象
			rs = stmt.executeQuery();// 获得一个数据集
			
			while (rs.next()) {
				// 初始化对象
				
				File_list file = new File_list();
				file.setId(rs.getInt("id"));// 设置文件id
				file.setTeacher_id(rs.getInt("teacher_id"));// 设置老师id
				file.setLesson_id(rs.getString("lesson_id"));// 设置课程名称
				file.setFile_data(rs.getString("file_data"));//设置文件参考资料
				file.setFile_name(rs.getString("file_name"));//设置文件名称
				file.setFile_id(rs.getString("file_id"));//设置文件id
				file.setFile_info(rs.getString("file_info"));//设置文件简介
				file.setFile_url(rs.getString("file_url"));//设置文件url
				
				
				list.add(file);// 把一个文件加入集合
			}
			return list;// 返回集合

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//老师课程列表显示
		public ArrayList<Lesson_list> SearchLesson(int teacher_id){
			Connection conn = null;
			PreparedStatement stmt = null;// 连接对象
			ResultSet rs = null;
			ArrayList<Lesson_list> list = new ArrayList<Lesson_list>();// 用户集合
			try {
				conn = DBHelper.getConnection();// 获得连接对象

				String sql = "select lesson_id,lesson_name,lesson_info from lesson_list where teacher_id=?";// sql语句注册用户
				stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
				stmt.setInt(1, teacher_id);
				rs = stmt.executeQuery();//返回结果集
				
				while (rs.next()) {
					// 初始化对象
					Lesson_list less = new Lesson_list();
					less.setLesson_id(rs.getString("lesson_id"));// 设置课程编码
					less.setLesson_name(rs.getString("lesson_name"));// 设置课程名称
					less.setLesson_info(rs.getString("lesson_info"));// 设置课程信息
					list.add(less);//把老师的课程加入集合
				}
				
				return list;
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null)// 释放内存
				{
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
		}
	
	public ArrayList<Video> getAllVideo() {
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ResultSet rs = null;// 数据集
		ArrayList<Video> list = new ArrayList<Video>();// 用户集合
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "select * from video_list";// sql语句获得所有视频
			stmt = conn.prepareStatement(sql);// 创建连接对象
			rs = stmt.executeQuery();// 获得一个数据集
			
			while (rs.next()) {
				// 初始化对象
				Video video = new Video();
				video.setId(rs.getInt("id"));// 设置视频id
				video.setTeacher_id(rs.getInt("teacher_id"));// 设置老师id
				video.setLesson_id(rs.getString("lesson_id"));// 设置课程名称
				video.setVideo_data(rs.getString("video_data"));//设置视频参考资料
				video.setVideo_name(rs.getString("video_name"));//设置视频名称
				video.setVideo_id(rs.getString("video_id"));//设置视频id
				video.setVideo_info(rs.getString("video_info"));//设置视频简介
				video.setVideo_url(rs.getString("video_url"));//设置视频url
				
				
				list.add(video);// 把一个视频加入集合
			}
			return list;// 返回集合

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public void deleteVideo(String video_id)
	{
		Connection conn = null;
		PreparedStatement stmt = null;//连接对象
		try
		{
			conn = DBHelper.getConnection();//获得连接对象
			String sql = "DELETE FROM video_list WHERE video_id = '" + video_id + "'";//sql语句获得所有用户,id为String格式，不能直接加入sql语句
			stmt = conn.prepareStatement(sql);//创建连接对象
			/*String sql2 = "DELETE FROM comment WHERE articleid = '" + id + "'";//删除文章的同时删除评论
			stmt = conn.prepareStatement(sql2);*/
			int i = stmt.executeUpdate(sql);
			//int j = stmt.executeUpdate(sql2);
			System.out.println(sql);
			//System.out.println(sql2);
			System.out.println("成功删除" + i + "个视频");
			//System.out.println("成功删除" + j + "篇评论");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			//释放数据集对象
			if(stmt  != null)
			{
				try
				{
					stmt.close();
					stmt = null;
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
			//释放语句对象
			if(stmt  != null)//释放内存
			{
				try
				{
					stmt.close();
					stmt = null;
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
	}
	
	public void deleteFile(String file_id)
	{
		Connection conn = null;
		PreparedStatement stmt = null;//连接对象
		try
		{
			conn = DBHelper.getConnection();//获得连接对象
			String sql = "DELETE FROM file_list WHERE file_id = '" + file_id + "'";//sql语句获得所有用户,id为String格式，不能直接加入sql语句
			stmt = conn.prepareStatement(sql);//创建连接对象
			/*String sql2 = "DELETE FROM comment WHERE articleid = '" + id + "'";//删除文章的同时删除评论
			stmt = conn.prepareStatement(sql2);*/
			int i = stmt.executeUpdate(sql);
			//int j = stmt.executeUpdate(sql2);
			System.out.println(sql);
			//System.out.println(sql2);
			System.out.println("成功删除" + i + "个文件");
			//System.out.println("成功删除" + j + "篇评论");
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		finally
		{
			//释放数据集对象
			if(stmt  != null)
			{
				try
				{
					stmt.close();
					stmt = null;
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
			//释放语句对象
			if(stmt  != null)//释放内存
			{
				try
				{
					stmt.close();
					stmt = null;
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}
			}
		}
	}
	
	public void addVideoToDB(int teacher_id, String lesson_id, String video_id, String video_name, String video_data, String video_info, String video_url)// 增加视频数据到数据库
	{
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象

			String sql = "INSERT INTO video_list VALUES(?, ?, NULL, ?, ?, ?, ?, ?)";// sql语句创建video
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setInt(1, teacher_id);
			stmt.setString(2, lesson_id);
			stmt.setString(3, video_id);
			stmt.setString(4, video_name);
			stmt.setString(5, video_data);
			stmt.setString(6, video_info);
			stmt.setString(7, video_url);
			int i = stmt.executeUpdate();
			System.out.println("video成功添加了" + i + "行");

		} catch (Exception ex) {
			ex.printStackTrace();
			return;
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	public void addFileToDB(int teacher_id, String lesson_id, String file_id, String file_name, String file_data, String file_info, String file_url)// 增加视频数据到数据库
	{
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象

			String sql = "INSERT INTO file_list VALUES(?, ?, NULL, ?, ?, ?, ?, ?)";// sql语句创建video
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setInt(1, teacher_id);
			stmt.setString(2, lesson_id);
			stmt.setString(3, file_id);
			stmt.setString(4, file_name);
			stmt.setString(5, file_data);
			stmt.setString(6, file_info);
			stmt.setString(7, file_url);
			int i = stmt.executeUpdate();
			System.out.println("file成功添加了" + i + "行");

		} catch (Exception ex) {
			ex.printStackTrace();
			return;
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//添加课程
	public String AddLesson(int teacher_id,String lesson_id,String lesson_name,String lesson_info,String lesson_type,String lesson_data){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "INSERT INTO lesson_list (teacher_id,lesson_id,lesson_name,lesson_info,lesson_type,lesson_data) VALUES( ?,?,?,?,?,?) ";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setInt(1, teacher_id);
			stmt.setString(2, lesson_id);
			stmt.setString(3, lesson_name);
			stmt.setString(4, lesson_info);
			stmt.setString(5, lesson_type);
			stmt.setString(6, lesson_data);
			stmt.executeUpdate();
			
			return "成功";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "失败";
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

//检测是否有课程重复
	//老师课程列表显示
	public int Check(int teacher_id,String lesson_id){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();// 获得连接对象

			String sql = "select * from lesson_list where teacher_id=? and lesson_id=?";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setInt(1, teacher_id);
			stmt.setString(2, lesson_id);
			rs = stmt.executeQuery();//返回结果集
			rs.last();
			int  rowcount = rs.getRow(); 
			return rowcount;
		} catch (Exception ex) {
			ex.printStackTrace();
			return -1;
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}	
	
	//修改课程
	public String ChangeLesson(int teacher_id,String lesson_id,String lesson_name,String lesson_info,String lesson_type,String lesson_data){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "update lesson_list set lesson_id=?,lesson_name=?,lesson_info=?,lesson_type=?,lesson_data=? where lesson_id=? and teacher_id=?";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setInt(7, teacher_id);
			stmt.setString(1, lesson_id);
			stmt.setString(2, lesson_name);
			stmt.setString(3, lesson_info);
			stmt.setString(4, lesson_type);
			stmt.setString(5, lesson_data);
			stmt.setString(6, lesson_id);
			stmt.executeUpdate();
			System.out.println("成功");
			return "成功";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "失败";
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	//删除课程
	public String DeleteLesson(int teacher_id,String lesson_id){
		Connection conn = null;
		PreparedStatement stmt = null;// 连接对象
		try {
			conn = DBHelper.getConnection();// 获得连接对象
			String sql = "delete from lesson_list where lesson_id=? and teacher_id=?";// sql语句注册用户
			stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
			stmt.setString(1, lesson_id);
			stmt.setInt(2, teacher_id);
			stmt.executeUpdate();
			System.out.println("成功");
			
			return "成功";
		} catch (Exception ex) {
			ex.printStackTrace();
			return "失败";
		} finally {
			// 释放数据集对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null)// 释放内存
			{
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	//课程主页查询课程信息 + 修改课程信息之前的显示，显示原课程信息
		public ArrayList<Lesson_list> SearchClass(int teacher_id,String lesson_id){
			Connection conn = null;
			PreparedStatement stmt = null;// 连接对象
			ResultSet rs = null;
			ArrayList<Lesson_list> list = new ArrayList<Lesson_list>();// 用户集合
			try {
				conn = DBHelper.getConnection();// 获得连接对象

				String sql = "select lesson_id,lesson_name,lesson_info,lesson_data,lesson_type from lesson_list where lesson_id=? and teacher_id=?";// sql语句注册用户
				stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
				stmt.setString(1, lesson_id);
				stmt.setInt(2, teacher_id);
				rs = stmt.executeQuery();//返回结果集
				
				while (rs.next()) {
					// 初始化对象
					Lesson_list less = new Lesson_list();
					less.setLesson_id(rs.getString("lesson_id"));// 设置课程编码
					less.setLesson_name(rs.getString("lesson_name"));// 设置课程名称
					less.setLesson_info(rs.getString("lesson_info"));// 设置课程信息
					less.setLesson_data(rs.getString("lesson_data"));// 设置课程简介
					less.setLesson_type(rs.getString("lesson_type"));// 设置课程类别
					list.add(less);//把老师的课程加入集合
				}
				
				return list;
			} catch (Exception ex) {
				ex.printStackTrace();
				return null;
			} finally {
				// 释放数据集对象
				if (stmt != null) {
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// 释放语句对象
				if (stmt != null)// 释放内存
				{
					try {
						stmt.close();
						stmt = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
			}
			
			
		}

		

}
