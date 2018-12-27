package chap4;

public class Gugudan {

	public static void main(String[] args) {
		// 2-9단 출력
		
		for (int i=1;i<=9;i++) {
			for (int j=2;j<=9;j++) {
				//if (j==5) {break;} //5단 이후 출력x
				//if (j==5) {continue;} //5단만 나오지 않고 그 이후는 계속 반복 
				System.out.print(j+"*"+i+"="+i*j+"\t");
				
			}//inner for문
			System.out.println(); 
		}//outer for문
		System.out.println("구구단을 종료합니다.");
	}

}
