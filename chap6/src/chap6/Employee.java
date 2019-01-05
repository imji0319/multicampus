package chap6;

public class Employee {
	
	//자바 모든 클래스 내부 기본 생성자 자동 사입
	//기본 생성자 형태 : 클래스명() {}
	//사용자 생성자 정의 (기본 생성자 사라짐)
	
	//생성자
	Employee(int id, String name, String dept, String title) {
		System.out.println("생성자호출");
		this.id = id;   //this : 해당 클래스를 의미하여 필드변수임을 알려줌
		this.name = name;
		this.dept = dept;
		this.title = title; } 
	
	//오버로딩
	//1개 클래스 내부에 생성자 여러개 정의 가능
	//생성자 이름=클래스 이름 
	//변수개수, 타입, 순서 중 1개 이상 다르게 정의 
	 Employee(int id, String n){
		 this.id = id;
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
	 
	 Employee(int id){
		 this(id,"이순신","부서미정","직급미정"); //같은 클래스 내에서 다른 생성자를 사용하기 위해 this 사용
	 }
	 
	//필드변수
	int id ; //사번
	String name; //이름
	String dept; //부서
	String title; // 직급
	
	
	@Override
	
	//클래스 필드변수들 모아서 한버네 출력 양식 정의
	//e1, e2, e3 ...
	public String toString() {
		
		return ("사번은 "+id+"이고 이름은 "+
				name+" 부서는 " +
				dept+"이며 직급은 "+
				title+"입니다.");	
	}

}
