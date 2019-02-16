import re
r=re.compile("[abcd]")
# 못찾으면 None
print(r.search("pizza")) 
print(r.search("bread")) 
print(r.search("mashroom")) 
print("---------------------------")

print(re.search("[^ap]","apple")) 
print(re.search("[^ab]","bread")) 
print(re.search("[^ab]","orange")) 

print("---------------------------")

print(re.search("[a-g]","apple")) 
print(re.search("[0-5]","123678")) 
print(re.search("[가-사]","강원도에서")) 
print("---------------------------")

print(re.search("\d+","햄버거가 무려 7000 원이나 하다니!!")) 
result = re.search("\d+","햄버거가 무려 7000 원이나 하다니!!")
print(result.start())
print(result.end())
print(result.span())
print(result.group())