
drop table bookmarks;
drop table reviews;
drop table reservation;
drop table adminboard;
drop table boards;
drop table hospitals;
drop table members;
select * from reservation;
select * from members;

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
create table members(
	id			varchar2(15) primary key,
	password	varchar2(15) not null,
	name		varchar2(20) not null,
	phone		number(12) not null,
	address		varchar2(100),
	email		varchar2(50) primary key,
	birth		date,
	gender		number(1),
	userkey		number(1)
);
create table bookmarks (
  id varchar2(15) references members(id),
  hosid varchar2(15) references hospitals(id),
  hosname varchar2(50)
)
--review:0 ; 후기x
create table reservation(
	reserveNo		number(10) primary key,
	id				varchar2(15) references members(id),
	name			varchar2(15) not null,
	hosid			varchar2(15) references hospitals(id),
	hosname			varchar2(100) not null,
	disease			varchar2(100) not null,
	reserveTime		date,
	acceptance		number(1) default 0,
	review         number(1) default 0 
)



create table adminBoard(
  id varchar2(15) references members(id),
  boardNum number(10) primary key,
  subject varchar2(100) not null,
  content varchar2(4000) not null,
  checking number(1) default 0 not null ,
  reply varchar2(3000),
  reqDate date
)
--병원에 문의
create table boards (
  writeId varchar2(15),
  boardsTarget varchar2(15) references hospitals(id),
  boardNum number primary key,
  secret number(1) default 1 not null ,
  head varchar2(30) not null,
  subject varchar2(100) not null,
  content varchar2(4000) not null,
  uploaddate date,
  reply varchar2(3000)
)

create table reviews(
  id varchar2(15) references members(id),
  hospital varchar2(15) references hospitals(id),
  reviewNum number(10) primary key,
  subject varchar2(100) not null,
  content varchar2(4000) not null,
  kindness number(2) not null,
  ability number(2) not null,
  price number(2) not null,
  visited date,
  uploaddate date,
  reply varchar2(3000)
)