package vo;

public class BoardVO {
	//board테이블 컬럼 = 변수 
	int boardseq;
	String boardtitle;
	String boardcontents;
	String boardwriter;
	String boardtime;
	String boardviewcount;
	
	
	
	public BoardVO() {

	}

	public BoardVO(int boardseq, String boardtitle, String boardcontents, String boardwriter, String boardtime,
			String boardviewcount) {
		this.boardseq = boardseq;
		this.boardtitle = boardtitle;
		this.boardcontents = boardcontents;
		this.boardwriter = boardwriter;
		this.boardtime = boardtime;
		this.boardviewcount = boardviewcount;
	}

	public int getBoardseq() {
		return boardseq;
	}

	public void setBoardseq(int boardseq) {
		this.boardseq = boardseq;
	}

	public String getBoardtitle() {
		return boardtitle;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardcontents() {
		return boardcontents;
	}

	public void setBoardcontents(String boardcontents) {
		this.boardcontents = boardcontents;
	}

	public String getBoardwriter() {
		return boardwriter;
	}

	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}

	public String getBoardtime() {
		return boardtime;
	}

	public void setBoardtime(String boardtime) {
		this.boardtime = boardtime;
	}

	public String getBoardviewcount() {
		return boardviewcount;
	}

	public void setBoardviewcount(String boardviewcount) {
		this.boardviewcount = boardviewcount;
	}

	
	
	@Override
	public String toString() {
		return "BoardVO [boardseq=" + boardseq + ", boardtitle=" + boardtitle + ", boardcontents=" + boardcontents
				+ ", boardwriter=" + boardwriter + ", boardtime=" + boardtime + ", boardviewcount=" + boardviewcount
				+ "]";
	}
	
	
	
	
}
