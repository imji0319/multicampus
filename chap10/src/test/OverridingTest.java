package test;

class OverridingTest {
    public static void main(String args[]){
        int i = 10;
        int j = 20;
        
        MySum ms1 = new MySum(i, j);
        MySum ms2 = new MySum(i, j);

        System.out.println(ms1);

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
		int result = first + second;
		
		return String.valueOf(result);
	}

	
	/* 조건2 */
	@Override
	public boolean equals(Object obj) {
		
		String s1 = this.toString();
		String s2 = obj.toString();
		
		if (s1.equals(s2)){
			return true;
		}
		else {return false;}
	}

}
