-- 05. 데이터 갱신과 트랜잭션 제어

-- 5.1 데이터 갱신(INSERT, UPDATE, DELETE)

-- 5.1.1 INSERT ----------------------------------------------------------------
-- (1) 단일 튜플 삽입
CREATE TABLE A_ENROL
AS SELECT * FROM
ENROL WHERE STU_NO < 20150000;

INSERT INTO A_ENROL(SUB_NO, STU_NO, ENR_GRADE) VALUES (108, 20151062, 92);
INSERT INTO A_ENROL VALUES (109, 20152088, 85);
INSERT INTO A_ENROL(SUB_NO, STU_NO) VALUES (110, 20152088);
SELECT * FROM A_ENROL;
INSERT INTO A_ENROL VALUES(111, 20153075, NULL);


--(2) 복수 행 삽입
SELECT * FROM ENROL 
WHERE STU_NO LIKE '2015%';

INSERT INTO A_ENROL
SELECT * FROM ENROL
WHERE STU_NO LIKE '2015%';

-- 5.1.2 UPDATE ----------------------------------------------------------------

--(1) 전체 데이터에 대한 변경 
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 5;
    
--(2) 조건에 의한 변경 
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 5 
    WHERE SUB_NO = 101;
    
--(3) 부질의를 갖는 UPDATE문
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 10
    WHERE SUB_NO = (SELECT SUB_NO
                        FROM SUBJECT
                        WHERE SUB_NAME = '시스템분석설계');
                        
SELECT SUB_NO 
FROM SUBJECT 
WHERE SUB_NAME = '시스템분석설계';


-- 5.1.3 DELETE ----------------------------------------------------------------
DELETE FROM A_ENROL;
SELECT * FROM A_ENROL; 
ROLLBACK; /*롤백*/

-- DELETE(DML) : 롤백 가능
-- TRUNCATE(DDL) : 롤백 불가능 

TRUNCATE TABLE A_ENROL;
ROLLBACK; /*테이블 내용은 전부 삭제*/
SELECT * FROM A_ENROL;










