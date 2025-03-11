-- CHAPTER 02. WHERE 절

-- WHERE 기본 사용방법
-- 3 SELECT   조회할 "컬럼 명"
-- 1 FROM     데이터를 가져올 "테이블 명"
-- 2 WHERE    원하는 행(데이터)를 선별(필터링) 하기 위한 "조건식"

-- [ 산술연산자 ] (+,-,*,/)
-- 직원의 이름과 급여와 연봉을 조회
SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES;
  
-- [ 비교연산자 ]
-- = : 같다
-- > : 보다 크다 (초과)
-- >= : 보다 크거나 같다 (이상)
-- < : 보다 작다 (미만)
-- <= : 보다 작거나 같다 (이하)

-- 실습1) 직원테이블에서 직원ID가 105인 직원의 이름과 급여 정보를 조회.
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 105;
-- 실습2) 매니저ID가 100인 부서이름과 부서ID를 조회하는 쿼리문 작성
SELECT DEPARTMENT_NAME, DEPARTMENT_ID
  FROM DEPARTMENTS
 WHERE MANAGER_ID = 100;
-- 실습3) 급여를 9000을 받는 직원의 직원ID, 이름, 핸드폰번호, 이메일정보를 조회하는 쿼리문 작성
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, EMAIL, SALARY
  FROM EMPLOYEES
 WHERE SALARY = 9000;
-- 실습4) 급여가 5000이하인 직원의 이름과 급여 정보 조회
SELECT FIRST_NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY <= 5000;
-- 실습5) 연봉이 120000 이상인 직원의 이름과 급여 정보 조회
SELECT FIRST_NAME, SALARY, SALARY*12 AS "AnnSal"
  FROM EMPLOYEES
 WHERE (SALARY*12) >= 120000;

-- 리터럴(literal)이란?
-- 소스 코드에서 특정한 자료형의 값을 직접 표현하는 방식
-- 소스 코드의 고정된 값을 나타내는 표기법
SELECT FIRST_NAME --컬럼
      ,1000 -- 숫자형 리터럴
      ,'FIRST' -- 문자형 리터럴 (""=컬럼)
  FROM EMPLOYEES;


-- [ 부정 비교 연산자 ]
-- !=, <>, ^= : 같지 않다.
-- NOT A = B : 같지 않다. 논리 비교 연산자

-- 직원의 이름과 직업 정보를 조회
-- IT_PROG가 아닌 직원들의 정보만 조회
SELECT FIRST_NAME, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID != 'IT_PROG';
 
-- 급여가 9000이 아닌 직원의 이름과 급여를 조회하시오
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY != 9000;

-- 대표이사가 상사가 아닌 직원의 수는 총 몇명인가
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, MANAGER_ID
FROM EMPLOYEES
WHERE MANAGER_ID != 100;

-- [ 논리 연산자 ]
-- AND : 조건을 모두 만족하면 True값을 반환
-- OR : 하나의 조건이라도 만족하는 경우 True값 반환
-- 논리연산자의 우선 순위 AND > OR

-- 부서가 90이고 급여가 5000이상 받고 있는 직원의 정보를 조회하시오
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90 AND SALARY >= 5000;

-- 실습) 부서가 100이거나 입사일이 06년02월02일 이후에 입사한 직원의 이름과 입사날짜
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, HIRE_DATE, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR HIRE_DATE > '06/02/02';

-- 연산자의 우선순위를 생각
-- AND > OR

-- 직원의 이름과 부서아이디 그리고 급여의 정보를 알고 싶다
-- 조건은 부서가 50이거나 90에 소속된 직원 중에서
-- 급여는 7000 이상을 받아야 한다
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID = 50 OR DEPARTMENT_ID = 90)
   AND SALARY >= 7000;
   
