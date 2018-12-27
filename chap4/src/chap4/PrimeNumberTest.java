package chap4;

public class PrimeNumberTest {

	public static void main(String[] args) {
		int su =(int)(Math.random()*100)+1;
		int i;
		int cnt=0;
		
		for (i=2; i<su; i++) {
			if (su%i == 0) {
				cnt+=1 ;
			}

		}
		System.out.println(i+":"+cnt);
		if (cnt == 0) {
			System.out.println(su+"는 소수이다");
		}
		else{
			System.out.println(su+"는 소수가 아니다");
			}

	}

}
