package chap18;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;



public class FileClassTest {
public static void main(String[] args) {
	System.out.println("파일명이나 디렉토리명을 입력하시오");
	Scanner sc = new Scanner(System.in);
	String filename = sc.nextLine();
	sc.close();
	
	//파일이면 구현 메소드 실행결과 출력
	//디렉토리라면 내부 리스트 출력

	try {
	File f = new File(filename) ;
	if (f.exists()) {
		if (f.isFile()) {  
			System.out.println(f.isFile());
			System.out.println(f.canRead());
			System.out.println(f.canWrite());
			System.out.println(f.getCanonicalPath());
			System.out.println(f.getName());   		//파일명을 키보드로 입력받을 경우를 생각해볼 수 있음
			System.out.println(f.length());
	
			// 설정포맷 변경
			long time = f.lastModified(); //1/1000초 단위
			Date timeDate = new Date(time);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //원하는 포맷 
	
			String timeString = sdf.format(timeDate);
			String timeString2 = sdf.format(new Date(time));
	
			System.out.println(timeString);
			System.out.println(timeString2);
			}
	
		else if (f.isDirectory()){
			for (String s : f.list()) {
				System.out.println(s);
			}
		}
	}
	}
	
	catch(IOException e) {
		System.out.println(e.getMessage());
	}

}
}
