package chap6;

public class Employee {
	
	//자바 모든 클래스 내부 기본 생성자 자동 사입
	//기본 생성자 형태 : 클래스명() {}
	//사용자 생성자 정의 (기본 생성자 사라짐)
	
	//생성자
	Employee(int i, String n, String d, String t) {
		System.out.println("생성자호출");
		id = i;
		name = n;
		dept = d;
		title = t; } //id 변수 초기화
	
	//오버로딩
	//1개 클래스 내부에 생성자 여러개 정의 가능
	//생성자 이름=클래스 이름 
	//변수개수, 타입, 순서 중 1개 이상 다르게 정의 
	 Employee(int i, String n){
		 id = i;
		 name = n;
		 dept = "부서미정";
		 title = "직급미정";
	 }
	
	 Employee(){
		 id=-1;
		 name ="이름미정";
		 dept = "부서미정";
		 title = "직급미정";
	 }
	 
	 
	//변수
	int id ; //사번
	String name; //이름
	String dept; //부서
	String title; // 직급
	

}
