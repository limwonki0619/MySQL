-- 04. JOIN, SUBQUERY ��������

-- ���� 1. ���(TEMP)���̺�� �μ�(DEPT)���̺��� NATURAL JOIN�϶� 

-- ��� ���̺�
SELECT * FROM EMP;
-- �μ� ���̺� 
SELECT * FROM DEPT;
SELECT * FROM EMP NATURAL JOIN DEPT;

-- ���� 2. �����ȣ, ����̸�, �μ��̸��� �˻��϶�(EQUI JOIN)
SELECT EMPNO, ENAME, DNAME 
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- ���� 3. �����ȣ, ����̸�, �μ��̸��� �˻��϶�(NATURAL JOIN)
SELECT EMPNO, ENAME, DNAME
FROM EMP NATURAL JOIN DEPT;

-- ���� 4. �����ȣ, ����̸�, �μ��̸��� �˻��϶�(JOIN ~ USING)
SELECT EMPNO, ENAME, DNAME
FROM EMP JOIN DEPT USING(DEPTNO);

-- ���� 5. �����ȣ, ����̸�, �μ��̸��� �˻��϶�(JOIN ~ ON)
SELECT EMPNO, ENAME, DNAME
FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

-- ���� 6. ������ NEW YORK�� ����̸��� �˻��϶�(EQUI JOIN)
SELECT ENAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND LOC = 'NEW YORK';

-- ���� 7. ������ NEW YORK�� ����̸��� �˻��϶�(NATURAL JOIN)
SELECT ENAME, LOC
FROM EMP NATURAL JOIN DEPT
WHERE LOC = 'NEW YORK';

-- ���� 8. ������ NEW YORK�� ����̸��� �˻��϶�(JOIN USING)
SELECT ENAME, LOC
FROM EMP JOIN DEPT USING(DEPTNO)
WHERE LOC = 'NEW YORK';

-- ���� 9. ������ NEW YORK�� ����̸��� �˻��϶�(JOIN ON)
SELECT ENAME, LOC
FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE LOC = 'NEW YORK';

-- ���� 10. ������ NEW YORK�� ����� �����ȣ, ����̸��� �����ȣ ������ �˻��϶�.
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT EMPNO, ENAME, LOC
FROM EMP NATURAL JOIN DEPT
WHERE LOC = 'NEW YORK'
ORDER BY 1;

-- ���� 11. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(EQUI JOIN)
SELECT ENAME, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND ENAME ='ADAMS';

-- ���� 12. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(JOIN ~ USING)
SELECT ENAME, DNAME, LOC
FROM EMP JOIN DEPT USING(DEPTNO)
WHERE ENAME ='ADAMS';

-- ���� 13. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(JOIN ~ ON)
SELECT ENAME, DNAME, LOC
FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE ENAME = 'ADAMS';

-- ���� 14. ADAMS ����� �ٹ� ���� �μ��̸��� ������ �˻��϶�(NATURAL JOIN)
SELECT ENAME, DNAME, LOC
FROM EMP NATURAL JOIN DEPT
WHERE ENAME = 'ADAMS';

-- ���� 15. �޿��� 2000 �̻��� ������� ������ ������ �˻��϶� 
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME, SAL, LOC
FROM EMP NATURAL JOIN DEPT
WHERE SAL > 2000;

-- ���� 16. �޿��� 1000�̻� 2000������ ������� �����ȣ, ����̸�, �μ��̸��� �����ȣ������ �˻��϶�.
SELECT EMPNO, ENAME, DNAME, SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL >= 1000 AND SAL <= 2000
ORDER BY 1;

SELECT EMPNO, ENAME, DNAME, SAL
FROM EMP NATURAL JOIN DEPT
WHERE SAL BETWEEN 1000 AND 2000
ORDER BY 1;

-- ���� 17. ��������� SALESMAN �̸鼭 CHICAGO ������ �ٹ����� ������� �˻��϶�.
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT ENAME, JOB, LOC, SAL
FROM EMP NATURAL JOIN DEPT
WHERE JOB = 'SALESMAN' AND LOC = 'CHICAGO';

-- ���� 18. NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶� (EQUI JOIN)
SELECT EMPNO, ENAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND (LOC = 'NEW YORK' OR LOC = 'DALLAS')
ORDER BY 1;

SELECT EMPNO, ENAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
AND LOC IN ('NEW YORK', 'DALLAS')
ORDER BY 1;

-- ���� 19. �μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�� ����� �����ȣ�� ����̸��� �˻��϶�. (EQUI JOIN)
SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT EMPNO, ENAME, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND (DNAME = 'ACCOUNTING' OR LOC = 'CHICAGO');

-- ���� 20. NEW YORK�̳� DALLAS ������ �ٹ��ϴ� ������� �����ȣ�� ����̸��� �����ȣ ������ �˻��϶�. (NATURAL JOIN)
SELECT EMPNO, ENAME, LOC
FROM EMP NATURAL JOIN DEPT
WHERE LOC IN ('NEW YORK', 'DALLAS')
ORDER BY 1;

