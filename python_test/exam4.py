
gugudan = int(input("구구단 입력 : "))

print("1. 구구단 전체 출력")
for i in range(1,gugudan+1):
    for j in range(1,10):
        print("%i x %i = %i" %(i,j,i*j))
        
print("2. 입력된 값의 단만 출력")

for j in range(1,10):
    print("%i x %i = %i" %(gugudan,j,i*j))
        
