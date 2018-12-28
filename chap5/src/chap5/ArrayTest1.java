package chap5;

public class ArrayTest1 {

	public static void main(String[] args) {
		//5개의 정수를 저장 배열 
		//1-100 사이의 난수 5개 발생 저장
		int scores[] = new int[5];
		int sum=0;
		int avg=0;
		
		System.out.println("배열의 길이 : "+scores.length);
		for (int i=0 ; i<scores.length ;i++) {
			scores[i]=(int)(Math.random()*100)+1;
			sum+=scores[i];
			System.out.println(scores[i]);
		}
		avg=sum/scores.length;
		
		System.out.println("합계"+sum);
		System.out.println("평균"+avg);

	}

}
