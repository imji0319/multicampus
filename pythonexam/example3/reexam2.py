import re
r=re.compile("[ab]")
# 못찾으면 None
print(r.search("pizza")) # a 또는 b가 포함되어 있으면 결과 나옴
print(r.match("pizza")) # a 또는 b로 시작해야 결과 나옴

