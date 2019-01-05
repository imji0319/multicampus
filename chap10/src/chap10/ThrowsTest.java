package chap10;

public class ThrowsTest {

	public static void main(String[] args) {
		/*
		 * 1. 예외발생 상황 정해져 있다 : 처리 필요
		 * 2. 메소드 예외 전달 : 처리 필요
		 */
		
		int id = -100;
		try {
			if (id <=0) {
				//의도적, 강제적 예외 발생
			throw new Exception("존재할 수 없는 사번"); //의도적 예외 발생
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("사번 : "+ id);
	}

}
