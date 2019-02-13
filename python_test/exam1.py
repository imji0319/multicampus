

mydic={"java":"OOP 기반의 범용 언어",
       "javascript":"웹앱개발언어",
       "R":"통계/분석처리 언어",
       "python":"다목적으로 활용 가능한 스크립트 언어"}


for i in mydic.keys():
    print(i)


for i in mydic.values():
    print(i)

for (i,j) in mydic.items():
    print("%s - %s" %(i,j))
