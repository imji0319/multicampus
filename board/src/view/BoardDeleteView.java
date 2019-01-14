package view;

import java.io.IOException;
import java.util.Scanner;

import dao.BoardDAO;
import vo.BoardVO;

public class BoardDeleteView {
	public void input() throws IOException {
		System.out.println("삭제할 게시물 번호 입력하세요: ");
		
		Scanner sc = new Scanner(System.in);
		int seq = sc.nextInt();
		
		BoardDAO dao = new BoardDAO();
		
		dao.deleteBoard(seq);


}
}
