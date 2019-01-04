package test;

class Employee{
	int id;
	String name;
	int year;
	int day;
	int salary;
	
	public Employee(int id, String name, int year, int day) {
		this.id = id;
		this.name = name;
		this.year = year;
		this.day = day;
	}
	
	public void cals() {
		salary = year + day;
	}
	
	int cal() {
		salary = year+day;
		return salary;
	}

}

class Manager extends Employee{
	int mSalary;
	Manager(int id, String name, int year, int day, int mSalary) {
		super(id, name, year, day);
		this.mSalary = mSalary;
		
	}
	
	public void cals() {
		super.cals();
		salary += mSalary;

	}
	
	public int cal() {
		salary = super.cal();
		mSalary = salary+mSalary;
		return mSalary;
	}
}

class Engineer extends Employee{
	int eSalary1;
	int eSalary2;
	
	Engineer(int id, String name, int year, int day,int eSalary1, int eSalary2) {
		super(id, name, year, day);
		this.eSalary1 = eSalary1;
		this.eSalary2 = eSalary2;
		
	}
	public void cals() {
		super.cals();
		salary += eSalary1 +eSalary2;
	}
	
	public int cal() {
		salary = super.cal();
		
		int eSalary;
		eSalary = salary+eSalary1+eSalary2;
		return eSalary;
	}
	
}

class Secretary extends Employee{
	int sSalary;
	Secretary(int id, String name, int year, int day,int sSalary) {
		super(id, name, year, day);
		this.sSalary = sSalary;
		
	}
	
	public void cals() {
		super.cals();
		salary += sSalary;
	}
	
	public int cal() {
		salary = super.cal();
		sSalary = salary+sSalary;
		return sSalary;
	}
	
}


public class SalaryTest {

	public static void main(String[] args) {
		
		System.out.println("사번 : 이름 : 본봉 : 총급여");
		
		//cal() 
		Employee e [] = new Employee[4];
		// 1.상속 2.생성자(타입 순서 갯수....)
		e[0] = new Employee
		(1000,"이사원",10000,5000);
		e[1] = new Manager
		(2000,"김간부",20000,10000,10000);
		e[2] = new Engineer
		(3000,"박기술",15000,7500,5000,5000);
		e[3] = new Secretary
		(4000,"최비서",15000,7000,10000);
		

		for (int i=0; i<e.length;i++) {
			System.out.println(e[i].id +":" +e[i].name+":"+e[i].year+":"+e[i].cal());
			
			// 특정 객체들을 찾을 수 있도록 하는 키워드 instanceof 
			if (e[i] instanceof Secretary) {
				System.out.println(((Secretary)e[i]).day);
			}
			
		}
		
		
		
//		//cals()
//		System.out.println("void method");
//		
//		Employee e2 [] = new Employee[4];
//		// 1.상속 2.생성자(타입 순서 갯수....)
//		e2[0] = new Employee
//		(1000,"이사원",10000,5000);
//		e2[1] = new Manager
//		(2000,"김간부",20000,10000,10000);
//		e2[2] = new Engineer
//		(3000,"박기술",15000,7500,5000,5000);
//		e2[3] = new Secretary
//		(4000,"최비서",15000,7000,10000);
//
//
//		for (int i=0; i<e2.length;i++) {
//			e2[i].cals();   // void return 메소드 선언하여 salary 변수 메모리에 생성 
//			System.out.println(e2[i].id +":" +e2[i].name+":"+e2[i].year+":"+e2[i].salary);
//		}
		

	}

}
