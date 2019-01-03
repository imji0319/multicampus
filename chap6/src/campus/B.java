package campus;  //자바 파일은 가장 처음 패키지문장으로 시작해야함, 클래스 저장 위치 설정

//클래스 사용 위치
import java.util.Date;
import java.util.Vector;
import multi.A;
//import java.util.* : 패키지의 모든 클래스 불러오기 


 /* 아래의 경우를 제외하고 모든 패키지는 import 해야 사용 가능함 
  * 1. java.lang 패키지 필수 클래스 자동  import
  * 2. 현재  클래스와 같은 패키지 존재 클래스
  */

public class B {
	public static void main(String[] args) {
		Date now = new Date();
		System.out.println(now);
		Vector v = new Vector(); //일종의 배열 타입
		A a1 =new A("you");

	}

}
