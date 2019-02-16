# 소스코드 12번 -----------------------------------------------------------
import requests

req = requests.get('http://unico2013.dothome.co.kr/productlog.html')

html = req.text
header = req.headers
status = req.status_code
is_ok = req.ok

print(html)
print("----------------------------------------------------------")
print(header)
print("----------------------------------------------------------")
print(status)
print("----------------------------------------------------------")
print(is_ok)
print("----------------------------------------------------------")