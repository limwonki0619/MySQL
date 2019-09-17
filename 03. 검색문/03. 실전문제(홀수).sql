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
SELECT EMPNO, ENAME
FROM EMP
ORDER BY 1;

-- Q45. 사원들의 정보를 부서별 급여가 많은 순으로 검색하라.
SELECT * FROM EMP
ORDER BY DEPTNO, SAL DESC;

-- Q47. 사원들의 정보를 부서번호별, 사원직무별, 급여순으로 검색하라.
SELECT * FROM EMP
ORDER BY DEPTNO, JOB, SAL DESC;

-- Q49. 사원들의 사원이름, 사원직무를 소문자로 검색하라.
SELECT LOWER(ENAME), LOWER(JOB)
FROM EMP;

-- Q51. 사원들의 사원이름과 사원직무를 대문자로 검색하라.
SELECT UPPER(ENAME), UPPER(JOB)
FROM EMP;

-- Q53. 사원들의 사원이름과 사원직무를 첫 자만 대문자로 검색하라.
SELECT INITCAP(ENAME), INITCAP(JOB)
FROM EMP;


-- Q54. 사원들의 사원이름과 사원직무를 연결하여 검색하라.
SELECT CONCAT(ENAME, JOB)
FROM EMP;

SELECT ENAME || JOB
FROM EMP;

-- Q55. 사원들의 사원이름과 사원이름의 첫 두 글자를 검색하라.
SELECT ENAME, SUBSTR(ENAME, 1, 2)
FROM EMP;

-- Q57. 사원들의 사원이름과 사원이름의 길이를 검색하라.
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

-- Q59. 사원들의 사원이름에 'A'가 몇 번째 위치에 있는지 검색하라.
SELECT INSTR(ENAME, 'A')
FROM EMP;

-- Q61. 사원이름을 15자리로 하고, 뒤에 '&'를 채워 검색하라.
SELECT RPAD(ENAME, 15, '&')
FROM EMP;

-- Q63. 사원의 사원번호, 사원이름, 급여를 검색하라.
SELECT EMPNO, ENAME, ROUND(SAL, -2)
FROM EMP;

-- Q65. 사원번호와 급여를 100으로 나눈 누머지를 검색하라.
SELECT EMPNO, MOD(SAL, 100)
FROM EMP;

-- Q67. 사원번호, 사원이름, 입사일, 근무일자를 계산하여 검색하라.
SELECT EMPNO, ENAME, HIREDATE, TRUNC(SYSDATE-HIREDATE, 0) AS WORKDAYS
FROM EMP
ORDER BY 4 DESC;

-- Q69. 사원들의 입사일 다음 토요일의 날짜를 검색하라.
SELECT NEXT_DAY(HIREDATE,'토')
FROM EMP;

-- Q71. 사원들의 입사일을 년을 기준으로 반올림하여 검색하라.
SELECT ROUND(HIREDATE, 'YEAR')
FROM EMP;

-- Q73. 상급자 사원번호가 없는 사원의 경우 '상급자없음'을 나타내도록하는 질의문을 작성하라.
SELECT EMPNO, ENAME, NVL(TO_CHAR(MGR),'상급자없음')
FROM EMP;

-- Q75. 커미션을 포함한 연봉을 사원번호, 사원이름과 함께 검색하라.
SELECT EMPNO, ENAME, (SAL+NVL(COMM,0)*12)
FROM EMP;

-- Q77. 다른 값을 가지는 NULLIF TEST 질의문을 작성하라.
SELECT NVL(NULLIF(JOB,'CLERK'),'C')
FROM EMP;

-- Q79. 다음 문장의 결과를 확인하라.
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'SALESMAN', SAL * 1.1,
                'MANAGER', SAL * 1.3,
                'CLERK',   SAL * 1.2) AS 인상급여
FROM EMP
ORDER BY EMPNO;

-- Q80. 10, 20번 부서 사원들 중 최고 급여를 받는 사원의 사원번호, 사원이름, 급여를 검색하라.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO
                HAVING DEPTNO IN (10, 20))
