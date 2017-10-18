-- SYSTEM ���� ����
--CREATE MEMBER tonight IDENTIFIED BY tonight;
--GRANT CONNECT, RESOURCE TO tonight;

--DROP TABLE ACCOM_FILE;
--DROP TABLE ACCOM;
--DROP TABLE MEMBER;


/*����� ���̺�*/
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
  CONSTRAINT CHK_MEMBER_TYPE CHECK(MEMBER_TYPE IN ('U', 'B', 'G', 'M')),  /*�����, �����, ���̵�, ������*/
  CONSTRAINT UNI_MEMBER_PHOHNE UNIQUE(MEMBER_PHONE),
  CONSTRAINT CHK_MEMBER_RANK CHECK (MEMBER_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE MEMBER IS '�����';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS 'ȸ�� Ÿ��';
COMMENT ON COLUMN MEMBER.MEMBER_BIRTH_DATE IS '�������';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.MEMBER_ADDRESS IS '�ּ�';
COMMENT ON COLUMN MEMBER.MEMBER_RANK IS 'ȸ�� ���';


/*********************INSERT*********************/

-- ������
INSERT INTO MEMBER
VALUES('admin', 'admin', '������', 'M', '19930209', '01090302469', 'admin@iei.or.kr', '���� ������ ������� 14', 'DIAMOND');

-- �����
INSERT INTO MEMBER VALUES('ib1500','asd123','�迩��','U','19920313','010-6427-4492','ib1500@naver.com','��⵵ ������ ��ȱ�',default);
INSERT INTO MEMBER VALUES('ksm1225','asd456','��ҹ�','U','19931225','010-1235-7848','ib1400@naver.com','��⵵ �Ȼ�� �絿',default);
INSERT INTO MEMBER VALUES('jnh0930','asd789','������','U','19940930','010-7643-1247','ib1300@naver.com','��⵵ ����� ���յ�',default);
INSERT INTO MEMBER VALUES('kdy0820','asd012','�赵��','U','19950820','010-9274-4982','ib1200@naver.com','��⵵ �Ⱦ�� ������',default);
INSERT INTO MEMBER VALUES('usb0119','asd345','���ű�','U','19960119','010-9577-0183','ib1100@naver.com','��⵵ ������ ����',default);
INSERT INTO MEMBER VALUES('ych0426','asd678','����ȣ','U','19970426','010-0027-4891','ib1000@naver.com','��⵵ ���� �����',default);

-- ���̵�
INSERT INTO MEMBER
VALUES ('gyeontae12', 'gt1212', '�����', 'G', '19900509', '01023324234', 'gyeontae12@naver.com', '������ ��õ�� ��ȭ�� 8', DEFAULT);
INSERT INTO MEMBER
VALUES ('ganghwa12', 'gh1212', '�ڰ�ȭ', 'G', '19830209', '01089445266', 'ganghwa83@google.com', '������ ���ֽ� �߾ӵ� 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('haeyeon', 'hy1212', '���ؿ�', 'G', '19890816', '01056485231', 'haeyeon89@naver.com', '������ ���ֽ� �ε� 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('is8899', 'is8899', '���μ�', 'G', '19880909', '01028854621', 'is8899@naver.com', '������ ���ֽ� �ε� 2', DEFAULT);
INSERT INTO MEMBER
VALUES ('skwang93', 'sk9393', '���ű�', 'G', '19930425', '01036548526', 'skwang93@naver.com', '������ ���ؽ� �򸪵� 2-1', DEFAULT);
INSERT INTO MEMBER
VALUES ('kangnam95', 'kangnam95', '�̰���', 'G', '19950821', '01032532786', 'kangnam95@naver.com', '������ ���� ������ ������ 183-4', DEFAULT);

-- �����
insert into MEMBER VALUES('BIZ01', 'PASS11','������', 'B', '19901212', '01012345678', 'moMEMBER@nate.com', '��õ�� ������ ������ 293-2', default); 
insert into MEMBER VALUES('NAMU01', 'PASS22','������', 'B', '19930931', '01023456781', 'namu@naver.com', '����� ���ı� ������ ���߾���Ʈ 302�� 1301ȣ', default); 
insert into MEMBER VALUES('INSUNG', 'PASS33','���μ�', 'B', '19950206', '01034567812', 'bestfriend@daum.net', '��õ�� ������ ������ 108-2', default); 
insert into MEMBER VALUES('SONEJH12', 'PASS44','������', 'B', '19870723', '01045678123', 'sonejh12@nate.com', '��õ�� ���� �ɰ 293-2', default); 
insert into MEMBER VALUES('MBMGOOD', 'PASS55','�����', 'B', '19890301', '01056781234', 'mbm@nate.com', '��⵵ ������ ��ȱ� �ΰ赿 136-2', default); 
insert into MEMBER VALUES('SINKWANNG', 'PASS66','���ű�', 'B', '19930411', '01045678321', 'bf5000@naver.com', '����� ���α� ���ε� �������Ʈ 202�� 1907ȣ', default); 


commit;