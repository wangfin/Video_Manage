package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.*;

import util.DBHelper;

public class STUDAO {
	//视频列表显示
		public ArrayList<Video> Video_list(){
			Connection conn = null;
			PreparedStatement stmt = null;// 连接对象
			ResultSet rs = null;
			ArrayList<Video> list = new ArrayList<Video>();// 用户集合
			try {
				conn = DBHelper.getConnection();// 获得连接对象

				String sql = "select * from video_list ";// sql语句注册用户
				stmt = conn.prepareStatement(sql);// 创建连接对象,使用PreparedStatement方法增加可维护性
				rs = stmt.executeQuery();//返回结果集
				
				while (rs.next()) {
					// 初始化对象
					Video video = new Video();
					video.setTeacher_id(rs.getInt("teacher_id"));//获取老师id
					video.setLesson_id(rs.getString("lesson_id"));// 获取课程id
					video.setVideo_id(rs.getString("video_id"));// 获取视频id
					video.setVideo_name(rs.getString("video_name"));// 获取视频名称
					video.setVideo_data(rs.getString("video_data"));// 获取视频描述
					video.setVideo_info(rs.getString("video_info"));// 设置课程信息
					list.add(video);//把老师的课程加入集合
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
