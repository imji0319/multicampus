package chap12;


//1. 멀티스레드 클래스 정의 
class B implements Runnable{
	String msg;
	
	B(String msg){
		this.msg = msg;
	}
	
	public void run() {
		for (int i=1; i<=20; i++) {
			System.out.println(msg+" : "+ i);
		}
	}
	
}


public class RunnableTest1 {
public static void main(String[] args) {
	
	//2. 멀티스레드 객체 생성 -> 동시 실행
	B b1 = new B("one");
	B b2 = new B("two");
	
	//Thread 객체로 변환
	Thread ta1 = new Thread(b1); //Thread(Runnable r) : Runnable 객체를 Thread로 변환
	Thread ta2 = new Thread(b2);
	
	ta1.start();
	ta2.start();
	
}
}
