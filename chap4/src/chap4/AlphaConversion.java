package chap4;

public class AlphaConversion {

	public static void main(String[] args) {
		//System.out.println((char)65);
		//System.out.println((int)'Z');
		//65-90 정수 : 영대문자
		//97-122정수 : 영소문자
		//A===>a (+32)
		
		while(true) {
			int num=(int)(Math.random()*200)+1;
			System.out.println("숫자는 "+num);
			if (num>=65 && num <=90){
				System.out.println(num+"라면 "+(char)num+"를"+(char)(num+32)+"로 변경합니다");
			}
			else if (num>=97 && num<=122) {
				System.out.println(num+"라면 "+(char)num+"를"+(char)(num-32)+"로 변경합니다");
			}
			else {
				break;
			}

		}			
	}
}


