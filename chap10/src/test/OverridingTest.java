package test;

class OverridingTest {
    public static void main(String args[]){
        int i = 10;
        int j = 20;
        
        MySum ms1 = new MySum(i, j);
        MySum ms2 = new MySum(j, i);

        System.out.println(ms1);
        System.out.println(ms2);

        if(ms1.equals(ms2))
            System.out.println
            ("ms1과 ms2의 합계는 동일합니다.");
    }
}

class MySum {
    int first;
    int second;
    
    MySum (int first, int second){
        this.first = first;
        this.second = second;
    }
    
    /* 조건1 */
	@Override
	public String toString() {		
		return String.valueOf(first + second);  //값을 String 으로 변경 
	}

	
	/* 조건2 */
	@Override
	public boolean equals(Object obj) {
		
		//obj가 MySum 객체인지 확인 : instanceof
		if (obj instanceof MySum) {			
			return toString().equals(obj.toString());
		}
		else {
			return false;
		}
	}

}