-- ���� 21. �μ��̸��� ACCOUNTING�̰ų�, ������ CHICAGO�� ����� �����ȣ�� ����̸��� �˻��϶�. (JOIN USING)
SELECT EMPNO, ENAME, DNAME, LOC
FROM EMP JOIN DEPT USING(DEPTNO)
WHERE DNAME = 'ACCOUNTING' OR LOC = 'CHICAGO';

-- ���� 22. �����ȣ, ����̸�, �޿�, �޿������ �޿���޺� �����ȣ ������ �˻��϶�.
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

SELECT EMPNO, ENAME, SAL, GRADE
FROM EMP, SALGRADE
WHERE SAL BETWEEN LOSAL AND HISAL
ORDER BY 4,1;

-- ���� 23. �����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶� (EQUI JOIN)
SELECT A.EMPNO AS �����ȣ, A.ENAME AS ����̸�, B.EMPNO AS ����ڻ����ȣ, B.ENAME AS ������̸�
FROM EMP A, EMP B
WHERE A.MGR = B.EMPNO;

-- ���� 24. �����ȣ, ����̸�, ����ڻ����ȣ, ������̸��� �˻��϶� (JOIN  ON)
SELECT A.EMPNO AS �����ȣ, A.ENAME AS ����̸�, B.EMPNO AS ����ڻ����ȣ, B.ENAME AS ������̸�
FROM EMP A JOIN EMP B ON A.MGR = B.EMPNO;

-- ���� 25. BLAKE ������� ���� �޿��� �޴� ����̸��� �˻��϶�(SUB QUERY)
SELECT ENAME, SAL
FROM EMP 
WHERE SAL > 
    (SELECT SAL 
    FROM EMP 
    WHERE ENAME = 'BLAKE');
    
-- ���� 26. BLAKE ������� ���� �޿��� �޴� ����̸��� �̻��϶�(SELF JOIN)
SELECT B.ENAME, B.SAL
FROM EMP A, EMP B
WHERE B.SAL > A.SAL
    AND A.ENAME = 'BLAKE';
    
-- ���� 27. FORD ����� ���� �μ��� �ٹ��ϴ� ����̸��� �˻��϶�.
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'FORD');

-- ���� 28. FORD ����� ���� �޿��� �޴� ����� �����ȣ�� �˻��϶�.
SELECT EMPNO, ENAME, SAL FROM EMP
WHERE SAL = (SELECT SAL FROM EMP WHERE ENAME = 'FORD');

-- ���� 29. �μ��� �ο����� �μ��̸��� �Բ� ����� ���� �μ� ������ �˻��϶�.
SELECT DNAME, COUNT(*)
FROM EMP NATURAL JOIN DEPT
GROUP BY DNAME
ORDER BY 2 DESC;

-- ���� 30. �����ȣ, ����̸��� ������������ ���� ������ �˻��϶�.
SELECT B.EMPNO, B.ENAME, COUNT(*)
FROM EMP A JOIN EMP B ON A.MGR = B.EMPNO
GROUP BY B.EMPNO, B.ENAME, A.MGR
ORDER BY 3 DESC;

-- ���� 31. �μ��̸��� 'SALES'�̸鼭 ��������� 'MANAGER'�� ����� �����ȣ, ����̸��� ����̸� ������ �˻��϶�.
SELECT EMPNO, ENAME, DNAME, JOB
FROM EMP NATURAL JOIN DEPT
WHERE DNAME = 'SALES' AND JOB = 'MANAGER';

-- ���� 32. SCOTT ������� ���� �޿��� �޴� ��� ������ �˻��϶�.
SELECT * FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT');

-- ���� 33. ALLEN ������� ���� �޿��� �޴� ��� ������ �˻��϶�.
SELECT * FROM EMP
WHERE SAL < (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');

-- ���� 34. 20�� �μ� ����� ��������� ���� ��������� �ٸ� �μ��� ��� ������ �˻��϶�.
SELECT * FROM EMP
WHERE DEPTNO <> 20 
    AND JOB IN 
    (SELECT JOB 
    FROM EMP 
    WHERE DEPTNO = 20);

-- ���� 35. ��ü ����� ��� �޿����� �޿��� ���� ��������� �˻��϶�.
SELECT * FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- ���� 36. �޿��� ��� �μ����� ��� �޿����� ���� ��� ������ �˻��϶�.
SELECT * FROM EMP
WHERE SAL > ALL
    (SELECT AVG(SAL) 
        FROM EMP 
        GROUP BY DEPTNO);
        
-- ���� 37. 20�� �μ��� �ִ� �޿����� �ִ�޿��� ū �μ��� ��ȣ�� �ִ� �޿��� �˻��϶�.
SELECT DEPTNO, MAX(SAL)
FROM EMP
WHERE SAL > 
    (SELECT MAX(SAL)
     FROM EMP 
     GROUP BY DEPTNO
     HAVING DEPTNO = 20)
GROUP BY DEPTNO;


