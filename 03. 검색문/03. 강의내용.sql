-- 03. 검색문 (SELECT)

-- 3.1 단순 검색 ----------------------------------------------------------------

-- (1) 테이블 내의 모든 정보 검색 
SELECT * FROM STUDENT;

-- (2) 특정 열의 내용 검색 
SELECT STU_NO, STU_NAME 
FROM STUDENT;

-- (3) 중복 행 제거
SELECT DISTINCT STU_DEPT
FROM STUDENT;

SELECT STU_GRADE, STU_CLASS
FROM STUDENT;

SELECT DISTINCT STU_GRADE, STU_CLASS
FROM STUDENT;

-- (4) 수식을 포함한 검색
SELECT STU_NO, SUB_NO, ENR_GRADE, ENR_GRADE + 10
FROM ENROL;

-- (5) 결과 열에 별칭(ALIAS)부여하기
SELECT STU_NO AS ID, STU_NAME AS NAME
FROM STUDENT;

-- (6) 연결연산자
SELECT STU_DEPT || STU_NAME AS 학과성명
FROM STUDENT;

SELECT STU_DEPT || ',' || STU_NAME || '입니다' AS 학과성명
FROM STUDENT;


-- 3.2 조건 검색 ----------------------------------------------------------------
-- (1) WHERE 절 사용하기
SELECT STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보';

-- (2) 논리연산자
SELECT STU_NAME, STU_DEPT, STU_GRADE, STU_CLASS
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보' AND STU_GRADE = 2;

-- (3) 범위 조건
SELECT *
FROM STUDENT
WHERE STU_WEIGHT BETWEEN 60 AND 70;

SELECT *
FROM STUDENT
WHERE STU_NO BETWEEN '20140001' AND '20149999';

-- (4) LIKE를 이용한 검색
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '김%';

-- 와일드카드 문자
-- % : 0개 이상의 문자
-- _ : 1개 이상의 문자

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_NAME LIKE '_수%';

SELECT * 
FROM STUDENT
WHERE STU_NO LIKE '2014%';

-- (5) NULL값 처리
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT;

-- 데이터에 NULL값의 존재 여부를 확인하는 질의문
SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NULL;

SELECT STU_NO, STU_NAME, STU_HEIGHT
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL;


-- (6) IN
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_DEPT IN ('컴퓨터정보', '기계');


-- 3.3 검색 결과의 순서화(정렬) ---------------------------------------------------
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY STU_NO;

-- 내림차순 정렬 
SELECT STU_NO, STU_NAME
FROM STUDENT
ORDER BY STU_NO DESC;

SELECT STU_NO AS NO, STU_NAME 
FROM STUDENT
ORDER BY NO;

-- 열의 번호로 정렬 
SELECT STU_NO, STU_NAME 
FROM STUDENT
ORDER BY 1;

-- 여러개의 열을 기준으로 정렬 
SELECT STU_NO, STU_NAME, STU_DEPT, STU_WEIGHT -5 AS TARGET
FROM STUDENT
ORDER BY STU_DEPT, TARGET;


-- 3.4 함수(FUNCTION)

-- 3.4.1 함수란 하나 이상의 인수를 전달받아 처리한 결과값을 함수의 이름에 실어 반환해주는 모듈이다.
-- 이러한 함수에는 각 행에 대해 처리된 결과를 반환하는 함수와 데이터 그룹에 대한 처리 결과를 반환하는 그룹함수로 구분된다.
-- 단일 함수 : 함수가 정의된 SQL문장이 실행될 때 각각의 행에 대해 수행, 각 행당 하나의 결과값을 반환
-- 그룹 함수 : 데이터를 그룹화하고 그룹 각각에 대한 결과를 반환하며, 주로 GROUP BY 절을 사용한다.


-- 3.4.2 단일행 함수 -------------------------------------------------------------

-- (1) 숫자함수 
-- ROUND, TRUNC, MOD, ABS, FLOOR
SELECT ROUND(345.6478), ROUND(345.678, 0),
ROUND(345.678, 1), ROUND(345.678, -1)
FROM DUAL;

-- (2) 문자함수
-- LOWER
-- UPPER 
-- INITCAP : 첫번째 문자를 대문자로 변환 
-- CONCAT 
-- SUBSTR : 일부 추출 
-- LENGTH 
-- INSTR : 특정 문자의 절대위치를 반환 
-- LPAD : 자릿수를 지정하고, 빈 공간을 특정 문자로 왼쪽부터 채움
-- RPAD : 오른쪽부터 채움 

SELECT UPPER('KOREA')
FROM DUAL;

-- (3) 날짜 함수
-- SYSDATE : 시스템의 오늘 날짜를 반환 
-- 날짜 연산 : 날짜에 +, - 연산 가능 
-- MONTHS_BETWEEN : 두 날짜의 차이 반환
-- NEXT_DAY : 인수1에서 가장 가까운 인수2의 요일을 반환
-- ADD_MONTH : 인수1에 인수2의 달을 더하여 반환
-- LAST_DAY : 인수1이 속한 달의 마지막 날을 반환
-- ROUND : 인수1의 값을 인수2를 기준으로 반올림하여 반환
-- TRUNC : 인수1의 값을 인수2를 기준으로 절사하여 반환 

SELECT SYSDATE
FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT SYSDATE
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '화')
FROM DUAL;


-- (4) 변환 함수 
-- 데이터 형태 변환 
-- TO_NUMBER
-- TO_DATE
-- TO_CHAR


-- (5) 일반 함수

