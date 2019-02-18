package vo;

public class CocktailVO {
	int cock_id;
	String cock_name;
	int alcohol;
	int alcohol_grade;
	String main_matatial;
	String sub_matatial;
	String base;
	int taste_cola;
	int taste_choco;
	int taste_fruit;
	int taste_coffee;
	
	
	public CocktailVO() {
		
	}
	
	public CocktailVO(int cock_id, String cock_name, int alcohol, int alcohol_grade, String main_matatial,
			String sub_matatial, String base, int taste_cola, int taste_choco, int taste_fruit, int taste_coffee) {
		this.cock_id = cock_id;
		this.cock_name = cock_name;
		this.alcohol = alcohol;
		this.alcohol_grade = alcohol_grade;
		this.main_matatial = main_matatial;
		this.sub_matatial = sub_matatial;
		this.base = base;
		this.taste_cola = taste_cola;
		this.taste_choco = taste_choco;
		this.taste_fruit = taste_fruit;
		this.taste_coffee = taste_coffee;
	}
	public int getCock_id() {
		return cock_id;
	}
	public void setCock_id(int cock_id) {
		this.cock_id = cock_id;
	}
	public String getCock_name() {
		return cock_name;
	}
	public void setCock_name(String cock_name) {
		this.cock_name = cock_name;
	}
	public int getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(int alcohol) {
		this.alcohol = alcohol;
	}
	public int getAlcohol_grade() {
		return alcohol_grade;
	}
	public void setAlcohol_grade(int alcohol_grade) {
		this.alcohol_grade = alcohol_grade;
	}
	public String getMain_matatial() {
		return main_matatial;
	}
	public void setMain_matatial(String main_matatial) {
		this.main_matatial = main_matatial;
	}
	public String getSub_matatial() {
		return sub_matatial;
	}
	public void setSub_matatial(String sub_matatial) {
		this.sub_matatial = sub_matatial;
	}
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	public int getTaste_cola() {
		return taste_cola;
	}
	public void setTaste_cola(int taste_cola) {
		this.taste_cola = taste_cola;
	}
	public int getTaste_choco() {
		return taste_choco;
	}
	public void setTaste_choco(int taste_choco) {
		this.taste_choco = taste_choco;
	}
	public int getTaste_fruit() {
		return taste_fruit;
	}
	public void setTaste_fruit(int taste_fruit) {
		this.taste_fruit = taste_fruit;
	}
	public int getTaste_coffee() {
		return taste_coffee;
	}
	public void setTaste_coffee(int taste_coffee) {
		this.taste_coffee = taste_coffee;
	}

	@Override
	public String toString() {
		return "CocktailVO [cock_id=" + cock_id + ", cock_name=" + cock_name + ", alcohol=" + alcohol
				+ ", alcohol_grade=" + alcohol_grade + ", main_matatial=" + main_matatial + ", sub_matatial="
				+ sub_matatial + ", base=" + base + ", taste_cola=" + taste_cola + ", taste_choco=" + taste_choco
				+ ", taste_fruit=" + taste_fruit + ", taste_coffee=" + taste_coffee + "]";
	}
	
	

}
