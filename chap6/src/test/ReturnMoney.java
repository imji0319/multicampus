package test;


class Student{
	
	//생성자
	Student(String name, String conf, String lecture, int expense, int extra){
		this.name = name;
		this.conf = conf;
		this.lecture =lecture;
		this.expense= expense;
		this.extra = extra;
		
	}
	
	//필드변수
	String name ;
	String conf ;
	String lecture ;
	int expense ;
	int extra ;
	int returnmoney ;
	
	
	//메소드
	
	int reMoney(String s, int i, int j) {
		int result=0;
		
		if (s.equals("자바프로그래밍")) {
			result = (int)(i*(0.25))+j;
		}
		else if (s.equalsIgnoreCase("JDBC프로그래밍")) {  //대소문자 상관없이
			result = (int)(i*(0.2))+j;
		}
		else if (s.equalsIgnoreCase("JSP프로그래밍")) {
			result = (int)(i*(0.15))+j;
		}
		else {
			System.out.println("잘못입력되었습니다.");
			//return 0; //method 리턴타입이 void가 아닐 때 중간에 중단할 수 있는 명령문 return 0; 
		}
		return result;

	}
	
}

public class ReturnMoney {

	public static void main(String[] args) {
		String name = args[0];
		String conf = args[1];
		String lecture = args[2].toUpperCase(); //입력되는 것 모두 대문자로 변환 -equals.IgnoreCase("")를 사용할 필요 없음 
		int expense = Integer.parseInt(args[3]);
		int extra = Integer.parseInt(args[4]);
		
		Student stu = new Student(name, conf, lecture,expense,extra);
		
		int reM = stu.reMoney(lecture,expense,extra);
		
        /* return 0; 으로 중단한 명령문이 있을 때 사용
         * 이 조건문을 수립할 때 
		if (reM == 0) {
			return; 
		}
		*/

		if (reM != 0 ) {
		System.out.print
		("이름 : "+name+"\n"+
		"소속 : "+conf+"\n"+
		"과목명 : "+lecture+"\n"+
		"교육비 : "+expense+"\n"+
		"부가금 : "+extra+"\n"+
		"환급금 : "+reM);
		}

	}

}
