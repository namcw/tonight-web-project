-- SYSTEM ���� ����
--CREATE MEMBER tonight IDENTIFIED BY tonight;
--GRANT CONNECT, RESOURCE TO tonight;

--DROP TABLE TOUR_REVIEW;
--DROP TABLE TOUR;
--DROP TABLE MEMBER;
drop table faq;

/*����� ���̺�*/
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
  CONSTRAINT CHK_MTYPE CHECK(MEMBER_TYPE IN ('U', 'B', 'G', 'M')),  /*�����, �����, ���̵�, ������*/
  CONSTRAINT UNI_MPHOHNE UNIQUE(MEMBER_PHONE),
  CONSTRAINT CHK_MRANK CHECK (MEMBER_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE MEMBER IS '�����';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS 'ȸ�� Ÿ��';
COMMENT ON COLUMN MEMBER.MEMBER_BIRTHDATE IS '�������';
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


/*��Ű������ ���̺�*/
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
VALUES(1, '���ѹα� ���� Ž�赿��! ��â ��浿��,���� ��곪�� [����]', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(2, '[����Ʈ��]������ ��� �ٴٸ�� ����! ����� �ϴø���,������,������,���ǻ� Ʈ��ŷ 1��2��', 'haeyeon', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(3, '[��翩�ࢾ������] ���뼱 ������ �߱� ���� �Ǿ �Ƹ���~ ���� �Ƹ����ڹ���  ����, ���� ��� ����', 'is8899', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(4, '[����ȣ�ڱ�]���ؾ� 7������! �߾��д����, ��ȣ��, �ȸ�Ŀ�ǰŸ�, �����ҿ��� 1��2��', 'kangnam95', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(5, '�������� ���! ���ǻ� ��� �������� 1��2�Ϣ�', 'ganghwa12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(6, '�������� ������Ʈ 1ź! ���Ÿ� ������ Ÿ�� ������ ������ 2��3��', 'skwang93', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(7, '����ɾ綼����, ������(�ٴ�,ȣ��)', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(8, '���ѹα� ���� Ž�赿��! ��â ��浿��,���� ��곪�� [����]', 'gyeontae12', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(9, '[����Ʈ��]������ ��� �ٴٸ�� ����! ����� �ϴø���,������,������,���ǻ� Ʈ��ŷ 1��2��', 'haeyeon', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(10, '[��翩�ࢾ������] ���뼱 ������ �߱� ���� �Ǿ �Ƹ���~ ���� �Ƹ����ڹ���  ����, ���� ��� ����', 'is8899', '/tonight/uploadfiles/image.jpg');
INSERT INTO TOUR
VALUES(11, '[����ȣ�ڱ�]���ؾ� 7������! �߾��д����, ��ȣ��, �ȸ�Ŀ�ǰŸ�, �����ҿ��� 1��2��', 'kangnam95', '/tonight/uploadfiles/image.jpg');

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
VALUES(1, '��Ű�� 1�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(2, '��Ű�� 2�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(3, '��Ű�� 3�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(4, '��Ű�� 4�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(5, '��Ű�� 5�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(6, '��Ű�� 6�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(7, '��Ű�� 7�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(8, '��Ű�� 8�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(9, '��Ű�� 9�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(10, '��Ű�� 10�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');
INSERT INTO TOURDETAIL
VALUES(11, '��Ű�� 11�� ���� ���� �Ұ�', '������,����1,����2,����3', '2014�� 8�� 7�Ϻ��� ����ϴ� ��� ���������ǰ�� �������� ��ȣ��(�ֹε�Ϲ�ȣ ó���� ����)�� �ǰ��Ͽ� 
��������(�ֹι�ȣ)������ �Ұ��Կ� ���� �����ں��谡���� ���������� ����Ǿ����ϴ�. 
��, ���������߿� �̿�Ǵ� �������(�װ�,ö��,����,���� ����������)�� ���� ������ ������ ���ԵǾ� ������ �˷��帳�ϴ�. 
�����ں��谡���� ���Ͻ� ��쿡�� ���������� �����մϴ�. 

(���蹮�� : TOURSAFE ������� ��1800-9010 / 010-5458-8679)', '�����ǻ��� ��! �о�����

�������� �� �����ð� �� ������ ������ ���Ͽ� ���̵�(����̺� ���̵� ����)�� �ȳ����� �� ���� ��Ģ�� �ؼ��Ͽ� ��� ������� �����Ͻñ� �ٶ��ϴ�.

Ư�� ���� ���� ���� �Ǵ� ���������� ���̵��� ���ǻ��� �� ���� �ȳ������� ���� �� ������ ������ �����Ͽ� �ֽñ� �ٶ��, �̿��� ������ ���� �� ���� �ǰ����·� ���Ͽ� �߻��� ������� ���ؼ��� �̿��� ������ å������ �˷��帳�ϴ�.', '�μ�������
�غ� ��ǰ�� �μ��� �� ���̵尡 ������ ������, ������ ���� �ϴ� ��ǰ�Դϴ�.', '�Һ������ر���
[Ư����� ��ҷ� ����]
�� ��ǰ�� ����, �װ�(�Ǵ� ����)�¼� �Ǵ� ȣ�ڰ��ǿ� ���� ����� ������ ���� ��ǰ����, ��� �Ǵ� ���ຯ��� �ϴ��� ��ҷᰡ ����˴ϴ�.

- ���ళ�� 4��������(~4) �뺸�� : ���� ȯ��
- ���ళ�� 3��������(3~3) �뺸��: �������� 20%���
- ���ళ�� 2��������(2~2) �뺸��: �������� 50%���
- ���ళ�� 1��������(1~1) �뺸��: �������� 100%���, ȯ�Ҿ���');

/*��Ű������ �ı� ���̺�*/
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
COMMENT ON TABLE TOUR_REVIEW IS '���� ��Ű�� �ı� �Խ���';
COMMENT ON COLUMN TOUR_REVIEW.TR_NO IS '�Խñ� ��ȣ';
COMMENT ON COLUMN TOUR_REVIEW.TR_TOUR_ID IS '��Ű����ǰ ID';
COMMENT ON COLUMN TOUR_REVIEW.TR_DATE IS '�Խ� ��¥';
COMMENT ON COLUMN TOUR_REVIEW.TR_WRITER_ID IS '�ۼ��� ���̵�';
COMMENT ON COLUMN TOUR_REVIEW.TR_TITLE IS '����';
COMMENT ON COLUMN TOUR_REVIEW.TR_CONTENT IS '����';
COMMENT ON COLUMN TOUR_REVIEW.TR_GRADE IS '����';


-- TOUR_REVIEW
INSERT INTO TOUR_REVIEW
VALUES(1, 1, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 10);
INSERT INTO TOUR_REVIEW
VALUES(2, 1, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 8);
INSERT INTO TOUR_REVIEW
VALUES(3, 1, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 10);
INSERT INTO TOUR_REVIEW
VALUES(4, 1, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 8);
INSERT INTO TOUR_REVIEW
VALUES(5, 1, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 10);
INSERT INTO TOUR_REVIEW
VALUES(6, 1, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 8);

INSERT INTO TOUR_REVIEW
VALUES(7, 3, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 9);
INSERT INTO TOUR_REVIEW
VALUES(8, 2, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 10);
INSERT INTO TOUR_REVIEW
VALUES(9, 5, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 9);
INSERT INTO TOUR_REVIEW
VALUES(10, 9, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 10);
INSERT INTO TOUR_REVIEW
VALUES(11, 10, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 5);

INSERT INTO TOUR_REVIEW
VALUES(12, 5, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 7);
INSERT INTO TOUR_REVIEW
VALUES(13, 5, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 6);
INSERT INTO TOUR_REVIEW
VALUES(14, 7, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 8);
INSERT INTO TOUR_REVIEW
VALUES(15, 10, DEFAULT, 'jnh0930', '���� �����̿����!!!', '���̵�е� ģ���Ͻð� ���� ������ ������ ������ϴ�.', 6);
INSERT INTO TOUR_REVIEW
VALUES(16, 9, DEFAULT, 'usb0119', '�׷����� ������ �����̿����ϴ�.', '������ �� ã�� �� ���׿�', 7);
commit;

/*���� ���̺�*/
CREATE TABLE ACCOMMODATION
(
  ACC_ID NUMBER,                                      /*���� ���̵�*/
  BIZ_ID VARCHAR2(20) CONSTRAINT NN_BIZ_ID NOT NULL,  /*����� ���̵�*/ 
  ACC_NAME VARCHAR2(50),                              /*���� �̸�*/
  ACC_TYPE CHAR(1) CONSTRAINT NN_ACC_TYPE NOT NULL,   /*���� Ÿ��*/
  ACC_ADDRESS VARCHAR2(50) CONSTRAINT NN_ACC_ADDRESS NOT NULL,/*���� �ּ�*/
  ACC_CONTACT VARCHAR2(50),                           /*���� ����ó*/
  ACC_RANK VARCHAR2(8) DEFAULT 'SILVER',              /*���� ���*/
  ACC_IMAGE_PATH VARCHAR2(500),                       /*���� �̹��� ���*/
  ACC_RULES VARCHAR2(4000),                           /*���� �̿� ��Ģ*/
  ACC_lOCATIONINFO VARCHAR2(4000),                    /*���� ��ġ ����*/
  ACC_FACILITIES VARCHAR2(4000),                      /*���� �ü�*/
  ACC_REFUND VARCHAR2(4000),                          /*ȯ�� ����*/
  
  CONSTRAINT PK_ACC_ID PRIMARY KEY(ACC_ID),
  CONSTRAINT FK_BIZ_ID FOREIGN KEY(BIZ_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_ACC_TYPE CHECK (ACC_TYPE IN ('H', 'M', 'G', 'P')),  /*ȣ��, ����, �Խ�Ʈ�Ͽ콺, ���*/
  CONSTRAINT CHK_ACC_RANK CHECK (ACC_RANK IN ('SILVER', 'GOLD', 'PLATINUM', 'DIAMOND'))
);
COMMENT ON TABLE ACCOMMODATION IS '����';
COMMENT ON COLUMN ACCOMMODATION.ACC_ID IS '���� ���̵�';
COMMENT ON COLUMN ACCOMMODATION.BIZ_ID IS '����� ���̵�';
COMMENT ON COLUMN ACCOMMODATION.ACC_NAME IS '���� �̸�';
COMMENT ON COLUMN ACCOMMODATION.ACC_TYPE IS '���� Ÿ��';
COMMENT ON COLUMN ACCOMMODATION.ACC_ADDRESS IS '���� �ּ�';
COMMENT ON COLUMN ACCOMMODATION.ACC_CONTACT IS '���� ����ó';
COMMENT ON COLUMN ACCOMMODATION.ACC_RANK IS '���� ���';
COMMENT ON COLUMN ACCOMMODATION.ACC_IMAGE_PATH IS '���� �̹��� ���';
COMMENT ON COLUMN ACCOMMODATION.ACC_RULES IS '���� �̿� ��Ģ';
COMMENT ON COLUMN ACCOMMODATION.ACC_lOCATIONINFO IS '���� ��ġ ����';
COMMENT ON COLUMN ACCOMMODATION.ACC_FACILITIES IS '���� �ü�';
COMMENT ON COLUMN ACCOMMODATION.ACC_REFUND IS 'ȯ�� ����';

/*���� �̹��� ���̺�*/ 
CREATE TABLE ACCOMMODATION_IMAGE
(
  ACC_ID NUMBER,           /*���� ���̵�*/
  ACC_IMAGE VARCHAR2(500),  /*���� �̹���*/
  
  CONSTRAINT FK_IMAGE FOREIGN KEY (ACC_ID) REFERENCES ACCOMMODATION
);

COMMENT ON TABLE ACCOMMODATION_IMAGE IS '���� �̹��� ���̺�';
COMMENT ON COLUMN ACCOMMODATION_IMAGE.ACC_ID IS '���� ���̵�';
COMMENT ON COLUMN ACCOMMODATION_IMAGE.ACC_IMAGE IS '���� �̹���';


/*���õ�����*/
-- ACCOMMODATION 
INSERT INTO ACCOMMODATION VALUES(1, 'MBMGOOD', '�󸶴�ȣ��', 'H', '������ ��õ�� ���� 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 15�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��Ǫ,����,��������', 'üũ�� 5�� ������ ����ϸ� ������ ȯ�ҵ˴ϴ�');

INSERT INTO ACCOMMODATION VALUES(2, 'INSUNG', '�����Խ�Ʈ�Ͽ콺', 'G', '������ ��õ�� ���� 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��������', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(3, 'SONEJH12', '�ٴ����', 'P', '������ ��õ�� ���� 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 5�аŸ�',
'��������,TV', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(4, 'NAMU01', 'ûȣ����', 'M', '������ ���ʽ� ûȣ�ؾȱ� 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�͹̳μ� ���� 10�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(5, 'BIZ01', '���������', 'P', '������ ������ ����� ����4�� 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�������� ���� 5�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(6, 'MBMGOOD', '�󸶴�ȣ��1', 'H', '������ ��õ�� ���� 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 15�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��Ǫ,����,��������', 'üũ�� 5�� ������ ����ϸ� ������ ȯ�ҵ˴ϴ�');

INSERT INTO ACCOMMODATION VALUES(7, 'INSUNG', '�����Խ�Ʈ�Ͽ콺2', 'G', '������ ��õ�� ���� 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��������', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(8, 'SONEJH12', '�ٴ����2', 'P', '������ ��õ�� ���� 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 5�аŸ�',
'��������,TV', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(9, 'NAMU01', 'ûȣ����3', 'M', '������ ���ʽ� ûȣ�ؾȱ� 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�͹̳μ� ���� 10�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(10, 'BIZ01', '���������3', 'P', '������ ������ ����� ����4�� 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�������� ���� 5�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(11, 'MBMGOOD', '�󸶴�ȣ��3', 'H', '������ ��õ�� ���� 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 15�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��Ǫ,����,��������', 'üũ�� 5�� ������ ����ϸ� ������ ȯ�ҵ˴ϴ�');

INSERT INTO ACCOMMODATION VALUES(12, 'INSUNG', '�����Խ�Ʈ�Ͽ콺4', 'G', '������ ��õ�� ���� 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��������', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(13, 'SONEJH12', '�ٴ����4', 'P', '������ ��õ�� ���� 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 5�аŸ�',
'��������,TV', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(14, 'NAMU01', 'ûȣ����4', 'M', '������ ���ʽ� ûȣ�ؾȱ� 31', '010-1111-2278',
'GOLD', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�͹̳μ� ���� 10�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(15, 'BIZ01', '���������5', 'P', '������ ������ ����� ����4�� 16-2', '010-2222-333',
'PLATINUM', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '�������� ���� 5�аŸ�',
'��������,TV', 'üũ�� ������ �������� ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(16, 'MBMGOOD', '�󸶴�ȣ��6', 'H', '������ ��õ�� ���� 16-2', '010-1234-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 15�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��Ǫ,����,��������', 'üũ�� 5�� ������ ����ϸ� ������ ȯ�ҵ˴ϴ�');

INSERT INTO ACCOMMODATION VALUES(17, 'INSUNG', '�����Խ�Ʈ�Ͽ콺6', 'G', '������ ��õ�� ���� 32-2', '010-1244-5678', 
'SILVER', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 3�аŸ�',
'��������', 'ȯ���� �Ұ��մϴ�.');

INSERT INTO ACCOMMODATION VALUES(18, 'SONEJH12', '�ٴ����6', 'P', '������ ��õ�� ���� 16-2', '010-1111-5678',
'DIAMOND', '/tonight/uploadfiles/image2.jpg', 'üũ�� 12�� üũ�� 1��', '���򿪼� ���� 5�аŸ�',
'��������,TV', 'ȯ���� �Ұ��մϴ�.');

commit;
/*���� ���̺�*/
CREATE TABLE ROOM
(   
  ROOM_ID CHAR(3),                        /*���� ���̵�*/
  ACC_ID CHAR(5) CONSTRAINT NN_ACC_ID NOT NULL, /*���� ��ȣ*/
  ROOM_STATE CHAR(1),                     /*���� ���� ���� ����*/
  ROOM_ADULT_PRICE NUMBER,                /*���� ����*/
  ROOM_CHILD_PRICE NUMBER,                /*���� ����*/
  ROOM_DISCOUNT NUMBER(3,2) DEFAULT 0.00, /*������*/
  ROOM_IMAGE_PATH VARCHAR2(500),          /*���� �̹��� ���*/
  ROOM_DETAILS  VARCHAR2(4000),            /*������*/
  
  CONSTRAINT PK_ROOM_ID PRIMARY KEY(ROOM_ID),
  CONSTRAINT FK_ACC_ID FOREIGN KEY(ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT CHK_ROOM_STATE CHECK (ROOM_STATE IN ('Y', 'N')),
  CONSTRAINT CHK_ROOM_ADULT_PRICE CHECK (ROOM_ADULT_PRICE >= ROOM_CHILD_PRICE),
  CONSTRAINT CHK_ROOM_CHILD_PRICE CHECK (ROOM_CHILD_PRICE > 0),
  CONSTRAINT CHK_ROOM_DISCOUNT CHECK (ROOM_DISCOUNT BETWEEN 0.0 AND 1.0)
);
COMMENT ON TABLE ROOM IS '����';
COMMENT ON COLUMN ROOM.ROOM_ID IS '���� ���̵�';
COMMENT ON COLUMN ROOM.ACC_ID IS '���� ��ȣ';
COMMENT ON COLUMN ROOM.ROOM_STATE IS '���� ���� ���� ����';
COMMENT ON COLUMN ROOM.ROOM_ADULT_PRICE IS '���� ����';
COMMENT ON COLUMN ROOM.ROOM_CHILD_PRICE IS '���� ����';
COMMENT ON COLUMN ROOM.ROOM_DISCOUNT IS '������';
COMMENT ON COLUMN ROOM.ROOM_IMAGE_PATH IS '���� �̹��� ���';
COMMENT ON COLUMN ROOM.ROOM_DETAILS IS '������';



/*���� ���� ���̺�*/
CREATE TABLE RESERVE_ROOM
(
  REV_RID CHAR(5),                                /*���� ���� ��ȣ*/
  USER_ID VARCHAR2(15) CONSTRAINT NN_ROOM_USER_ID NOT NULL, /*������ ID*/
  ACC_ID CHAR(5)  CONSTRAINT NN_REV_ACC_ID NOT NULL, /*���� ���� ID*/
  ROOM_ID CHAR(3) CONSTRAINT NN_REV_ROOM_ID NOT NULL, /*���� ���� ID*/
  CHECK_IN DATE CONSTRAINT NN_CHECK_IN NOT NULL,  /*üũ�� ��¥*/
  CHECK_OUT DATE CONSTRAINT NN_CHECK_OUT NOT NULL,/*üũ�ƿ� ��¥*/
  REV_ROOM_DATE  DATE DEFAULT SYSDATE,            /*���� ��û ����*/
  REV_ROOM_STATE VARCHAR2(13),                    /*���� ����*/
  REV_ROOM_ADULT NUMBER DEFAULT 1,                /*���� ���� �ο���*/
  REV_ROOM_CHILD NUMBER,                          /*���� ���� �ο���*/
  TOTAL_ROOM_PRICE NUMBER CONSTRAINT NN_TOTAL_ROOM_PRICE NOT NULL,  /*�� ����*/
  REV_ROOM_EVENT VARCHAR2(20),                                      /*���� �̺�Ʈ ���� ��ǰ*/
  
  CONSTRAINT PK_REV_RID PRIMARY KEY(REV_RID),
  CONSTRAINT FK_ROOM_USER_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_REV_ACC_ID FOREIGN KEY(ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT FK_REV_ROOM_ID FOREIGN KEY(ROOM_ID) REFERENCES ROOM,
  CONSTRAINT CHK_REV_ROOM_STATE CHECK (REV_ROOM_STATE IN ('�����Ϸ�', '�������', '�Աݴ��'))
);
COMMENT ON TABLE RESERVE_ROOM IS '���� ����';
COMMENT ON COLUMN RESERVE_ROOM.REV_RID IS '���� ���� ��ȣ';
COMMENT ON COLUMN RESERVE_ROOM.USER_ID IS '������ ID';
COMMENT ON COLUMN RESERVE_ROOM.ACC_ID IS '���� ���� ID';
COMMENT ON COLUMN RESERVE_ROOM.ROOM_ID IS '���� ���� ID';
COMMENT ON COLUMN RESERVE_ROOM.CHECK_IN IS 'üũ�� ��¥';
COMMENT ON COLUMN RESERVE_ROOM.CHECK_OUT IS 'üũ�ƿ� ��¥';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_DATE IS '���� ��û ����';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_STATE IS '���� ����';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_ADULT IS '���� ���� �ο���';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_CHILD IS '���� ���� �ο���';
COMMENT ON COLUMN RESERVE_ROOM.TOTAL_ROOM_PRICE IS '�� ����';
COMMENT ON COLUMN RESERVE_ROOM.REV_ROOM_EVENT IS '���� �̺�Ʈ ���� ��ǰ';


/*��Ű������ ���� ���̺�*/
CREATE TABLE RESERVE_TOUR
(
  REV_TID CHAR(5),                                /*��Ű����ǰ ���� ��ȣ*/
  USER_ID VARCHAR2(15) CONSTRAINT NN_TOUR_USER_ID NOT NULL, /*������ ID*/
  TOUR_ID CHAR(5) CONSTRAINT NN_REV_TOUR_ID NOT NULL, /*���� ��Ű����ǰ ID*/
  REV_TOUR_DATE  DATE DEFAULT SYSDATE,            /*���� ��û ����*/
  REV_TOUR_STATE VARCHAR2(13),                    /*���� ����*/
  REV_TOUR_ADULT NUMBER DEFAULT 1,                /*���� ���� �ο���*/
  REV_TOUR_CHILD NUMBER,                          /*���� ���� �ο���*/
  TOTAL_TOUR_PRICE NUMBER CONSTRAINT NN_TOTAL_TOUR_PRICE NOT NULL,  /*�� ����*/
  REV_TOUR_EVENT VARCHAR2(20),                                      /*���� �̺�Ʈ ���� ��ǰ*/
  
  CONSTRAINT PK_REV_TID PRIMARY KEY(REV_TID),
  CONSTRAINT FK_TOUR_USER_ID FOREIGN KEY(USER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_REV_TOUR_ID FOREIGN KEY(TOUR_ID) REFERENCES TOUR,
  CONSTRAINT CHK_REV_TOUR_STATE CHECK (REV_TOUR_STATE IN ('�����Ϸ�', '�������', '�Աݴ��'))
);
COMMENT ON TABLE RESERVE_TOUR IS '��Ű������ ����';
COMMENT ON COLUMN RESERVE_TOUR.REV_TID IS '��Ű������ ���� ��ȣ';
COMMENT ON COLUMN RESERVE_TOUR.USER_ID IS '������ ID';
COMMENT ON COLUMN RESERVE_TOUR.TOUR_ID IS '���� ��Ű����ǰ ID';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_DATE IS '���� ��û ����';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_STATE IS '���� ����';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_ADULT IS '���� ���� �ο���';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_CHILD IS '���� ���� �ο���';
COMMENT ON COLUMN RESERVE_TOUR.TOTAL_TOUR_PRICE IS '�� ����';
COMMENT ON COLUMN RESERVE_TOUR.REV_TOUR_EVENT IS '���� �̺�Ʈ ���� ��ǰ';


CREATE TABLE MESSAGE
( 
  MSG_ID NUMBER,                /*�޽��� ���̵�*/
  SEND_DATE DATE DEFAULT SYSDATE, /*���� ��¥*/
  SENDER_ID VARCHAR2(15) CONSTRAINT NN_SENDER_ID NOT NULL, /*������ ȸ�����̵�*/
  RECEIVER_ID VARCHAR2(15) CONSTRAINT NN_RECEIVER_ID NOT NULL, /*�޴� ȸ�����̵�*/
  MSG_CONTENTS VARCHAR(1000) CONSTRAINT NN_MSG_CONTENTS NOT NULL,  /*����*/
  
  CONSTRAINT PK_MSG_ID PRIMARY KEY(MSG_ID),
  CONSTRAINT FK_SENDER_ID FOREIGN KEY(SENDER_ID) REFERENCES MEMBER,
  CONSTRAINT FK_RECEIVER_ID FOREIGN KEY(RECEIVER_ID) REFERENCES MEMBER
);
COMMENT ON TABLE MESSAGE IS '����';
COMMENT ON COLUMN MESSAGE.MSG_ID IS '�޽��� ���̵�';
COMMENT ON COLUMN MESSAGE.SEND_DATE IS '���� ��¥';
COMMENT ON COLUMN MESSAGE.SENDER_ID IS '������ ȸ�����̵�';
COMMENT ON COLUMN MESSAGE.RECEIVER_ID IS '�޴� ȸ�����̵�';
COMMENT ON COLUMN MESSAGE.MSG_CONTENTS IS '����';

/*���� �ı� �Խ��� ���̺�*/
CREATE TABLE ROOM_REVIEWBOARD
(  
  RRB_NO NUMBER,    /*�Խñ� ��ȣ*/
  RRB_ACC_ID CHAR(5) CONSTRAINT NN_RRB_ACC_ID NOT NULL, /* ���� ID */
  RRB_ROOM_ID CHAR(3) CONSTRAINT NN_RRB_ROOM_ID NOT NULL,/*���� ID*/
  RRB_DATE DATE DEFAULT SYSDATE,  /*�Խ� ��¥*/
  RRB_WRITER_ID VARCHAR2(15) CONSTRAINT NN_RRB_WRITER_ID NOT NULL,   /*�ۼ��� ���̵�*/
  RRB_TITLE VARCHAR2(50) CONSTRAINT NN_RRB_TITLE NOT NULL,     /*����*/
  RRB_CONTENTS VARCHAR2(4000) CONSTRAINT NN_RRB_CONTENTS NOT NULL, /*����*/
  RRB_GRADE NUMBER(3,1) DEFAULT 10.0, /*����*/
  
  CONSTRAINT PK_RRB_NO PRIMARY KEY(RRB_NO),
  CONSTRAINT FK_RRB_ACC_ID FOREIGN KEY(RRB_ACC_ID) REFERENCES ACCOMMODATION,
  CONSTRAINT FK_RRB_ROOM_ID FOREIGN KEY(RRB_ROOM_ID) REFERENCES ROOM,
  CONSTRAINT FK_RRB_WIRTER_ID FOREIGN KEY(RRB_WRITER_ID) REFERENCES MEMBER,
  CONSTRAINT CHK_RRB_GRADE CHECK (RRB_GRADE BETWEEN 1.0 AND 10.0)
);
COMMENT ON TABLE ROOM_REVIEWBOARD IS '���� �ı� �Խ���';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_NO IS '�Խñ� ��ȣ';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_ROOM_ID IS '���� ID';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_ROOM_ID IS '���� ID';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_DATE IS '�Խ� ��¥';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_WRITER_ID IS '�ۼ��� ���̵�';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_TITLE IS '����';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_CONTENTS IS '����';
COMMENT ON COLUMN ROOM_REVIEWBOARD.RRB_GRADE IS '����';

/* FAQ �Խ��� ���̺�*/
CREATE TABLE FAQ (
  FAQ_NO  NUMBER, /*FAQ �� ��ȣ*/
  FAQ_CATEGORY VARCHAR2(30) DEFAULT '��Ÿ', /*���� ī�װ�*/
  FAQ_TITLE VARCHAR2(50) CONSTRAINT NN_FAQ_TITLE NOT NULL, /*����(����)*/
  FAQ_ANSWER VARCHAR2(4000) CONSTRAINT NN_FAQ_ANSWER NOT NULL,/*����(�亯)*/
  FAQ_READ_COUNT NUMBER DEFAULT 0,
  CONSTRAINT PK_FAQ_NO PRIMARY KEY(FAQ_NO),
  CONSTRAINT CHK_FAQ_CATEGORY CHECK(FAQ_CATEGORY IN ('����', '��Ű����ǰ', '���̵�', '����/����', 'ȯ��/����', '�̺�Ʈ', 'ȸ������', '��Ÿ'))
);
COMMENT ON TABLE FAQ IS '���ֹ�������';
COMMENT ON COLUMN FAQ.FAQ_NO IS 'FAQ �� ��ȣ';
COMMENT ON COLUMN FAQ.FAQ_CATEGORY IS '���� ī�װ�';
COMMENT ON COLUMN FAQ.FAQ_TITLE IS '����(����)';
COMMENT ON COLUMN FAQ.FAQ_ANSWER IS '����(�亯)';

/* QNA �Խ��� ���̺�*/
CREATE TABLE QNA (
  QNA_NO NUMBER, /*QNA �� ��ȣ*/
  QNA_TITLE VARCHAR2(50) CONSTRAINT NN_QNA_TITLE NOT NULL,  /*����*/
  WRITER_ID VARCHAR2(15) CONSTRAINT NN_WRITER_ID NOT NULL,   /*�ۼ��� ���̵�*/
  QUESTION VARCHAR2(4000) CONSTRAINT NN_QUESTION NOT NULL, /*���� ����*/
  ANSWER VARCHAR2(4000),  /*�亯 ����*/
  
  CONSTRAINT PK_QNA_NO PRIMARY KEY(QNA_NO),
  CONSTRAINT FK_WRITER_ID FOREIGN KEY(WRITER_ID) REFERENCES MEMBER
);
COMMENT ON TABLE QNA IS '��������';
COMMENT ON COLUMN QNA.QNA_NO IS 'QNA �� ��ȣ';
COMMENT ON COLUMN QNA.QNA_TITLE IS '����';
COMMENT ON COLUMN QNA.WRITER_ID IS '�ۼ��� ���̵�';
COMMENT ON COLUMN QNA.QUESTION IS '���� ����';
COMMENT ON COLUMN QNA.ANSWER IS '�亯 ����';

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
insert into MEMBER VALUES('BIZ01', 'PASS11','������', 'B', '19901212', '01012345678', 'mouser@nate.com', '��õ�� ������ ������ 293-2', default); 
insert into MEMBER VALUES('NAMU01', 'PASS22','������', 'B', '19930931', '01023456781', 'namu@naver.com', '����� ���ı� ������ ���߾���Ʈ 302�� 1301ȣ', default); 
insert into MEMBER VALUES('INSUNG', 'PASS33','���μ�', 'B', '19950206', '01034567812', 'bestfriend@daum.net', '��õ�� ������ ������ 108-2', default); 
insert into MEMBER VALUES('SONEJH12', 'PASS44','������', 'B', '19870723', '01045678123', 'sonejh12@nate.com', '��õ�� ���� �ɰ 293-2', default); 
insert into MEMBER VALUES('MBMGOOD', 'PASS55','�����', 'B', '19890301', '01056781234', 'mbm@nate.com', '��⵵ ������ ��ȱ� �ΰ赿 136-2', default); 
insert into MEMBER VALUES('SINKWANNG', 'PASS66','���ű�', 'B', '19930411', '01045678321', 'bf5000@naver.com', '����� ���α� ���ε� �������Ʈ 202�� 1907ȣ', default); 

-- RESERVER_TOUR
INSERT INTO RESERVE_TOUR
VALUES('00001', 'ib1500', '00002', DEFAULT, '�Աݴ��', 2, 0, 198000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00002', 'ksm1225', '00003', DEFAULT, '�����Ϸ�', 2, 2, 328000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00003', 'jnh0930', '00003', '2017-09-22', '�����Ϸ�', 4, 0, 348000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00004', 'kdy0820', '00001', DEFAULT, '�Աݴ��', 3, 1, 386000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00005', 'ych0426', '00004', DEFAULT, '�����Ϸ�', 1, 1, 166000, NULL);
INSERT INTO RESERVE_TOUR
VALUES('00006', 'usb0119', '00003', '2017-09-21', '�����Ϸ�', 2, 0, 174000, NULL);



-- ACCOMMODATION
INSERT INTO ACCOMMODATION VALUES('00001', 'MBMGOOD', 'H','������ ��õ�� ���� 16-2', 'SILVER', 'https://www.booking.com/hotel/kr/eco-spa-pension.ko.html','���򿪼� ���� 5�аŸ�');
INSERT INTO ACCOMMODATION VALUES('00002', 'INSUNG', 'G','������ ��õ�� ���� 32-2', 'SILVER', 'https://www.kokoasia.net','��õ�� ���� 10�аŸ�');
INSERT INTO ACCOMMODATION VALUES('00003', 'SONEJH12', 'P','������ ��õ�� ���� 16-2', 'DIAMOND', 'https://www.pention.org','���򿪼� ���� 5�аŸ�');
INSERT INTO ACCOMMODATION VALUES('00004', 'NAMU01', 'M','������ ���ʽ� ûȣ�ؾȱ� 31', 'GOLD', 'https://www.partypary.com','�͹̳μ� ���� 10�аŸ�');
INSERT INTO ACCOMMODATION VALUES('00005', 'BIZ01', 'P','������ ������ ����� ����4�� 16-2', 'PLATINUM', 'https://www.ROOMPARTY.org','�������� ���� 5�аŸ�');

-- ROOM
INSERT INTO ROOM
VALUES ('001', '00001', 'Y', '80000', '50000', '0.1', 'http://blog.naver.com/gusdbfl2023/70185568493', '�̱�ħ��1��, �ݿ��� �����, TV, ���ڰ����ο� 1��');
INSERT INTO ROOM
VALUES ('002', '00002', 'N', '70000', '55000', '0.0', 'http://blog.naver.com/monsterlabs/221090906585', ' ����ħ��1��,�̱�ħ��1��, �ݿ���, �����, �����������, ���ڰ����ο� 3��');
INSERT INTO ROOM
VALUES ('003', '00002', 'Y', '100000', '80000', '0.2', 'http://blog.naver.com/monsterlabs/221090906585', '����ħ��1��, ����, �����, ������, TV, ���ڰ����ο� 2�� ');
INSERT INTO ROOM
VALUES ('004', '00003', 'Y', '120000', '70000', '0.3', 'http://blog.daum.net/loooml/457', '�̱�ħ��2��, �ݿ���, �����������, ���ڰ����ο� 2�� ');
INSERT INTO ROOM
VALUES ('005', '00004', 'Y', '70000', '50000', '0.1', 'http://prod.danawa.com/info', '����ħ��2��, ����, �����, �����������, ���ڰ����ο� 2�� ');
INSERT INTO ROOM
VALUES ('006', '00005', 'N', '80000', '50000', '0.1', 'http://blog.naver.com/gusdbfl2023/70185568493', ' �̱�ħ��1��, ����, �ٴ�����, �����, ���ڰ����ο� 1��');

-- RESERVE_ROOM
INSERT INTO RESERVE_ROOM
VALUES ('75952', 'ib1500','00001', '001', '2017/10/11', '2017/10/12', DEFAULT, '�����Ϸ�', '2', '0','160000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('95314', 'ksm1225','00002', '001', '2017/10/11', '2017/10/12', DEFAULT, '�Աݴ��', '1', '1','70000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('85715', 'jnh0930','00002', '002', '2017/09/11', '2017/09/12', DEFAULT,'�����Ϸ�', '2', '0','200000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('92142', 'kdy0820','00003', '004', '2017/09/23', '2017/09/25', DEFAULT,'�����Ϸ�', '1', '0','120000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('25485', 'usb0119','00004', '005', '2017/09/22', '2017/09/25', DEFAULT, '�������', '4', '0','140000',NULL);
INSERT INTO RESERVE_ROOM
VALUES ('46585', 'ych0426','00005', '006', '2017/10/11', '2017/10/13', DEFAULT, '�Աݴ��', '1', '0','80000',NULL);

-- ROOM_REVIEWBOARD
INSERT INTO ROOM_REVIEWBOARD
VALUES (1, '00002', '002', DEFAULT, 'jnh0930', '���� ����ؿ�', 'ǫ ���� ���ϴ�-', 10);
INSERT INTO ROOM_REVIEWBOARD
VALUES (2, '00003', '004', DEFAULT, 'kdy0820', '���ο���..', '�������� �����������õ�.. �ٽ� �Ȱ��ϴ�', 1);

-- QNA
INSERT INTO QNA VALUES(1,'������ ��� �ϴ��� �𸣰ڽ��ϴ�','ib1500','����Ʈ�� ���µ� ��� ������ �ϴ��� �𸣰ڽ��ϴ� �ڼ��ϰ� �������ּ���','�����Ϳ� �����غ�����');
INSERT INTO QNA VALUES(2,'���� ��� ��� ������??','kdy0820','�������� ����µ� ��� ������� ��õ�� ���ּ���','������ ��������');
INSERT INTO QNA VALUES(3,'���� ���µ� ��� ��� �������?','usb0119','��� ����Ѱ��� ��õ���ּ���','namooȣ�� �����ϴ� ����ϰ� ���ƿ�');

--FAQ INSERT
INSERT INTO FAQ VALUES(1,'����/����','������ ��� �ϸ� �ǳ���?','���Ͻô� ���Ҹ� �����Ͻ��� ���Ͻô� ��¥�� �����Ͻø� �˴ϴ�.',0);
INSERT INTO FAQ VALUES(2,'�̺�Ʈ','�̺�Ʈ ������ ����ؿ�?','�Խ��ǿ��� Ȯ���Ͻø� �˴ϴ�.',0);
INSERT INTO FAQ VALUES(3,'��Ÿ','��Ʈī�� �뿩�� �� �ֳ���?','��Ʈī�� �ȵ˴ϴ�',0);

-- MESSAGE
INSERT INTO MESSAGE VALUES (1, DEFAULT, 'ib1500', 'gyeontae12' , '�ȳ��ϼ���. ����Ͽ� ������ �������� ��Եǳ���');
INSERT INTO MESSAGE VALUES (2, DEFAULT, 'gyeontae12', 'ib1500' , '���Բ��� �ٽ� ���೯¥�� ��ƾ��մϴ�...');
INSERT INTO MESSAGE VALUES (3, DEFAULT, 'ksm1225', 'SONEJH12' , '��ǿ� �߿ܹٺ�ť�� ��� ��Ұ� �ֳ���? ');
INSERT INTO MESSAGE VALUES (4, DEFAULT, 'SONEJH12', 'ksm1225' , '�� �ֽ��ϴ� ^^ ');
INSERT INTO MESSAGE VALUES (5, DEFAULT, 'ib1500', 'gyeontae12' , '���� ������ �����Ѱ���?');

commit;