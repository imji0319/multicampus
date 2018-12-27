package test;

public class Test2_tc {

	public static void main(String[] args) {
		int cntOfBooks = 97;
		int cntOfStu = 12;
		
		int booksPerS = cntOfBooks/cntOfStu;
		int space = cntOfBooks%cntOfStu;
		
		String result = cntOfBooks>cntOfStu?"1명의 학생당 : "+ booksPerS +"권씩 가질 수 있습니다.\n"+
				"남아있는 책은 "+space+"권입니다":"책을 나눌수 없습니다.";
		
		System.out.println(result);

	}

}
