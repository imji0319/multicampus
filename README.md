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
  
---

## 2.2 Final Project
: cockproject

### 프로젝트 내용
칵테일 바를 창업한다고 가정.<br/>
바에서 고객들에게 제공할 서비스 중 하나로 **칵테일 추천 서비스** 시스템을 개발. <br/>
**칵테일 추천 서비스**는 고객의 선호 요소를 입력받아 필터링 프로그램을 통해 고객맞춤 칵테일을 추천.


**< PROJECT PROCESS >**

![process_img2](https://user-images.githubusercontent.com/34160245/52607184-a6def300-2eb8-11e9-9686-5ce8428e3799.jpg)



#### 데이터
웹크롤링을 통해 데이터 수집 (R)
- Daum 칵테일 백과 조회수 기준 5Page : 100개 

Instagram 태그값 
: 칵테일 기본 Best 메뉴 지정을 위한 데이터로 인스타 tag의 개수로 지정
- 0 ~ 200000 사이의 값으로 나타나 정규화를 거쳐 정규분포상의 값으로 변경하고 이에 10을 곱하여 초기값 생성 


### DB table
**Cocktail** </br>
: cocktail table로 daum 백과사전 데이터 기반 

| column | desc | feature |
| ------ | -----| ------- |
| `cock_id` | 칵테일 ID |primary key |
| `cockname` | 칵테일 이름 |NOT NULL |
| `alcohol` | 알코올 도수 | |
| `alcohol_grade`| 알코올 등급| NOT NULL |
| `main_matarial`| 주재료 | |
| `sub_matarial`| 부재료 | |
| `base` | 베이스 | |
| `taste_cola`| 콜라맛 | 0 or 1  |
| `taste_choco` | 초콜릿맛 | 0 or 1 |
| `taste_fruit` | 과일맛 | 0 or 1 |
| `taste_coffee` | 커피맛 | 0 or 1 |

**Membertable** </br>
: 고객의 정보를 저장하는 table

| column | desc  | feature |
| ------ | ----- | ------- |
| `name` | 이름 | NOT NULL |
| `phone` | 전화번호 ||
| `choice` | 주문이력 | cock_id 값 |
| `order_data`| 주문날짜 | sysdate |

**Cocktail_Best** </br>
: Instagram 의 태그값을 기본으로 각 칵테일별 출현빈도수 Table로 이후 주문이력에 따라 빈도수 변화


| column | desc  | feature |
| ------ | ----- | ------- |
| `cock_id` | 칵테일 ID |primary key , foreign key (Cocktail)|
| `cockname` | 칵테일 이름 | NOT NULL |
| `frequecy` | 빈도수 | 태그값의 정규화 * 10 |


**Basketorder** </br>
: 장바구니 table로 임시 데이터베이스. 주문이 되면 그 값은 Membertable로 넘어가고 이 테이블의 값은 전부 delete

| column | desc  | feature |
| ------ | ----- | ------- |
| `cock_id` | 칵테일 ID | foregin key (Cocktail) |
| `ordertime` | 주문시간 | 장바구니 테이블에 저장되는 시간 |


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
  + CockDAO
    * getAllList
    * getBaseList
    * getPersonalList
    * getTotalCock
    * getBestList
    * addBasketList
    * deleteBasketList
    * getBasketList
    * getOrderList
  
  + MemberDAO
    * insertBoard
    * login
    * updateMemberChoice

- VO
    * MemberVO
    * CocktailVO
    * BestVO
    * PersonalVO
    * BasketVO

- Servlet 
    * BasketList
    * BasketListReset
    * DeleteItemBasket
    * BasketOrder
    * BasketListToBest
    * BasketListToPersonal

- JSP 
    * 첫 페이지 : homepage.jsp
    * 회원가입 : insertform.jsp , insertresult.jsp
    * 로그인 확인 : logincheck.jsp 
    * 전체 메뉴 : everyList.jsp
    * 전체 List : all_list.jsp
    * 개인 선호도 입력 : personal.jsp
    * 개인 추천 List : personal_list.jsp
    * BEST List : bestlist.jsp
    * Base 별 List : base.jsp
    * 장바구니 : basket.jsp
    * 주문 완료 : finally.jsp
  
- image 
    * 칵테일 이미지 사진 저장 





