
def studentinfo(name, sub1="자바프로그래밍",sub2= "SQL", sub3="웹프로그래밍",
                sub4="LINUX와Hadoop", sub5="R",sub6="PYTHON"):

    return ("%s가 학습한 교육과정 : %s, %s, %s, %s, %s, %s"
            %(name,sub1,sub2,sub3,sub4,sub5,sub6))

    
print (studentinfo("임지혜"))

print (studentinfo("둘리","자바프로그래밍","안드로이드","웹프로그래밍","LINUX와Hadoop",
                   "R","CSS3"))


