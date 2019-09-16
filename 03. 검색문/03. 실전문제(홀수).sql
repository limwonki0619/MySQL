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