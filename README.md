# R과 Python을 활용한 빅데이터 전문가 양성 과정 
청년취업아카데미 (멀티캠퍼스, 2018.12.24 ~ 2019.02.28 )

### 1. PROGRAM
- java
  * javascript
  * servlet
  * jsp
  * jquery
  * ajax 
- SQL
  * Oracle
  * jdbc 
- HTML + CSS
- linux
- Hadoop
- R 
- Python

---

## 2. PROJECT 

## 2.1 Mini Project 
: boardproject - 미니 프로젝트로 게시판 웹페이지 프로젝트를 진행. 

### 프로젝트내용
게시판 페이지를 운영하기 위해 게시물 작성, 수정, 삭제 기능과 게시판 목록을 나타내는 기본 기능을 포함하여야 하며 <br/>
이후 로그인 기능과 검색 기능을 추가로 생성함. <br/>
게시물의 수가 많아졌을 경우에 대해 페이징 처리기능 추가함.

#### 기능 
- 로그인 
- 게시판 리스트 
- 게시글 작성
- 게시글 수정 
- 게시글 삭제
- 게시글 검색 

#### 구성   
- DAO
  * loginBoard
  * getBoardList
  * getBoardDetail
  * selectBoard
  * insertBoard
  * updateBoard
  * deleteBoard
  * getTotalBoard
  
- VO
  * BoardVO
  
- WebPage src
  


## 2.2 Final Project
: cockproject

### 프로젝트 내용
칵테일 바를 창업한다고 가정.<br/>
바에서 고객들에게 제공할 서비스 중 하나로 **칵테일 추천 서비스** 시스템을 개발. <br/>
**칵테일 추천 서비스**는 고객의 선호 요소를 입력받아 필터링 프로그램을 통해 고객맞춤 칵테일을 추천.



#### 데이터
웹크롤링을 통해 데이터 수집 (R)
- doopedia 칵테일 데이터 
- Daum 칵테일 백과 조회수 기준 5Page : 100개 
- daum & doopedia 데이터 merge (by daum 칵테일 이름)
- twitter 
- Naver 

**CockTable**

| column | desc | feature |
| ------ | -----| ------- |
| `cock_id` | 칵테일 ID |primary key |
| `cockname` | 칵테일 이름 |NOT NULL |
| `alcohol` | 알코올 도수 | |
| `alcohol_grade`| 알코올 등급| NOT NULL |
| `base` | 베이스 | |
| `taste` | 맛 | |
| `taste_cola`| 콜라맛 | 0 or 1  |
| `taste_choco` | 초콜릿맛 | 0 or 1 |
| `taste_fruit` | 과일맛 | 0 or 1 |
| `taste_coffee` | 커피맛 | 0 or 1 |
| `contents` | 기타 설명 | |

**MemberTable**

| column | desc  | feature |
| ------ | ----- | ------- |
| `name` | 이름 | NOT NULL |
| `phone` | 전화번호 | primary key |
| `choice_1` | 주문이력1 | cock_id 값 |
| `choice_2` | 주문이력2 | cock_id 값 |
| `choice_3` | 주문이력3 | cock_id 값 |
| `choice_4` | 주문이력4 | cock_id 값 |  
| `choice_5` | 주문이력5 | cock_id 값 |  
  
#### 기능 
- 회원가입
- 로그인 
- 전체 리스트 / 개인 추천 / BEST 칵테일 중 선택 기능 
- 전체 칵테일 리스트 출력
- 개인 취향 선택 기능
- 칵테일 개인 맞춤 추천 
- 해당 메뉴별 칵테일 리스트 출력
- 장바구니
- 주문 

#### 구성 
- DAO
  * getAllList
  * getBestList
  * getPersonalList
  * login
  * insertMember
  * updateMember
  * orderCock
  
- VO
  * MemberVO
  * CocktailVO

- JSP 
  * 전체 List : all.jsp
  * 개인 추천 List : personal.jsp
  * BEST List : best.jsp
  
- image 
  * 칵테일 이미지 사진 저장 





