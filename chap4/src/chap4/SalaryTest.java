package chap4;
import java.util.Scanner; //라이브러리 불러올때

public class SalaryTest {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in); //키보트 입력박기 위한 방식
		String title =sc.next();//입력받은 값 저장하는 방법
		
		int baseSalary=30000;
		int totalSalary=0;
		
		//사원 : 기본급 +5000
		//대리 : 기본급 *1.2
		//과장 : 기본급 *1.5
		//그 외 : 2배
		switch(title) {
		case "사원":
			totalSalary=baseSalary+5000;
			break;
		case "대리":
			totalSalary=(int)(baseSalary*1.2);
			break;
		case "과장":
			totalSalary=(int)(baseSalary*1.5);
			break;
		default:
			totalSalary=baseSalary*2;
		}
		System.out.println(title +"의 급여는 "+totalSalary);

	}

}
