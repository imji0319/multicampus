package test;

/*사다리꼴 면적 실수
 * (윗변+아래변)/2*높이
 * 
 */
public class Test3 {

	public static void main(String[] args) {
		int up = 10;
		int down =15;
		int high = 12;
		
		double result = (double)(up+down)/2*high;
		System.out.println("사다리꼴의 면적 실수:"+result);

	}

}
