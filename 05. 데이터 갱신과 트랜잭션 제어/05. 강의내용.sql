-- 05. ������ ���Ű� Ʈ����� ����

-- 5.1 ������ ����(INSERT, UPDATE, DELETE)

-- 5.1.1 INSERT ----------------------------------------------------------------
-- (1) ���� Ʃ�� ����
CREATE TABLE A_ENROL
AS SELECT * FROM
ENROL WHERE STU_NO < 20150000;

INSERT INTO A_ENROL(SUB_NO, STU_NO, ENR_GRADE) VALUES (108, 20151062, 92);
INSERT INTO A_ENROL VALUES (109, 20152088, 85);
INSERT INTO A_ENROL(SUB_NO, STU_NO) VALUES (110, 20152088);
SELECT * FROM A_ENROL;
INSERT INTO A_ENROL VALUES(111, 20153075, NULL);


--(2) ���� �� ����
SELECT * FROM ENROL 
WHERE STU_NO LIKE '2015%';

INSERT INTO A_ENROL
SELECT * FROM ENROL
WHERE STU_NO LIKE '2015%';

-- 5.1.2 UPDATE ----------------------------------------------------------------

--(1) ��ü �����Ϳ� ���� ���� 
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 5;
    
--(2) ���ǿ� ���� ���� 
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 5 
    WHERE SUB_NO = 101;
    
--(3) �����Ǹ� ���� UPDATE��
UPDATE A_ENROL
    SET ENR_GRADE = ENR_GRADE + 10
    WHERE SUB_NO = (SELECT SUB_NO
                        FROM SUBJECT
                        WHERE SUB_NAME = '�ý��ۺм�����');
                        
SELECT SUB_NO 
FROM SUBJECT 
WHERE SUB_NAME = '�ý��ۺм�����';


-- 5.1.3 DELETE ----------------------------------------------------------------
DELETE FROM A_ENROL;
SELECT * FROM A_ENROL; 
ROLLBACK; /*�ѹ�*/

-- DELETE(DML) : �ѹ� ����
-- TRUNCATE(DDL) : �ѹ� �Ұ��� 

TRUNCATE TABLE A_ENROL;
ROLLBACK; /*���̺� ������ ���� ����*/
SELECT * FROM A_ENROL;










