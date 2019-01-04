package chap7;

import java.lang.Math;

//abstract class는 class와 메소드 앞 모두 abstract를 선언해야함
abstract class Shape{
	abstract void area();     //면적
	abstract void circum();   //둘레
	
}

class Rectangle extends Shape{
	int width; //가로
	int height; //세로
	
	Rectangle(int w, int h){
		width =w;
		height =h; 
	}
	
	void area() {
		System.out.println
		("가로 " + width + ", 세로 " + height + "인 Rectangle의 면적은 " +(width*height));
	}
	void circum() {
		System.out.println
		("가로 " + width + ", 세로 " + height + "인 Rectangle의 둘레은 " +2*(width+height));
	}
}

class Circle extends Shape{
	int r;  //반지름
	
	Circle(int r){
		this.r = r ;
	}
	void area() {
		System.out.println
		("반지름 " + r + "인 Circle 의 면적은 " +(r*r*Math.PI));
	}
	void circum() {
		System.out.println
		("반지름 " + r + "인 Circle 의 둘레은 " +2*r*Math.PI);
	}
	
}



public class ShapeTest {

	public static void main(String[] args) {
		// cir 5 : 반지름 5인 Circle 객체생성
		// rec 6 8 : 가로 6, 세로 8 Rectangle 객체 생성
		// 모든 객체들은 면적, 둘레 구하기 가능
		
		if (args.length == 2 && args[0].equals("cir")) {
			Circle c = new Circle(Integer.parseInt(args[1]));
			c.area();
			c.circum();
		}
		
		else if (args.length ==3 && args[0].equals("rec")) {
			Rectangle r = new Rectangle(Integer.parseInt(args[1]), 
										Integer.parseInt(args[2]));
			r.area();
			r.circum();

		}

	}

}
