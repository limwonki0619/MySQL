-- 04. ����(Join)�� ������(SubQuery)

SELECT TABLE_NAME FROM USER_TABLES; /*�����ϴ� ���̺��� ���̺� �̸��� ���*/

SELECT * FROM STUDENT;
SELECT * FROM ENROL;

-- 4.1.1 CROSS JOIN ------------------------------------------------------------
SELECT STUDENT.*, ENROL.* FROM STUDENT CROSS JOIN ENROL;

DESC STUDENT;
DESC ENROL;

-- 4.1.2 EQUI JOIN -------------------------------------------------------------

-- 1. WHERE���� �̿��� ���
SELECT STUDENT.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE FROM STUDENT, ENROL
WHERE STUDENT.STU_NO = ENROL.STU_NO;

-- 2. NATURAL JOIN�� �̿��� ��� 
-- NATURAL JOIN�� �ڵ����� �� ���̺��� �� �̸��� ���� ���� �̿��Ͽ� ����
SELECT STU_NO, STU_NAME, STU_DEPT, ENR_GRADE FROM STUDENT NATURAL JOIN ENROL;
-- ���뿭�� 2�� �̻� �����ϴ� ��� NATURAL JOIN�� �Ұ�, �̶� JOIN~USING���� �̿�

SELECT STU_NO, STU_NAME, STU_DEPT, ENR_GRADE FROM STUDENT JOIN ENROL USING(STU_NO);
-- USING���� ���뿭�� �˷��� 

-- 3. JOIN ~ ON ���� �̿��� ���
SELECT STUDENT.STU_NO, STU_NAME, STU_DEPT, ENR_GRADE 
FROM STUDENT JOIN ENROL ON STUDENT.STU_NO = ENROL.STU_NO;

DESC ENROL;
SELECT STU_NO, STU_NAME FROM STUDENT NATURAL JOIN ENROL WHERE SUB_NO = 101;

-- �� ������ �켱���� ���� 
SELECT STUDENT.STU_NO, STU_NAME 
FROM STUDENT, ENROL 
WHERE STUDENT.STU_NO=ENROL.STU_NO AND (SUB_NO = 101 OR SUB_NO=102);


-- '��ǻ�Ͱ���'������ �����ϴ� �л����� �й�, �̸�, �����̸��� �˻��϶�

DESC SUBJECT;
DESC STUDENT;

-- 1.
SELECT STUDENT.STU_NO, STU_NAME, SUB_NAME
FROM STUDENT, ENROL, SUBJECT
WHERE STUDENT.STU_NO = ENROL.STU_NO
    AND ENROL.SUB_NO = SUBJECT.SUB_NO
    AND ENROL.SUB_NO = 101;

-- 2.     
SELECT STUDENT.STU_NO, STU_NAME, SUB_NAME
FROM STUDENT, ENROL, SUBJECT
WHERE STUDENT.STU_NO = ENROL.STU_NO
    AND ENROL.SUB_NO = SUBJECT.SUB_NO
    AND SUB_NAME = '��ǻ�Ͱ���';

-- 3.
SELECT STU_NO, STU_NAME, SUB_NAME
FROM STUDENT NATURAL JOIN ENROL NATURAL JOIN SUBJECT
WHERE SUB_NAME = '��ǻ�Ͱ���';

-- 4.
SELECT STU_NO, STU_NAME, SUB_NAME
FROM STUDENT JOIN ENROL USING(STU_NO) 
JOIN SUBJECT USING(SUB_NO)
WHERE SUB_NAME = '��ǻ�Ͱ���';

-- 5.
SELECT ENROL.STU_NO, STU_NAME, SUB_NAME
FROM STUDENT  JOIN ENROL ON STUDENT.STU_NO = ENROL.STU_NO
JOIN SUBJECT ON ENROL.SUB_NO = SUBJECT.SUB_NO
WHERE SUB_NAME = '��ǻ�Ͱ���';


-- 4.1.3 Non-EQUI JOIN ---------------------------------------------------------
-- NON-EQUI�� ���� ���ο��� WHERE������ ����ϴ� '='�� �ƴ� �����ڸ� ����ϴ� ����.
-- �⺻ Ű�� �ܷ� Ű ���谡 �ƴ� �������� ���� �ִ� ����� �����ϴ� ����̴�.

SELECT * FROM SALGRADE;
SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL;

-- 4.1.4 SELF JOIN -------------------------------------------------------------
SELECT * FROM EMP; 

SELECT A.EMPNO AS �����ȣ, A.ENAME AS ����̸�,
B.EMPNO AS ����ڻ����ȣ, B.ENAME AS ������̸� -- AS�� �Ӽ��� ����  
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO;

