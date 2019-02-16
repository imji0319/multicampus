import re

lv=re.finditer("\d{3}", "abc 가나다 123 python3.7.2 aa9876@!!")    #정규식과 매치되는 모든 문자열(substring)을 iterator 객체로 리턴한다
for data in lv:
    print(data)
print("---------------------------")
lv=re.finditer("\w{3}", "abc 가나다 123 python3.7.2 aa9876@!!")    #정규식과 매치되는 모든 문자열(substring)을 iterator 객체로 리턴한다
for data in lv:
    print(data)
print("---------------------------")
lv=re.finditer("[a-z,A-Z]+", "abc 가나다 123 python3.7.2 aa9876@!!")    #정규식과 매치되는 모든 문자열(substring)을 iterator 객체로 리턴한다
for data in lv:
    print(data)

txt = "The rain in Spain"
x = re.search("^The.*Spain$", txt)

if (x):
    print("YES! We have a match!")
else:
    print("No match")    
  

str1 = "The rain in Spain"
x = re.findall("ai", str1)
print(x)

print("---------------------------")
phonenum_regex = re.compile('\d{3}-\d{3,4}-\d{4}')
mo = phonenum_regex.search('My number is 010-2222-3333')
print(mo.group())


print("---------------------------")
phonenum_regex1 = re.compile('(\d{3})-(\d{3,4}-\d{4})')
mo = phonenum_regex1.search('My number is 010-2222-3333')
print(mo.group())
print(mo.group(1))
print(mo.group(2))
print(mo.group(0))

print("---------------------------")
mo = phonenum_regex.search('Call1: 010-2222-3333, Call2: 010-3333-4444')
print(mo.group())

mo = phonenum_regex.findall('Call1: 010-2222-3333, Call2: 010-3333-4444')
print(mo)

mo = phonenum_regex1.findall('Call1: 010-2222-3333, Call2: 010-3333-4444')
print(mo)

print("---------------------------")
regex1 = re.compile('duke')
print(regex1.search('python java Duke R DUKE CSS duke').group())
print(regex1.findall('python java Duke R DUKE CSS duke'))
regex2 = re.compile('duke', 3) 
print(regex2.search('python java Duke R DUKE CSS duke').group())
print(regex2.findall('python java Duke R DUKE CSS duke'))
