package chap4;

public class Gugudan {

	public static void main(String[] args) {
		// 2-9단 출력
		
		for (int i=1;i<=9;i++) {
			for (int j=2;j<=9;j++) {
				System.out.print(j+"*"+i+"="+i*j+"\t");
			}//inner for문
			System.out.println(); 
		}//outer for문
	}

}
