package chap11;


public class StringTest {

	public static void main(String[] args) {
		String first = "Arnold";
		String middle = "Alois";
		String last = "Schwarzenegger";
		String initials;
		String firstInit, middleInit, lastInit;
		
		firstInit =first.substring(0);
		middleInit =middle.substring(0,1);
		lastInit = last.substring(0,1);
		initials = firstInit+middleInit+lastInit;
		
		
		System.out.print("1. 이름: ");
		System.out.println(first + " " + middle + " " + last);
		System.out.print("2. 이름 (대문자): ");
		System.out.println(first.toUpperCase() + " "+ middle.toUpperCase()+" " + last.toUpperCase());
		System.out.print("3. 이니셜:  ");
		System.out.println(initials);
		
		
		System.out.println("4. First Name은 arnold이다. (대소문자 구분; T/F):  " + first.equals("arnold"));
		System.out.println("5. First Name은 arnold이다. (대소문자 미구분; T/F):  " + first.equalsIgnoreCase("arnold"));
			
		System.out.println("6. Last Name " + last + "의 index 번호 6~13까지 문자열 : " +  last.substring(6,13));
		System.out.println("7. Last Name " + last + "에서 negger 문자열의 위치 : " + last.indexOf("negger"));		


		String s1 = " test ";
		System.out.println("--"+s1+"--");
		System.out.println("--"+s1.trim()+"--");
		
		String result = String.valueOf(10+20);
		System.out.println(result);
		
		
	}

}