-- 1. NVL(인수1, 인수2) : 인수 값이 NULL인지 체크하여 연산이 가능한 값으로 변환하여 변환하는 함수 
SELECT NVL(STU_HEIGHT, 0)
FROM STUDENT;

-- 2. NVL2(인수1, 인수2, 인수3) : 인수1이 널 값이 아니면 인수2를, 널 값이면 인수3을 반환
SELECT ENAME, NVL2(COMM, SAL+COMM, SAL)
FROM EMP;

-- 3. NULLIF(인수1, 인수2) : 인수1과 인수2의 값을 비교하여 그 값이 같으면 NULL을, 아니면 인수1의 값을 반환
SELECT NVL(NULLIF('A', 'A'), '널 값')
FROM DUAL;

SELECT NVL(NULLIF('A', 'B'), '널 값')
FROM DUAL;

-- 4. COALESCE(인수1, ...인수N) : 인수1의 값이 널 값이 아니면, 인수1의 값을 반환하고, 
-- 널 값이면 인수2의 값을 검사하여 널 값이 아니면, 인수2의 값을 반환하고.. 결국 여러 인수들 중 처음으로 널 값이 아닌 값이 나타날 때 
-- 그 값을 반환한다.
SELECT COALESCE(NULL, NULL, 10, 100, NULL)
FROM DUAL;

-- 5. CASE
-- 조건에 따른 처리 

SELECT EMPNO, ENAME, SAL,
CASE JOB WHEN 'SALESMAN' THEN SAL * 1.1         
         WHEN 'CLERK' THEN SAL * 1.15
         WHEN 'MANAGER' THEN SAL * 1.2
         ELSE SAL
     END AS 급여인상
FROM EMP;


-- 6. DECODE : 보고서를 쓸 때 사용 
SELECT EMPNO, ENAME, JOB, SAL,
    DECODE(JOB, 'SALESMAN', SAL * 1.1,
                'CLERK',    SAL * 1.15,
                'MANAGER',  SAL * 1.2, SAL) AS 인상된급여
FROM EMP;



-- 3.4.3 그룹함수 ---------------------------------------------------------------
-- 그룹함수는 단일 함수우ㅘ 달리 여러 행에 대한 연산 즉 평균, 개수 등의 결과값을 반환하는 함수다.
-- 특히 SELECT 문에서 GROUP BY 절에 정의된 열을 기준으로 행을 그룹화시켜 그룹함수를 적용하면
-- 각 그룹에 하나의 결과를 반환하며, 만약 GROUP BY 절을 사용하지 않으면, 하나의 결과값을 반환한다.

-- COUNT() : 조건을 만족한느 열의 데이터 값들의 개수를 반환
-- COUNT(*) : 모든 행의 개수를 반환
-- SUM() : 열의 합 
-- AVG() : 열의 평균
-- MAX() : 열의 최대
-- MIN() : 열의 최소 
-- STDDEV() : 표준편차
-- VARIANCE() : 분산 

-- 그룹함수중 COUNT(*)를 제외하고는 널 값을 제외한다.
-- 또한 중복 값을 제외하기 위해서는 DISTINCT를 사용한다.

-- (1) MIN, MAX 함수
SELECT MAX(ENR_GRADE), MIN(ENR_GRADE)
FROM ENROL;

SELECT MIN(STU_WEIGHT), MAX(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT = '기계';

-- (2) COUNT 함수
-- COUNT(*) : 널값을 포함한 개수
-- COUNT() : 널값을 제외한 개수 
SELECT COUNT(*), COUNT(STU_HEIGHT)
FROM STUDENT;

SELECT COUNT(STU_DEPT), COUNT(DISTINCT STU_DEPT)
FROM STUDENT;

-- (3) SUM과 AVG 함수
SELECT SUM(STU_WEIGHT), AVG(STU_WEIGHT)
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보';

SELECT COUNT(*) AS 학생, SUM(STU_HEIGHT) AS 신장합,
COUNT(STU_HEIGHT) AS 해당학생수, AVG(STU_HEIGHT) AS 평균신장
FROM STUDENT;


-- 3.4.4 GROUP BY의 사용
-- (1) 단일행을 이용한 GROUP BY 절
-- 주로 GROUP BY 절은 그룹을 지어 그룹별 대표 값을 반환하는데 사용된다.
-- 결과에 대한 정렬을 하기위해 ORDER BY절을 사용할 수 있다.

SELECT STU_DEPT, AVG(STU_WEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

SELECT STU_DEPT , COUNT(*)
FROM STUDENT 
WHERE STU_WEIGHT >= 50
GROUP BY STU_DEPT;

-- (2) 다중열 GROUP BY 절
-- GROUP BY 절에 두 개 이사의 열이 기술될 수 있으며, 이 경우 GROUP BY 절의 왼쪽에서 오른쪽의 열의 순으로 행을 그룹지어 처리한다.
SELECT STU_DEPT, STU_GRADE, COUNT(*)
FROM STUDENT
GROUP BY STU_DEPT, STU_GRADE;

-- (3) HAVING절 사용
-- 그룹함수를 적용한 결과에 다시 조건을 부여할 때는 HAVING절을 사용한다.
SELECT STU_GRADE, AVG(STU_HEIGHT)
FROM STUDENT
WHERE STU_DEPT = '기계'
GROUP BY STU_GRADE
HAVING AVG(STU_HEIGHT) >= 160;

SELECT STU_DEPT, MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT 
HAVING MAX(STU_HEIGHT) >= 175;

SELECT TO_CHAR(MAX(AVG(STU_HEIGHT)), '999.99')
FROM STUDENT
GROUP BY STU_DEPT;