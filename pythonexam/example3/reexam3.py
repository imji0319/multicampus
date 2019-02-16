import re
r=re.compile("[pP]")
# 못찾으면 None
print(r.search("apple")) 
print(r.match("apple")) 
print(r.match("apPle")) 
print(r.match("pP")) 
print("---------------------------")
print(re.search("[pP]","apPle"))
print(re.match("[pP]","pP"))
