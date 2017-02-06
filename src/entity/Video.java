package entity;

public class Video {

	private int id;
	private int teacher_id;
	private String lesson_id;
	private String video_id;
	private String video_name;
	private String video_data;
	private String video_info;
	private String video_url;
	
	public Video()
	{
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}

	public String getLesson_id() {
		return lesson_id;
	}

	public void setLesson_id(String lesson_id) {
		this.lesson_id = lesson_id;
	}

	public String getVideo_id() {
		return video_id;
	}

	public void setVideo_id(String video_id) {
		this.video_id = video_id;
	}

	public String getVideo_name() {
		return video_name;
	}

	public void setVideo_name(String video_name) {
		this.video_name = video_name;
	}

	public String getVideo_data() {
		return video_data;
	}

	public void setVideo_data(String video_data) {
		this.video_data = video_data;
	}

	public String getVideo_info() {
		return video_info;
	}

	public void setVideo_info(String video_info) {
		this.video_info = video_info;
	}

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	
	
}
