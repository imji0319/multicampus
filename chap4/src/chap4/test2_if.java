package chap4;

public class test2_if {

	public static void main(String[] args) {
		int cntOfBooks = 54;
		int cntOfStu = 12;
		
		String result; 
		//Sting result=""; 빈값으로 두고 시작
		//제어문 내 사용되고 제어문을 나올 때에도 사용되는 변수는 사전선언하여 사용 => 지역변수는 블록내에서만 사용		
		
		if (cntOfBooks>cntOfStu) {
			int booksPerS = cntOfBooks/cntOfStu;
			int space = cntOfBooks%cntOfStu;
			result = 
					"1명의 학생당 : "+ booksPerS +"권씩 가질 수 있습니다.\n"+
					"남아있는 책은 "+space+"권입니다";
		}
		
		else {
			result = "책을 나눌수 없습니다.";
		}
		
		System.out.println(result);
		

	}

}
