-- SQL(Structure Query Language) --------------------------------
-- DQL : SELECT
-- DML : INSERT, DELETE(Ʃ�� ���� | �ѹ� ����), UPDATE
-- TCL : COMMIT, ROLLBACK
-- DDL : CREATE, DROP(���̺� ����|�ѹ� �Ұ���), TRUNCATE(���̺� ����|�ѹ� �Ұ���), ALTER(���̺� ����)
-- DCL : GRANT, REVOKE
------------------------------------------------------------------

-- 06. ������ ���Ǿ�(DDL : Data Definition Language)

-- 6.1 ��ü(OBJECT) -------------------------------------------------------------

-- TABLE    : ��� ���� ������ 2���� ���̺�� �����͸� �����ϴ� ��ü
-- VIEW     : �ϳ� �̻��� ���̺�κ��� ������ �������� �κ����� ��ü
-- INDEX    : ���� �˻��� ���� ����ϴ� ��ü
-- SEQUENCE : �������� ���� ���� �����ϴ� ��ü

-- 6.2 ���̺�(TABLE)-------------------------------------------------------------

-- CREATE TABLE (���̺� ����)
-- ALTER TABLE (���̺� ����)
-- DROP TABLE (���̺� ���� | �ѹ� �Ұ���)
-- TRUNCATE TABLE (���̺� ���� ���� | �ѹ� �Ұ���)

CREATE TABLE TEST1 (
U_ID VARCHAR2(10),
U_DATE DATE);
DESC TEST1;

-- 6.2.2 ���̺� ���� 
-- ���� ���̺��� �̿��� ���ο� ���̺� ����� 
CREATE TABLE T_STUDENT
AS
SELECT * FROM STUDENT 
WHERE STU_DEPT = '���';


SELECT * FROM T_STUDENT;

-- 6.2.3 ���̺� ���� 
-- ���ο� �� �߰� 
ALTER TABLE T_STUDENT
ADD (ARMY CHAR(1));
DESC T_STUDENT;
SELECT * FROM T_STUDENT;

-- ������ Ÿ�� ����
ALTER TABLE T_STUDENT
MODIFY (ARMY NUMBER);
DESC T_STUDENT;

-- �÷� �̸� ���� 
ALTER TABLE T_STUDENT
RENAME COLUMN ARMY TO TOMY;
DESC T_STUDENT;

ALTER TABLE T_STUDENT
DROP (TOMY);
DESC T_STUDENT;

-- 6.2.4 ���̺� �̸� ����
RENAME T_STUDENT TO KK;
DESC T_STUDENT;
DESC KK;

-- 6.2.5 ���̺��� ������ ����
-- ���̺� ���� ���� : TRUNCATE | �ѹ� �Ұ���  
TRUNCATE TABLE KK;
SELECT * FROM KK;
ROLLBACK;
SELECT * FROM KK; 

--6.2.6 ���̺� ���� 
-- ���̺� ���� : DROP | �ѹ� �Ұ���
DROP TABLE KK;
DESC KK;


-- 6.3 ��������(Constraint) -----------------------------------------------------

-- NOT NULL    : ���� NULL���� ������� ����
-- UNIQUE KEY  : �� �Ǵ� ���� ������ ������ ���� ��������
-- PRIMARY KEY : �� �Ǵ� ���� ������ NULL���� �ƴϸ�, ������ ���� ��������
-- FOREIGN KEY : �ٸ� ���̺��� ���� �����Ǵ� ���̺� ���� �����ؾ� �� 
-- CHECK       : ���� �� ���� ���� ������ ����� 

-- 6.3.1 NOT NULL
CREATE TABLE T_STUDENT(
    STU_NO CHAR(9),
    STU_NAME VARCHAR2(12),
    STU_DEPT VARCHAR2(20)
        CONSTRAINT N_STU_DEPT NOT NULL,
    STU_GRADE NUMBER(1),
    STU_CLASS CHAR(1),
    STU_GENDER CHAR(1),
    STU_HEIGHT NUMBER(5, 2), 
    STU_WEIGHT NUMBER(5, 2));

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_STUDENT';

DROP TABLE T_STUDENT;

