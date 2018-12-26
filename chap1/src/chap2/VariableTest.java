package chap2;

public class VariableTest {

	public static void main(String[] args) {
		int i = 100;
		double pi = 3.14;
		boolean b1 = true;
		char c1 = 'a'; //단일따옴표 단일문자일때 '' 
		System.out.println(i); //100
		i = 200;
		System.out.println("i변수=" +i); //i변수=200
		b1=i > pi;
		System.out.println("b1="+ b1);
		System.out.println("c1="+c1);
		c1 = '가';
		System.out.println("c1="+c1);
		c1 = '\n';
		System.out.println("c1="+c1);
		//단일문자:char: 'a' = 97 'b' = 98 'A' = 65 '0'=48
		b1 = i > c1;
		System.out.println("b1="+ b1);
		char c2='a';//97
		char c3='A';//65
		System.out.println(c2>c3);
	//숫자 영대문자 영소문자 한글 순으로  
		int j=2121354265;
		
	//여러 문자 구성 문자열 
		String title="ds";
	}

}
