package chap7;

class A{int va = 10;}
class B extends A{int vb = 20;}
class C extends A{int vc = 30;}
class D extends C{int vd = 40;}

class E{
	void test(A v) {
		//메소드 매개변수가 클래스 객체일때 자동형변환을 활용할 수 있음 
		//이 경우 A 라는 클래스를 다 상속받고 있기 때문에 자동형변환을 통해 계산이 가능함
	}
	
	void call() {
		A a1 = new A();
		test(a1);
		B b1 = new B();
		test(b1);
		C c1 = new C();
		test(c1);
		D d1 = new D();
		test(d1);
	
	}
}


public class CastingTest {

	public static void main(String[] args) {
		A myarray [] = new A[4];
		
		myarray[0] = new A();
		//자동 형변환, 앞에 myarray 배열을 A라는 클래스로 객체 선언했기 때문에 B로 생성해도 A로 자동 형변환
		myarray[1] = new B(); 
		myarray[2] = new C(); //자동 형변환
		myarray[3] = new D(); //자동 형변환
		
		for (int i =0; i<myarray.length; i++) {
			System.out.println(myarray[i].va);
			
			if (i == 1) {
				B b1 = (B)myarray[i];
				System.out.println("vb : "+b1.vb);
			} else if (i == 2) {
				//C c1 = (C)myarray[i];
				System.out.println("vc : "+((C)myarray[i]).vc); //바로 명시적 형변환 가능
			}
		}

	}

}
