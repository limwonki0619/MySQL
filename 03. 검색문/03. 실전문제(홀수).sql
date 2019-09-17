-- 03. �˻��� ��������(Ȧ��)

-- Q1. ���(EMP) ���̺��� ������ �˻��϶�.
DESC EMP;

-- Q3. �޿�(SALGRADE) ���̺��� ������ �˻��϶�
DESC SALGRADE;

-- Q5. �μ��� �μ���ȣ(DEPTNO)�� �μ��̸�(DNAME)�� �˻��϶�.
SELECT DEPTNO, DNAME FROM DEPT;

-- Q7. ������� �޿��� Ŀ�̼��� �˻��϶�.
SELECT SAL, COMM FROM EMP;

-- Q9. ������� ����ڻ����ȣ(MGR) �ߺ��� �����ϰ� �˻��϶�.
SELECT DISTINCT MGR FROM EMP;

-- Q11. ������� 6���� �޿��� ���� �˻��϶�.
SELECT ENAME, SAL*6 FROM EMP;

-- Q13. ����̸��� 'NAME'���� ����� �޿��� 'Salary'�� ���� �̸��� �ο��Ͽ� �˻��϶�.
SELECT ENAME AS NAME, SAL AS SALARY FROM EMP;

-- Q15. �μ���ȣ, �μ��̸�, ������ �ѱ� �������� �˻��϶�.
SELECT DEPTNO AS �μ���ȣ, DNAME AS �μ��̸�, LOC AS ���� FROM DEPT;

-- Q17. �Ի���(HIREDATE) ����̸��� '80-12-17'�� �Ի��� SMITH�Դϴ�. ������ �˻��϶�.
SELECT HIREDATE || '�� �Ի���' || ENAME || '�Դϴ�' FROM EMP;

-- Q19. �޿��� 2000�̻��� ������� �����ȣ, ����̸��� �˻��϶�
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL >= 2000;

-- Q21. 1980�� 12�� 17�Ͽ� �Ի��� ����̸��� �˻��϶�.
SELECT ENAME FROM EMP
WHERE HIREDATE = '1980-12-17';

-- Q23. �޿������ 5�� �޿��� �����޿��� �����޿��� �˻��϶�.
SELECT HISAL, LOSAL
FROM SALGRADE
WHERE GRADE = 5;

-- Q25. 10�� �μ��� �ٹ��ϴ� MANAGER�� ����̸��� �˻��϶�.
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

-- Q27. ��������� 'CLERK'�̸�, 81�� ���Ŀ� �Ի��� ������� �����ȣ�� ����̸��� �˻��϶�.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE JOB = 'CLERK' AND HIREDATE >= '1981-01-01';

-- Q29. BOSTON �̿� ������ �ִ� �μ��̸��� �˻��϶�.
SELECT DNAME, LOC
FROM DEPT
WHERE LOC <> 'BOSTON';

-- Q31. �޿��� 1000�̻��̸�, 2500 ������ ����� �����ȣ, ����̸�, �޿��� �˻��϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500;

-- Q33. �μ���ȣ�� 10 �Ǵ� 30�� �ٹ��ϴ� ������� ����̸��� �޿��� �˻��϶�.
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO IN (10, 30);

-- Q35. �����ȣ�� 79�� �����ϴ� ������� ����̸�, �޿�, Ŀ�̼��� �˻��϶�.
SELECT EMPNO, ENAME, SAL, COMM
FROM EMP
WHERE EMPNO LIKE '79%';

-- Q37. ����̸� �߰��� 'A'�� ����ִ� ����� �����ȣ�� ����̸��� �˻��϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '_A%';

-- Q39. ����ڻ����ȣ�� NULL�� �ƴ� ����� �����ȣ, �̸�, ����ڻ����ȣ�� �˻��϶�.
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE MGR IS NOT NULL;

-- Q41. ����ڻ����ȣ�� 7698 �Ǵ� 7839�� ����� �����ȣ�� ����̸��� �˻��϶�.
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE MGR IN (7698, 7839);

