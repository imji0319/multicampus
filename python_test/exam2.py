month = int(input("당신이 좋아하는 월을 입력하세요 : "))

string = "당신은 %s을 좋아하는 군요!"

if month in (1,2,11,12):
    print(string %("겨울"))
elif month in (3,4,5):
    print(string %("봄"))
elif month in (6,7,8):
    print(string %("여름"))
else:
    print(string %("가을"))


