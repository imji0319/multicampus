package view;

import java.io.IOException;
import java.util.Scanner;

import dao.BoardDAO;
import vo.BoardVO;

public class BoardUpdateView {
	public void input() throws IOException {
		System.out.println("변경할 단어를 입력하세요: ");
		
		Scanner sc = new Scanner(System.in);
		String[] change = sc.nextLine().split(",");
		
		BoardDAO dao = new BoardDAO();
		
		dao.updateBoard(change[0],change[1]);
		
		
		


}
}
