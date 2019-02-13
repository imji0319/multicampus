def sum_all(*n):

    total=0
    for i in n:
        if i < 0:
            return ("결과가 없어요 ㅠㅠ ")
        else:
           total+=i

    return ("합산 : %i" %(total))


            
    
