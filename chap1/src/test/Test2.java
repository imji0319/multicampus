package test;
/*책 97권
 *학생 12명
 *조건 
 1.책권수가 학생수보다 많다면 12명에게 공평한 권수의 책 분배 
 2.적다면 나눠가져가질 수 없다는 것을 나타내라
 *출력결과
 1명당 가져가는 책은 xx권
  남은 책은 xx권 
 
 */
public class Test2 {

	public static void main(String[] args) {
		int cntOfBooks = 10;
		int cntOfStu = 12;
		
		System.out.println(cntOfBooks<cntOfStu?"책의 수가 학생 수보다 작습니다.":"");
		
		int booksPerS = cntOfBooks/cntOfStu;
		int space = cntOfBooks%cntOfStu;
		
		System.out.println("1명의 학생당 : "+ booksPerS +"권씩 가질 수 있습니다.");
		System.out.println("남아있는 책은 "+space+"권입니다");

	}

}