-- 부서가 100이거나 90인 직원중에서도 직원ID가 100인 직원의 정보
-- 이름, 직원ID, 부서ID, 급여, 연봉(AnnSal)로 출력
SELECT * FROM EMPLOYEES;
SELECT FIRST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY, SALARY*12 AS "AnnSal"
FROM EMPLOYEES
WHERE (DEPARTMENT_ID = 100 OR DEPARTMENT_ID = 90) AND EMPLOYEE_ID = 100;


-- SQL연산자 : SQL에서만 사용할 수 있는 연산자
-- NULL연산자, IN연산자, BETWEEN연산자, LIKE

-- NULL 연산자
-- IS NULL : 데이터 값이 NULL인 값을 조회 (IS NOT NULL 가능)

-- 부서가 정해지지 않은 직원의 이름
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;
 
-- 부서가 30이거나 50이거나 90인 직원의 이름, 부서ID
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 30
    OR DEPARTMENT_ID = 50 
    OR DEPARTMENT_ID = 90
ORDER BY DEPARTMENT_ID;

-- IN 연산자를 활용
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (30,50,90)
ORDER BY DEPARTMENT_ID;


-- IN 연산자
-- '=' + 'OR'의 결과값
-- 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용하는 연산자.
-- NULL값을 제외하는 특성을 가지고 있다.
SELECT * FROM EMPLOYEES;

-- 직업이 It_PROG, ST_MAN 인 직원의 이름, 급여, JOB_ID의 정보를 조회
SELECT FIRST_NAME, SALARY, JOB_ID
  FROM EMPLOYEES
 WHERE JOB_ID IN ('IT_PROG', 'ST_MAN');

-- 이메일 정보가 DLEE, KGEE, SANDE 인 직원의 이름과 전화번호 정보 조회
SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
  FROM EMPLOYEES
 WHERE EMAIL IN ('DLEE', 'KGEE', 'SANDE');

SELECT FIRST_NAME, PHONE_NUMBER, EMAIL
FROM EMPLOYEES
WHERE EMAIL = 'DLEE'
OR EMAIL = 'KGEE'
OR EMAIL = 'SANDE';

-- NOT IN : IN 뒤에 조건에 해당하지 않는 데이터를 출력.
-- '!=' + 'AND'의 결과값
-- NOT IN 에서는 NULL값을 넣으면 출력X -> AND연산이기 때문
-- 직원의 부서가 30,50,90에 해당하지 않은 직원의 이름과 부서정보
SELECT FIRST_NAME, DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID != 30
   AND DEPARTMENT_ID != 50
   AND DEPARTMENT_ID != 90
ORDER BY DEPARTMENT_ID;

-- NOT IN
SELECT FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30,50,90)
ORDER BY DEPARTMENT_ID;

-- BETWEEN A AND B 연산자 (범위 연산자)
-- BETWEEN 최소값 AND 최대값
-- A '이상' B '이하'의 범위 안에 있는 데이터를 조회하는 연산자이다.
-- 이상 >= 이하 <= 중요
-- 급여가 10000이상 20000이하의 범위 내에서 받고있는 직원의 이름과 급여 조회
SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 10000
AND SALARY <= 20000;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 10000 AND 20000;

-- 2005년에 입사한 직원은 총 몇명인가 -> 29
SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '05/01/01' AND '05/12/31';

-- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할 때 사용
-- 문자열을 찾는 연산
-- %, _ 라는 와일드 카드를 이용해서 매칭 연산을 진행하는 연산자다.
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 어떤 값이든 상관없이 한개의 문자 데이터를 의미

SELECT * FROM EMPLOYEES;

--문제1) 직원테이블에서 650으로 시작하는 핸드폰 번호 찾기
SELECT PHONE_NUMBER
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '650%';
--문제2) 직원테이블에서 이름이 S로 시작하고 n으로 끝나는 찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%n';
--문제3) 직원테이블에서 이름이 it으로 끝나고 총 4글자인 직원찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__it';
--문제4) 직원테이블에서 이름이 두번째 글자가 e인 직원찾기
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_e%';
--문제5) 직원테이블에서 01월에 입사한 직원찾기
SELECT HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '___01%';
