# 소스코드 15번 -----------------------------------------------------------
import tweepy

api_key = "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret = "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token = "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret = "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"

auth = tweepy.OAuthHandler(api_key, api_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)

keyword = "미세먼지";      
search = []   

cnt = 1
while(cnt <= 10):   
    tweets = api.search(keyword)
    for tweet in tweets:
        search.append(tweet)
    cnt += 1

print(len(search)) # 문서 길이 
print(search[0]) # 첫번째 text 보기 

#전체 문서 내용을 딕셔너리에
data = {}   
i = 0       # 문서 번호
for tweet in search:
    data['text'] = tweet.text   # text키에 text문서 저장
    print(i, " : ", data)   # 문서번호 : 문서내용
    i += 1



