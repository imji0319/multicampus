package chap15;

import java.util.HashMap;
import java.util.Set;

public class PhoneMapTest {
public static void main(String[] args) {
	
		String [] p1 = {"010-2222-3333","02-255-5412","031-456-1542","kim@multi.com"};
		String [] p2 = {"010-3333-4444","032-541-1456","ssong@multi.com"};
		String [] p3 = {"010-5555-6666","02-845-2546","jun@multi.com"};
		
		HashMap<String, String[]> map = new HashMap <String, String[]> ();
		
		map.put("김태리",p1);
		map.put("송혜교",p2);
		map.put("전지현",p3);
		map.put("김태리",new String[] {""}); //똑같이 key값으로 추가될 경우 그 key에 대한 value를 변경
		map.put("이자바",p1);				   //값은 중복될 수 있음 
		
		
/*		String[] result = map.get("김태리");
		for (String s : result) {
			System.out.print(s+"-");
		}*/
		
		Set<String> keys = map.keySet(); //모든 key값을 Set 으로 저장 
		
		for (String k : keys) {
			String [] result = map.get(k);
			System.out.print(k+" : ");
			
			for (String s : result) {
				System.out.print(s+"	");
			}
			System.out.println();
			
		}

	
}
}
