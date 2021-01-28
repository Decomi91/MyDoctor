--members
insert all
into members values('user1', '123', '유저일', 
		01033333333, 'testADDR',
		'dd@dd.com', '1991-02-11', 1, 1)
into members values('admin', '20000', 'admin', 
		01032308711, '멤버',
		'd@naver.com', '1991-02-11', 1, 1)
into members values('user2', '123', '유저이', 
		01032048231, 'testADDR',
		'user2@naver.com', '1989-11-05', 1, 1)
select * from dual;

--hospitals
insert all
into hospitals values('gong1','123','공안과의원',
			'testaddr',029579599,'ABC',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos1','123','덕산병원',
			'testaddr',029579599,'ABCD1',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos2','123','hospital',
			'testaddr',029579599,'ABCD2',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos3','123','토마토치과',
			'testaddr',029579599,'ABCD3',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos4','123','밝은이안과',
			'testaddr',029579599,'ABCD4',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos5','123','땡땡병원',
			'testaddr',029579599,'ABCD5',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos6','123','가나다병원',
			'testaddr',029579599,'ABCD6',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
into hospitals values('hos7','123','123병원',
			'testaddr',029579599,'ABCD7',0900,1700,0900,1700,0900,1700,
			0900,1700,0900,1700,0900,1700,0900,1700,1300, 1400, 1,1,sysdate)
select * from dual;			

--reservation
insert all
into reservation values(1, 'user1', '유저일', 'gong1', '공안과의원','결막염', sysdate, '1','0')
into reservation values(2, 'user1', '유저일', 'hos2', 'hospital','감기', sysdate, '1','0')
into reservation values(3, 'user1', '유저일', 'hos3', '토마토치과','감기', sysdate, '0','0')
into reservation values(4, 'user1', '유저일', 'hos4', '밝은이안과','감기', sysdate, '-1','0')
into reservation values(5, 'user1', '유저일', 'hos5', '땡땡병원','감기', sysdate, '0','0')
into reservation values(8, 'user1', '유저일', 'hos6', '가나다병원','감기', sysdate, '0','0')
into reservation values(6, 'user1', '유저일', 'hos7', '123병원','감기', sysdate, '0','0')
into reservation values(7, 'user1', '유저일', 'hos1', '덕산병원','감기', sysdate, '1','0')
into reservation values(9, 'user1', '유저일', 'hos1', '덕산병원','감기', sysdate, '2','0')
into reservation values(10, 'user1', '유저일', 'hos1', '덕산병원','감기', sysdate, '0','0')
select * from dual;

--adminboard(관리자에게문의)
insert all
into adminboard values('user1', 1, '문의test_sub', '문의 test_con', 0, '문의 답변', sysdate)
into adminboard values('user1', 2, '문의test_sub2', '문의 test_con2', 0, '문의 답변', sysdate)
select * from dual;	

--boards(병원에 문의)
insert all
into boards values('user1', 'gong1', 1, 1,'문의', '병원문의_testSub1',
			'testCont','2019-10-28','ok')
into boards values('user1', 'gong1', 2, 1,'문의', 'testSub2',
'testCont','2019-11-14','ok')
into boards values('user1', 'gong1', 3, 1,'문의', 'testSub3',
'testCont','2019-12-05','')
into boards values('user1', 'gong1', 4, 1,'문의', 'testSub4',
'testCont','2020-01-06','ok')
into boards values('user1', 'gong1', 5, 1,'문의', 'testSub5',
'testCont','2020-01-11','ok')
into boards values('user1', 'gong1', 6, 1,'문의', 'testSub6',
'testCont','2020-02-01','ok')
select * from dual;
			

--reviews
insert all
into reviews values('user1', 'gong1', 1, 'testSub',
	'testCont', 5,5,5,sysdate,sysdate,'ok')
into reviews values('user1', 'hos1', 2, 'testSub2',
	'testCont', 3,4,5,sysdate,sysdate,'ok')
into reviews values('user1', 'gong1', 3, 'testSub3',
	'testCont', 2,4,5,sysdate,sysdate,'ok')
into reviews values('user1', 'gong1', 4, 'testSub4',
	'testCont', 3,4,2,sysdate,sysdate,'ok')
into reviews values('user1', 'gong1', 5, 'testSub5',
	'testCont', 3,4,5,sysdate,sysdate,'ok')
into reviews values('user1', 'gong1', 6, 'testSub6',
	'testCont', 3,4,5,sysdate,sysdate,'ok')
select * from dual;	