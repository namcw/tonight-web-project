-- SYSTEM 계정 설정
--CREATE MEMBER tonight IDENTIFIED BY tonight;
--GRANT CONNECT, RESOURCE TO tonight;

--DROP TABLE TOUR_REVIEW;
--DROP TABLE TOUR;
--DROP TABLE MEMBER;
drop table faq;

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
  CONSTRAINT UNI_MPHOHNE UNIQUE(MEMBER_PHONE),
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


/*패키지여행 테이블*/
--drop table tour;
CREATE TABLE TOUR
(
  TOUR_ID NUMBER,
  TOUR_TITLE VARCHAR2(500) CONSTRAINT NN_TTITLE NOT NULL,
  GUIDE_ID VARCHAR2(15) CONSTRAINT NN_GID NOT NULL,
  TOUR_THUMNAIL_PATH VARCHAR2(500),
  
  
  CONSTRAINT PK_TID PRIMARY KEY (TOUR_ID),
  CONSTRAINT FK_GID FOREIGN KEY (GUIDE_ID) REFERENCES MEMBER

);
INSERT INTO TOUR
VALUES(1, '대한민국 유일 탐험동굴! 평창 백룡동굴,예쁜 허브나라 [당일]', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(2, '[리조트급]강원도 산과 바다명소 즐기기! 대관령 하늘목장,경포대,하조대,설악산 트레킹 1박2일', 'haeyeon', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(3, '[명사여행♥정선편] 진용선 관장의 발길 따라 피어난 아리랑~ 정선 아리랑박물관  영월, 강릉 명소 여행', 'is8899', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(4, '[관광호텔급]동해안 7번국도! 추암촛대바위, 묵호항, 안목커피거리, 울진불영사 1박2일', 'kangnam95', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(5, '♣강원도 명산! 설악산 등산 힐링여행 1박2일♣', 'ganghwa12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(6, '가족여행 프로젝트 1탄! 럭셔리 리무진 타고 떠나는 강원권 2박3일', 'skwang93', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(7, '대관령양떼목장, 경포대(바다,호수)', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(8, '대한민국 유일 탐험동굴! 평창 백룡동굴,예쁜 허브나라 [당일]', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(9, '[리조트급]강원도 산과 바다명소 즐기기! 대관령 하늘목장,경포대,하조대,설악산 트레킹 1박2일', 'haeyeon', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(10, '[명사여행♥정선편] 진용선 관장의 발길 따라 피어난 아리랑~ 정선 아리랑박물관  영월, 강릉 명소 여행', 'is8899', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(11, '[관광호텔급]동해안 7번국도! 추암촛대바위, 묵호항, 안목커피거리, 울진불영사 1박2일', 'kangnam95', '/tonight/uploadfiles/image.jpg');

commit;
CREATE TABLE TOURCONF (
  
  TOUR_ID NUMBER,
  START_DATE DATE CONSTRAINT NN_STARTDATE NOT NULL,
  ARRIVAL_DATE DATE CONSTRAINT NN_ARRIVALDATE NOT NULL,
  TOUR_ADULT_PRICE NUMBER,
  TOUR_CHILD_PRICE NUMBER,
  TOUR_DISCOUNT NUMBER(3,2) DEFAULT 0.00,
  TOUR_STATE CHAR(1),
  
  CONSTRAINT PK_TCID PRIMARY KEY (TOUR_ID, START_DATE),
  CONSTRAINT FK_TID FOREIGN KEY (TOUR_ID) REFERENCES TOUR
);
INSERT INTO TOURCONF
VALUES(1, '2017/11/11', '2017/11/13', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(1, '2017/11/20', '2017/11/22', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(1, '2017/11/22', '2017/11/24', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(2, '2017/11/11', '2017/11/13', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(3, '2017/11/11', '2017/11/13', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(4, '2017/11/11', '2017/11/13', 30000, 25000, DEFAULT, 'Y');
INSERT INTO TOURCONF
VALUES(5, '2017/11/11', '2017/11/13', 30000, 25000, DEFAULT, 'Y');

commit;
CREATE TABLE TOURDETAIL (

  TOUR_ID NUMBER,
  TOUR_INTRO VARCHAR2(500),
  TOUR_TOURLIST VARCHAR2(500),
  TOUR_HISTORY VARCHAR2(4000),
  TOUR_SCHEDULE VARCHAR2(4000),
  TOUR_OPTION VARCHAR2(4000),
  TOUR_POLICY VARCHAR2(4000),
  
  CONSTRAINT PK_TDID PRIMARY KEY (TOUR_ID),
  CONSTRAINT FK_TDID FOREIGN KEY (TOUR_ID) REFERENCES TOUR
);
INSERT INTO TOURDETAIL
VALUES(1, '패키지 1번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(2, '패키지 2번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(3, '패키지 3번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(4, '패키지 4번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(5, '패키지 5번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(6, '패키지 6번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(7, '패키지 7번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(8, '패키지 8번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(9, '패키지 9번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(10, '패키지 10번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
VALUES(11, '패키지 11번 여행 간단 소개', '강원도,지역1,지역2,지역3', '2014년 8월 7일부터 출발하는 모든 국내여행상품은 개인정보 보호법(주민등록번호 처리의 제한)에 의거하여 
개인정보(주민번호)수집이 불가함에 따라 여행자보험가입이 불포함으로 변경되었습니다. 
단, 여행일정중에 이용되는 교통수단(항공,철도,선박,버스 전용차량등)은 각각 별도의 보험이 가입되어 있음을 알려드립니다. 
여행자보험가입을 원하실 경우에는 개별가입을 권장합니다. 

(보험문의 : TOURSAFE 투어세이프 ☎1800-9010 / 010-5458-8679)', '◈유의사항 꼭! 읽어보세요◈

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
  CONSTRAINT FK_TR_TID FOREIGN KEY(TR_TOUR_ID) REFERENCES TOUR,
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
VALUES(1, 1, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(2, 1, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(3, 1, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(4, 1, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(5, 1, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(6, 1, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);

INSERT INTO TOUR_REVIEW
VALUES(7, 3, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 9);
INSERT INTO TOUR_REVIEW
VALUES(8, 2, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(9, 5, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 9);
INSERT INTO TOUR_REVIEW
VALUES(10, 9, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 10);
INSERT INTO TOUR_REVIEW
VALUES(11, 10, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 5);

INSERT INTO TOUR_REVIEW
VALUES(12, 5, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 7);
INSERT INTO TOUR_REVIEW
VALUES(13, 5, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 6);
INSERT INTO TOUR_REVIEW
VALUES(14, 7, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 8);
INSERT INTO TOUR_REVIEW
VALUES(15, 10, DEFAULT, 'jnh0930', '좋은 여행이였어요!!!', '가이드분도 친절하시고 여행 일정도 마음에 들었습니다.', 6);
INSERT INTO TOUR_REVIEW
VALUES(16, 9, DEFAULT, 'usb0119', '그럭저럭 괜찮은 여행이였습니다.', '다음에 또 찾을 것 같네요', 7);
commit;

/*숙소 테이블*/
CREATE TABLE ACCOMMODATION
(
  ACC_ID NUMBER,                                      /*숙소 아이디*/
  BIZ_ID VARCHAR2(20) CONSTRAINT NN_BIZ_ID NOT NULL,  /*사업자 아이디*/ 
  ACC_NAME VARCHAR2(50),                              /*숙소 이름*/
  ACC_TYPE CHAR(1) CONSTRAINT NN_ACC_TYPE NOT NULL,   /*숙소 타입*/
  ACC_ADDRESS VARCHAR2(50) CONSTRAINT NN_ACC_ADDRESS NOT NULL,/*숙소 주소*/
  ACC_CONTACT VARCHAR2(50),                           /*숙소 연락처*/
  ACC_RANK VARCHAR2(8) DEFAULT 'SILVER',              /*숙소 등급*/
  ACC_IMAGE_PATH VARCHAR2(500),                       /*숙소 이미지 경로*/
  ACC_RULES VARCHAR2(4000),                           /*숙소 이용 규칙*/
  ACC_lOCATIONINFO VARCHAR2(4000),                    /*숙소 위치 정보*/
  ACC_FACILITIES VARCHAR2(4000),                      /*편의 시설*/
  ACC_REFUND VARCHAR2(4000),                          /*환불 규정*/
  
  CONSTRAINT PK_ACC_ID PRIMARY KEY(ACC_ID),
  CONSTRAINT FK_BIZ_ID FOREIGN KEY(BIZ_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_ACC_TYPE CHECK (ACC_TYPE IN ('H', 'M', 'G', 'P')),  /*호텔, 모텔, 게스트하우스, 펜션*/
  CONSTRAINT CHK_ACC_RANK CHECK (ACC_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE ACCOMMODATION IS '숙소';
COMMENT ON COLUMN ACCOMMODATION.ACC_ID IS '숙소 아이디';
COMMENT ON COLUMN ACCOMMODATION.BIZ_ID IS '사업자 아이디';
COMMENT ON COLUMN ACCOMMODATION.ACC_NAME IS '숙소 이름';
COMMENT ON COLUMN ACCOMMODATION.ACC_TYPE IS '숙소 타입';
COMMENT ON COLUMN ACCOMMODATION.ACC_ADDRESS IS '숙소 주소';
COMMENT ON COLUMN ACCOMMODATION.ACC_CONTACT IS '숙소 연락처';
COMMENT ON COLUMN ACCOMMODATION.ACC_RANK IS '숙소 등급';
COMMENT ON COLUMN ACCOMMODATION.ACC_IMAGE_PATH IS '숙소 이미지 경로';
COMMENT ON COLUMN ACCOMMODATION.ACC_RULES IS '숙소 이용 규칙';
COMMENT ON COLUMN ACCOMMODATION.ACC_lOCATIONINFO IS '숙소 위치 정보';
COMMENT ON COLUMN ACCOMMODATION.ACC_FACILITIES IS '편의 시설';
COMMENT ON COLUMN ACCOMMODATION.ACC_REFUND IS '환불 규정';

/*숙소 이미지 테이블*/ 
CREATE TABLE ACCOMMODATION_IMAGE
(
  ACC_ID NUMBER,           /*숙소 아이디*/
  ACC_IMAGE VARCHAR2(500),  /*숙소 이미지*/
  
  CONSTRAINT FK_IMAGE FOREIGN KEY (ACC_ID) REFERENCES ACCOMMODATION
);

COMMENT ON TABLE ACCOMMODATION_IMAGE IS '숙소 이미지 테이블';
COMMENT ON COLUMN ACCOMMODATION_IMAGE.ACC_ID IS '숙소 아이디';
COMMENT ON COLUMN ACCOMMODATION_IMAGE.ACC_IMAGE IS '숙소 이미지';


/*샘플데이터*/
-- ACCOMMODATION 
INSERT INTO ACCOMMODATION VALUES(1, 'MBMGOOD', '라마다호텔', 'H', '강원도 춘천시 가평군 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 15시 체크인 1시', '가평역서 도보 3분거리',
'샴푸,수건,와이파이', '체크인 5일 전까지 취소하면 전액이 환불됩니다');

INSERT INTO ACCOMMODATION VALUES(2, 'INSUNG', '강원게스트하우스', 'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 차로 3분거리',
'와이파이', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(3, 'SONEJH12', '바다펜션', 'P', '강원도 춘천시 가평군 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 도보 5분거리',
'와이파이,TV', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(4, 'NAMU01', '청호모텔', 'M', '강원도 속초시 청호해안길 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '터미널서 도보 10분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(5, 'BIZ01', '정동진펜션', 'P', '강원도 강릉시 연곡면 영진4길 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '정동진역 교통 5분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(6, 'MBMGOOD', '라마다호텔1', 'H', '강원도 춘천시 가평군 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 15시 체크인 1시', '가평역서 도보 3분거리',
'샴푸,수건,와이파이', '체크인 5일 전까지 취소하면 전액이 환불됩니다');

INSERT INTO ACCOMMODATION VALUES(7, 'INSUNG', '강원게스트하우스2', 'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 차로 3분거리',
'와이파이', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(8, 'SONEJH12', '바다펜션2', 'P', '강원도 춘천시 가평군 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 도보 5분거리',
'와이파이,TV', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(9, 'NAMU01', '청호모텔3', 'M', '강원도 속초시 청호해안길 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '터미널서 도보 10분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(10, 'BIZ01', '정동진펜션3', 'P', '강원도 강릉시 연곡면 영진4길 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '정동진역 교통 5분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(11, 'MBMGOOD', '라마다호텔3', 'H', '강원도 춘천시 가평군 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 15시 체크인 1시', '가평역서 도보 3분거리',
'샴푸,수건,와이파이', '체크인 5일 전까지 취소하면 전액이 환불됩니다');

INSERT INTO ACCOMMODATION VALUES(12, 'INSUNG', '강원게스트하우스4', 'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 차로 3분거리',
'와이파이', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(13, 'SONEJH12', '바다펜션4', 'P', '강원도 춘천시 가평군 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 도보 5분거리',
'와이파이,TV', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(14, 'NAMU01', '청호모텔4', 'M', '강원도 속초시 청호해안길 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '터미널서 도보 10분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(15, 'BIZ01', '정동진펜션5', 'P', '강원도 강릉시 연곡면 영진4길 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '정동진역 교통 5분거리',
'와이파이,TV', '체크인 일주일 전까지는 환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(16, 'MBMGOOD', '라마다호텔6', 'H', '강원도 춘천시 가평군 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 15시 체크인 1시', '가평역서 도보 3분거리',
'샴푸,수건,와이파이', '체크인 5일 전까지 취소하면 전액이 환불됩니다');

INSERT INTO ACCOMMODATION VALUES(17, 'INSUNG', '강원게스트하우스6', 'G', '강원도 춘천시 가평군 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 차로 3분거리',
'와이파이', '환불이 불가합니다.');

INSERT INTO ACCOMMODATION VALUES(18, 'SONEJH12', '바다펜션6', 'P', '강원도 춘천시 가평군 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', '체크인 12시 체크인 1시', '가평역서 도보 5분거리',
'와이파이,TV', '환불이 불가합니다.');

commit;
/*객실 테이블*/
CREATE TABLE ROOM
(   
  ROOM_ID CHAR(3),                        /*객실 아이디*/
  ACC_ID CHAR(5) CONSTRAINT NN_ACC_ID NOT NULL, /*숙소 번호*/
  ROOM_STATE CHAR(1),                     /*객실 예약 가능 상태*/
  ROOM_ADULT_PRICE NUMBER,                /*성인 가격*/
  ROOM_CHILD_PRICE NUMBER,                /*소인 가격*/
  ROOM_DISCOUNT NUMBER(3,2) DEFAULT 0.00, /*할인율*/
  ROOM_IMAGE_PATH VARCHAR2(500),          /*객실 이미지 경로*/
  ROOM_DETAILS  VARCHAR2(4000),            /*상세정보*/
  
  CONSTRAINT PK_ROOM_ID PRIMARY KEY(ROOM_ID),
  CONSTRAINT FK_ACC_ID FOREIGN KEY(ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT CHK_ROOM_STATE CHECK (ROOM_STATE IN ('Y', 'N')),
  CONSTRAINT CHK_ROOM_ADULT_PRICE CHECK (ROOM_ADULT_PRICE >= ROOM_CHILD_PRICE),
  CONSTRAINT CHK_ROOM_CHILD_PRICE CHECK (ROOM_CHILD_PRICE > 0),
  CONSTRAINT CHK_ROOM_DISCOUNT CHECK (ROOM_DISCOUNT BETWEEN 0.0 AND 1.0)
);
COMMENT ON TABLE ROOM IS '객실';
COMMENT ON COLUMN ROOM.ROOM_ID IS '객실 아이디';
COMMENT ON COLUMN ROOM.ACC_ID IS '숙소 번호';
COMMENT ON COLUMN ROOM.ROOM_STATE IS '객실 예약 가능 상태';
COMMENT ON COLUMN ROOM.ROOM_ADULT_PRICE IS '성인 가격';
COMMENT ON COLUMN ROOM.ROOM_CHILD_PRICE IS '소인 가격';
COMMENT ON COLUMN ROOM.ROOM_DISCOUNT IS '할인율';
COMMENT ON COLUMN ROOM.ROOM_IMAGE_PATH IS '객실 이미지 경로';
COMMENT ON COLUMN ROOM.ROOM_DETAILS IS '상세정보';



/*객실 예약 테이블*/
CREATE TABLE RESERVE_ROOM
(
  REV_RID CHAR(5),                                /*객실 예약 번호*/
  USER_ID VARCHAR2(15) CONSTRAINT NN_ROOM_USER_ID NOT NULL, /*예약자 ID*/
  ACC_ID CHAR(5)  CONSTRAINT NN_REV_ACC_ID NOT NULL, /*예약 숙소 ID*/
  ROOM_ID CHAR(3) CONSTRAINT NN_REV_ROOM_ID NOT NULL, /*예약 객실 ID*/
  CHECK_IN DATE CONSTRAINT NN_CHECK_IN NOT NULL,  /*체크인 날짜*/
  CHECK_OUT DATE CONSTRAINT NN_CHECK_OUT NOT NULL,/*체크아웃 날짜*/
  REV_ROOM_DATE  DATE DEFAULT SYSDATE,            /*예약 신청 일자*/
  REV_ROOM_STATE VARCHAR2(13),                    /*결제 상태*/
  REV_ROOM_ADULT NUMBER DEFAULT 1,                /*성인 예약 인원수*/
  REV_ROOM_CHILD NUMBER,                          /*소인 예약 인원수*/
  TOTAL_ROOM_PRICE NUMBER CONSTRAINT NN_TOTAL_ROOM_PRICE NOT NULL,  /*총 가격*/
  REV_ROOM_EVENT VARCHAR2(20),                                      /*게임 이벤트 증정 상품*/
  
  CONSTRAINT PK_REV_RID PRIMARY KEY(REV_RID),
  CONSTRAINT FK_ROOM_USER_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_REV_ACC_ID FOREIGN KEY(ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT FK_REV_ROOM_ID FOREIGN KEY(ROOM_ID) REFERENCES ROOM,
  CONSTRAINT CHK_REV_ROOM_STATE CHECK (REV_ROOM_STATE IN ('결제완료', '예약취소', '입금대기'))
);
COMMENT ON TABLE RESERVE_ROOM IS '객실 예약';
COMMENT ON COLUMN RESERVE_ROOM.REV_RID IS '객실 예약 번호';
COMMENT ON COLUMN RESERVE_ROOM.USER_ID IS '예약자 ID';
COMMENT ON COLUMN RESERVE_ROOM.ACC_ID IS '예약 숙소 ID';
COMMENT ON COLUMN RESERVE_ROOM.ROOM_ID IS '예약 객실 ID';
COMMENT ON COLUMN RESERVE_ROOM.CHECK_IN IS '체크인 날짜';
COMMENT ON COLUMN RESERVE_ROOM.CHECK_OUT IS '체크아웃 날짜';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_DATE IS '예약 신청 일자';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_STATE IS '결제 상태';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_ADULT IS '성인 예약 인원수';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_CHILD IS '소인 예약 인원수';
COMMENT ON COLUMN RESERVE_ROOM.TOTAL_ROOM_PRICE IS '총 가격';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_EVENT IS '게임 이벤트 증정 상품';


/*패키지여행 예약 테이블*/
CREATE TABLE RESERVE_TOUR
(
  REV_TID CHAR(5),                                /*패키지상품 예약 번호*/
  USER_ID VARCHAR2(15) CONSTRAINT NN_TOUR_USER_ID NOT NULL, /*예약자 ID*/
  TOUR_ID CHAR(5) CONSTRAINT NN_REV_TOUR_ID NOT NULL, /*예약 패키지상품 ID*/
  REV_TOUR_DATE  DATE DEFAULT SYSDATE,            /*예약 신청 일자*/
  REV_TOUR_STATE VARCHAR2(13),                    /*결제 상태*/
  REV_TOUR_ADULT NUMBER DEFAULT 1,                /*성인 예약 인원수*/
  REV_TOUR_CHILD NUMBER,                          /*소인 예약 인원수*/
  TOTAL_TOUR_PRICE NUMBER CONSTRAINT NN_TOTAL_TOUR_PRICE NOT NULL,  /*총 가격*/
  REV_TOUR_EVENT VARCHAR2(20),                                      /*게임 이벤트 증정 상품*/
  
  CONSTRAINT PK_REV_TID PRIMARY KEY(REV_TID),
  CONSTRAINT FK_TOUR_USER_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_REV_TOUR_ID FOREIGN KEY(TOUR_ID) REFERENCES TOUR,
  CONSTRAINT CHK_REV_TOUR_STATE CHECK (REV_TOUR_STATE IN ('결제완료', '예약취소', '입금대기'))
);
COMMENT ON TABLE RESERVE_TOUR IS '패키지여행 예약';
COMMENT ON COLUMN RESERVE_TOUR.REV_TID IS '패키지여행 예약 번호';
COMMENT ON COLUMN RESERVE_TOUR.USER_ID IS '예약자 ID';
COMMENT ON COLUMN RESERVE_TOUR.TOUR_ID IS '예약 패키지상품 ID';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_DATE IS '예약 신청 일자';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_STATE IS '결제 상태';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_ADULT IS '성인 예약 인원수';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_CHILD IS '소인 예약 인원수';
COMMENT ON COLUMN RESERVE_TOUR.TOTAL_TOUR_PRICE IS '총 가격';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_EVENT IS '게임 이벤트 증정 상품';


CREATE TABLE MESSAGE
( 
  MSG_ID NUMBER,                /*메시지 아이디*/
  SEND_DATE DATE DEFAULT SYSDATE, /*보낸 날짜*/
  SENDER_ID VARCHAR2(15) CONSTRAINT NN_SENDER_ID NOT NULL, /*보내는 회원아이디*/
  RECEIVER_ID VARCHAR2(15) CONSTRAINT NN_RECEIVER_ID NOT NULL, /*받는 회원아이디*/
  MSG_CONTENTS VARCHAR(1000) CONSTRAINT NN_MSG_CONTENTS NOT NULL,  /*내용*/
  
  CONSTRAINT PK_MSG_ID PRIMARY KEY(MSG_ID),
  CONSTRAINT FK_SENDER_ID FOREIGN KEY(SENDER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_RECEIVER_ID FOREIGN KEY(RECEIVER_ID) REFERENCES MEMBER
);
COMMENT ON TABLE MESSAGE IS '쪽지';
COMMENT ON COLUMN MESSAGE.MSG_ID IS '메시지 아이디';
COMMENT ON COLUMN MESSAGE.SEND_DATE IS '보낸 날짜';
COMMENT ON COLUMN MESSAGE.SENDER_ID IS '보내는 회원아이디';
COMMENT ON COLUMN MESSAGE.RECEIVER_ID IS '받는 회원아이디';
COMMENT ON COLUMN MESSAGE.MSG_CONTENTS IS '내용';

/*객실 후기 게시판 테이블*/
CREATE TABLE ROOM_REVIEWBOARD
(  
  RRB_NO NUMBER,    /*게시글 번호*/
  RRB_ACC_ID CHAR(5) CONSTRAINT NN_RRB_ACC_ID NOT NULL, /* 숙소 ID */
  RRB_ROOM_ID CHAR(3) CONSTRAINT NN_RRB_ROOM_ID NOT NULL,/*객실 ID*/
  RRB_DATE DATE DEFAULT SYSDATE,  /*게시 날짜*/
  RRB_WRITER_ID VARCHAR2(15) CONSTRAINT NN_RRB_WRITER_ID NOT NULL,   /*작성자 아이디*/
  RRB_TITLE VARCHAR2(50) CONSTRAINT NN_RRB_TITLE NOT NULL,     /*제목*/
  RRB_CONTENTS VARCHAR2(4000) CONSTRAINT NN_RRB_CONTENTS NOT NULL, /*내용*/
  RRB_GRADE NUMBER(3,1) DEFAULT 10.0, /*평점*/
  
  CONSTRAINT PK_RRB_NO PRIMARY KEY(RRB_NO),
  CONSTRAINT FK_RRB_ACC_ID FOREIGN KEY(RRB_ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT FK_RRB_ROOM_ID FOREIGN KEY(RRB_ROOM_ID) REFERENCES ROOM,
  CONSTRAINT FK_RRB_WIRTER_ID FOREIGN KEY(RRB_WRITER_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_RRB_GRADE CHECK (RRB_GRADE BETWEEN 1.0 AND 10.0)
);
COMMENT ON TABLE ROOM_REVIEWBOARD IS '숙소 후기 게시판';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_NO IS '게시글 번호';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_ROOM_ID IS '숙소 ID';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_ROOM_ID IS '객실 ID';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_DATE IS '게시 날짜';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_WRITER_ID IS '작성자 아이디';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_TITLE IS '제목';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_CONTENTS IS '내용';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_GRADE IS '평점';

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
insert into MEMBER VALUES('BIZ01', 'PASS11','김혜정', 'B', '19901212', '01012345678', 'mouser@nate.com', '인천시 남동구 구월동 293-2', default); 
insert into MEMBER VALUES('NAMU01', 'PASS22','남찬우', 'B', '19930931', '01023456781', 'namu@naver.com', '서울시 송파구 문정동 가야아파트 302동 1301호', default); 
insert into MEMBER VALUES('INSUNG', 'PASS33','전인성', 'B', '19950206', '01034567812', 'bestfriend@daum.net', '인천시 연수구 연수동 108-2', default); 
insert into MEMBER VALUES('SONEJH12', 'PASS44','손정한', 'B', '19870723', '01045678123', 'sonejh12@nate.com', '인천시 서구 심곡동 293-2', default); 
insert into MEMBER VALUES('MBMGOOD', 'PASS55','김상혁', 'B', '19890301', '01056781234', 'mbm@nate.com', '경기도 수원시 장안구 인계동 136-2', default); 
insert into MEMBER VALUES('SINKWANNG', 'PASS66','유신광', 'B', '19930411', '01045678321', 'bf5000@naver.com', '서울시 구로구 구로동 남양아파트 202동 1907호', default); 

-- RESERVER_TOUR
INSERT INTO RESERVE_TOUR
VALUES('00001', 'ib1500', '00002', DEFAULT, '입금대기', 2, 0, 198000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00002', 'ksm1225', '00003', DEFAULT, '결제완료', 2, 2, 328000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00003', 'jnh0930', '00003', '2017-09-22', '결제완료', 4, 0, 348000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00004', 'kdy0820', '00001', DEFAULT, '입금대기', 3, 1, 386000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00005', 'ych0426', '00004', DEFAULT, '결제완료', 1, 1, 166000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00006', 'usb0119', '00003', '2017-09-21', '결제완료', 2, 0, 174000, NULL);



-- ACCOMMODATION
INSERT INTO ACCOMMODATION VALUES('00001', 'MBMGOOD', 'H','강원도 춘천시 가평군 16-2', 'SILVER', 'https://www.booking.com/hotel/kr/eco-spa-pension.ko.html','가평역서 차로 5분거리');
INSERT INTO ACCOMMODATION VALUES('00002', 'INSUNG', 'G','강원도 춘천시 가평군 32-2', 'SILVER', 'https://www.kokoasia.net','춘천역 교통 10분거리');
INSERT INTO ACCOMMODATION VALUES('00003', 'SONEJH12', 'P','강원도 춘천시 가평군 16-2', 'DIAMOND', 'https://www.pention.org','가평역서 도보 5분거리');
INSERT INTO ACCOMMODATION VALUES('00004', 'NAMU01', 'M','강원도 속초시 청호해안길 31', 'GOLD', 'https://www.partypary.com','터미널서 도보 10분거리');
INSERT INTO ACCOMMODATION VALUES('00005', 'BIZ01', 'P','강원도 강릉시 연곡면 영진4길 16-2', 'PLATINUM', 'https://www.ROOMPARTY.org','정동진역 교통 5분거리');

-- ROOM
INSERT INTO ROOM
VALUES ('001', '00001', 'Y', '80000', '50000', '0.1', 'http://blog.naver.com/gusdbfl2023/70185568493', '싱글침대1개, 금연룸 냉장고, TV, 숙박가능인원 1명');
INSERT INTO ROOM
VALUES ('002', '00002', 'N', '70000', '55000', '0.0', 'http://blog.naver.com/monsterlabs/221090906585', ' 더블침대1개,싱글침대1개, 금연룸, 냉장고, 무료와이파이, 숙박가능인원 3명');
INSERT INTO ROOM
VALUES ('003', '00002', 'Y', '100000', '80000', '0.2', 'http://blog.naver.com/monsterlabs/221090906585', '더블침대1개, 흡연룸, 냉장고, 에어컨, TV, 숙박가능인원 2명 ');
INSERT INTO ROOM
VALUES ('004', '00003', 'Y', '120000', '70000', '0.3', 'http://blog.daum.net/loooml/457', '싱글침대2개, 금연룸, 무료와이파이, 숙박가능인원 2명 ');
INSERT INTO ROOM
VALUES ('005', '00004', 'Y', '70000', '50000', '0.1', 'http://prod.danawa.com/info', '더블침대2개, 흡연룸, 냉장고, 무료와이파이, 숙박가능인원 2명 ');
INSERT INTO ROOM
VALUES ('006', '00005', 'N', '80000', '50000', '0.1', 'http://blog.naver.com/gusdbfl2023/70185568493', ' 싱글침대1개, 흡연룸, 바다전망, 냉장고, 숙박가능인원 1명');

-- RESERVE_ROOM
INSERT INTO RESERVE_ROOM
VALUES ('75952', 'ib1500','00001', '001', '2017/10/11', '2017/10/12', DEFAULT, '결제완료', '2', '0','160000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('95314', 'ksm1225','00002', '001', '2017/10/11', '2017/10/12', DEFAULT, '입금대기', '1', '1','70000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('85715', 'jnh0930','00002', '002', '2017/09/11', '2017/09/12', DEFAULT,'결제완료', '2', '0','200000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('92142', 'kdy0820','00003', '004', '2017/09/23', '2017/09/25', DEFAULT,'결제완료', '1', '0','120000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('25485', 'usb0119','00004', '005', '2017/09/22', '2017/09/25', DEFAULT, '예약취소', '4', '0','140000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('46585', 'ych0426','00005', '006', '2017/10/11', '2017/10/13', DEFAULT, '입금대기', '1', '0','80000',NULL);

-- ROOM_REVIEWBOARD
INSERT INTO ROOM_REVIEWBOARD
VALUES (1, '00002', '002', DEFAULT, 'jnh0930', '정말 깔끔해요', '푹 쉬다 갑니다-', 10);
INSERT INTO ROOM_REVIEWBOARD
VALUES (2, '00003', '004', DEFAULT, 'kdy0820', '별로에요..', '더러워서 바퀴벌레나올듯.. 다신 안갑니다', 1);

-- QNA
INSERT INTO QNA VALUES(1,'예약을 어떻게 하는지 모르겠습니다','ib1500','사이트에 들어갔는데 어떻게 예약을 하는지 모르겠습니다 자세하게 가르쳐주세요','고객센터에 문의해보세요');
INSERT INTO QNA VALUES(2,'여행 장소 어디가 좋을까??','kdy0820','강릉으로 놀러가는데 어디가 좋을까요 추천좀 해주세요','정동진 가보세요');
INSERT INTO QNA VALUES(3,'속초 가는데 펜션 어디가 있을까요?','usb0119','펜션 깔끔한곳좀 추천해주세요','namoo호텔 좋습니다 깔끔하고 좋아요');

--FAQ INSERT
INSERT INTO FAQ VALUES(1,'예약/결제','예약은 어떻게 하면 되나요?','원하시는 숙소를 선택하신후 원하시는 날짜를 선택하시면 됩니다.',0);
INSERT INTO FAQ VALUES(2,'이벤트','이벤트 참여는 어떻게해요?','게시판에서 확인하시면 됩니다.',0);
INSERT INTO FAQ VALUES(3,'기타','렌트카를 대여할 수 있나요?','렌트카는 안됩니다',0);

-- MESSAGE
INSERT INTO MESSAGE VALUES (1, DEFAULT, 'ib1500', 'gyeontae12' , '안녕하세요. 출발일에 날씨가 안좋으면 어떻게되나요');
INSERT INTO MESSAGE VALUES (2, DEFAULT, 'gyeontae12', 'ib1500' , '고객님께서 다시 예약날짜를 잡아야합니다...');
INSERT INTO MESSAGE VALUES (3, DEFAULT, 'ksm1225', 'SONEJH12' , '펜션에 야외바베큐를 즐길 장소가 있나요? ');
INSERT INTO MESSAGE VALUES (4, DEFAULT, 'SONEJH12', 'ksm1225' , '넵 있습니다 ^^ ');
INSERT INTO MESSAGE VALUES (5, DEFAULT, 'ib1500', 'gyeontae12' , '예약 변경이 가능한가요?');

commit;