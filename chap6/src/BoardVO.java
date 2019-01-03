import java.util.Date;

public class BoardVO {
	
	//완벽한 정보은닉을 보장 & 메소드 활용 수정 가능
	private int seq;
	private String title;
	private String contents;
	private String writer;
	private Date time ;
	private int password;
	private int viewcount;
	
	//getters & setters
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public int getSeq() {
		return seq;
	}
	
	
}
