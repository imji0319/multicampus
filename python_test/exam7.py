class Friends:

    def __init__(self,name="unico", phone="010-2222-3333", age=20):
        self.name = name
        self.phone = phone
        self.age = age

    def __str__(self):
        
        return ("이름 : {} , 전화번호 : {} . 나이 : {}".format(self.name,self.phone,self.age))

if __name__ == '__main__' :
   print(Friends())
   print(Friends("둘리","010-9999-8888",100))

        
