package rtest;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class RJavaText {
	public String getRVersion() {
		String result = "";
		try {
			RConnection conn = new RConnection();
			conn.assign("msg", "우리가 사용하는 R 버전");
			REXP x = conn.eval("info <- paste(iconv(msg, 'CP949','UTF-8'), ' : ', R.version.string); info");
			result = x.asString();
			conn.close();
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return result;
	}

	public double[] getDoubles1() {
		double[] result = null;
		try {
			RConnection conn = new RConnection();
			result = conn.eval("rnorm(20)").asDoubles();
			conn.close();
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return result;
	}

	public double[] getDoubles2() {
		double[] result = null;
		try {
			RConnection conn = new RConnection();
			double[] dataX = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
			conn.assign("x", dataX);
			conn.eval("y <- x + 10");
			result = conn.eval("y").asDoubles();
			conn.close();
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		} catch (REngineException e) {
			e.printStackTrace();
		} 
		return result;
	}

	public String[][] getDataFrame() {
		String[][] result = null;
		try {
			RConnection conn = new RConnection();
			conn.eval("col1<- c('test1', 'test2', 'test3', 'test4', 'test5')");
			RList list = conn.eval("df<-data.frame(col1,c(11:15));df").asList();
			int cols = list.size();
			
			result = new String[cols][];
			for (int i = 0; i < cols; i++) {
				result[i] = list.at(i).asStrings();
			}			
			conn.close();
		} catch (RserveException e) {
			e.printStackTrace();
		} catch (REXPMismatchException e) {
			e.printStackTrace();
		}
		return result;
	}
}