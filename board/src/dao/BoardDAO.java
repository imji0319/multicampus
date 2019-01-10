package dao;
//Data access object 

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import vo.BoardVO;

public class BoardDAO {
	public void insertBoard(BoardVO vo) throws IOException {
		// 번호 =1 제목 =게시물 저장 내용=1개의 게시물을 저장합니다.조회수=0

		// 게시물 저장
		FileWriter fw = new FileWriter("board.txt", true);

		fw.write(vo.toString() + "\n"); // 한번에 여러 문장 저장 가능 , 매개변수 선언해야함, +"\n" : 줄바꿈
		fw.close();

		System.out.println(vo + "  ===> board.txt 파일에 게시물 저장을 완료했습니다.");
	}


	public BoardVO selectBoard(int seq) throws IOException {
		// 게시물 번호 전달 -> 게시물 조회 수 리턴
		// 게시물 번호 전달 -> 게시물 전체 내용 리턴 ==> BoardVO 리턴

		FileReader fr = new FileReader("board.txt");
		int total = 0;
		String st = "";

		ArrayList<String> list = new ArrayList<String>();

		while ((total = fr.read()) != -1) {
			st = st + (char) total;
		}

		String[] arr = st.split("\n");

		for (String i : arr) {
			list.add(i);
		}

		ArrayList<BoardVO> list1 = new ArrayList<BoardVO>();

		for (String i : list) {
			String[] ar = i.split("=");
			BoardVO vo = new BoardVO(Integer.parseInt(ar[0]), ar[1], ar[2], Integer.parseInt(ar[3]));
			list1.add(vo);

		}
		

		for (int i = 0; i <= 5; i++) {
			if (list1.get(i).getSeq() == seq) {
				return list1.get(i);
			} 
		}	
		
		System.out.println("해당 번호가 없습니다");
		BoardVO vo2 = new BoardVO(0, "N", "N", 0);
		return vo2;

		/*
		 * 1. board.txt 파일 입력받을 객체 생성 FileReader fr= new FileReader("board.txt"); 2. 첫번째
		 * 라인읽고 마지막 라인까지 읽기 (반복)
		 * 
		 * 3. "="로 분할 -> 결과 ArrayList 저장 (int, String, String, int); 4. 한 라인씩 BoardVO
		 * 객체로 생성, 그 객체들을 ArrayList<BoardVO>() 생성 5. if ArrayList.get(0).getSeq() ==
		 * seq; return ArrayList's BoardVO
		 */

	}

}