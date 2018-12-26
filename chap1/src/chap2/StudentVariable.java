package chap2;

public class StudentVariable {

	public static void main(String[] args) {
		//1명 학생 정보 표현
		//학번, 이름, 전화번호, 이메일,성적, 총 이수학점
		//상태 : 재학증(T)/졸업(F)
		//7개 변수 선언
		String id ="091112" ;
		String name="임지혜";
		String phone="0104052632";
		String email="tfj0531@na";
		double grade=4.5;
		int total = 130;
		boolean state =true;
		System.out.println(
				"학번 = "+id+
				" 이름 = "+name+
				" 전화번호 = "+phone+
				" 이메일 = "+email+
				" 성적 = "+grade +
				" 재학상태 = "+state);
		System.out.println("100 "+200); 
		// + 연산자 주위에 string이 하나라도 있으면 모두 문자열결합 

	}

}
