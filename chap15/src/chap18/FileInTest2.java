package chap18;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileInTest2 {
	public static void main(String[] args) {
		
		
		FileReader fr = null; //예외처리 과정 모두에서 사용할 수 있도록 try블록 밖에서 선언
		FileWriter fw = null; //파일생성 저장 
		
		try {
		//1. 파일 열기 - 기존 파일 + 생성 파일 
			fr = new FileReader(args[0]);
			fw = new FileWriter(args[1]);       //복사해서 저장할 파일 지정 
			
			
		//2. 파일 처음 - 끝 입력
			int result = 0;
			int num = 1; 
			
			fw.write(num++ +" : ");
			
			while ( (result=fr.read()) != -1) {
				//모니터 출력
				System.out.print((char)result);
				fw.write(result); //integer 갑을 2byte로 생각하고 자동 문자변환 시켜 (char)형변환 불필요
				//copy.txt로 파일 저장 
				
				if (result == 10) {  // \n = 10
					fw.write(num++ +" : "); //라인넘버
				}
				
				//임시메모리(버터) 저장 
			}
		
		} catch (IOException e){
			System.out.println(e.getMessage());
		
		}finally {
			//3. 파일 닫기
			try {
			fr.close(); //파일 입력 완료 후 window 반납
			fw.close(); //버터에 저장할 걸 파일에 최종저장하는 방법, 
			
			}catch (IOException e){ } //예외발생해도 아무동작도 하지 말라.
			
		}
		
		
		
	}
	}

