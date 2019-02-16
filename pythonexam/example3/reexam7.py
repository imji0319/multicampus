import re

print(re.findall("\d+","서진수는 1975년 10월 23일 입니다 ^^")) 
print("---------------------------")
print(re.split('[:]+', "Apple Orange : Grape Cherry"))
print(re.split('[: ]+', "Apple Orange : Grape Cherry"))
print("---------------------------")
print(re.sub('-' ,'**' , '751023-1901813'))
print("---------------------------")
url="http://www.ar_eum.com"
print(re.split('[/]', url))
print("---------------------------")
print(re.search("[^\w\s]+", "python is very fun!!"))
print(re.escape('python.exe'))
