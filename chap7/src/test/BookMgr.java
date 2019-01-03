package test;

public class BookMgr extends Book{
	 
	 Book []booklist;
	 
	 BookMgr(Book[] booklist) {
		 this.booklist = booklist;
	 }
	 
	 void printBookList() {
		 for (int i=0 ; i<=4; i++){
			 System.out.println(booklist[i].getTitle());
		 }
	 }
	 
	 void printTotalPrice(){
		 int total=0;
		 for (int i=0; i<=4; i++) {
			 total += booklist[i].getPrice();
		 }
		 System.out.println(total);
	 }
}
