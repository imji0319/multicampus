package chap6;

public class EmployeeTest {

	public static void main(String[] args) {
		Employee e1 = new  Employee(1234); 
		//클래스명 변수명 = new 클래스명();
		/*1. e1변수 stack 영역 할당 null
		 *2. new heap 영역 Employee 클래스 복사본 생성
		 *3. Employee 생성자 정의되어 있다면 호출 실행
		 *4. 2번 주소값을 1번 대입 */ 
		
		//e1.id = 1234;
		e1.name ="홍길동";
		e1.dept = "인사부";
		e1.title = "사원";
		System.out.println("사번은 "+e1.id+"이고 이름은 "+e1.name+" 부서는 " +e1.dept+"이며 직급은 "+e1.title+"입니다.");
		
		
		Employee e2 = new  Employee(2234); 
		//e2.id = 2234;
		e2.name ="김유정";
		e2.dept = "총무부";
		e2.title = "대리";
		System.out.println("사번은 "+e2.id+"이고 이름은 "+e2.name+" 부서는 " +e2.dept+"이며 직급은 "+e2.title+"입니다.");
		
		
		//클래스명 주소참조변수 = 복사연산자 생성자호출();


	}

}
