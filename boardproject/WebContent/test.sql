create table board(
	boardseq number(10) primary key,
	boardtitle varchar2(100) not null,
	boardcontents varchar2(4000),
	boardwriter varchar2(100),
	boardtime date,
	boardviewcount number(10)
);

select * from board;

insert into board values(1,'게시판 개설','환영합니다','hr',sysdate, 0);
insert into board values(2,'게시판 개설 축하','환영합니다','html5',sysdate, 0);
insert into board values(3,'게시판 프로젝트 할 사람 구해요','저요 저요','oracle',sysdate, 0);

insert into board values((select max(boardseq)+1 from board),'게시판 프로젝트 업데이트','끝나지 않아요','html',sysdate, 0);
insert into board values((select max(boardseq)+1 from board),'프로젝트 ','프로젝트 확장중','r',sysdate, 0);
insert into board values((select max(boardseq)+1 from board),'python프로젝트','다음주부터 pytho시작합니다.','python',sysdate, 0);
insert into board values((select max(boardseq)+1 from board),'공지사항','공지사항','admin',sysdate, 0);
insert into board values((select max(boardseq)+1 from board),'재공지사항','공지사항수정','system',sysdate, 0);
insert into board values((select max(boardseq)+1 from board),'프로그래밍언어기초','기본인 C언어부터 시작합니다.','c언어',sysdate, 0);



select * from board

create table member( id varchar2(10) constraint member_id_pk primary key,
					password number(12) constraint member_pw_nn not null,
					name varchar2(30),
					phone varchar2(20) constraint member_phone_ck check(phone like '010%') ,
					email varchar2(25) constraint member_email_uk unique,
					indate date);
					
				
select * from member



insert into member(id, password, name, phone, email, indate)
		values('oracle',11111,'홍길도','010-1452-4152','tbjh@multi.com',sysdate); 


insert into member(id, password)
		values('python',11111)
		
insert into member(id, password, name, phone, email, indate)
		values('r',11111,NULL,NULL,NULL,NULL); 			
		
insert into member(id, password)
		values('hr',11111)
				
insert into member
		values('html5',11111,'이자바','010-1452-4152','orda1@multi.com',sysdate); 

insert into member(id, password,name)
		values('admin',11111,'관리자1')
insert into member(id, password,name)
		values('system',11111,'관리자2')
insert into member(id, password)
		values('c언어',11111)

select X.rnum, X.boardseq, X.boardtitle, X.boardcontents, X.boardwriter
from (select rownum as rnum, A.boardseq, A.boardtitle, A.boardcontents, A.boardwriter
	  from (select boardseq, boardtitle, boardcontents,boardwriter
			from board order by boardseq) A
	  where rownum <15 ) X
where X.rnum > 5;



















