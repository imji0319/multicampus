# 소스코드 1번 -----------------------------------------------------------
import urllib.request

res=urllib.request.urlopen("http://unico2013.dothome.co.kr/productlog.html")
print(type(res))
print(res.status)
res_header = res.getheaders()
print("[ header 정보 ]----------")
for s in res_header :
    print(s)
print("[ body 내용 ]-----------")
print(res.read())