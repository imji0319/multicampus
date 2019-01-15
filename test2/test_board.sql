create table board( seq number(5) constraint board_seq_pk primary key,
					title varchar2(100),
					contents varchar2(4000),
					viewcount number(5));

insert into board (seq,title,contents,viewcount)values(1,'테스트제목','테스트내용입니다',0);

--commit; 

select * from board

select * from board where contents ='자바' or title ='자바'

select * from board where title like ('JA'||'VA')