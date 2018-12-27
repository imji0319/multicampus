package chap4;

import java.util.Scanner;

public class WhileInputTest {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String input=sc.next();//공백이전문자열 입력
		//System.out.println(input);
		//equals()메소드 : String 문자열값 동등비교
		//while (input.equals("진행")) {
		while(true) {	
			System.out.println("프로그램수행중입니다.");
			System.out.println("계속 하려면 '진행'을 입력하세요");
			input = sc.next();
		}
		//System.out.println("프로그램을 종료합니다");
	}

}
