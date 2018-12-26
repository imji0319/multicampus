package test;

//3자리 정수 -> 백자리의 수만 
public class Test1 {

	public static void main(String[] args) {
		int sample = 851;
		double sm2=(double)sample/100;
		int sm3=(int)sm2;
		int result =sm3*100;
		
		System.out.println("출력결과 : "+result);
		
	}

}