-- 4.1.5 OUTER JOIN ------------------------------------------------------------
SELECT * FROM ENROL;
SELECT * FROM SUBJECT;

SELECT A.*, SUB_NAME
FROM ENROL A RIGHT OUTER JOIN SUBJECT B
ON A.SUB_NO = B.SUB_NO;


-- 4.2 ������(SubQuery) ---------------------------------------------------------
-- SELECT�� ���� �� �ٸ� SELECT ���� �����ϴ� ���� �ǹ���
-- '������'���� ������ ū �л����� �й�, �̸�, ������ ���ϴ� ���ǹ� 

-- 1. �Ϲ����� ���
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_NAME = '������';

SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT > 172;

-- 2. Subquery ���
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT > 
    (SELECT STU_HEIGHT 
        FROM STUDENT 
        WHERE STU_NAME = '������');

-- 3. SELF JOIN�� �̿��� ���
SELECT A.STU_NO, A.STU_NAME, A.STU_HEIGHT
FROM STUDENT A, STUDENT B
WHERE A.STU_HEIGHT > B.STU_HEIGHT
    AND B.STU_NAME='������';
    
-- 4.2.1 ���Ͽ� ������
SELECT * 
FROM STUDENT 
WHERE STU_WEIGHT = 
    (SELECT STU_WEIGHT
        FROM STUDENT
        WHERE STU_NAME = '����ö')
        AND STU_NAME<>'����ö'; -- '����ö'�� ������ ���� 
        
        
-- �л�(STUDENT)���̺��� '��ǻ������'�а��� ���� ���� �ٸ� �а��� �л� ������ 
-- IN�� �̿��Ͽ� ���ϴ� ���ǹ�

SELECT *
FROM STUDENT
WHERE STU_CLASS IN (SELECT STU_CLASS
FROM STUDENT
WHERE STU_DEPT = '��ǻ������')
AND STU_DEPT <> '��ǻ������';

-- ������ ��ü �л����� ��� ���庸�� ū �л��� ������ ���ϴ� ���ǹ� 
SELECT *
FROM STUDENT
WHERE STU_HEIGHT > (SELECT AVG(STU_HEIGHT) FROM STUDENT);


-- ������ ��� �а����� ��� ���庸�� ū �л��� ������ ���ϴ� ���ǹ� 
SELECT *
FROM STUDENT
WHERE STU_HEIGHT > ALL
    (SELECT MAX(AVG(STU_HEIGHT)) 
    FROM STUDENT
    GROUP BY STU_DEPT);

-- 4.2.2 ������ ������ 
-- �ǽ��� ���� TEST ���̺� ���� 
CREATE TABLE TEST(EMPNO, ENAME, SAL, COMM, DEPTNO)
AS
    SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
    FROM EMP
    WHERE DEPTNO = 1;
    
INSERT INTO TEST VALUES(11, 'APPLE', 1000, NULL, 30);
INSERT INTO TEST VALUES(12, 'BANANA', 2000, 100, 30);
INSERT INTO TEST VALUES(13, 'CHEESE', 1000, 0, 10);
INSERT INTO TEST VALUES(14, 'DOG', 2000, NULL, 20);
INSERT INTO TEST VALUES(15, 'EGG', 1000, 100, 20);

SELECT * FROM TEST;

-- 4.2.3 FROM ���� ������ 
SELECT STU_NO, STU_NAME, A.STU_DEPT, STU_HEIGHT, AVG_HEIGHT
FROM STUDENT A, (SELECT STU_DEPT, ROUND(AVG(STU_HEIGHT),2) AS AVG_HEIGHT
FROM STUDENT
GROUP BY STU_DEPT) B
WHERE A.STU_DEPT = B.STU_DEPT
AND STU_HEIGHT > AVG_HEIGHT;

-- 4.3 ����(SET) ������ 
CREATE TABLE C_STUDENT
AS SELECT * 
FROM STUDENT WHERE STU_DEPT IN ('���','��������');

CREATE TABLE D_STUDENT
AS SELECT * 
FROM STUDENT WHERE STU_DEPT IN ('��������','��ǻ������');

-- 4.3.1 ���տ����� ����
-- 1. UNION // A �� B �ߺ��� ����
-- 2. UNION ALL // A �� B �ߺ� ���� 
-- 3. INTERSECT // A �� B
-- 4. MINUS // A-B

-- 4.3.2 ���տ����� ��� ��Ģ 

SELECT * FROM A_STUDENT
-- UNION, UNION ALL, INTERSECT, MINUS
SELECT * FROM B_STUDENT;

