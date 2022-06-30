# sql = STRUCTED QUERY language.  RDB에서 쓰는 확장자. 쿼리가 들어있는 파일
select NOW() from dual;

## SELECT = 선택해라. 가져와라.
## NOW = 현재시간을 가져오는 함수
## FROM = 어디서 가져올지
## DUAL = 비어있는 임시의 가짜 테이블

select 1+50 as 값1 from dual
union all
select 3+20 as 값1 from dual;

create table TABLE_USER(
	userID VARCHAR(20),
	userPassword VARCHAR(20),
	userName VARCHAR(20),
	userGender VARCHAR(4),
	primary key (userID)
);

create table BBS(
	bbsID INT,
	bbsTitle VARCHAR(50),
	writer VARCHAR(20),
	crDate DATETIME,
	bbsContent VARCHAR(2048),
	bbsAvailable INT,
	primary KEY(bbsID)
);

create table test(
	id int,
	content varchar(50)
)

 select * from test;
commit;
insert into test(id, content) values (1, '테스트1');
insert into test(id, content) values (2, '테스트2');
insert into test(id, content) values (3, '테스트3');

insert into test(id, content) select * from TEST;



# 문자열이 " 이 아니라 ' 안에 있어야한다.
INSERT into TABLE_USER VALUES
	('test1@gmail.com', '1234', '홍길동', 'M');
delete from TABLE_USER;

select * from TABLE_USER;
commit;

SELECT userPassword FROM TABLE_USER WHERE userID='test1';

INSERT INTO TABLE_USER VALUES('test1@gmail.com','1234','딸기우유','여자');



# 자기를 선택하고 자기자신을 그대로 새로운 데이터로 추가 : 뻥튀기
# mysql에서 변수선언하는법       set @변수명 = 값
#       선언된 변수 사용하는법    select @변수명
#       값 수정하는법          set @변수명 :=값
set @COUNT = 0;
select @COUNT;
select @COUNT := @COUNT+1;

select * from BBS;
#뻥튀기
insert into BBS (bbsID, bbsTitle, writer, crDate, bbsContent, bbsAvailable) 
select @COUNT := @COUNT+1, bbsTitle, writer, crDate, bbsContent, bbsAvailable
from BBS;

# 운영환경처럼 DB 섞기
update BBS set bbsAvailable = 0 where bbsId=23;
delete from bbs where bbsid=34;


INSERT INTO BBS (bbsID, bbsTitle, writer, crDate, bbsContent, bbsAvailable) VALUES (?, ?, ?, ?, ?, ?)
# 더미 데이터 생성
insert into BBS VALUES(1, '왕초', '김춘삼', '2022-01-01', '왕초의 이름은 김춘삼', 1);
insert into BBS VALUES(2, '아이언맨', '로버트다우주니어', '2022-02-02', '핵융합발전', 1);
insert into BBS VALUES(3, '토르', '크리스 헴스워스', '2022-01-01', '북유럽의 신 토르', 0);
insert into BBS VALUES(4, '기생충', '송강호', '2022-05-05', '시대의 명작', 1);
insert into BBS VALUES(5, '곡성', '황정민', '2022-06-06', '무엇이 중요한디', 1);
INSERT INTO BBS (bbsID, bbsTitle, writer, crDate, bbsContent, bbsAvailable) VALUES (6, '포켓몬', '피카츄', '2022-06-06', '피카츄 라이츄 파이리 꼬부기', 1);
commit;
# 현재 저장된 마지막 글번호 가져오기
select bbsID from BBS order by bbsID desc;
select max(bbsID) from BBS;



select * from BBS order by bbsid desc;
#글 목록가져오기. 글삭제유무가 1인것만
# 만약 글이 300개다. 글의ID가 200이하인것만 보여라.
select * from BBS where bbsID < 35
   and bbsAvailable = 1
   order by bbsID desc 
   limit 10;