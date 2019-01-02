package chap6;

public class Employee {
	
	//자바 모든 클래스 내부 기본 생성자 자동 사입
	//기본 생성자 형태 : 클래스명() {}
	//사용자 생성자 정의 (기본 생성자 사라짐)
	
	Employee(int i) {
		System.out.println("생성자호출");
		id = i;} 
	
	int id ; //사번
	String name; //이름
	String dept; //부서
	String title; // 직급
	

}
