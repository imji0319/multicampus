package chap12;


//1. 멀티스레드 클래스 정의 
class A extends Thread{
	String msg;
	A(String msg){
		this.msg = msg;
	}
	
	public void run() {
		for (int i=1; i<=10; i++) {
			System.out.println(msg+" : "+ i);
		}
	}
	
}


public class ThreadTest1 {
public static void main(String[] args) {
	
	//2. 멀티스레드 객체 생성 -> 동시 실행
	A a1 = new A("one");
	A a2 = new A("two");
	
	a1.start();
	a2.start();
	
}
}
