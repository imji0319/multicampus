package test;

class Employee{
	int id;
	String name;
	int year;
	int day;
	int salary;
	
	Employee(int id, String name, int year, int day) {
		this.id = id;
		this.name = name;
		this.year = year;
		this.day = day;
	}
	
	int cal() {
		salary = year+day;
		return salary;
	}

}

class Manager extends Employee{
	int mSalary;
	Manager(int id, String name, int year, int day,int mSalary) {
		super(id, name, year, day);
		this.mSalary = mSalary;
		// TODO Auto-generated constructor stub
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
		// TODO Auto-generated constructor stub
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
		// TODO Auto-generated constructor stub
	}
	
	public int cal() {
		salary = super.cal();
		sSalary = salary+sSalary;
		return sSalary;
	}
	
}


public class SalaryTest {

	public static void main(String[] args) {
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
		}

	}

}