-- Q43. ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶�. 
SELECT EMPNO, ENAME
FROM EMP
ORDER BY 1;

-- Q45. ������� ������ �μ��� �޿��� ���� ������ �˻��϶�.
SELECT * FROM EMP
ORDER BY DEPTNO, SAL DESC;

-- Q47. ������� ������ �μ���ȣ��, ���������, �޿������� �˻��϶�.
SELECT * FROM EMP
ORDER BY DEPTNO, JOB, SAL DESC;

-- Q49. ������� ����̸�, ��������� �ҹ��ڷ� �˻��϶�.
SELECT LOWER(ENAME), LOWER(JOB)
FROM EMP;

-- Q51. ������� ����̸��� ��������� �빮�ڷ� �˻��϶�.
SELECT UPPER(ENAME), UPPER(JOB)
FROM EMP;

-- Q53. ������� ����̸��� ��������� ù �ڸ� �빮�ڷ� �˻��϶�.
SELECT INITCAP(ENAME), INITCAP(JOB)
FROM EMP;


-- Q54. ������� ����̸��� ��������� �����Ͽ� �˻��϶�.
SELECT CONCAT(ENAME, JOB)
FROM EMP;

SELECT ENAME || JOB
FROM EMP;

-- Q55. ������� ����̸��� ����̸��� ù �� ���ڸ� �˻��϶�.
SELECT ENAME, SUBSTR(ENAME, 1, 2)
FROM EMP;

-- Q57. ������� ����̸��� ����̸��� ���̸� �˻��϶�.
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- Q59. ������� ����̸��� 'A'�� �� ��° ��ġ�� �ִ��� �˻��϶�.
SELECT INSTR(ENAME, 'A')
FROM EMP;

-- Q61. ����̸��� 15�ڸ��� �ϰ�, �ڿ� '&'�� ä�� �˻��϶�.
SELECT RPAD(ENAME, 15, '&')
FROM EMP;

-- Q63. ����� �����ȣ, ����̸�, �޿��� �˻��϶�.
SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP;

-- Q65. �����ȣ�� �޿��� 100���� ���� �������� �˻��϶�.
SELECT EMPNO, MOD(SAL, 100)
FROM EMP;

-- Q67. �����ȣ, ����̸�, �Ի���, �ٹ����ڸ� ����Ͽ� �˻��϶�.
SELECT EMPNO, ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE, 0) AS WORKDAYS
FROM EMP
ORDER BY 4 DESC;

-- Q69. ������� �Ի��� ���� ������� ��¥�� �˻��϶�.
SELECT NEXT_DAY(HIREDATE,'��')
FROM EMP;

-- Q71. ������� �Ի����� ���� �������� �ݿø��Ͽ� �˻��϶�.
SELECT ROUND(HIREDATE, 'YEAR')
FROM EMP;

-- Q73. ����� �����ȣ�� ���� ����� ��� '����ھ���'�� ��Ÿ�������ϴ� ���ǹ��� �ۼ��϶�.
SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR),'����ھ���')
FROM EMP;

-- Q75. Ŀ�̼��� ������ ������ �����ȣ, ����̸��� �Բ� �˻��϶�.
SELECT EMPNO, ENAME, (SAL+NVL(COMM,0)*12)
FROM EMP;

-- Q77. �ٸ� ���� ������ NULLIF TEST ���ǹ��� �ۼ��϶�.
SELECT NVL(NULLIF(JOB,'CLERK'),'C')
FROM EMP;

-- Q79. ���� ������ ����� Ȯ���϶�.
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'SALESMAN', SAL * 1.1,
                'MANAGER', SAL * 1.3,
                'CLERK',   SAL * 1.2) AS �λ�޿�
FROM EMP
ORDER BY EMPNO;

-- Q80. 10, 20�� �μ� ����� �� �ְ� �޿��� �޴� ����� �����ȣ, ����̸�, �޿��� �˻��϶�.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO
                HAVING DEPTNO IN (10, 20))
AND DEPTNO IN (10, 20);


