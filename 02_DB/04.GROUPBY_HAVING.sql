-- CHAPTER 04. GROUP BY / HAVING
-- 내장함수의 종류
-- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수(집계함수) : 여러 행을 입력을 받아 하나의 결과 값으로 출력이 되는 함수

-- 다중행함수 (집계함수)의 특징
-- 1. 집계함수는 NULL값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 그룹화(GROUP BY) 가 되어 있는 상태에서만 사용 가능

-- 집계함수의 종류
-- COUNT() : 지정한 데이터의 개수 반환
-- SUM() : 지정한 데이터의 합 반환
-- MAX() : 지정한 데이터 중 최대값 반환
-- MIN() : 지정한 데이터 중 최소값 반환
-- AVG() : 지정한 데이터의 평균값 반환

-- 직원테이블에서 직원ID의 행의 개수를 조회
SELECT COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY ();

-- COUNT() 함수는 *를 사용할 수 있다.
-- 다른 집계함수는 사용 못함
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES;
SELECT COUNT(*)
FROM EMPLOYEES;

-- 문제1) 직원테이블에서 급여의 총 합계를 출력 (SUM 함수사용)
SELECT SUM(SALARY)
FROM EMPLOYEES;
-- 문제2) 직원테이블에서 직원들의 최대 급여와 최소 급여를 출력 (MAX/MIN 함수)
SELECT MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES;
-- 문제3) 직원테이블에서 부서ID가 100인 직원의 평균 급여를 출력 (AVG 함수)
--        * 결과값은 소수점 1의 자리까지 반올림
SELECT ROUND (AVG(SALARY), 1)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100;


-- GROUP BY
-- 특정 컬럼을 기준으로 그룹화(묶음)

-- [ GRUOP BY 사용 방법 ] 
-- 4. SELECT        조회하고자 하는 "컬럼 이름"
-- 1. FROM          데이터를 가져올 "테이블 이름"
-- 2. WHERE         원하는 행(데이터)를 선별하기 위한 "조건 식"
-- 3. GROUP BY      "특정 컬럼"을 기준으로 "그룹화"

-- 수강생정보 테이블에서 소속반 별 학생의 인원 수를 조회
SELECT 소속반, COUNT(학생이름)
FROM 수강생정보
GROUP BY (소속반);

-- GROUP BY를 사용할때 유의해야할 점
-- 1. GROUP BY절을 사용하는 순간 실제 출력되는 행의 갯수가 감소하기 때문에
-- GROUP BY절보다 늦게 실행되는 절인(SELECT, HAVING, ORDER BY)절에는
-- 출력할 수 있는 행이 제한이 걸리게 된다
-- 2. 다만 집계함수로 처리하는 컬럼에 한에서는 사용 가능

-- ***SQL 실행순서***
-- FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

-- 성적표 테이블에서 과목별로 최고 성적과, 최저 성적 출력
SELECT * FROM 성적표;

SELECT 과목, MIN(성적),MAX(성적)
FROM 성적표
GROUP BY 과목;

-- 부서별로 평균 급여를 조회
-- 소수점 첫째 자리까지만 조회
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),1)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

-- 성적표테이블에서 과목이 PYTHON을 제외한 학생별 성적의 합
SELECT * FROM 성적표;

SELECT 학생ID, SUM(성적)
FROM 성적표
WHERE 과목 != 'PYTHON'
GROUP BY 학생ID
ORDER BY 학생ID;

-- 데이터를 가져올 테이블 : EMPLOYEES
-- 직업이 AD_PRES, IT_PROG를 제외한 직업별 직원들의 평균 급여
-- IN연산자
SELECT * FROM EMPLOYEES;

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID NOT IN ('AD_PRES', 'IT_PROG')
GROUP BY JOB_ID;


-- HAVING
-- GROUP BY 절이 존재 할때만 사용 가능
-- 집계가 완료된 대상을 조건을 통해 필터링

-- HAVING 사용 방법

-- 5. SELECT           조회하고자 하는 "컬럼 명"
-- 1. FROM             데이터를 가져올 "테이블 명"
-- 2. WHERE            원하는 행(데이터)를 선별하기 위한 "조건식"
-- 3. GROUP BY         특정 컬럼을 기준으로 "그룹화"
-- 4. HAVING           집계함수의 "조건식" -> 그룹에 대한 "조건식"
-- 6. ORDER BY         특정 컬럼을 기준으로 "정렬화"

-- 학생별 평균 성적에서 75 이하인 학생들만 조회
SELECT * FROM 성적표;

SELECT 학생ID, ROUND(AVG(성적))
FROM 성적표
GROUP BY 학생ID
HAVING AVG(성적) <= 75;

-- 문제1 수강생 정보 테이블에서 반별 인원수가 3명 이상인 반만 출력
SELECT * FROM 수강생정보;
SELECT 소속반, COUNT(소속반)
FROM 수강생정보
GROUP BY 소속반
HAVING COUNT(소속반) >= 3;

-- 문제2 직원테이블에서 부서별 최고 연봉이 100000이상인 부서만 출력
SELECT * FROM EMPLOYEES;
SELECT DEPARTMENT_ID, MAX(SALARY*12)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MAX(SALARY*12) >= 100000;

-- 문제3 EMPLOYEES
-- 부서가 30,90,100을 제외한 부서별 평균 월급에서 10000 이상인 부서만 조회
SELECT * FROM EMPLOYEES;

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY),1)
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30, 90, 100)
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) >= 10000;

SELECT *
FROM 성적표, 수강생정보;