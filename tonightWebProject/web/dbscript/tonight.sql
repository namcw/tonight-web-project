--drop table ACCOM_REVIEW;
--drop table ACCOMMODATION cascade CONSTRAINT;;
--drop table ACCOMMODATION_IMAGE;
--drop table MEMBER cascade CONSTRAINT;
--drop table REVIEW;
--drop table ROOM;
--drop table TOUR cascade CONSTRAINT;
--drop table TOUR_IMAGE;
--drop table TOUR_RESERVE cascade CONSTRAINT;
--drop table TOURCONF;
--drop table TOURDETAIL;
--drop table qna;
--drop table faq;
--drop table tour_review;

/*사용자 테이블*/
CREATE TABLE MEMBER
(
  MEMBER_ID VARCHAR2(15),
  MEMBER_PWD VARCHAR2(20) CONSTRAINT NN_MPWD NOT NULL,
  MEMBER_NAME VARCHAR2(20) CONSTRAINT NN_MNAME NOT NULL,
  MEMBER_TYPE CHAR(1),
  MEMBER_BIRTHDATE VARCHAR2(14) CONSTRAINT NN_MBIRTHDATE NOT NULL,
  MEMBER_PHONE VARCHAR2(13) CONSTRAINT NN_MPHONE NOT NULL,
  MEMBER_EMAIL VARCHAR2(25) CONSTRAINT NN_MEMAIL NOT NULL,
  MEMBER_ADDRESS VARCHAR2(100) CONSTRAINT NN_MADDRESS NOT NULL,
  MEMBER_RANK VARCHAR2(8) DEFAULT 'SILVER',
  
  CONSTRAINT PK_MID PRIMARY KEY(MEMBER_ID),
  CONSTRAINT CHK_MTYPE CHECK(MEMBER_TYPE IN ('U', 'B', 'G', 'M')),  /*사용자, 사업자, 가이드, 관리자*/
  CONSTRAINT CHK_MRANK CHECK (MEMBER_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE MEMBER IS '사용자';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원 비밀번호';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원 이름';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '회원 타입';
COMMENT ON COLUMN MEMBER.MEMBER_BIRTHDATE IS '생년월일';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.MEMBER_RANK IS '회원 등급';

/*********************INSERT*********************/

-- 관리자
INSERT INTO MEMBER
VALUES('admin', 'admin', '관리자', 'M', '19930209', '010-9030-2469', 'admin@iei.or.kr', '서울 강남구 테헤란로 14', 'DIAMOND');

-- 사용자
INSERT INTO MEMBER VALUES('ib1500','asd123','김여진','U','19920313','010-6427-4492','ib1500@naver.com','경기도 수원시 장안구','SILVER');
INSERT INTO MEMBER VALUES('ksm1225','zxcv456','김소미','U','19931225','010-1235-7848','exsm1225@naver.com','경기도 안산시 사동','GOLD');
INSERT INTO MEMBER VALUES('jnh0930','jnh789','조남훈','U','19940930','010-7643-1247','jnh789@nate.com','경기도 시흥시 정왕동','PLATINUM');
INSERT INTO MEMBER VALUES('kdy0820','dydy012','김도영','U','19950820','010-9274-4982','ib1200@google.com','경기도 안양시 만원구',default);
INSERT INTO MEMBER VALUES('usb0119','sbusi45','유신광','U','19960119','010-9577-0183','usb0119@hanmail.net','경기도 성남시 태평동',default);
INSERT INTO MEMBER VALUES('iss0426','sis678','전인성','U','19970426','010-0027-4891','sis0426@nate.com','경기도 고양시 고색동','PLATINUM');

-- 가이드
INSERT INTO MEMBER
VALUES ('gyeontae12', 'zxcv5885', '김경태', 'G', '19900509', '010-2332-4234', 'gyeontae12@naver.com', '강원도 춘천시 근화동 8', DEFAULT);
INSERT INTO MEMBER
VALUES ('gg7811', 'gg8944', '박강화', 'G', '19830209', '010-8944-5266', 'ganghwa83@google.com', '강원도 원주시 중앙동 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('haeyeon', 'hyeon0816', '김해연', 'G', '19890816', '010-5648-5231', 'haeyeon89@nate.com', '강원도 원주시 인동 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('is8899', 'is8899', '정인수', 'G', '19880909', '010-2885-4621', 'is8899@naver.com', '강원도 원주시 인동 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('skwang93', 'sk9393', '유신광', 'G', '19930425', '010-3654-8526', 'skwang93@hanmail.net', '강원도 동해시 평릉동 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('kangnam95', 'kangnam95', '이강남', 'G', '19950821', '010-3253-2786', 'kangnam95@naver.com', '강원도 고성군 현내면 대진리 183-4', DEFAULT);

-- 사업자
insert into MEMBER VALUES('BIZ01', 'PASS11','김혜정', 'B', '19901212', '010-2226-7716', 'moMEMBER@nate.com', '인천시 남동구 구월동 293-2', default); 
insert into MEMBER VALUES('NAMU01', 'nam0327','남찬우', 'B', '19930931', '010-0327-6781', 'namu@naver.com', '서울시 송파구 문정동 가야아파트 302동 1301호', default); 
insert into MEMBER VALUES('INSUNG', 'sis5523','전인성', 'B', '19950206', '010-5523-7812', 'bestfriend@daum.net', '인천시 연수구 연수동 108-2', default); 
insert into MEMBER VALUES('SONEJH12', 'son12','손정한', 'B', '19870723', '010-4492-8123', 'sonejh12@nate.com', '인천시 서구 심곡동 293-2', default); 
insert into MEMBER VALUES('MBMGOOD', 'sh0301','김상혁', 'B', '19920313', '010-5015-6289', 'mbm@nate.com', '경기도 수원시 장안구 인계동 136-2', default); 
insert into MEMBER VALUES('SINKWANNG', 'sk202','유신광', 'B', '19930411', '010-4332-0917', 'bf5000@naver.com', '서울시 구로구 구로동 남양아파트 202동 1907호', default); 
commit;



/*숙소 테이블*/
CREATE TABLE ACCOMMODATION
(
  ACC_ID NUMBER,                                                          /*숙소 아이디*/
  BIZ_ID VARCHAR2(20) CONSTRAINT NN_BIZ_ID NOT NULL,                      /*사업자 아이디*/ 
  ACC_NAME VARCHAR2(50),                                                  /*숙소 이름*/
  ACC_INFO VARCHAR2(4000),                                                /*숙소 정보*/
  ACC_TYPE CHAR(1) CONSTRAINT NN_ACC_TYPE NOT NULL,                       /*숙소 타입*/
  ACC_ADDRESS VARCHAR2(50) CONSTRAINT NN_ACC_ADDRESS NOT NULL,            /*숙소 주소*/
  ACC_CONTACT VARCHAR2(50),                                               /*숙소 연락처*/
  ACC_RANK VARCHAR2(8) DEFAULT 'SILVER',                                  /*숙소 등급*/
  ACC_ONAME VARCHAR2(100),
  ACC_RNAME VARCHAR2(500),
  ACC_RULES VARCHAR2(4000),                                               /*숙소 이용 규칙*/
  ACC_FACILITIES VARCHAR2(4000),                                          /*편의 시설*/
  ACC_REFUND VARCHAR2(4000),                                              /*환불 규정*/
  
  CONSTRAINT PK_ACC_ID PRIMARY KEY(ACC_ID),
  CONSTRAINT FK_BIZ_ID FOREIGN KEY(BIZ_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_ACC_TYPE CHECK (ACC_TYPE IN ('H', 'M', 'G', 'P')),  /*호텔, 모텔, 게스트하우스, 펜션*/
  CONSTRAINT CHK_ACC_RANK CHECK (ACC_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);

/*샘플데이터*/
-- ACCOMMODATION 
INSERT INTO ACCOMMODATION VALUES(1, 'BIZ01', '라마다호텔', 
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'H', '강원도 춘천시 가평군 16-2', '010-8754-7651', 'SILVER',
'201711012.jpg', '201711012.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');

INSERT INTO ACCOMMODATION VALUES(2, 'NAMU01', '강원게스트하우스', 
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201705468.jpg', '201705468.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(3, 'INSUNG', '손정바다펜션',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'P', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201704657.jpg', '201704657.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(4, 'SONEJH12', '남청호모텔',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'M', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201703547.jpg', '201703547.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장,부엌',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(5, 'MBMGOOD', '비즈정동진펜션',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'P', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201749875.jpg', '201749875.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');

INSERT INTO ACCOMMODATION VALUES(6, 'SINKWANNG', '컬리넌호텔', 
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'H', '강원도 춘천시 가평군 16-2', '010-1234-5678', 'SILVER',
'201724138.jpg', '201724138.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장,세탁기',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');

INSERT INTO ACCOMMODATION VALUES(7, 'INSUNG', '모두의게스트하우스', 
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201731458.jpg', '201731458.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(8, 'SONEJH12', '송전바다펜션',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'P', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201784675.jpg', '201784675.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(9, 'NAMU01', '남청호모텔',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'M', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'201797841.jpg', '201797841.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


INSERT INTO ACCOMMODATION VALUES(10, 'INSUNG', '스즈란정동진펜션',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'P', '강원도 춘천시 가평군 32-2', '010-1244-5678', 'SILVER',
'20177946.jpg', '20177946.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');

INSERT INTO ACCOMMODATION VALUES(11, 'SINKWANNG', '하늘하늘펜션',
'영월의 스테이하우스는 커플이 조용히 쉬기에 좋은 객실입니다. 
창밖으로 들리는 계곡물소리와 지저귀는 새소리 그리고 맑은 공기는 도시에서 지친 마음에 휴식을 주며 
매일 청결하게 관리하는 침구는 편안한 잠자리를 제공합니다. 
김삿갓계곡의 외씨버선길과 가깝고 숙소 바로 앞에는 아름다운 계곡이 흐르고 있습니다.
객실에서는 Marshall 스피커로 감미로운 음악과 함께 빔 프로젝터로 보다 실감나고 편하게 영화를 감상하실 수 있으며, 
해질녘에는 아름다운 정원의 해먹에 누워 자연속에서 재충전의 시간을 가져보세요~',
'P', '강원도 춘천시 남산면 남이섬길 1', '010-1244-5678', 'SILVER',
'201796325.jpg', '201796325.jpg',
'흡연 금지
반려동물 동반에 적합하지 않음
파티나 이벤트 금지
어린이(만 0-12세)에게 안전하거나 적합하지 않음
체크인은 15:00 이후입니다
11:00까지 체크아웃 하셔야 합니다',
'수영장,무선인터넷,주차장',
'일반 체크인 5일 전까지 취소하면 전액이 환불됩니다. 
체크인 전 5일 이내에 취소하면 첫 1박 요금은 환불되지 않으나, 잔여 숙박 요금의 50%가 환불됩니다.');


/*숙소 이미지 테이블*/ 
CREATE TABLE ACCOMMODATION_IMAGE
(
  IMAGE_RNAME VARCHAR2(100),
  IMAGE_ONAME VARCHAR2(100),
  ACC_ID NUMBER,           /*숙소 아이디*/
  
  CONSTRAINT PK_ARNAME PRIMARY KEY(IMAGE_RNAME),
  CONSTRAINT FK_IMG_AID FOREIGN KEY (ACC_ID) REFERENCES ACCOMMODATION
);
select acc_rname from ACCOMMODATION;
/*샘플데이터*/
-- ACCOMMODATION_IMAGE
INSERT INTO ACCOMMODATION_IMAGE VALUES('201784675.jpg', 'image1.jpg', 1);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201746357.jpg', 'image2.jpg', 1);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201754872.jpg', 'image3.jpg', 2);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201746284.jpg', 'image4.jpg', 2);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201798657.jpg', 'image5.jpg', 3);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201746315.jpg', 'image6.jpg', 3);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201764187.jpg', 'image7.jpg', 4);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201713479.jpg', 'image8.jpg', 4);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201795347.jpg', 'image9.jpg', 4);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201764217.jpg', 'image10.jpg', 5);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201764792.jpg', 'image11jpg', 5);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201710457.jpg', 'image12.jpg', 6);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201753487.jpg', 'image13.jpg', 7);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201794613.jpg', 'image14.jpg', 7);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201784571.jpg', 'image15.jpg', 8);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201746254.jpg', 'image16.jpg', 8);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201798746.jpg', 'image17.jpg', 9);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201746132.jpg', 'image18.jpg', 9);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201742546.jpg', 'image19.jpg', 10);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201779451.jpg', 'image20.jpg', 10);
INSERT INTO ACCOMMODATION_IMAGE VALUES('201784521.jpg', 'image21.jpg', 11);



/*패키지여행 후기 테이블*/
CREATE TABLE ACCOM_REVIEW
(  
  AR_NO NUMBER,
  AR_ACCOM_ID NUMBER CONSTRAINT NN_AR_AID NOT NULL,
  AR_DATE DATE DEFAULT SYSDATE,
  AR_WRITER_ID VARCHAR2(15) CONSTRAINT NN_AR_WID NOT NULL,
  AR_TITLE VARCHAR2(50) CONSTRAINT NN_AR_TITLE NOT NULL,
  AR_CONTENT VARCHAR2(4000) CONSTRAINT NN_AR_CONTENT NOT NULL,
  AR_GRADE NUMBER(3,1) DEFAULT 10.0,
  
  CONSTRAINT PK_AR_NO PRIMARY KEY(AR_NO),
  CONSTRAINT FK_AR_AID FOREIGN KEY(AR_ACCOM_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT FK_AR_WID FOREIGN KEY(AR_WRITER_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_AR_GRADE CHECK (AR_GRADE BETWEEN 1.0 AND 10.0)
);
COMMENT ON TABLE ACCOM_REVIEW IS '숙소 후기 게시판';
COMMENT ON COLUMN ACCOM_REVIEW.AR_NO IS '게시글 번호';
COMMENT ON COLUMN ACCOM_REVIEW.AR_ACCOM_ID IS '숙소 ID';
COMMENT ON COLUMN ACCOM_REVIEW.AR_DATE IS '게시 날짜';
COMMENT ON COLUMN ACCOM_REVIEW.AR_WRITER_ID IS '작성자 아이디';
COMMENT ON COLUMN ACCOM_REVIEW.AR_TITLE IS '제목';
COMMENT ON COLUMN ACCOM_REVIEW.AR_CONTENT IS '내용';
COMMENT ON COLUMN ACCOM_REVIEW.AR_GRADE IS '평점';

-- ACCOM_REVIEW
INSERT INTO ACCOM_REVIEW
VALUES(1, 1, DEFAULT, 'ib1500', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO ACCOM_REVIEW
VALUES(2, 1, DEFAULT, 'ksm1225', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO ACCOM_REVIEW
VALUES(3, 2, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '위치가 매우 좋고 기분이 좋은 호텔임. 식사도 호텔 치고는 매우 저렴함. 다만 부대시설이 좀 부족함.', 10);
INSERT INTO ACCOM_REVIEW
VALUES(4, 2, DEFAULT, 'kdy0820', '여행 후기요!!!', '경포대에서 약간 거리가 있긴 하지만 내부도 깨끗하고 조용하고 맘에 듭니다~직원분도 친절하시네요~', 8);
INSERT INTO ACCOM_REVIEW
VALUES(5, 3, DEFAULT, 'usb0119', '많이 아쉬워요.', '화장실 비데설치가 되어있지 않아 다소 아쉬움', 10);
INSERT INTO ACCOM_REVIEW
VALUES(6, 3, DEFAULT, 'iss0426', '강원도 여행 쵝오!', '기본적으로 건물 자체와 객실이 너무 깔끔해서 좋았습니다. 객실이 넓은 부분도 편하고 좋았습니다', 8);

INSERT INTO ACCOM_REVIEW
VALUES(7, 4, DEFAULT, 'ib1500', '깨끗해서 좋아써여!!', '생각보다 너무 깨끗하고, 넓어서 좋았어요 친구들이랑 다같이 5명이 갔는데 좋은 추억 만들고 왔네용 위치도 좋고, 깨끗하고, 넓고 최고에요', 9);
INSERT INTO ACCOM_REVIEW
VALUES(8, 4, DEFAULT, 'kdy0820', '주인장 짱짱맨!!', '숙소 주인장님 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO ACCOM_REVIEW
VALUES(9, 5, DEFAULT, 'usb0119', '5일여행!!', '5일동안 조식이 거의 변하지않았음 이외엔 좋았음', 9);
INSERT INTO ACCOM_REVIEW
VALUES(10, 5, DEFAULT, 'iss0426', '건물이 좀...', '건물이 오래되서 좀...방도 약간 별로였구요.', 10);

INSERT INTO ACCOM_REVIEW
VALUES(12, 5, DEFAULT, 'usb0119', '비대 설치좀ㅡㅡ', '화장실 비데설치가 되어있지 않아 다소 아쉬움', 7);
INSERT INTO ACCOM_REVIEW
VALUES(13, 5, DEFAULT, 'usb0119', '아쉬워 아쉬워 ㅜㅜ', '늦게 도착해서 수영장 이용을 못했는데 다음에 드르게 되면 야외 수영장 이용하고 싶어요~', 6);
INSERT INTO ACCOM_REVIEW
VALUES(14, 7, DEFAULT, 'iss0426', '청소좀요...', '환풍기로 담배 냄새가 들어오는 거 빼곤 뭐 문제를 못 느낌.', 8);
INSERT INTO ACCOM_REVIEW
VALUES(15, 10, DEFAULT, 'usb0119', '요금이좀...', '평일 싼 가격으로 오면 만족.주말이나 연휴때 성수기 요금내고오면 후회', 6);
INSERT INTO ACCOM_REVIEW
VALUES(16, 9, DEFAULT, 'usb0119', '좋은 여행이였습니다.', '다음에 또 찾을 것 같네요', 7);


/*객실 테이블*/
CREATE TABLE ROOM
(   
  ROOM_ID NUMBER,                                 /*객실 아이디*/
  ACC_ID NUMBER CONSTRAINT NN_ACC_ID NOT NULL,    /*숙소 번호*/
  ROOM_NAME VARCHAR2(50),                         /*객실명*/
  ROOM_DETAILS  VARCHAR2(4000),                   /*상세정보*/
  ROOM_WEEKEND_ADULT_PRICE NUMBER,                /*주말성인가격*/
  ROOM_WEEKEND_CHILD_PRICE NUMBER,                /*주말소인가격*/
  ROOM_WEEKDAYS_ADULT_PRICE   NUMBER,               /*주중성인가격*/
  ROOM_WEEKDAYS_CHILD_PRICE NUMBER,               /*주중소인가격*/
  
  CONSTRAINT PK_ROOM_ID PRIMARY KEY(ROOM_ID),
  CONSTRAINT FK_ACC_ID FOREIGN KEY(ACC_ID) REFERENCES ACCOMMODATION
);

INSERT INTO ROOM VALUES('1', '1', '슈페리얼', '더블침대 1개, 최대2인', '45000', '30000',
'40000', '25000');

INSERT INTO ROOM VALUES('2', '1', '스탠다드', '더블침대 1개, 최대 3인', '50000', '35000',
'40000', '30000');

INSERT INTO ROOM VALUES('3', '2', '디럭스', '더블 1개 싱글 1개, 최대 4인', '60000', '40000',
'40000', '25000');

INSERT INTO ROOM VALUES('4', '2', '스위트', '더블침대 1개, 최대 3인', '60000', '40000',
'50000', '30000');

INSERT INTO ROOM VALUES('5', '2', '로얄스위트', '더블침대 2개, 최대 4인', '70000', '55000',
'55000', '40000');

INSERT INTO ROOM VALUES('6', '3', '프리엄', '싱글침대 2개, 최대 3인', '70000', '40000',
'60000', '35000');

INSERT INTO ROOM VALUES('7', '4', 'Premium', '더블 1개 싱글1개, 최대 4인', '50000', '40000',
'40000', '30000');

INSERT INTO ROOM VALUES('8', '4', 'Suite', '싱글침대 2개, 최대 3인', '50000', '40000',
'40000', '30000');

INSERT INTO ROOM VALUES('9', '4', 'Royal Suite', '퀸 1개 더블 1개, 최대 3인', '90000', '65000',
'80000', '50000');

INSERT INTO ROOM VALUES('10', '5', 'Standard', '더블침대 1개, 최대 3인', '70000', '40000',
'60000', '35000');

INSERT INTO ROOM VALUES('11', '5', 'Premium', '더블 1개 싱글 1개, 최대 3인', '90000', '75000',
'80000', '65000');

INSERT INTO ROOM VALUES('12', '6', 'Pool Party', 'super침대 1개, 최대 4인', '105000', '90000',
'90000', '75000');

INSERT INTO ROOM VALUES('13', '6', 'Glamping', '더블 2개 싱글1, 최대 6인', '120000', '100000',
'100000', '80000');

INSERT INTO ROOM VALUES('14', '7', 'Standard', '더블침대 1개, 최대 3인', '50000', '40000',
'40000', '30000');

INSERT INTO ROOM VALUES('15', '8', '아드리게 Suite (노천탕)', '더블침대 1개, 최대 3인', '80000', '60000',
'70000', '45000');

INSERT INTO ROOM VALUES('16', '8', 'VIP (파티룸)', '더블침대 1개, 최대 3인', '80000', '60000',
'70000', '40000');

INSERT INTO ROOM VALUES('17', '8', 'Twin', 'Double + Single', '90000', '50000',
'70000', '45000');

INSERT INTO ROOM VALUES('18', '9', '일반실', '더블침대 1개, 최대 3인', '50000', '35000',
'35000', '25000');

INSERT INTO ROOM VALUES('19', '9', '특실', '더블침대 1개, 최대 3인', '80000', '60000',
'75000', '50000');

INSERT INTO ROOM VALUES('20', '9', 'VIP', '더블침대 1개, 최대 3인', '90000', '60000',
'80000', '50000');

INSERT INTO ROOM VALUES('21', '10', 'MINI', '더블침대 1개, 최대 3인', '45000', '35000',
'40000', '30000');

INSERT INTO ROOM VALUES('22', '10', 'Standard Twin', '더블침대 1개, 최대 3인', '50000', '40000',
'40000', '30000');

INSERT INTO ROOM VALUES('23', '10', 'Standard Double', '더블침대 1개, 최대 3인', '60000', '35000',
'40000', '30000');

INSERT INTO ROOM VALUES('24', '10', 'Family room', '퀸 1개  최대 3인', '90000', '40000',
'80000', '40000');

INSERT INTO ROOM VALUES('25', '11', '디럭스 더블룸', '더블 1개 싱글 1개 최대 3인', '80000', '40000',
'65000', '30000');

INSERT INTO ROOM VALUES('26', '11', '패밀리 스위트', '트윈 1개 더블 1개 최대 6인', '100000', '50000',
'80000', '35000');







/* FAQ 게시판 테이블*/
CREATE TABLE FAQ (
  FAQ_NO  NUMBER, /*FAQ 글 번호*/
  FAQ_CATEGORY VARCHAR2(30) DEFAULT '기타', /*질문 카테고리*/
  FAQ_TITLE VARCHAR2(50) CONSTRAINT NN_FAQ_TITLE NOT NULL, /*제목(질문)*/
  FAQ_ANSWER VARCHAR2(4000) CONSTRAINT NN_FAQ_ANSWER NOT NULL,/*내용(답변)*/
  FAQ_READ_COUNT NUMBER DEFAULT 0,
  CONSTRAINT PK_FAQ_NO PRIMARY KEY(FAQ_NO),
  CONSTRAINT CHK_FAQ_CATEGORY CHECK(FAQ_CATEGORY IN ('숙소', '패키지상품', '가이드', '예약/결제', '환불/변경', '이벤트', '회원관리', '기타'))
);
COMMENT ON TABLE FAQ IS '자주묻는질문';
COMMENT ON COLUMN FAQ.FAQ_NO IS 'FAQ 글 번호';
COMMENT ON COLUMN FAQ.FAQ_CATEGORY IS '질문 카테고리';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '제목(질문)';
COMMENT ON COLUMN FAQ.FAQ_ANSWER IS '내용(답변)';

--faq
INSERT INTO FAQ VALUES(1,'예약/결제','예약은 어떻게 하면 되나요?','원하시는 숙소를 선택하신후 원하시는 날짜를 선택하시면 됩니다.',0);
INSERT INTO FAQ VALUES(2,'이벤트','이벤트 참여는 어떻게해요?','게시판에서 확인하시면 됩니다.',0);
INSERT INTO FAQ VALUES(3,'기타','렌트카를 대여할 수 있나요?','렌트카는 안됩니다',0);


/* QNA 게시판 테이블*/
CREATE TABLE QNA (
  QNA_NO NUMBER, /*QNA 글 번호*/
  QNA_TITLE VARCHAR2(50) CONSTRAINT NN_QNA_TITLE NOT NULL,  /*제목*/
  WRITER_ID VARCHAR2(15) CONSTRAINT NN_WRITER_ID NOT NULL,   /*작성자 아이디*/
  QUESTION VARCHAR2(4000) CONSTRAINT NN_QUESTION NOT NULL, /*질문 내용*/
  ANSWER VARCHAR2(4000),  /*답변 내용*/
  
  CONSTRAINT PK_QNA_NO PRIMARY KEY(QNA_NO),
  CONSTRAINT FK_WRITER_ID FOREIGN KEY(WRITER_ID) REFERENCES MEMBER
);
COMMENT ON TABLE QNA IS '질의응답';
COMMENT ON COLUMN QNA.QNA_NO IS 'QNA 글 번호';
COMMENT ON COLUMN QNA.QNA_TITLE IS '제목';
COMMENT ON COLUMN QNA.WRITER_ID IS '작성자 아이디';
COMMENT ON COLUMN QNA.QUESTION IS '질문 내용';
COMMENT ON COLUMN QNA.ANSWER IS '답변 내용';

ALTER TABLE QNA ADD(QNA_READ_COUNT NUMBER(13) DEFAULT 0);
ALTER TABLE QNA ADD(QNA_REF NUMBER(13));
ALTER TABLE QNA ADD(QNA_LEVEL NUMBER(10) DEFAULT 0);
ALTER TABLE QNA ADD(QNA_REPLY_REF NUMBER(10));
ALTER TABLE QNA ADD(QNA_REPLY_SEQ NUMBER(10) DEFAULT 0);

-- QNA
INSERT INTO QNA VALUES(1,'예약을 어떻게 하는지 모르겠습니다','ib1500','사이트에 들어갔는데 어떻게 예약을 하는지 모르겠습니다 자세하게 가르쳐주세요','고객센터에 문의해보세요',default,0,default,0,default);
INSERT INTO QNA VALUES(2,'여행 장소 어디가 좋을까??','kdy0820','강릉으로 놀러가는데 어디가 좋을까요 추천좀 해주세요','정동진 가보세요',default,0,default,0,default);
INSERT INTO QNA VALUES(3,'속초 가는데 펜션 어디가 있을까요?','usb0119','펜션 깔끔한곳좀 추천해주세요','namoo호텔 좋습니다 깔끔하고 좋아요',default,0,default,0,default);
 
 
 
CREATE TABLE TOUR
(
  TOUR_ID NUMBER,
  TOUR_TITLE VARCHAR2(500) CONSTRAINT NN_TTITLE NOT NULL,
  GUIDE_ID VARCHAR2(15) CONSTRAINT NN_GID NOT NULL,
  TOUR_ONAME VARCHAR2(100),
  TOUR_RNAME VARCHAR2(500),
  
  
  CONSTRAINT PK_TID PRIMARY KEY (TOUR_ID),
  CONSTRAINT FK_GID FOREIGN KEY (GUIDE_ID) REFERENCES MEMBER

);

INSERT INTO TOUR
VALUES(1, 'ITX - 외설악 속초ㆍ동해바다 기차여행', 'gyeontae12', '201729916.jpg', '201729916.jpg');
INSERT INTO TOUR
VALUES(2, 'K-정선 옥산장ㆍ레일바이크ㆍ바다열차 기차여행(1박2일)', 'haeyeon', '201712808.jpg', '201712808.jpg');
INSERT INTO TOUR
VALUES(3, '정동진 바다열차ㆍ동굴신비관 기차여행', 'is8899', '201783301.jpg', '201783301.jpg');
INSERT INTO TOUR
VALUES(4, 'S-천상의 화원 곰배령 버스여행', 'kangnam95', '201738588.jpg', '201738588.jpg');
INSERT INTO TOUR
VALUES(5, '청춘 양구 3색 농촌, 문화, 생태 체험 기차여행', 'gg7811', '201733245.jpg', '201733245.jpg');
INSERT INTO TOUR
VALUES(6, '나비 이야기 이화원  춘천 구석구석 기차여행', 'skwang93', '201737174.jpg', '201737174.jpg');
INSERT INTO TOUR
VALUES(7, '대관령 하늘목장 정동진 부채길ㆍ강원도 구석구석 여행', 'gyeontae12', '201734752.jpg', '201734752.jpg');
INSERT INTO TOUR
VALUES(8, '정동진 해돋이  묵호항 삼척ㆍ환선굴 기차여행', 'gyeontae12', '201780441.jpg', '201780441.jpg');
INSERT INTO TOUR
VALUES(9, 'K-정선레일바이크ㆍ아라리촌  정선장터 기차여행 ', 'haeyeon', '2017182211.jpg', '201718221.jpg');
INSERT INTO TOUR
VALUES(10, '[C코스]정동진ㆍ바다열차  대관령 하늘목장 기차여행', 'is8899', '20171975111.jpg', '201719751.jpg');
INSERT INTO TOUR
VALUES(11, '강촌 레일바이크  남이섬 기차여행', 'kangnam95', '201754761.jpg', '201754761.jpg');


CREATE TABLE TOURCONF (
  
  TOUR_ID NUMBER,
  START_DATE DATE CONSTRAINT NN_STARTDATE NOT NULL,
  ARRIVAL_DATE DATE CONSTRAINT NN_ARRIVALDATE NOT NULL,
  TOUR_ADULT_PRICE NUMBER,
  TOUR_CHILD_PRICE NUMBER,
  TOUR_STATE CHAR(1),
  
  CONSTRAINT PK_TCID PRIMARY KEY (TOUR_ID, START_DATE),
  CONSTRAINT FK_TID FOREIGN KEY (TOUR_ID) REFERENCES TOUR ON DELETE CASCADE
);



INSERT INTO TOURCONF
VALUES(1, '2017/11/11', '2017/11/13', 54000, 49000, 'Y');
INSERT INTO TOURCONF
VALUES(1, '2017/11/20', '2017/11/22', 54000, 49000,  'Y');
INSERT INTO TOURCONF
VALUES(1, '2017/11/22', '2017/11/24', 54000, 49000,  'Y');
INSERT INTO TOURCONF
VALUES(2, '2017/11/11', '2017/11/13', 59000, 53000,  'Y');
INSERT INTO TOURCONF
VALUES(3, '2017/11/09', '2017/11/12', 109000, 84000,  'Y');
INSERT INTO TOURCONF
VALUES(4, '2017/11/11', '2017/11/13', 45000, 45000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/11', '2017/11/13', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(5, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(6, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(6, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(6, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(6, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(7, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(7, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(7, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(7, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(8, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(8, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(8, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(8, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(9, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(9, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(9, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(9, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');

VALUES(10, '2017/11/11', '2017/11/13', 49000, 42000,  'Y');
INSERT INTO TOURCONF
VALUES(11, '2017/11/16', '2017/11/19', 39000, 35000,  'Y');
INSERT INTO TOURCONF
VALUES(10, '2017/11/24', '2017/11/30', 59000, 52000,  'Y');
INSERT INTO TOURCONF
VALUES(11, '2017/12/21', '2017/12/26', 159000, 122000,  'Y');
COMMIT;

CREATE TABLE TOURDETAIL (

  TOUR_ID NUMBER,
  TOUR_INFO VARCHAR2(500),
  TOUR_GUIDEMENT VARCHAR2(500),
  TOUR_MEETINGPLACE VARCHAR2(200),--주소
  TOUR_TOURLIST VARCHAR2(500),
  TOUR_HISTORY VARCHAR2(4000),--포함내역
  TOUR_SCHEDULE VARCHAR2(4000),
  TOUR_OPTION VARCHAR2(4000),
  TOUR_POLICY VARCHAR2(4000),--환불취소정책
  
  CONSTRAINT PK_TDID PRIMARY KEY (TOUR_ID),
  CONSTRAINT FK_TDID FOREIGN KEY (TOUR_ID) REFERENCES TOUR ON DELETE CASCADE
);
INSERT INTO TOURDETAIL
VALUES(1, '패키지 1번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(2, '패키지 2번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(3, '패키지 3번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(4, '패키지 4번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(5, '패키지 5번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(6, '패키지 6번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(7, '패키지 7번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(8, '패키지 8번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(9, '패키지 9번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');
INSERT INTO TOURDETAIL
VALUES(10, '패키지 10번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');

INSERT INTO TOURDETAIL
VALUES(11, '패키지 11번 여행 간단 소개', '가이드의 한마디~', '강원 춘천시 남산면 남이섬길 1', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

여행일정 및 자유시간 중 고객님의 안전을 위하여 가이드(드라이빙 가이드 포함)의 안내사항 및 안전 수칙을 준수하여 모든 안전사고에 유의하시기 바랍니다.

특히 현지 선택 관광 또는 자유일정은 가이드의 주의사항 및 사전 안내문구를 숙지 후 참여와 관광을 결정하여 주시기 바라며, 이용자 본인의 과실 및 본인 건강상태로 인하여 발생한 안전사고에 대해서는 이용자 본인의 책임임을 알려드립니다.', '인솔자정보
※본 상품은 인솔자 및 가이드가 별도로 없으며, 기사님이 진행 하는 상품입니다.', '소비자피해규정
[특별약관 취소료 규정]
이 상품은 기차, 항공(또는 선박)좌석 또는 호텔객실에 대한 비용을 선납해 놓은 상품으로, 취소 또는 예약변경시 하단의 취소료가 적용됩니다.

- 여행개시 4일전까지(~4) 통보시 : 계약금 환급
- 여행개시 3일전까지(3~3) 통보시: 여행요금중 20%배상
- 여행개시 2일전까지(2~2) 통보시: 여행요금중 50%배상
- 여행개시 1일전까지(1~1) 통보시: 여행요금중 100%배상, 환불없음');





/*패키지여행 후기 테이블*/
CREATE TABLE TOUR_REVIEW
(  
  TR_NO NUMBER,
  TR_TOUR_ID NUMBER CONSTRAINT NN_TR_TID NOT NULL,
  TR_DATE DATE DEFAULT SYSDATE,
  TR_WRITER_ID VARCHAR2(15) CONSTRAINT NN_TR_WID NOT NULL,
  TR_TITLE VARCHAR2(50) CONSTRAINT NN_TR_TITLE NOT NULL,
  TR_CONTENT VARCHAR2(4000) CONSTRAINT NN_TR_CONTENT NOT NULL,
  TR_GRADE NUMBER(3,1) DEFAULT 10.0,
  
  CONSTRAINT PK_TR_NO PRIMARY KEY(TR_NO),
  CONSTRAINT FK_TR_TID FOREIGN KEY(TR_TOUR_ID) REFERENCES TOUR ON DELETE CASCADE,
  CONSTRAINT FK_TR_WID FOREIGN KEY(TR_WRITER_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_TR_GRADE CHECK (TR_GRADE BETWEEN 1.0 AND 10.0)
);
COMMENT ON TABLE TOUR_REVIEW IS '여행 패키지 후기 게시판';
COMMENT ON COLUMN TOUR_REVIEW.TR_NO IS '게시글 번호';
COMMENT ON COLUMN TOUR_REVIEW.TR_TOUR_ID IS '패키지상품 ID';
COMMENT ON COLUMN TOUR_REVIEW.TR_DATE IS '게시 날짜';
COMMENT ON COLUMN TOUR_REVIEW.TR_WRITER_ID IS '작성자 아이디';
COMMENT ON COLUMN TOUR_REVIEW.TR_TITLE IS '제목';
COMMENT ON COLUMN TOUR_REVIEW.TR_CONTENT IS '내용';
COMMENT ON COLUMN TOUR_REVIEW.TR_GRADE IS '평점';


-- TOUR_REVIEW
INSERT INTO TOUR_REVIEW
VALUES(1, 1, DEFAULT, 'ib1500', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(2, 1, DEFAULT, 'ksm1225', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(3, 1, DEFAULT, 'jnh0930', '나쁘지않은 여행이였어요!!!', '시간이 된다면 또 가고 싶습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(4, 1, DEFAULT, 'kdy0820', '날씨 때문에 좀 아쉬웠습니다', '다음에 날씨 좋을 때 다시가고 싶네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(5, 1, DEFAULT, 'usb0119', '2%아쉬운 여행이었습니다.', '맛있는게 많아서 좋았습니다. 뭔가 아쉬운거 빼곤..', 10);
INSERT INTO TOUR_REVIEW
VALUES(6, 1, DEFAULT, 'iss0426', '가격도 괜찮아서 좋았습니다.', '다음에 또 찾을 것 같네요', 8);

INSERT INTO TOUR_REVIEW
VALUES(7, 3, DEFAULT, 'iss0426', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 9);
INSERT INTO TOUR_REVIEW
VALUES(8, 2, DEFAULT, 'iss0426', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(9, 5, DEFAULT, 'ksm1225', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 9);
INSERT INTO TOUR_REVIEW
VALUES(10, 9, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(11, 10, DEFAULT, 'ib1500', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 5);

INSERT INTO TOUR_REVIEW
VALUES(12, 5, DEFAULT, 'iss0426', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 7);
INSERT INTO TOUR_REVIEW
VALUES(13, 5, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 6);
INSERT INTO TOUR_REVIEW
VALUES(14, 7, DEFAULT, 'kdy0820', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(15, 10, DEFAULT, 'ksm1225', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 6);
INSERT INTO TOUR_REVIEW
VALUES(16, 9, DEFAULT, 'ksm1225', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 7);


CREATE TABLE TOUR_IMAGE (
  IMAGE_RNAME VARCHAR2(100),
  IMAGE_ONAME VARCHAR2(100),
  TOUR_ID NUMBER,
  
  CONSTRAINT PK_RNAME PRIMARY KEY(IMAGE_RNAME),
  CONSTRAINT FK_IMG_TID FOREIGN KEY(TOUR_ID) REFERENCES TOUR ON DELETE CASCADE
);

INSERT INTO TOUR_IMAGE VALUES('201712345.jpg','201712345.jpg',1);
INSERT INTO TOUR_IMAGE VALUES('201712344.jpg','201712344.jpg',1);

INSERT INTO TOUR_IMAGE VALUES('201744951.jpg','201744951.jpg',2);
INSERT INTO TOUR_IMAGE VALUES('201720451.jpg','201720451.jpg',2);

INSERT INTO TOUR_IMAGE VALUES('201708443.jpg','201708443.jpg',3);
INSERT INTO TOUR_IMAGE VALUES('201708442.jpg','201708442.jpg',3);

INSERT INTO TOUR_IMAGE VALUES('201738333.jpg','201738333.jpg',4);
INSERT INTO TOUR_IMAGE VALUES('201738322.jpg','201738322.jpg',4);

INSERT INTO TOUR_IMAGE VALUES('201724512.jpg','201724512.jpg',5);
INSERT INTO TOUR_IMAGE VALUES('201724511.jpg','201724511.jpg',5);

INSERT INTO TOUR_IMAGE VALUES('201742722.jpg','201742722.jpg',6);
INSERT INTO TOUR_IMAGE VALUES('201742711.jpg','201742711.jpg',6);

INSERT INTO TOUR_IMAGE VALUES('201758211.jpg','201758211.jpg',7);
INSERT INTO TOUR_IMAGE VALUES('201758222.jpg','201758222.jpg',7);

INSERT INTO TOUR_IMAGE VALUES('201775922.jpg','201775922.jpg',8);
INSERT INTO TOUR_IMAGE VALUES('201775911.jpg','201775911.jpg',8);

INSERT INTO TOUR_IMAGE VALUES('201758311.jpg','201758311.jpg',9);
INSERT INTO TOUR_IMAGE VALUES('201758322.jpg','201758322.jpg',9);

INSERT INTO TOUR_IMAGE VALUES('201719722.jpg','201719722.jpg',10);
INSERT INTO TOUR_IMAGE VALUES('201719711.jpg','201719711.jpg',10);

INSERT INTO TOUR_IMAGE VALUES('201757881.jpg','201757881.jpg',11);
INSERT INTO TOUR_IMAGE VALUES('201757882.jpg','201757882.jpg',11);


 CREATE TABLE TOUR_RESERVE(
  TR_ID NUMBER,
  MEMBER_ID VARCHAR2(15),
  TOUR_ID NUMBER,
  TR_DATE DATE DEFAULT SYSDATE, 
  TR_STATE VARCHAR2(20),
  TR_SDATE DATE,
  TR_ADATE DATE,
  TR_ADULT NUMBER,
  TR_CHILD NUMBER,
  TR_TPRICE NUMBER,
  
  CONSTRAINT PK_TRID PRIMARY KEY(TR_ID),
  CONSTRAINT FK_TRMID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_TRTID FOREIGN KEY(TOUR_ID) REFERENCES TOUR
);

INSERT INTO TOUR_RESERVE VALUES(1,'ib1500',3,'2017-11-06','예약확인','2017-11-07','2017-11-09',2,2,206000);
INSERT INTO TOUR_RESERVE VALUES(2,'ksm1225',3,'2017-11-08','예약확인','2017-11-09','2017-11-12',1,2,157000);
INSERT INTO TOUR_RESERVE VALUES(3,'jnh0930',3,'2017-11-10','예약확인','2017-11-11','2017-11-15',3,4,363000);
INSERT INTO TOUR_RESERVE VALUES(4,'kdy0820',4,'2017-11-12','예약확인','2017-11-14','2017-11-18',2,2,224000);
INSERT INTO TOUR_RESERVE VALUES(5,'usb0119',1,'2017-11-14','예약확인','2017-11-15','2017-11-19',3,5,417000);
INSERT INTO TOUR_RESERVE VALUES(6,'iss0426',1,'2017-11-16','예약확인','2017-11-17','2017-11-21',2,4,342000);

commit;
