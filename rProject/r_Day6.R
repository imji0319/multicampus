install.packages("ggmap")
library(ggmap)
lon <- 127.0147559
lat <- 37.5431424
cen <- c(lon,lat)
mk <- data.frame(lon=lon, lat=lat)

#구글 개발자 등록 후 key 받아야함 
register_google(key="AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY")

#로드
map <- get_googlemap(center=cen, source="google", maptype="roadmap",zoom=12, marker=mk)
ggmap(map)

#위성지도
map <- get_googlemap(center=cen, source="google", maptype="satellite",zoom=14, marker=mk)
ggmap(map)


map <- get_googlemap(center=cen, source="google", maptype="terrain",zoom=8, marker=mk)
ggmap(map)


#지역코드
mk <- geocode("seoul", source = "google")  #dsk")
print(mk)

cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, source="google", maptype="roadmap",zoom=12, marker=mk)
ggmap(map)

#지역코드 한글 사용 : enu2utf8
mk <- geocode(enc2utf8("부산"), source = "google") #source = "dsk")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, source="google", maptype="roadmap",zoom=12, marker=mk)
ggmap(map)


#도로명 주소 지원 
mk <- geocode(enc2utf8("서울특별시 강남구 역삼동 테헤란로 212"), source = "google")
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, source="google", maptype="roadmap",zoom=15, marker=mk)
ggmap(map)


# 공공 DB 활용 

install.packages("XML")
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "402"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc) ; top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")); df
busRouteId <- df$busRouteId
busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")); 

df



# 구글 맵에 버스 위치 출력
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=df$gpsX, lat=df$gpsY);gc
cen <- c(mean(gc$lon), mean(gc$lat))
map <- get_googlemap(center=cen, key="AIzaSyD-nx_y7aBlJgfgVZRaIwMbnShQJsxpryY", source="google", maptype="roadmap",zoom=12, marker=gc)
ggmap(map)


library(dplyr)
df <- read.csv("전국전기차충전소표준데이터.csv", stringsAsFactors=F)       
str(df) 
head(df)

df_add <- as.data.frame(df[,c("경도","위도")])
head(df_add)
names(df_add) <- c("lon", "lat")
head(df_add)


table(is.na(df_add$lat))
table(is.na(df_add$lon))
table(is.na(df_add))

map_korea <- get_map(location="southKorea", zoom=7, 
                     maptype="roadmap")       

ggmap(map_korea)
ggmap(map_korea)+geom_point(data=df_add, aes(x=lon, y=lat), alpha=0.5, size=2, color="red")


map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")       
ggmap(map_seoul)+geom_point(data=df_add, aes(x=lon, y=lat), alpha=0.5, size=5, color="blue")



install.packages('leaflet')
library(leaflet)
library(dplyr)
setwd("C:/Users/student/Documents/multicampus/rProject")
seoul_lonlat = unlist(geocode('seoul', source='google'))
names(seoul_lonlat) <- NULL
wifi_data = read.csv('datafile/wifi_data.csv', stringsAsFactors = FALSE)
str(wifi_data)
head(wifi_data)
tail(wifi_data)
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addTiles() %>% 
  addCircles(lng = ~경도, lat=~위도)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~경도, lat=~위도)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addCircles(lng = ~경도, lat=~위도)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~경도, lat=~위도, popup = ~설치장소명)

content <- paste(sep = "<br/>",
                 "<b><a href='https://www.seoul.go.kr/main/index.jsp'>서울시청</a></b>",
                 "아름다운 서울",
                 "박원순 시장님 화이팅"
)

leaflet() %>% addTiles() %>%
  addPopups(126.97797,  37.56654, content,
            options = popupOptions(closeButton = FALSE)
  )

leaflet() %>% setView(-118.456554, 34.09, 13) %>%
  addTiles() %>%
  addMarkers(
    lng = -118.456554, lat = 34.105,
    label = "Default Label",
    labelOptions = labelOptions(noHide = T)) %>%
  addMarkers(
    lng = -118.456554, lat = 34.095,
    label = "Label w/o surrounding box",
    labelOptions = labelOptions(noHide = T, textOnly = TRUE)) %>%
  addMarkers(
    lng = -118.456554, lat = 34.085,
    label = "label w/ textsize 15px",
    labelOptions = labelOptions(noHide = T, textsize = "15px")) %>%
  addMarkers(
    lng = -118.456554, lat = 34.075,
    label = "Label w/ custom CSS style",
    labelOptions = labelOptions(noHide = T, direction = "bottom",
                                style = list(
                                  "color" = "red",
                                  "font-family" = "serif",
                                  "font-style" = "italic",
                                  "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                  "font-size" = "12px",
                                  "border-color" = "rgba(0,0,0,0.5)"
                                )))



