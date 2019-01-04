package chap7;

class Employee{
	int id;
	String name; //private 선언시
	String dept;
	String title ="사원";
	
	public void printField() {
		System.out.println(id+":"+name+":"+dept);
	}

}

//상속 inheritance  ==> extends 
class Manager extends Employee{
	
	void test() {
		System.out.println(super.title); //super : 상위클래스의 변수값 사용
		System.out.println(title);
	}
	
	String jobOfManage; //관리직업무
	int cntOfSubs;      //관리하는 사원수
	String title="관리직"; 
	//상위 클래스와 동일한 변수에 다른 값이 들어있을 때 자신 클래스값 우선
	
	//하위 클래스 상속메소드를 그대로 사용하거나 수정 가능
	
	/* 상위 클래스의 메소드 수정방법
	 * 1. 선언부는 똑같거나 접근 권한이 더 넓은 modifier를 사용해야함
	 * 2. 똑같은 return 타입
	 * 우선 실행 메소드 : 자신 클래스 메소드 실행
	 */
	public void printField() {
		super.printField();   //상위 클래스의 메소드 호출
		System.out.println(jobOfManage +":"+ cntOfSubs);
		
	}
	

}
public class ManagerTest {

	public static void main(String[] args) {
		Manager m = new Manager();
		m.id = 100;
		m.name = "홍길동";
		m.dept = "전산";
		m.jobOfManage="전산실관리";
		m.cntOfSubs = 5;
		
		System.out.println
		(m.id +":"+m.name+":"+m.jobOfManage);
		
		m.test();
		m.printField(); //Manager 에서 수정한 메소드 호출 
		m.printField();
	}

}
