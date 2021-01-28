drop table reservation cascade constraints

create table reservation(
	reserveNo		number(10) primary key,
	id				varchar2(15) references members(id),
	name			varchar2(15) not null,
	hosid			varchar2(15) references hospitals(id),
	hosname			varchar2(100) not null,
	disease			varchar2(100) not null,
	reserveTime		date,
	acceptance		number(1) default 0,
	review			number(1) default 0
)

insert all
into reservation values(1, 'test', 'testing', 'testing', '공안과의원','감기', sysdate, '1')
into reservation values(2, 'test', 'testing', 'testing', 'hospital','감기', sysdate, '1')
into reservation values(3, 'test', 'testing', 'testing', '토마토치과','감기', sysdate, '0')
into reservation values(4, 'test', 'testing', 'testing', '밝은이안과','감기', sysdate, '-1')
into reservation values(5, 'test', 'testing', 'testing', '땡땡병원','감기', sysdate, '0')
into reservation values(8, 'test', 'testing', 'testing', '가나다병원','감기', sysdate, '0')
into reservation values(6, 'test', 'testing', 'testing', '123병원','감기', sysdate, '0')
into reservation values(7, 'test', 'testing', 'testing', '덕산병원','감기', sysdate, '1')
into reservation values(9, 'test', 'testing', 'testing', '덕산병원','감기', sysdate, '2')
into reservation values(10, 'test', 'testing', 'testing', '덕산병원','감기', sysdate, '0')
insert into reservation values(120, 'test', 'testing', 'testing', '치과','감기', sysdate, '2')
insert into reservation values(121, 'test', 'testing', 'testing', '병운ㄴ','감기', sysdate, '2')

select * from dual;

select * from reservation;
drop table reservation;

select count(case when acceptance=1 then 1 else null end), 
count(case when acceptance=0 then 1 else null end), 
count(case when acceptance=-1 then 1 else null end)
from (select hosid, acceptance 
		from reservation
		where hosid = 'gong1' and to_Char(sysdate,'yyyymmdd') = to_char(sysdate, 'yyyymmdd'))

select * from reservation
where hosId = 'gong1' and acceptance = 1 and reserveTime >= sysdate

select count(*)
from reservation 
where hosid = 'gong1' and to_Char(reserveTime,'YYYYMMDD') = to_Char(sysdate, 'YYYYMMDD') and acceptance=1
union all
select count(*)
from reservation 
where hosid = 'gong1' and acceptance=0
union all
		select count(*)
		from reservation 
		where hosid = 'gong1' and acceptance<0

		
		update reservation
		set review = 1
		where id = 'test' and hosid = 'nowbi' and reserveTime = to_date('2020-02-19 11:15:00', 'yyyy-mm-dd hh24:mi:ss')