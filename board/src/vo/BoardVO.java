package vo;
// vo : value object - 객체 정보 저장/추출


public class BoardVO {
	int seq;         //게시물번호
	String title;    //게시물제목
	String contents; //내용
	int viewcount;   //조회수
	
	
	public BoardVO(int seq, String c, String d, int viewcount) {
		this.seq = seq;
		this.title = c;
		this.contents = d;
		this.viewcount = viewcount;
	}

	@Override
	public String toString() {
		return seq+"="+title+"="+contents+"="+viewcount ;
	}
	
	//타 패키지에서 사용하기 위해 getter/setter 메소드 필요

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

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

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	
	
	
	
	
}
