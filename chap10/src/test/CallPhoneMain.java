package test;

class CellPhone{
	
	String model;
	double battery; //남은 배터리양
	
	CellPhone(String model){
		this.model = model;
	}
	
	void call(int time) 
			throws IllegalArgumentException{
		try {
			if (time<0) {
				throw new IllegalArgumentException("통화시간입력오류");
			}
		}catch (IllegalArgumentException e){
			System.out.println(e.getMessage());
		}
		
		System.out.println("통화시간 : "+time+"분");
		double ls = time * 0.5; 
		battery -= ls;
	
		if (battery < 0) {
			battery = 0;
		}
		

	}
	
	void charge(int time) 			
			throws IllegalArgumentException{

		try {
			if (time > 100) {
				throw new IllegalArgumentException("충전시간입력오류");
			}
		}catch (IllegalArgumentException e){
			System.out.println(e.getMessage());
		}
		System.out.println("충전시간 : "+time+"분");
		double ga = time * 3; 
		battery += ga;
		if (battery > 100 ) {
			battery = 100;
		}

	}
	
	void printBattery() {
		System.out.println("남은 배터리 양 : " + battery);

	}
	
	boolean isSame(CellPhone C) {
		if (model.equalsIgnoreCase(C.model)) {
			return true;
		}
		else {return false;}
	}
}

public class CallPhoneMain {

	public static void main(String[] args) {
		CellPhone myPhone = 
		         new CellPhone("GALAXY-9");

		try {
			myPhone.charge( 20 );  //20분간 충전을 한다.
			myPhone.printBattery();
			
			myPhone.call( 300 );  //300분간 통화를 한다.
			myPhone.printBattery();
			
			myPhone.charge( 50 );  //50분간 충전을 한다.
			myPhone.printBattery();
			
			myPhone.call( 40 );  //40분간 통화를 한다.
			myPhone.printBattery();
			
			myPhone.call( -20 );  //통화시간입력오류
			
		}
		catch (IllegalArgumentException e){
			System.out.println("IllegalArgumentException 예외가 발생하였습니다");

		}
		
		CellPhone yourPhone = new CellPhone("galaxy-9");
		
		if( myPhone.isSame(yourPhone) ) {
			System.out.println("동일 모델입니다.");
		} else {
			System.out.println("다른 모델입니다.");
		}

	}

}
