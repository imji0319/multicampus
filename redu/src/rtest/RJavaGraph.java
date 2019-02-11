package rtest;

import org.rosuda.REngine.Rserve.RConnection;

public class RJavaGraph {
	public byte[] returnRImg1() {
		RConnection r = null;
		byte retImg[] = null;
		try {
			r = new RConnection();
			r.eval("setwd('C:/Users/student/Documents/multicampus/rProject')");
			r.eval("jpeg('test.jpg')");
			r.eval("x <- 1:10");
			r.eval("barplot(x, names='SALES', col=rainbow(15))");
			r.eval("dev.off()");
			r.eval("r=readBin('test.jpg','raw',1024*1024)");
			r.eval("unlink('test.jpg')");
			retImg = r.eval("r").asBytes();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg;
	}

	public byte[] returnRImg2() {
		RConnection r = null;
		byte retImg[] = null;
		try {
			r = new RConnection();
			r.eval("library(DBI)");
			r.eval("library(RJDBC)");
			r.eval("library(rJava)");
			r.eval("setwd('C:/Users/student/Documents/multicampus/rProject')");
			r.eval("drv <- JDBC('oracle.jdbc.driver.OracleDriver','ojdbc6.jar')");
			r.eval("conn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521:xe', 'javatest','javatest')");
			r.eval("result <- dbGetQuery(conn, 'select * from productlog')");
			r.eval("data_p <- table(result$PID)");
			r.eval("data_t <- table(substr(result$CLICK_TIME,9,10)) ");
			r.eval("jpeg('test.jpg')");
			r.eval("par(mfrow=c(1,2))");
			r.eval("pie(data_p, radius = 1, col=rainbow(10))");
			r.eval("barplot(data_t, col=terrain.colors(10))");
			r.eval("dev.off()");
			r.eval("r=readBin('test.jpg','raw',1020*1020)");
			r.eval("unlink('test.jpg')");
			retImg = r.eval("r").asBytes();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg;
	}
	
	public byte[] returnRImg3() {
		RConnection r = null;
		byte retImg[] = null;
		try {
			r = new RConnection();
			r.eval("library(ggplot2)");
			r.eval("setwd('C:/Users/student/Documents/multicampus/rProject')");
			r.eval("product_click <-read.table('datafile/product_click.log')");
			r.eval("colnames(product_click)<- c('date','id')");
			r.eval("color_cnt <- unique(product_click$id)");

			r.eval("chart<-ggplot(data=product_click,aes(x=id))+geom_bar(fill=rainbow(length(color_cnt)))");
			r.eval("ggsave('clicklog.png', chart)");
			r.eval("r=readBin('clicklog.png','raw',1024*1024)");
			r.eval("unlink('clicklog.png')");
			retImg = r.eval("r").asBytes();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg;
	}

	public byte[] returnRImg4() {
		RConnection r = null;
		byte retImg[] = null;
		try {
			r = new RConnection();
			r.eval("setwd('C:/Users/student/Documents/multicampus/rProject')");
			r.eval("jpeg('test.jpg')");
			r.eval("library(KoNLP)");
			r.eval("library(rJava)");
			r.eval("library(XML)");
			r.eval("library(wordcloud)");
			r.eval("t <- htmlParse('http://hankookilbo.com')");
			r.eval("content<- xpathSApply(t,\"//p[@class='title']\", xmlValue)");
			r.eval("content <- gsub('[[:punct:][:cntrl:]]', '', content)");
			r.eval("useSejongDic()");
			r.eval("word <- sapply(content,extractNoun,USE.NAMES=F)");
			r.eval("cdata <- unlist(word)");
			r.eval("cdata <- Filter(function(x) {nchar(x) >= 2} ,cdata)");
			r.eval("wordcount <- table(cdata)");
			r.eval("wordcount <- head(sort(wordcount, decreasing=T),20)");
			r.eval("wordcloud(names(wordcount),freq=wordcount,scale=c(4,1),"
					+ "rot.per=0.35,min.freq=1,random.order=F,random.color=T,colors=rainbow(20))");
			r.eval("dev.off()");
			r.eval("r=readBin('test.jpg','raw',1020*1020)");
			r.eval("unlink('test.jpg')");
			retImg = r.eval("r").asBytes(); 
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retImg;
	}

}
