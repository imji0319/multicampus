package chap4;

public class MonthTest {

	public static void main(String[] args) {
		int day=30; //31,30,28
		
		//day 31이면 1,3,5,7,8,10,12월은 31일까지 존재합니다.
		//day 30이면 4,6,9,11월은 30일까지 존재합니다.
		//day 28이면 2월은 28일까지 존재합니다.
		
		
		switch(day) {
		case 28:
			System.out.println("2월은 "+day +"까지 존재합니다.");
			break; //case 수행 종료
		case 30:
			System.out.println("4,6,9,11월은 "+day +"까지 존재합니다.");
			break;
		case 31:
			System.out.println("1,3,5,7,8,10,12월은 "+day +"까지 존재합니다.");
			break;
		default:
			System.out.println("해당월은 존재하지 않습니다");
		
		
		}

	}

}
