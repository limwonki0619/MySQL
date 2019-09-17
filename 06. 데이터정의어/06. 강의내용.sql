-- SQL(Structure Query Language) --------------------------------
-- DQL : SELECT
-- DML : INSERT, DELETE(튜플 삭제 | 롤백 가능), UPDATE
-- TCL : COMMIT, ROLLBACK
-- DDL : CREATE, DROP(테이블 삭제|롤백 불가능), TRUNCATE(테이블 삭제|롤백 불가능), ALTER(테이블 변경)
-- DCL : GRANT, REVOKE
------------------------------------------------------------------

-- 06. 데이터 정의어(DDL : Data Definition Language)

-- 6.1 개체(OBJECT) -------------------------------------------------------------

-- TABLE    : 행과 열로 구성된 2차원 테이블로 데이터를 저장하는 개체
-- VIEW     : 하나 이상의 테이블로부터 유도된 데이터의 부분집합 개체
-- INDEX    : 빠른 검색을 위해 사용하는 개체
-- SEQUENCE : 순차적인 숫자 값을 생성하는 개체

-- 6.2 테이블(TABLE)-------------------------------------------------------------

-- CREATE TABLE (테이블 생성)
-- ALTER TABLE (테이블 변경)
-- DROP TABLE (테이블 삭제 | 롤백 불가능)
-- TRUNCATE TABLE (테이블 내용 삭제 | 롤백 불가능)

CREATE TABLE TEST1 (
U_ID VARCHAR2(10),
U_DATE DATE);
DESC TEST1;

-- 6.2.2 테이블 생성 
-- 기존 테이블을 이용해 새로운 테이블 만들기 
CREATE TABLE T_STUDENT
AS
SELECT * FROM STUDENT 
WHERE STU_DEPT = '기계';


SELECT * FROM T_STUDENT;

-- 6.2.3 테이블 변경 
-- 새로운 열 추가 
ALTER TABLE T_STUDENT
ADD (ARMY CHAR(1));
DESC T_STUDENT;
SELECT * FROM T_STUDENT;

-- 데이터 타입 변경
ALTER TABLE T_STUDENT
MODIFY (ARMY NUMBER);
DESC T_STUDENT;

-- 컬럼 이름 변경 
ALTER TABLE T_STUDENT
RENAME COLUMN ARMY TO TOMY;
DESC T_STUDENT;

ALTER TABLE T_STUDENT
DROP (TOMY);
DESC T_STUDENT;

-- 6.2.4 테이블 이름 변경
RENAME T_STUDENT TO KK;
DESC T_STUDENT;
DESC KK;

-- 6.2.5 테이블내의 데이터 삭제
-- 테이블 내용 삭제 : TRUNCATE | 롤백 불가능  
TRUNCATE TABLE KK;
SELECT * FROM KK;
ROLLBACK;
SELECT * FROM KK; 

--6.2.6 테이블 삭제 
-- 테이블 삭제 : DROP | 롤백 불가능
DROP TABLE KK;
DESC KK;


-- 6.3 제약조건(Constraint) -----------------------------------------------------

-- NOT NULL    : 열에 NULL값을 허용하지 않음
-- UNIQUE KEY  : 열 또는 열의 조합이 유일한 값을 가져야함
-- PRIMARY KEY : 열 또는 열의 조합이 NULL값이 아니며, 유일한 값을 가져야함
-- FOREIGN KEY : 다른 테이블의 열을 참조되는 테이블에 값이 존재해야 함 
-- CHECK       : 열에 들어갈 값에 대한 조건을 명시함 

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
        
-- 6.3.6 제약조건의 확인 
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_ENROL';
        
-- 6.3.7 제약조건의 삭제 
ALTER TABLE T_ENROL
DROP CONSTRAINT ENR_SUB_NO_FK1 CASCADE;

-- 6.3.8 제약조건의 활성화, 비활성화
ALTER TABLE T_STUDENT
DISABLE CONSTRAINT N_STU_DEPT;

ALTER TABLE T_STUDENT
ENABLE CONSTRAINT N_STU_DEPT;


-- 6.4 뷰(VIEW) ----------------------------------------------------------------
-- 데이터베이스내의 가장의 테이블로서, 사용자에게는 데이터가 있는 테이블 처럼 보이나, 
-- 실제로 데이터는 존재하지 않음
-- 사용할 때 데이터가 베이스 테이블로부터 유도되어 운영
-- 뷰를 사용하기위해서는 권한이 필요 (CMD 관리자 - SQLPLUS SYSTEM/PW - GRANT CREATE VIEW TO SCOTT;)

-- (1) 단순 뷰
CREATE VIEW V_STUDENT1
AS
SELECT *
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보';

SELECT * FROM V_STUDENT1;

-- (2) 조인 뷰 
CREATE VIEW V_ENROL1
AS 
SELECT SUB_NAME, B.SUB_NO, STU_NO, ENR_GRADE
FROM ENROL A, SUBJECT B
WHERE A.SUB_NO = B.SUB_NO;

SELECT * FROM V_ENROL1;

-- (3) 인라인 뷰

-- (4) TOP-N 질의


-- 6.5 인덱스(INDEX) ------------------------------------------------------------

CREATE INDEX I_STUU_NAME ON STUDENT(STU_NAME);
CREATE INDEX I_STU_NO_NAME ON STUDENT(STU_NO, STU_NAME);

CREATE INDEX I_STU_WEIGHT ON STUDENT (STU_WEIGHT-5);


-- 6.6 시퀀스(SEQUENCE)
CREATE SEQUENCE SEQ1
INCREMENT BY 2
START WITH 1000
MAXVALUE 10000;

SELECT SEQ1.NEXTVAL FROM DUAL;