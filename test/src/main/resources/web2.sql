create table board(
	boardnum number primary key
	,id varchar2(20) not null
	,title varchar2(100) not null
	,content varchar2(2000) not null
	,inputdate date default sysdate
	,hits number default 0
	,originalfile varchar2(200)
	,savedfile varchar2(200)
	);

create sequence board_seq start with 1 increment by 1;

alter table board add constraint fk_board foreign key (id) references person(id);

select b.boardnum, p.name as id, b.title, b.content, b.inputdate, b.hits, b.originalfile, b.savedfile
		 from board b, person p where b.id = p.id order by b.boardnum desc;
		 
		 update board set hits = hits+1 where boardnum = #{boardnum};
		 
		 select count(boardnum) as totalRecordsCount from board