package view;

import java.util.Scanner;
import dao.BoardDAO;
import vo.BoardVO;

public class BoardInsertView {
	
	public void input() {
		System.out.println("게시물 저장할 내용을 입력하세요");
		
		Scanner sc = new Scanner(System.in);
		String line = sc.nextLine();
		
		//분리
		String[] tokens = line.split(":");
		
		//BoardVO 객체 생성 = 필수변수 분리 저장 
		BoardVO vo = new BoardVO(Integer.parseInt(tokens[0]),
								tokens[1],tokens[2],
								Integer.parseInt(tokens[3]));
		
		BoardDAO dao = new BoardDAO();
		dao.insertBoard(vo);
		

	}
}
