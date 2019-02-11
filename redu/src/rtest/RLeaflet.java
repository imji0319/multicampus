package rtest;
import org.rosuda.REngine.Rserve.RConnection;
public class RLeaflet {	
	public String returnLeaflet1(String path, String type)  {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection(); 
			r.eval("library(dplyr)");
			r.eval("library(tmap)");
			r.eval("library(leaflet)");
			r.eval("library(Kormaps)");
			r.eval("library(htmltools)");
			r.eval("crime <- read.csv('C:/Users/student/Documents/multicampus/rProject/datafile/2017crime.csv')");

			r.eval("Encoding(names(korpopmap2))<-'UTF-8'");
			r.eval("Encoding(korpopmap2@data$name)<-'UTF-8'");
			r.eval("Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'");
			
			r.eval("korpopmap2@data <- korpopmap2@data[-26:-251,]");
			r.eval("korpopmap2@polygons<-korpopmap2@polygons[-26:-251]");
			
			r.eval("mymap <- korpopmap2@data");
			r.eval("palette1<-colorNumeric(palette = 'Oranges', domain = crime$살인_발생)");
			r.eval("popup1 <- paste0(mymap$name,'<br> 살인 : ',crime$살인_발생, '건')");
			r.eval("palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)");
			r.eval("popup2 <- paste0(mymap$name,'<br> 폭력 : ',mymap$폭력_발생, '건')");
			r.eval("palette3<-colorNumeric(palette = 'Reds', domain = crime$범죄_발생_총합)");
			r.eval("popup3 <- paste0(mymap$name,'<br> 총 범죄 건수 : ',crime$범죄_발생_총합, '건')");
			
			String baseMap = "map1<-leaflet(korpopmap2)%>%" + "addTiles()%>%"
					+ "setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%";
			if(type.equals("살인"))
				r.eval(baseMap
					+ "addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup1, color=~palette1(crime$살인_발생), group='살인')");
			
			else if(type.equals("폭력"))
				r.eval(baseMap
					+ "addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2,color=~palette2(crime$폭력_발생),group='폭력')");
			else
				r.eval(baseMap
					+ "addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3,color=~palette3(crime$범죄_발생_총합),group='총 범죄')");

			String fileName = path + "/index.html";
			String libPath = path + "/lib";
			r.eval("save_html(map1,'" + fileName + "', libdir = '" + libPath + "')");
			retStr = r.eval("'index.html'").asString();
		
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close(); 
		}
		return retStr;
	}	
	public String returnLeaflet2(String path)  {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(leaflet)");
			r.eval("library(dplyr)");
			r.eval("library(htmltools)");
			r.eval("library(ggmap)");
			r.eval("register_google(key='AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY')");
			r.eval("mk <- geocode(enc2utf8('서울특별시 강남구 역삼동 테헤란로 212'), source = 'google')");
			r.eval("lan <- mk$lon");
			r.eval("lat <- mk$lat");
			r.eval("msg <- '<strong><a href=http://www.multicampus.co.kr style=text-decoration:none >멀티캠퍼스</a></strong><hr>우리가 공부하는 곳'");
			r.eval("map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 14) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )");
			String fileName = path + "/index.html";
			String libPath = path + "/lib";

			r.eval("save_html(map2,'" + fileName + "', libdir='" + libPath + "')");
			retStr = r.eval("'index.html'").asString();
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
	public String returnLeaflet3(String path)  {
		RConnection r = null;
		String retStr = "";
		try {
			r = new RConnection();
			r.eval("library(leaflet)");
			r.eval("library(dplyr)");
			r.eval("library(htmltools)");
			r.eval("content <- paste(sep = '<br/>',\"<b><a href='https://www.seoul.go.kr/main/index.jsp'>서울시청</a></b>\",'아름다운 서울','박원순 시장님 화이팅')");
			r.eval("map3<-leaflet() %>% addTiles() %>%  addPopups(126.97797,  37.56654, content, options = popupOptions(closeButton = FALSE) )");
		    String fileName = path+"/index.html";
	        String libPath = path + "/lib";
	   	     
			r.eval("save_html(map3,'"+fileName+"', libdir='"+libPath+"')");	        
			String s = r.eval("'index.html'").asString();
			return s;
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		} finally {
			r.close();
		}
		return retStr;
	}
}