-- Q81. 30�� �μ��� ��� �� ���� �޿��� �޴� ����� �����ȣ, ����̸�, �޿��� �˻��϶�
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MIN(SAL)
                FROM EMP
                GROUP BY DEPTNO
                HAVING DEPTNO = 30)
AND DEPTNO = 30;    


-- Q82. ��ü ����� �� �ְ� Ŀ�̼��� �޴� ����� �����ȣ, ����̸�, Ŀ�̼��� �˻��϶�.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM = (SELECT MAX(COMM)
                FROM EMP);
                
-- Q83. ��ü ����� �� ���� Ŀ�̼��� �޴� ����� �����ȣ, ����̸�, Ŀ�̼��� �˻��϶�.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM = (SELECT MIN(COMM)
                FROM EMP);
                
-- Q84. ��ü ����� ����̸� �� MAX�� MIN���� �˻��϶�.
SELECT MAX(ENAME), MIN(ENAME)
FROM EMP;

-- Q85. ��ü ����� �Ի��� �� MAX, MIN���� �˻��϶�.
SELECT MAX(HIREDATE), MIN(HIREDATE)
FROM EMP;

-- Q86. �����ȣ�� MAX, MIN���� �˻��϶�.
SELECT MAX(EMPNO), MIN(EMPNO)
FROM EMP;

-- Q87. ����ڻ����ȣ ���� ������ �˻��϶�.
SELECT COUNT(MGR)
FROM EMP;

-- Q88. ����̸��� ������ �˻��϶�.
SELECT COUNT(ENAME)
FROM EMP;

-- Q89. ���(EMP) ���̺��� Ʃ�� ���� �˻��϶�.
SELECT COUNT(*)
FROM EMP;

-- Q90. �μ�(DEPT) ���̺��� Ʃ�ü��� �˻��϶�
SELECT COUNT(*)
FROM DEPT;

-- Q91. Ŀ�̼��� ������ �˻��϶�
SELECT COUNT(COMM)
FROM EMP;

-- Q92. �μ��� ������� �ο����� �˻��϶�
SELECT DEPTNO, COUNT(DEPTNO)
FROM EMP
GROUP BY DEPTNO;

-- Q93. ����ڻ����ȣ�� ������� �ο����� �˻��϶�.
SELECT MGR, COUNT(*)
FROM EMP
GROUP BY MGR;

-- Q94. �μ��� ������� ��� �޿��� �̻��϶�. 
SELECT DEPTNO, ROUND(AVG(SAL),1)
FROM EMP
GROUP BY DEPTNO;

-- Q95. �μ��� ������� �޿��� ǥ�������� �˻��϶�.
SELECT DEPTNO, ROUND(STDDEV(SAL), 1)
FROM EMP
GROUP BY DEPTNO;

-- Q96. �μ��� ��������� ����� �޿� ���� �̻��϶�.
SELECT DEPTNO, ROUND(SUM(SAL), 1)
FROM EMP
GROUP BY DEPTNO;

-- 97. �μ��� ��������� ������� ��� �޿��� �˻��϶�.
SELECT DEPTNO, JOB, ROUND(AVG(SAL), 1)
FROM EMP
GROUP BY DEPTNO, JOB;


-- Q98. �μ��� ��������� ������� �Ի����� MAX�� MIN���� �˻��϶�.
SELECT DEPTNO, JOB, MAX(HIREDATE), MIN(HIREDATE)
FROM EMP
GROUP BY DEPTNO, JOB;

-- Q99. �μ��� ������� �ο����� �ο����� ���� ������ �˻��϶�.
SELECT DEPTNO, COUNT(ENAME)
FROM EMP
GROUP BY DEPTNO
ORDER BY 2 DESC;

-- Q100. �μ��� ������� ��� �޿��� ��� �޿� ������ �˻��϶�.
SELECT DEPTNO, ROUND(AVG(SAL))
FROM EMP
GROUP BY DEPTNO
ORDER BY 2 DESC;

-- Q101. �μ���, ��������� ����� �޿� ���� ���� ������ �˻��϶�.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 3 DESC;
