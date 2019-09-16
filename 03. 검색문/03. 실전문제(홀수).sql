-- 03. 검색문 실전문제(홀수)

-- Q1. 사원(EMP) 테이블의 구조를 검색하라.
DESC EMP;

-- Q3. 급여(SALGRADE) 테이블의 구조를 검색하라
DESC SALGRADE;

-- Q5. 부서의 부서번호(DEPTNO)와 부서이름(DNAME)을 검색하라.
SELECT DEPTNO, DNAME FROM DEPT;

-- Q7. 사원들의 급여와 커미션을 검색하라.
SELECT SAL, COMM FROM EMP;

-- Q9. 사원들의 상급자사원번호(MGR) 중복을 제거하고 검색하라.
SELECT DISTINCT MGR FROM EMP;

-- Q11. 사원들의 6개월 급여의 합을 검색하라.
SELECT ENAME, SAL*6 FROM EMP;

-- Q13. 사원이름을 'NAME'으로 사원의 급여를 'Salary'로 열의 이름을 부여하여 검색하라.
SELECT ENAME AS NAME, SAL AS SALARY FROM EMP;

-- Q15. 부서번호, 부서이름, 지역을 한글 제목으로 검색하라.
SELECT DEPTNO AS 부서번호, DNAME AS 부서이름, LOC AS 지역 FROM DEPT;

-- Q17. 입사일(HIREDATE) 사원이름을 '80-12-17'에 입사한 SMITH입니다. 식으로 검색하라.
SELECT HIREDATE || '에 입사한' || ENAME || '입니다' FROM EMP;

-- Q19. 급여가 2000이상인 사원들의 사원번호, 사원이름을 검색하라
SELECT EMPNO, ENAME
FROM EMP
WHERE SAL >= 2000;

-- Q21. 1980년 12월 17일에 입사한 사원이름을 검색하라.
SELECT ENAME FROM EMP
WHERE HIREDATE = '1980-12-17';

-- Q23. 급여등급이 5인 급여의 상위급여와 하위급여를 검색하라.
SELECT HISAL, LOSAL
FROM SALGRADE
WHERE GRADE = 5;

-- Q25. 10번 부서에 근무하는 MANAGER의 사원이름을 검색하라.
SELECT ENAME, JOB, DEPTNO
FROM EMP
WHERE DEPTNO = 10 AND JOB = 'MANAGER';

-- Q27. 사원직무가 'CLERK'이며, 81년 이후에 입사한 사원들의 사원번호와 사원이름을 검색하라.
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
WHERE JOB = 'CLERK' AND HIREDATE >= '1981-01-01';

-- Q29. BOSTON 이외 지역에 있는 부서이름을 검색하라.
SELECT DNAME, LOC
FROM DEPT
WHERE LOC <> 'BOSTON';

-- Q31. 급여가 1000이상이며, 2500 이하인 사원의 사원번호, 사원이름, 급여를 검색하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 2500;

-- Q33. 부서번호가 10 또는 30에 근무하는 사원들의 사원이름과 급여를 검색하라.
SELECT ENAME, SAL
FROM EMP
WHERE DEPTNO IN (10, 30);

-- Q35. 사원번호가 79로 시작하는 사원들의 사원이름, 급여, 커미션을 검색하라.
SELECT EMPNO, ENAME, SAL, COMM
FROM EMP
WHERE EMPNO LIKE '79%';

-- Q37. 사원이름 중간에 'A'가 들어있는 사원의 사원번호와 사원이름을 검색하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE ENAME LIKE '_A%';

-- Q39. 상급자사원번호가 NULL이 아닌 사원의 사원번호, 이름, 상급자사원번호를 검색하라.
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE MGR IS NOT NULL;

-- Q41. 상급자사원번호가 7698 또는 7839인 사원의 사원번호와 사원이름을 검색하라.
SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE MGR IN (7698, 7839);

-- Q43. 사원들의 사원번호와 사원이름을 사원번호 순으로 검색하라. 