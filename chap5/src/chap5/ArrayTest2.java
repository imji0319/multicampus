package chap5;

public class ArrayTest2 {

	public static void main(String[] args) {
		int scores[] = new int[5];
		int max=0;
		int min=101;
		
		for (int i=0 ; i<scores.length ;i++) {
			scores[i]=(int)(Math.random()*100)+1;
			System.out.print(scores[i]+"\t");
			if (max <scores[i]) {
				max = scores[i];
			}
			if (min > scores[i]) {
				min =scores[i];
			}
			
			if (scores[0]<scores[i]) {
				scores[0]=scores[i];
			}
			System.out.print(scores[i]+"\t");
		}
	
		
		System.out.println("최대값 : " + max);
		System.out.println("최소값 : " + min);
		System.out.println("최대값 : " + scores[0]);
		
		//System.out.println(scores);

	}

}
