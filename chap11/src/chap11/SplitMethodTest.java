package chap11;
import java.util.StringTokenizer;

public class SplitMethodTest {

	public static void main(String[] args) {
		String address = "서울시:강남구:역삼동:-멀티캠퍼스:10층 1003호";
		
		//1. split메소드
		String tokens[] = address.split(":");
		System.out.println("분리된 토큰 개수 : "+tokens.length);

		for (int i =0;i <tokens.length;i++) {
			System.out.println(tokens[i]);
		}
		
		System.out.println("=====================");
		
		
		//2. StringTokenizer객체 활용 - 생성자, 메소드
		//분리기호가 여러개 일때
		StringTokenizer st = new StringTokenizer(address, ":- ");
		
		while (st.hasMoreTokens()) { //다음 토큰 조재하면
			String token = st.nextToken(); //토큰 읽어와라
			System.out.println(token);
			
		}

	}

}
