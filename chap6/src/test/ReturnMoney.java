package test;


class Student{
	
	//생성자
	Student(String n,String c, String l, int e, int ex){
		name = n;
		conf = c;
		lecture =l;
		expense= e;
		extra = ex;
		
	}
	
	//필드변수
	String name;
	String conf;
	String lecture;
	int expense;
	int extra;
	int returnmoney;
	
	//메소드
	
	int reMoney(String s, int i, int j) {
		int result=0;
		
		if (s.equals("자바프로그래밍")) {
			result = (int)(i*(0.25))+j;
		}
		else if (s.equals("JDBC프로그래밍")) {
			result = (int)(i*(0.2))+j;
		}
		else if (s.equals("JSP프로그래밍")) {
			result = (int)(i*(0.15))+j;
		}
		else {
			System.out.println("잘못입력되었습니다.");
		}
		return result;

	}
	
}

public class ReturnMoney {

	public static void main(String[] args) {
		String name =args[0];
		String conf =args[1];
		String lecture =args[2];
		int expense =Integer.parseInt(args[3]);
		int extra =Integer.parseInt(args[4]);
		
		Student stu = new Student(name, conf, lecture,expense,extra);
		
		int reM = stu.reMoney(lecture,expense,extra);
		
		if (reM != 0 ) {
		System.out.print
		("이름 : "+name+"\n"+"소속 : "+conf+"\n"+"과목명 : "+lecture+"\n"+
				"교육비 : "+expense+"\n"+"부가금 : "+extra+"\n"+"환급금 : "+reM+"\n");
		}

	}

}
