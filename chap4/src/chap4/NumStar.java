package chap4;

public class NumStar {

	public static void main(String[] args) {
		int num=(int)(Math.random()*10)+1; //1-10 사이의 난수 발생
		System.out.println(num+"의 별");
		int i=1;
		int j=1;
		for (i=1; i<=num; i++) {
			for (j=1; j<=i;j++) {
				System.out.print("*");
			}
			System.out.println("\n");
		}
	}

}
