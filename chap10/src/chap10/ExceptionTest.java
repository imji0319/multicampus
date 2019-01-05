package chap10;

public class ExceptionTest {

	public static void main(String[] args) {
		//예외처리 try - catch
		try {
		//예외발생 가능성문장 정의
		//발생x : try블록 수행
		//발생o : try블록 중단 -> new XXXException() 를 자동 생성 -> catch 블록수행
		int i = Integer.parseInt(args[0]);
		int j = Integer.parseInt(args[1]);
		System.out.println(i/j);
		}
		
		//try 블록 내 오류가 없으면 절대 catch블록을 수행하지 않음
		//특정 예외에 대한 처리를 지정하고 싶을 때에는 먼저 catch를 선언
		
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("2개의 입력변수가 필요합니다.");
			//e.printStackTrace(); // 예외가 발생한 라인, 블록, 원인 추적 메세지 출력
		}		
		
		catch(NumberFormatException e) {
			System.out.println("0-9 사이의 값만 입력하세요.");
			//e.printStackTrace(); // 예외가 발생한 라인, 블록, 원인 추적 메세지 출력
		}
		catch(ArithmeticException e) {
			System.out.println("0으로 나눌 수 없습니다.");
			//e.printStackTrace(); // 예외가 발생한 라인, 블록, 원인 추적 메세지 출력
		}

		//모든 예외 처리로 특정 예외 처리에 대해선 이 문장 전에 선언해야함 
		//-> 특정 예외처리 그외 예외 처리에 대해 수행 
		//상위 exception 먼저 선언
		catch(Exception e)//모든 예외 지정 : 클래스 형변환 
		{System.out.println("모든 예외동일 처리합니다");
		}
		
		//모든 경우에 실행해야 하는 명령 : finally 블록에 지정

		finally {
			System.out.println("항상 출력됩니다");
		}

		System.out.println("main완료");

	}

}
