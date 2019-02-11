package app;

import org.rosuda.REngine.REXP;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RServeExample {
	public static void getString() throws RserveException, REXPMismatchException {
		RConnection rc = new RConnection();
		REXP x = rc.eval("setwd('C:/Users/student/Documents/multicampus/rProject')");
		x = rc.eval("getwd()");
		System.out.println("워킹디렉토리 : " + x.asString());
		rc.close();
	}
	public static void getInteger() throws RserveException, REXPMismatchException {
		RConnection rc = new RConnection();
		REXP x = rc.eval("length(LETTERS)");
		System.out.println("알파벳 갯수 : " + x.asInteger());
		rc.close();
	}

	public static void getDoubles() throws RserveException, REXPMismatchException {
		RConnection rc = new RConnection();
		REXP x = rc.eval("rnorm(20)");
		double[] d = x.asDoubles();
		for (int i = 0; i < d.length; i++) {
			System.out.println(d[i]);
		}
		rc.close();
	}

	public static void getIntegers() throws REngineException, REXPMismatchException {
		RConnection rc = new RConnection();
		double[] dataX = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
		rc.assign("x", dataX);
		rc.eval("y <- x + 10");
		int[] resultX = rc.eval("y").asIntegers();
		for (int i = 0; i < resultX.length; i++) {
			System.out.println(resultX[i]);
		}
		rc.close();
	}

	public static void getDataFrame1() throws RserveException, REXPMismatchException {
		RConnection rc = new RConnection();
		REXP x = rc.eval("d<-data.frame(LETTERS[11:20],c(11:20), stringsAsFactors=F)");
		RList list = x.asList();   //dataframe -> asList()
		int v_size = list.size();
		int d_length = list.at(0).length();
		System.out.println("데이터(관측치)의 갯수 : " +d_length);
		System.out.println("변수의 갯수 : " +  v_size);
		
		int arrayRows =  v_size;
		int arrayCols =d_length;
		String[][] s = new String[arrayRows][];  // 데이터프레임의 변수 갯수로 행의 크기를 정한다.

		for (int i = 0; i < arrayRows; i++) {
			s[i] = list.at(i).asStrings();			
		}

		for (int i = 0; i < arrayRows; i++) {
			for (int j = 0; j < arrayCols; j++) {
				System.out.print(s[i][j]+"\t");
			}
			System.out.println();
		}
		rc.close();
	}
	public static void getDataFrame2() throws RserveException, REXPMismatchException {
		RConnection rc = new RConnection();
		REXP x = rc.eval("imsi<-source('C:/Users/student/Documents/multicampus/rProject/test.R'); imsi$value");
		RList list = x.asList();
		
		String pid = list.at("product").asString();	
		System.out.print("PID : " + pid);
		
		int clickcount = list.at("clickcount").asInteger();	
		System.out.println("\tCLICKCOUNT : " +clickcount);		
		rc.close();
	}

	public static void main(String[] args) throws REXPMismatchException, REngineException {
		System.out.println("------------ R에서 버젼정보 가져오기 --------------");
		RServeExample.getString();
		System.out.println("------------ R에서 정수 데이터 가져오기 --------------");
		RServeExample.getInteger();
		System.out.println("------------ R에서 더블 데이터들 가져오기 -------------");
		RServeExample.getDoubles();
		System.out.println("------------  R에서 데이터 주입 연산후 가져오기 ------");
		RServeExample.getIntegers();
		System.out.println("------------  R에서 데이터 생성(데이터 프레임) 연산후 가져오기------");
		RServeExample.getDataFrame1();
		System.out.println("------------ R에서 데이터 프레임 가져오기 --------------");
		RServeExample.getDataFrame2();

	}
}

