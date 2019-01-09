package generic;


class Box<T,E> {				//변수 타입 별도 지정하지 않을때 : Generic	
	T contents;
	E classid; //-> 제네릭에 추가로 선언해주면 가능

	public Box(T contents) {
		this.contents = contents;
	}
	
	public Box(T contents, E classid) {
		this.contents=contents;
		this.classid = classid;
	}
	
	public void setContents(T c) {
		contents = c;
	}
	public T getContents() {
		return contents;
	}
	
}

class Paper{
	String size;
	Paper(String size){
		this.size = size;
	}
}
class Apple{
	String origin;
	public Apple(String origin) {
		this.origin = origin;
	}
	
}

public class GenericTest {
public static void main(String[] args) {
	
	Paper p = new Paper("A4");
	Apple a = new Apple("청송");
	
	Box<Paper, String> paperBox = new Box<Paper,String> (p,"공산품");
	Box<Apple, Integer> appleBox = new Box<Apple,Integer> (a,100);
	
	Paper o1 = paperBox.getContents();
	System.out.println((o1).size);
	System.out.println(paperBox.classid); //String 
	
	
	Apple o2 = appleBox.getContents();
	System.out.println((o2).origin);
	System.out.println(appleBox.classid);//Integer 



}
}
