package chap15;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


public class LottoSetTest {
public static void main(String[] args) {
	Set<Integer> lotto = new HashSet<Integer>();
	
	//1-45사이의 난수 6개 발생 
	while(true) {
		int ran = (int)(Math.random()*45)+1;
		lotto.add(ran);
		System.out.println(ran +":"+lotto.size());
		if (lotto.size()==6) break;
		
	}
	System.out.println("=======================");
	//조회 1
	Iterator<Integer> it = lotto.iterator(); 
	while(it.hasNext()) {
		Integer in =it.next(); //set 내부에 데이터 존재 여부 확인 T/F
		System.out.println(in);
	}
	
	System.out.println("=======================");
	//조회 2 jdk1.5 추가
	for (Integer i : lotto) { 
		System.out.println(i);
	}

}
}
