-- 03. �˻��� (SELECT)

-- 3.1 �ܼ� �˻� ----------------------------------------------------------------

-- (1) ���̺� ���� ��� ���� �˻� 
SELECT * FROM STUDENT;

-- (2) Ư�� ���� ���� �˻� 
SELECT STU_NO, STU_NAME 
FROM STUDENT;

-- (3) �ߺ� �� ����
SELECT DISTINCT STU_DEPT
FROM STUDENT;

SELECT STU_GRADE, STU_CLASS
FROM STUDENT;

SELECT DISTINCT STU_GRADE, STU_CLASS
FROM STUDENT;

-- (4) ������ ������ �˻�
SELECT STU_NO, SUB_NO, ENR_GRADE, ENR_GRADE + 10
FROM ENROL;

-- (5) ��� ���� ��Ī(ALIAS)�ο��ϱ�
SELECT STU_NO AS ID, STU_NAME AS NAME
FROM STUDENT;

-- (6) ���Ῥ����
SELECT STU_DEPT || STU_NAME AS �а�����
FROM STUDENT;

SELECT STU_DEPT || ',' || STU_NAME || '�Դϴ�' AS �а�����
FROM STUDENT;


-- 3.2 ���� �˻� ----------------------------------------------------------------
-- (1) WHERE �� ����ϱ�
SELECT STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS
FROM STUDENT
WHERE STU_DEPT = '��ǻ������';

-- (2) ��������
SELECT STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS
FROM STUDENT
WHERE STU_DEPT = '��ǻ������' AND STU_GRADE = 2;

-- (3) ���� ����
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;

SELECT *
FROM STUDENT
WHERE STU_NO BETWEEN '20140001' AND '20149999';

-- (4) LIKE�� �̿��� �˻�
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '��%';

-- ���ϵ�ī�� ����
-- % : 0�� �̻��� ����
-- _ : 1�� �̻��� ����

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '_��%';

SELECT * 
FROM STUDENT
WHERE STU_NO LIKE '2014%';

-- (5) NULL�� ó��
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT;

-- �����Ϳ� NULL���� ���� ���θ� Ȯ���ϴ� ���ǹ�
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NULL;

SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;


-- (6) IN
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_DEPT IN ('��ǻ������', '���');


-- 3.3 �˻� ����� ����ȭ(����) ---------------------------------------------------
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY STU_NO;

-- �������� ���� 
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY STU_NO DESC;

SELECT STU_NO AS NO, STU_NAME 
FROM STUDENT
ORDER BY NO;

-- ���� ��ȣ�� ���� 
SELECT STU_NO, STU_NAME 
FROM STUDENT
ORDER BY 1;

-- �������� ���� �������� ���� 
SELECT STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT -5 AS TARGET
FROM STUDENT
ORDER BY STU_DEPT, TARGET;


-- 3.4 �Լ�(FUNCTION)

-- 3.4.1 �Լ��� �ϳ� �̻��� �μ��� ���޹޾� ó���� ������� �Լ��� �̸��� �Ǿ� ��ȯ���ִ� ����̴�.
-- �̷��� �Լ����� �� �࿡ ���� ó���� ����� ��ȯ�ϴ� �Լ��� ������ �׷쿡 ���� ó�� ����� ��ȯ�ϴ� �׷��Լ��� ���еȴ�.
-- ���� �Լ� : �Լ��� ���ǵ� SQL������ ����� �� ������ �࿡ ���� ����, �� ��� �ϳ��� ������� ��ȯ
-- �׷� �Լ� : �����͸� �׷�ȭ�ϰ� �׷� ������ ���� ����� ��ȯ�ϸ�, �ַ� GROUP BY ���� ����Ѵ�.


-- 3.4.2 ������ �Լ� -------------------------------------------------------------

-- (1) �����Լ� 
-- ROUND, TRUNC, MOD, ABS, FLOOR
SELECT ROUND(345.6478), ROUND(345.678, 0),
ROUND(345.678, 1), ROUND(345.678, -1)
FROM DUAL;

-- (2) �����Լ�
-- LOWER
-- UPPER 
-- INITCAP : ù��° ���ڸ� �빮�ڷ� ��ȯ 
-- CONCAT 
-- SUBSTR : �Ϻ� ���� 
-- LENGTH 
-- INSTR : Ư�� ������ ������ġ�� ��ȯ 
-- LPAD : �ڸ����� �����ϰ�, �� ������ Ư�� ���ڷ� ���ʺ��� ä��
-- RPAD : �����ʺ��� ä�� 

SELECT UPPER('KOREA')
FROM DUAL;

-- (3) ��¥ �Լ�
-- SYSDATE : �ý����� ���� ��¥�� ��ȯ 
-- ��¥ ���� : ��¥�� +, - ���� ���� 
-- MONTHS_BETWEEN : �� ��¥�� ���� ��ȯ
-- NEXT_DAY : �μ�1���� ���� ����� �μ�2�� ������ ��ȯ
-- ADD_MONTH : �μ�1�� �μ�2�� ���� ���Ͽ� ��ȯ
-- LAST_DAY : �μ�1�� ���� ���� ������ ���� ��ȯ
-- ROUND : �μ�1�� ���� �μ�2�� �������� �ݿø��Ͽ� ��ȯ
-- TRUNC : �μ�1�� ���� �μ�2�� �������� �����Ͽ� ��ȯ 

SELECT SYSDATE
FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT SYSDATE
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 'ȭ')
FROM DUAL;


-- (4) ��ȯ �Լ� 
-- ������ ���� ��ȯ 
-- TO_NUMBER
-- TO_DATE
-- TO_CHAR


-- (5) �Ϲ� �Լ�

