-- SYSTEM 계정 설정
--CREATE MEMBER tonight IDENTIFIED BY tonight;
--GRANT CONNECT, RESOURCE TO tonight;

--DROP TABLE ACCOM_FILE;
--DROP TABLE ACCOM;
--DROP TABLE MEMBER;


/*사용자 테이블*/
CREATE TABLE MEMBER
(
  MEMBER_ID VARCHAR2(15),
  MEMBER_PWD VARCHAR2(20) CONSTRAINT NN_MEMBER_PWD NOT NULL,
  MEMBER_NAME VARCHAR2(20) CONSTRAINT NN_MEMBER_NAME NOT NULL,
  MEMBER_TYPE CHAR(1),
  MEMBER_BIRTH_DATE VARCHAR2(14) CONSTRAINT NN_MEMBER_BIRTH_DATE NOT NULL,
  MEMBER_PHONE VARCHAR2(13) CONSTRAINT NN_MEMBER_PHONE NOT NULL,
  MEMBER_EMAIL VARCHAR2(25) CONSTRAINT NN_MEMBER_EMAIL NOT NULL,
  MEMBER_ADDRESS VARCHAR2(100) CONSTRAINT NN_MEMBER_ADDRESS NOT NULL,
  MEMBER_RANK VARCHAR2(8) DEFAULT 'SILVER',
  
  CONSTRAINT PK_MEMBER_ID PRIMARY KEY(MEMBER_ID),
  CONSTRAINT CHK_MEMBER_TYPE CHECK(MEMBER_TYPE IN ('U', 'B', 'G', 'M')),  /*사용자, 사업자, 가이드, 관리자*/
  CONSTRAINT UNI_MEMBER_PHOHNE UNIQUE(MEMBER_PHONE),
  CONSTRAINT CHK_MEMBER_RANK CHECK (MEMBER_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE MEMBER IS '사용자';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '회원 타입';
COMMENT ON COLUMN MEMBER.MEMBER_BIRTH_DATE IS '생년월일';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.MEMBER_RANK IS '회원 등급';


/*********************INSERT*********************/

-- 관리자
INSERT INTO MEMBER
VALUES('admin', 'admin', '관리자', 'M', '19930209', '01090302469', 'admin@iei.or.kr', '서울 강남구 테헤란로 14', 'DIAMOND');

-- 사용자
INSERT INTO MEMBER VALUES('ib1500','asd123','김여진','U','19920313','010-6427-4492','ib1500@naver.com','경기도 수원시 장안구',default);
INSERT INTO MEMBER VALUES('ksm1225','asd456','김소미','U','19931225','010-1235-7848','ib1400@naver.com','경기도 안산시 사동',default);
INSERT INTO MEMBER VALUES('jnh0930','asd789','조남훈','U','19940930','010-7643-1247','ib1300@naver.com','경기도 시흥시 정왕동',default);
INSERT INTO MEMBER VALUES('kdy0820','asd012','김도영','U','19950820','010-9274-4982','ib1200@naver.com','경기도 안양시 만원구',default);
INSERT INTO MEMBER VALUES('usb0119','asd345','유신광','U','19960119','010-9577-0183','ib1100@naver.com','경기도 성남시 태평동',default);
INSERT INTO MEMBER VALUES('ych0426','asd678','윤찬호','U','19970426','010-0027-4891','ib1000@naver.com','경기도 고양시 고색동',default);

-- 가이드
INSERT INTO MEMBER
VALUES ('gyeontae12', 'gt1212', '김경태', 'G', '19900509', '01023324234', 'gyeontae12@naver.com', '강원도 춘천시 근화동 8', DEFAULT);
INSERT INTO MEMBER
VALUES ('ganghwa12', 'gh1212', '박강화', 'G', '19830209', '01089445266', 'ganghwa83@google.com', '강원도 원주시 중앙동 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('haeyeon', 'hy1212', '김해연', 'G', '19890816', '01056485231', 'haeyeon89@naver.com', '강원도 원주시 인동 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('is8899', 'is8899', '정인수', 'G', '19880909', '01028854621', 'is8899@naver.com', '강원도 원주시 인동 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('skwang93', 'sk9393', '유신광', 'G', '19930425', '01036548526', 'skwang93@naver.com', '강원도 동해시 평릉동 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('kangnam95', 'kangnam95', '이강남', 'G', '19950821', '01032532786', 'kangnam95@naver.com', '강원도 고성군 현내면 대진리 183-4', DEFAULT);

-- 사업자
insert into MEMBER VALUES('BIZ01', 'PASS11','김혜정', 'B', '19901212', '01012345678', 'moMEMBER@nate.com', '인천시 남동구 구월동 293-2', default); 
insert into MEMBER VALUES('NAMU01', 'PASS22','남찬우', 'B', '19930931', '01023456781', 'namu@naver.com', '서울시 송파구 문정동 가야아파트 302동 1301호', default); 
insert into MEMBER VALUES('INSUNG', 'PASS33','전인성', 'B', '19950206', '01034567812', 'bestfriend@daum.net', '인천시 연수구 연수동 108-2', default); 
insert into MEMBER VALUES('SONEJH12', 'PASS44','손정한', 'B', '19870723', '01045678123', 'sonejh12@nate.com', '인천시 서구 심곡동 293-2', default); 
insert into MEMBER VALUES('MBMGOOD', 'PASS55','김상혁', 'B', '19890301', '01056781234', 'mbm@nate.com', '경기도 수원시 장안구 인계동 136-2', default); 
insert into MEMBER VALUES('SINKWANNG', 'PASS66','유신광', 'B', '19930411', '01045678321', 'bf5000@naver.com', '서울시 구로구 구로동 남양아파트 202동 1907호', default); 


commit;