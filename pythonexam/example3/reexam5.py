import re
r=re.compile("^c")
# 못찾으면 None
print(r.search("ckw")) 
print(r.search("sjs")) 
print("---------------------------")
r=re.compile("e$")
# 못찾으면 None
print(r.search("apple")) 
print(r.search("banana")) 