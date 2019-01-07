package test;

import java.util.Arrays;
import java.util.Collections;

class Solution {
	  public String solution(String s) {
	      String answer = "";
	      String arr[] = s.split(""); 
	      Arrays.sort(arr, Collections.reverseOrder());

	      answer = String.join("",arr); //배열요소->문자열

	      return answer;
	  }
}
public class SortDecsendingTest {

	public static void main(String[] args) {
		Solution s1 = new Solution();
		System.out.println(s1.solution("asda"));
		
	}
}