-- 6.3.3 PRIMARY KEY
CREATE TABLE T_STUDENT(
    STU_NO CHAR(9),
    STU_NAME VARCHAR2(12)
        CONSTRAINT U_STU_NAME UNIQUE,
    STU_DEPT VARCHAR2(20)
        CONSTRAINT N_STU_DEPT NOT NULL,
    STU_GRADE NUMBER(1),
    STU_CLASS CHAR(1),
    STU_GENDER CHAR(1),
    STU_HEIGHT NUMBER(5, 2), 
    STU_WEIGHT NUMBER(5, 2),
        CONSTRAINT P_STU_GRADE PRIMARY KEY(STU_GRADE));

DROP TABLE T_STUDENT;


-- 6.3.4 FOREIGN KEY
CREATE TABLE T_ENROL(
SUB_NO CHAR(3),
STU_NO CHAR(9),
ENR_GRADE NUMBER(3),
    CONSTRAINT ENR_SUB_NO_FK1 FOREIGN KEY(SUB_NO) REFERENCES SUBJECT(SUB_NO),
    CONSTRAINT ENR_STU_NO_FK1 FOREIGN KEY(STU_NO) REFERENCES STUDENT(STU_NO),
    CONSTRAINT ENR_PK1 PRIMARY KEY(SUB_NO, STU_NO));
    
DESC STUDENT;
DESC SUBJECT;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_ENROL';


-- 6.3.5 CHECK
CREATE TABLE T_STUDENT(
    STU_NO CHAR(9),
    STU_NAME VARCHAR2(12)
        CONSTRAINT U_STU_NAME UNIQUE,
    STU_DEPT VARCHAR2(20)
        CONSTRAINT N_STU_DEPT NOT NULL,
    STU_GRADE NUMBER(1),
    STU_CLASS CHAR(1),
    STU_GENDER CHAR(1)
        CONSTRAINT C_STU_GENDER CHECK (STU_GENDER IN ('M','F')),
    STU_HEIGHT NUMBER(5, 2), 
    STU_WEIGHT NUMBER(5, 2),
        CONSTRAINT P_STU_GRADE PRIMARY KEY(STU_GRADE));
        
-- 6.3.6 ���������� Ȯ�� 
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_ENROL';
        
-- 6.3.7 ���������� ���� 
ALTER TABLE T_ENROL
DROP CONSTRAINT ENR_SUB_NO_FK1 CASCADE;

-- 6.3.8 ���������� Ȱ��ȭ, ��Ȱ��ȭ
ALTER TABLE T_STUDENT
DISABLE CONSTRAINT N_STU_DEPT;

ALTER TABLE T_STUDENT
ENABLE CONSTRAINT N_STU_DEPT;


-- 6.4 ��(VIEW) ----------------------------------------------------------------
-- �����ͺ��̽����� ������ ���̺�μ�, ����ڿ��Դ� �����Ͱ� �ִ� ���̺� ó�� ���̳�, 
-- ������ �����ʹ� �������� ����
-- ����� �� �����Ͱ� ���̽� ���̺�κ��� �����Ǿ� �
-- �並 ����ϱ����ؼ��� ������ �ʿ� (CMD ������ - SQLPLUS SYSTEM/PW - GRANT CREATE VIEW TO SCOTT;)

-- (1) �ܼ� ��
CREATE VIEW V_STUDENT1
AS
SELECT *
FROM STUDENT
WHERE STU_DEPT = '��ǻ������';

SELECT * FROM V_STUDENT1;

-- (2) ���� �� 
CREATE VIEW V_ENROL1
AS 
SELECT SUB_NAME, B.SUB_NO, STU_NO, ENR_GRADE
FROM ENROL A, SUBJECT B
WHERE A.SUB_NO = B.SUB_NO;

SELECT * FROM V_ENROL1;

-- (3) �ζ��� ��

-- (4) TOP-N ����


-- 6.5 �ε���(INDEX) ------------------------------------------------------------

CREATE INDEX I_STUU_NAME ON STUDENT(STU_NAME);
CREATE INDEX I_STU_NO_NAME ON STUDENT(STU_NO, STU_NAME);

CREATE INDEX I_STU_WEIGHT ON STUDENT (STU_WEIGHT-5);


-- 6.6 ������(SEQUENCE)
CREATE SEQUENCE SEQ1
INCREMENT BY 2
START WITH 1000
MAXVALUE 10000;

SELECT SEQ1.NEXTVAL FROM DUAL;