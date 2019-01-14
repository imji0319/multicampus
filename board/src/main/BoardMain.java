package main;

import java.io.IOException;
import java.util.Scanner;
import view.BoardDeleteView;
import view.BoardInsertView;
import view.BoardSelectView;
import view.BoardUpdateView;

public class BoardMain {
public static void main(String[] args) throws IOException {
	
	while (true) {
	System.out.println("-----게시물메뉴-----");
	System.out.println("1. 게시물 저장 ");
	System.out.println("2. 게시물 수정");
	System.out.println("3. 게시물 삭제");
	System.out.println("4. 게시물 조회");
	System.out.println("5. 프로그램 종료");
	
	
	System.out.print("번호 입력 : ");
	
	Scanner sc = new Scanner(System.in);
	int menu = sc.nextInt();

	
	//입력 번호에 맞는 기능 수행 
	if (menu == 1) { //1. 게시물 저장 
		BoardInsertView view = new BoardInsertView();
		view.input();

	}
	else if (menu ==2) { //2. 게시물 수정
		System.out.println("게시물 수정 기능을 선택하셨습니다.");
		BoardUpdateView view = new BoardUpdateView();
		view.input();

		
	}
	else if (menu ==3) { //3. 게시물 삭제
		System.out.println("게시물 삭제 기능을 선택하셨습니다.");
		BoardDeleteView view = new BoardDeleteView();
		view.input();
		

	}
	else if (menu ==4) { //4. 게시물 조회
		System.out.println("게시물 조회 기능을 선택하셨습니다.");
		BoardSelectView view = new BoardSelectView();
		view.input();
		
	}
	else if (menu ==5) { //3. 프로그램 종료
		System.out.println("프로그램을 종료합니다.");
		System.exit(0); //return; 
	}

	else {
		System.out.println("잘못 입력하셨습니다.");
	}
	}
	
	
	
	
}
}
