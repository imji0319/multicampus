# 소스코드 7번 -----------------------------------------------------------
import urllib.parse

def input_query1() :
    q=input("검색어를 입력하세요 : ")
    return "query&"+q


def input_query2() :
    q=input("검색어를 입력하세요 : ")
    return "query&"+urllib.parse.quote_plus(q)


result1 = input_query1()
print("인코딩 처리 전 : " + result1)

result2 = input_query2()
print("인코딩 처리 후 : " + result2)
