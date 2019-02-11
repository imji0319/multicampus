package rtest;
import org.rosuda.REngine.Rserve.RConnection;
public class WordCloud2 {
	public String returnWC2() {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(wordcloud2)");		
			r.eval("library(htmltools)");			
			r.eval("my_cloud <- wordcloud2(demoFreq, size = 1.1, color = 'random-light')");
			r.eval("my_path <- renderTags(my_cloud)");
			retStr = r.eval("my_path$html").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
}
