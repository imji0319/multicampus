import re
r=re.compile("a.c")
# 못찾으면 None
print(r.search("abc")) 
print(r.search("afc")) 
print(r.search("ac")) 
print("---------------------------")
r=re.compile("ck?w")
# 못찾으면 None
print(r.search("cw")) 
print(r.search("ckw")) 
print(r.search("ckkw")) 
print(r.search("ckk")) 
print(r.search("kkkw")) 
print("---------------------------")
r=re.compile("ck*w")
# 못찾으면 None
print(r.search("cw")) 
print(r.search("ckw")) 
print(r.search("ckkw")) 
print(r.search("ckk")) 
print(r.search("kkkw")) 
print("---------------------------")
r=re.compile("ck+w")
# 못찾으면 None
print(r.search("cw")) 
print(r.search("ckw")) 
print(r.search("ckkw")) 
print(r.search("ckk")) 
print(r.search("kkkw")) 