AND DEPTNO IN (10, 20);


-- Q81. 30번 부서의 사원 중 최저 급여를 받는 사원의 사원번호, 사원이름, 급여를 검색하라
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN (SELECT MIN(SAL)
                FROM EMP
                GROUP BY DEPTNO
                HAVING DEPTNO = 30)
AND DEPTNO = 30;    


-- Q82. 전체 사원들 중 최고 커미션을 받는 사원의 사원번호, 사원이름, 커미션을 검색하라.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM = (SELECT MAX(COMM)
                FROM EMP);
                
-- Q83. 전체 사원들 중 최저 커미션을 받는 사원의 사원번호, 사원이름, 커미션을 검색하라.
SELECT EMPNO, ENAME, COMM
FROM EMP
WHERE COMM = (SELECT MIN(COMM)
                FROM EMP);
                
-- Q84. 전체 사원의 사원이름 중 MAX와 MIN값을 검색하라.
SELECT MAX(ENAME), MIN(ENAME)
FROM EMP;

-- Q85. 전체 사원의 입사일 중 MAX, MIN값을 검색하라.
SELECT MAX(HIREDATE), MIN(HIREDATE)
FROM EMP;

-- Q86. 사원번호의 MAX, MIN값을 검색하라.
SELECT MAX(EMPNO), MIN(EMPNO)
FROM EMP;

-- Q87. 상급자사원번호 열의 개수를 검색하라.
SELECT COUNT(MGR)
FROM EMP;

-- Q88. 사원이름의 개수를 검색하라.
SELECT COUNT(ENAME)
FROM EMP;

-- Q89. 사원(EMP) 테이블의 튜플 수를 검색하라.
SELECT COUNT(*)
FROM EMP;

-- Q90. 부서(DEPT) 테이블의 튜플수를 검색하라
SELECT COUNT(*)
FROM DEPT;

-- Q91. 커미션의 개수를 검색하라
SELECT COUNT(COMM)
FROM EMP;

-- Q92. 부서별 사원들의 인원수를 검색하라
SELECT DEPTNO, COUNT(DEPTNO)
FROM EMP
GROUP BY DEPTNO;

-- Q93. 상급자사원번호별 사원들의 인원수를 검색하라.
SELECT MGR, COUNT(*)
FROM EMP
GROUP BY MGR;

-- Q94. 부서별 사원들의 평균 급여를 겁색하라. 
SELECT DEPTNO, ROUND(AVG(SAL),1)
FROM EMP
GROUP BY DEPTNO;

-- Q95. 부서별 사원들의 급여의 표준편차를 검색하라.
SELECT DEPTNO, ROUND(STDDEV(SAL), 1)
FROM EMP
GROUP BY DEPTNO;

-- Q96. 부서별 사원직무별 사원의 급여 합을 겁색하라.
SELECT DEPTNO, ROUND(SUM(SAL), 1)
FROM EMP
GROUP BY DEPTNO;

-- 97. 부서별 사원직무별 사원들의 평균 급여를 검색하라.
SELECT DEPTNO, JOB, ROUND(AVG(SAL), 1)
FROM EMP
GROUP BY DEPTNO, JOB;


-- Q98. 부서별 사원직무별 사원들의 입사일의 MAX와 MIN값을 검색하라.
SELECT DEPTNO, JOB, MAX(HIREDATE), MIN(HIREDATE)
FROM EMP
GROUP BY DEPTNO, JOB;

-- Q99. 부서별 사원들의 인원수를 인원수가 많은 순으로 검색하라.
SELECT DEPTNO, COUNT(ENAME)
FROM EMP
GROUP BY DEPTNO
ORDER BY 2 DESC;

-- Q100. 부서별 사원들의 평균 급여를 평균 급여 순으로 검색하라.
SELECT DEPTNO, ROUND(AVG(SAL))
FROM EMP
GROUP BY DEPTNO
ORDER BY 2 DESC;

-- Q101. 부서별, 사원직무별 사원의 급여 합을 많은 순으로 검색하라.
SELECT DEPTNO, JOB, SUM(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY 3 DESC;