-- 1. NVL(�μ�1, �μ�2) : �μ� ���� NULL���� üũ�Ͽ� ������ ������ ������ ��ȯ�Ͽ� ��ȯ�ϴ� �Լ� 
SELECT NVL(STU_HEIGHT, 0)
FROM STUDENT;

-- 2. NVL2(�μ�1, �μ�2, �μ�3) : �μ�1�� �� ���� �ƴϸ� �μ�2��, �� ���̸� �μ�3�� ��ȯ
SELECT ENAME, NVL2(COMM, SAL+COMM, SAL)
FROM EMP;

-- 3. NULLIF(�μ�1, �μ�2) : �μ�1�� �μ�2�� ���� ���Ͽ� �� ���� ������ NULL��, �ƴϸ� �μ�1�� ���� ��ȯ
SELECT NVL(NULLIF('A', 'A'), '�� ��')
FROM DUAL;

SELECT NVL(NULLIF('A', 'B'), '�� ��')
FROM DUAL;

-- 4. COALESCE(�μ�1, ...�μ�N) : �μ�1�� ���� �� ���� �ƴϸ�, �μ�1�� ���� ��ȯ�ϰ�, 
-- �� ���̸� �μ�2�� ���� �˻��Ͽ� �� ���� �ƴϸ�, �μ�2�� ���� ��ȯ�ϰ�.. �ᱹ ���� �μ��� �� ó������ �� ���� �ƴ� ���� ��Ÿ�� �� 
-- �� ���� ��ȯ�Ѵ�.
SELECT COALESCE(NULL, NULL, 10, 100, NULL)
FROM DUAL;

-- 5. CASE
-- ���ǿ� ���� ó�� 

SELECT EMPNO, ENAME, SAL,
CASE JOB WHEN 'SALESMAN' THEN SAL * 1.1         
         WHEN 'CLERK' THEN SAL * 1.15
         WHEN 'MANAGER' THEN SAL * 1.2
         ELSE SAL
     END AS �޿��λ�
FROM EMP;


-- 6. DECODE : ������ �� �� ��� 
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'SALESMAN', SAL * 1.1,
                'CLERK',    SAL * 1.15,
                'MANAGER',  SAL * 1.2, SAL) AS �λ�ȱ޿�
FROM EMP;



-- 3.4.3 �׷��Լ� ---------------------------------------------------------------
-- �׷��Լ��� ���� �Լ���� �޸� ���� �࿡ ���� ���� �� ���, ���� ���� ������� ��ȯ�ϴ� �Լ���.
-- Ư�� SELECT ������ GROUP BY ���� ���ǵ� ���� �������� ���� �׷�ȭ���� �׷��Լ��� �����ϸ�
-- �� �׷쿡 �ϳ��� ����� ��ȯ�ϸ�, ���� GROUP BY ���� ������� ������, �ϳ��� ������� ��ȯ�Ѵ�.

-- COUNT() : ������ �����Ѵ� ���� ������ ������ ������ ��ȯ
-- COUNT(*) : ��� ���� ������ ��ȯ
-- SUM() : ���� �� 
-- AVG() : ���� ���
-- MAX() : ���� �ִ�
-- MIN() : ���� �ּ� 
-- STDDEV() : ǥ������
-- VARIANCE() : �л� 

-- �׷��Լ��� COUNT(*)�� �����ϰ�� �� ���� �����Ѵ�.
-- ���� �ߺ� ���� �����ϱ� ���ؼ��� DISTINCT�� ����Ѵ�.

-- (1) MIN, MAX �Լ�
SELECT MAX(ENR_GRADE), MIN(ENR_GRADE)
FROM ENROL;

SELECT MIN(STU_WEIGHT), MAX(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT = '���';

-- (2) COUNT �Լ�
-- COUNT(*) : �ΰ��� ������ ����
-- COUNT() : �ΰ��� ������ ���� 
SELECT COUNT(*), COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT COUNT(STU_DEPT), COUNT(DISTINCT STU_DEPT)
FROM STUDENT;

-- (3) SUM�� AVG �Լ�
SELECT SUM(STU_WEIGHT), AVG(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT = '��ǻ������';

SELECT COUNT(*) AS �л�, SUM(STU_HEIGHT) AS ������,
COUNT(STU_HEIGHT) AS �ش��л���, AVG(STU_HEIGHT) AS ��ս���
FROM STUDENT;


-- 3.4.4 GROUP BY�� ���
-- (1) �������� �̿��� GROUP BY ��
-- �ַ� GROUP BY ���� �׷��� ���� �׷캰 ��ǥ ���� ��ȯ�ϴµ� ���ȴ�.
-- ����� ���� ������ �ϱ����� ORDER BY���� ����� �� �ִ�.

SELECT STU_DEPT, AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_DEPT , COUNT(*)
FROM STUDENT 
WHERE STU_WEIGHT >= 50
GROUP BY STU_DEPT;

-- (2) ���߿� GROUP BY ��
-- GROUP BY ���� �� �� �̻��� ���� ����� �� ������, �� ��� GROUP BY ���� ���ʿ��� �������� ���� ������ ���� �׷����� ó���Ѵ�.
SELECT STU_DEPT, STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE;

-- (3) HAVING�� ���
-- �׷��Լ��� ������ ����� �ٽ� ������ �ο��� ���� HAVING���� ����Ѵ�.
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT = '���'
GROUP BY STU_GRADE
HAVING AVG(STU_HEIGHT) >= 160;

SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT 
HAVING MAX(STU_HEIGHT) >= 175;

SELECT TO_CHAR(MAX(AVG(STU_HEIGHT)), '999.99')
FROM STUDENT
GROUP BY STU_DEPT;