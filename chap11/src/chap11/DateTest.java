package chap11;
import java.util.Date;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateTest {
public static void main(String[] args) {
		/* 1. 현재 날짜 & 시간  Date
		Date now = new Date();
		System.out.println(now); //Mon Jan 07 13:22:34 KST 2019

		Date d2 = new Date(1000000000000L); //long타입  ?: 1970.1.1.00.00.00 ~ ? - 1/1000초 단위 
		System.out.println(d2);*/
		
		// 2. Calendar 클래스 
		// new 생성자() --> 이런방식을 사용할 수 없음, 클래스 객체 생성 메소드 도움을 받아야함 : getInstance();
		Calendar cal = Calendar.getInstance();
		System.out.println(cal);
		
		//연도, 월, 일, 시, 분,초 추출메소드
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int min = cal.get(Calendar.MINUTE);
		int sec = cal.get(Calendar.SECOND);
		
		System.out.println(
				"현재 시각은 " + year + "년도 "+
				month + "월 "+ day + "일 "+hour + "시  "+min + "분 "+sec + "초 ");
		
		//현재부터 100일 후
		cal.set(Calendar.DAY_OF_YEAR, cal.getActualMaximum(Calendar.DAY_OF_YEAR)+100);
		
		// 3. java.text.SimpleDateFormat
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/HH:mm:ss -E");
		//연도 : y, 월 : M, 일 : d/D, 시 : H/h, 분 : mm, 초 : ss 추출메소드
		
		String datestr = sdf.format(new Date());
		//sdf.format(cal.getTime());
		System.out.println(datestr);
		
		double d = 5 * Math.PI;
		System.out.println(d); //15.707963267948966
		DecimalFormat df = new DecimalFormat("###.00"); 
		String sd = df.format(d);
		System.out.println(sd); //15.71
		
		

}
}
