package vo;

public class PersonalVO {
	int alcohol_grade;
	int taste_cola;
	int taste_choco;
	int taste_fruit;
	int taste_coffee;
	String base;
	public PersonalVO(int alcohol_grade, int taste_cola, int taste_choco, int taste_fruit, int taste_coffee,
			String base) {
		super();
		this.alcohol_grade = alcohol_grade;
		this.taste_cola = taste_cola;
		this.taste_choco = taste_choco;
		this.taste_fruit = taste_fruit;
		this.taste_coffee = taste_coffee;
		this.base = base;
	}
	public PersonalVO() {
		
	}
	public int getAlcohol_grade() {
		return alcohol_grade;
	}
	public void setAlcohol_grade(int alcohol_grade) {
		this.alcohol_grade = alcohol_grade;
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
	public String getBase() {
		return base;
	}
	public void setBase(String base) {
		this.base = base;
	}
	
	
}
