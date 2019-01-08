package chap18;

import java.io.IOException;

//System.in : 키보드장치 - window 자바 구현 바이딩 변수명

public class SystemInTest {
public static void main(String[] args) {
	
	try {
		int result = 0; 
		//키보드 입력중단 종료 제어키 :ctrl+z 
		//System.in.read() : 한글, 자바 데이터 타입 입력 불가능
		
		while((result = System.in.read()) != -1) { // 문자 -> int ,영문 한글자 + 숫자(0-9) 표현만 가능(다국어 불가능)
		System.out.println(result);
		}
		
	}
	catch(IOException e) {
		System.out.println(e.getMessage());
	}
	

}
}
