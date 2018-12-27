package chap4;

public class MonthTest2 {

	public static void main(String[] args) {
		int month = (int)(Math.random()*12)+1;
		
		//month = 1,3,5,7,8,10,12 31일까지 존재 
		//month = 4,6,9,11 30일까지 존재
		//month = 2 28일까지 존재 
		
		switch(month) {
		//1,3,5,7,8,10,12 일 경우로 여러개가 가능할 때
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			System.out.println(month+"월은 31일까지 존재합니다.");
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			System.out.println(month+"월은 30일까지 존재합니다.");
			break;
		case 2:
			System.out.println(month+"월은 28일까지 존재합니다.");
			break;
		default:
			System.out.println("해당월은 존재하지 않습니다.");
		}
		
		if (month==1||month==3||month==5||month==7||month==8||month==10||month==12) {
			System.out.println(month+"31일까지 존재합니다.");
		}
		else if (month==4||month==6||month==9||month==11) {
			System.out.println(month+"30일까지 존재합니다.");
		}
		else if (month==2) {
			System.out.println(month+"28일까지 존재합니다");
			
		}
		
	}

}
