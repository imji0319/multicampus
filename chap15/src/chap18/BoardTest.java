package chap18;

import java.util.Scanner;

//XXXVO : Value Object
class BoardVO{
	int seq;         //게시물번호
	String title;    //게시물제목
	String contents; //내용
	int viewcount;   //조회수
	
	
	public BoardVO(int seq, String title, String contents, int viewcount) {
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.viewcount = viewcount;
	}

	@Override
	public String toString() {
		return "번호 = "+seq+" 제목 = "+title+" 내용 = "+contents+" 조회수 = "+viewcount ;
	}
	
}
//XXXDAO : Data Access Object
class BoardDAO{
	public void insertBoard(BoardVO vo) {
		//번호 =1 제목 =게시물 저장 내용=1개의 게시물을 저장합니다.조회수=0
		System.out.println(vo + "  ===> 게시물 저장을 완료했습니다.");
	}
	
	
}

public class BoardTest {
public static void main(String[] args) {

	//1. 게시물저장
	//2. 게시물수정
	//3. 게시물조회
	//각 번호에 맞는 기능수행
	//조회 기능
	//제목으로 검색, 내용으로 검색 ... 
	
	System.out.println("게시물 정보를 입력하시오.");
	
	//Scanner 생성
	Scanner s1 = new Scanner(System.in);
	
	//한줄 내용 입력
	//1:게시물 저장:1개의 게시물을 저장합니다.:0
	String line = s1.nextLine();

	// 입력받은 거 ":" 로 분할
	String[] ar = line.split(":");

	// BoardVO 객체로 생성 
	int seq = Integer.parseInt(ar[0].trim());         
	String title = ar[1];    
	String contents = ar[2]; 
	int viewcount =Integer.parseInt(ar[3].trim()); 
	
	BoardVO vo = new BoardVO(seq,title,contents,viewcount);
	
	// BoardDAO 객체 생성
	BoardDAO dao = new BoardDAO();
	
	// insertBoard 메소드 생성(BoardVO 객체)
	dao.insertBoard(vo);
	
	
}
}
