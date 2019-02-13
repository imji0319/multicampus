
incoin = int(input("투입한 돈 : "))
price = int(input("물건값 : "))

charge = incoin-price
print ("거스름돈 : ",charge)
print ("500원 동전의 개수 : ", charge//500)
print ("100원 동전의 개수 : ", charge%500//100)
