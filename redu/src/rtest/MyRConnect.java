package rtest;
import org.rosuda.REngine.Rserve.RConnection;
public class MyRConnect {
	RConnection conn = null;
	public  RConnection connect() {		
		try {
			conn =  new RConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public  void close() {
		if (conn != null)
			conn.close();
	}
}
