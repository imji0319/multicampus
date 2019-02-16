
from exam7 import Friends

class BestFriend(Friends):
    
    def __init__(self,email="unicodaum@hanmail.net"):
        super().__init__(name,phone,age)
        
        self.email=email

    def __str__():
        return super().__str__()+"메일 주소 : {}".format(self.email)
        #return ("이름 : {} , 전화번호 : {} , 나이 : {}, 메일 주소: {}".format(self.name, self.phone, self.age, self.email))


    def getName():

        return (self.name)
    
    def getPhone():

        return (self.phone)

    def getAge():

        return (self.age)

    def getEmail():

        return (self.email)

print(Friends("둘리","010-9999-8888",100))
print(BestFriend())
print(BestFriend("둘리","010-9999-8888",100, "duly@haha"))

bf = BestFriends("고길동","duly@haha")

print(df.getName())
print(df.getEmail())
print(df.getPhone())
