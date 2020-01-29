create table hospitals(
	id			varchar2(15) primary key,
	password	varchar2(15) not null,
	yadmNm		varchar2(50) not null,
	addr		varchar2(100) not null,
	hphone		number(12) not null,
	yki			varchar2(100) not null,
	monStart	number(4),
	monEnd		number(4),
	tueStart	number(4),
	tueEnd		number(4),
	wedStart	number(4),
	wedEnd		number(4),
	thuStart	number(4),
	thuEnd		number(4),
	friStart	number(4),
	friEnd		number(4),
	satStart	number(4) default 0,
	satEnd		number(4) default 0,
	sunStart	number(4) default 0,
	sunEnd		number(4) default 0,
	lunchStart	number(4),
	lunchEnd	number(4),
	joinok		number(1) default 0,
	doctors		number(3),
	joindate	date
)
drop table hospitals cascade constraints
select * from hospitals
insert into hospitals values('testing','123','test',
			'testaddr',029579599,'ABCD',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate);
		

create table bookmarks (
  id varchar2(15) references members(id),
  hosid varchar2(15) references hospitals(id),
  hosname varchar2(50)
)
select * from bookmarks				