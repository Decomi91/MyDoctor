drop table reservation cascade constraints

create table reservation(
	reserveNo		number(10) primary key,
	id				varchar2(15) references members(id),
	name			varchar2(15) not null,
	hosid			varchar2(15) references hospitals(id),
	hosname			varchar2(15) not null,
	disease			varchar2(100) not null,
	reserveTime		date,
	acceptance		number(1) default 0
)

insert into reservation
values(2, 'test', 'testing', 'testing', 'hospital', 'kk', sysdate, '1');

insert into reservation
values(3, 'test', 'testing', 'testing', '토마토치과', 'kk', sysdate, '0');
insert into reservation
values(4, 'test', 'testing', 'testing', '밝은이안과', 'kk', sysdate, '-1');
insert into reservation
values(5, 'test', 'testing', 'testing', '땡땡병원', 'kk', sysdate, '0');

insert into reservation
values(8, 'test', 'testing', 'testing', '가나다병원', 'kk', sysdate, '0');
insert into reservation
values(6, 'test', 'testing', 'testing', '123병원', 'kk', sysdate, '0');
insert into reservation
values(7, 'test', 'testing', 'testing', '덕산병원', 'kk', sysdate, '1');
insert into reservation
values(9, 'test', 'testing', 'testing', '덕산병원', 'kk', sysdate, '2');

insert into reservation
values(10, 'test', 'testing', 'testing', '덕산병원', 'kk', sysdate, '0');

select * from reservation;
drop table reservation;

select count(case when acceptance=1 then 1 else null end), 
count(case when acceptance=0 then 1 else null end), 
count(case when acceptance=-1 then 1 else null end)
from (select hosid, acceptance 
		from reservation
		where hosid = 'gong1' and to_Char(sysdate,'yyyymmdd') = to_char(sysdate, 'yyyymmdd'))


