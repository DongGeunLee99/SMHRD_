-- CHAPTER 01. SELECT
-- 주석 기호
-- 글씨 크기 : 도구>환경설정>코드편집기>글꼴
-- 주석 색 바꾸기 : 도구>환경설정>코드편집기>PL/SQL주석
-- 시작 단축키 : ctrl + enter
DESC EMPLOYEES ;

SELECT FIRST_NAME
     , SALARY
  FROM EMPLOYEES ;

-- [ SELECT 기본 사용 방법 ]
-- SELECT 조회하고자 하는 "컬럼 이름"
-- FROM 데이터를 가져올 "테이블 이름"

/*
1. SQL문장에는 대소문자를 구분하지 않는다 ( 대문자 권장 )
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL문장 끝에는 반드시 세미클론(;)을 찍어줘야 한다.
4. SQL 실행 단축키 : F9, CTRL + ENTER
*/

DESC DEPARTMENTS;

SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME
     , MANAGER_ID
     , LOCATION_ID
  FROM DEPARTMENTS;

-- *(아스타리스크) : 전체조회.
SELECT *
  FROM DEPARTMENTS;
  
-- 직원테이블의 모든 정보 조회
SELECT *
  FROM EMPLOYEES;
  
--직원테이블에서 직원의 FIRST_NAME, 직원ID 급여, 이메일, 전화번호 컬럼의 정보를 순서대로 출력
SELECT FIRST_NAME
     , EMPLOYEE_ID
     , SALARY
     , EMAIL
     , PHONE_NUMBER
  FROM EMPLOYEES;

-- 부서 테이블에서 부서명, 부서아이디, 컬럼을 조회
SELECT DEPARTMENT_NAME
     , DEPARTMENT_ID
  FROM DEPARTMENTS;
  
-- 직원테이블에서 직원의 JOB_ID 컬럼 조회
SELECT DISTINCT JOB_ID
  FROM EMPLOYEES;

-- DISTINCT : 중복을 제거
-- SELECT[ALL/DISTINCT] 조회하고자 하는 컬럼 이름 (ALL이 기본)

-- 직원테이블의 부서ID를 중복을 제거하여 출력
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES;
-- 직원테이블에서 HIRE_DATE(입사날짜)의 중복을 제거하여 출력
SELECT DISTINCT HIRE_DATE
  FROM EMPLOYEES;

--직원테이블에 있는 직원의 이름과 직원의 급여의 정보 + 연봉을 출력
SELECT FIRST_NAME
     , SALARY
     , SALARY * 12
  FROM EMPLOYEES;

-- 컬럼의 TYPE(자료형)이 숫자형, 날짜형이면 산술 연산이 가능하다 (+,-,*,/)
DESC EMPLOYEES;

-- 직원테이블에서 직원아이디, 이름, 입사날짜, 입사날짜다음날을 출력
SELECT * FROM EMPLOYEES;
-- 직원테이블의 데이터를 확인하여 어떤 정보를 원하는지 확인
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , HIRE_DATE
     , HIRE_DATE + 1
  FROM EMPLOYEES;

-- 컬럼에 별칭 사용하기
--1. SELECT 컬럼 AS 별칭
--2. SELECT 컬럼 AS "별칭" (대소문자, 널문자 구분가능)
--3. SELECT 컬럼 별칭
--4. SELECT 컬럼 "별칭" (대소문자, 널문자 구분가능)
SELECT FIRST_NAME
     , SALARY
     , SALARY * 12 AS "AnnSal"
     , SALARY * 12 "연 봉"
     , SALARY * 12 AS ANNSAL
  FROM EMPLOYEES;

-- 직원테이블에서 직원의 이름과 급여, 핸드폰번호, 입사일, 입사일다음날 출력
-- 입사일 다음날은 "입사일 다음날"이라고 별칭을 사용
SELECT FIRST_NAME
     , SALARY
     , PHONE_NUMBER
     , HIRE_DATE
     , HIRE_DATE + 1 AS "입사일 다음날"
  FROM EMPLOYEES;

-- ORDER BY절
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할때 사용한다.
-- SQL 실행 순서에 가장 마지막에 실행된다.
-- 병도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용이 된다.
-- ASC (Ascending) 오름차순 (기본값)
-- DESC (Descending) 내림차순 정렬

SELECT *
  FROM EMPLOYEES
ORDER BY SALARY DESC;

--최근에 입사한 날짜를 기준으로 직원의 이름과 입사날짜 정보를 출력
SELECT FIRST_NAME
     , HIRE_DATE
  FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;

-- 직원테이블에서 직원ID, 부서ID, 이름, 급여 출력
-- 부서ID는 오름차순으로 급여는 내림 차순으로 정렬
-- 같은 부서에 근무하고 있는 직원들 중에서 급여를 가장 높게 받고 있는 순서대로 데이터 분석
SELECT EMPLOYEE_ID
     , DEPARTMENT_ID
     , FIRST_NAME
     , SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;

-- [ NULL값이란? ]
-- NULL이란 데이터의 값이 완전히 비어있는 상태
-- 값이 존재하지 않거나 정해지지 않을 것을 의미
-- 숫자 0과 빈 문자열(' ')은 NULL값이 아니다
-- NULL과 연산하면 결과 값은 무조건 NULL값이 나온다
-- EX) 100 + NULL = NULL

-- 직원의ID, 이름, 급여, 보너스(COMMISSION_PCT), 보너스 * 2 의 정보를 출력
SELECT EMPLOYEE_ID
     , FIRST_NAME
     , SALARY
     , COMMISSION_PCT
     , COMMISSION_PCT * 2
  FROM EMPLOYEES;
  
-- 왜 결과가 이렇게 나오는지 설명
-- NULL값에는 연산을 하더라도 NULL이 나오기 때문에
-- 숫자가 있는 경우에서 *2연산이 된다