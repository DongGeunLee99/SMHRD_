-- CHAPTER 05. JOIN 

-- JOIN 이란?
-- 여러 테이블에서 필요한 데이터만 한번에 가져오는 기술

-- 비등가조인 (Non EQUI JOIN) 
--> 두 개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인을 의미 ( >, >=, <, <=, BETWEEN)

-- 등가조인 (EQUI JOIN)
--> 두 개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자를 사용해서 조인을 의미 ( = )
--> 가장 많이 사용하는 조인의 형태

SELECT *
  FROM 수강생정보, 성적표; -- JOIN 을 하겠다

-- 테이블에서 가져와야 할 모든 경우의 수를 출력 해주는 카티션 곱이라는 현상이 발생한다.
-- CROSS JOIN 이라고 한다.
-- 수강생정보 테이블 행의 갯수(9) * 성적표테이블의 행의 갯수 (18) => 

SELECT * FROM 성적표;
SELECT * FROM 수강생정보;

-- [ 등가조인의 사용방법 ]

-- SELECT   테이블1.컬러 명, 테이블2.컬럼명  -> 해당 테이블의 컬럼명을 조회하겠다.
-- FROM     테이블1, 테이블2               -> 테이블1과 테이블2를 합쳐서 가져오겠다.   
-- WHERE    테이블1.컬럼명 = 테이블2.컬럼명  -> 해당 조건으로 조인하겠다 (조인 조건)

-- 수강생 정보 테이블과 성적표 테이블에서 학생ID, 이름, 과목, 성적 

-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. FROM 절에 조인할 테이블을 ,(컴마) 기준으로 작성
-- 3. 조인 조건이 되는 "특정 컬럼" 을 확인하여, WHERE 조건절에 조인 조건을 작성
-- 조인 조건이 되는 특정 컬럼 => 조인할 테이블 간의 같은 결과 값을 가지는 컬럼이다.
-- 조인시 조인 조건이 되는 특정 컬럼은 PK와 FK 관계로 형성되는것이 대부분이다. 단 다 그런것은 아니다.!
-- 4. SELECT 절에 출력하고자 하는 컬럼을 .(경로) 와 함께 작성

SELECT 수강생정보.학생ID, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  FROM 수강생정보, 성적표
 WHERE 수강생정보.학생ID = 성적표.학생ID ;

-- 데이터를 가져올 테이블 정보 : EMPLOYEES, DEPARTMENTS
-- 직원ID, 이름, 급여, 부서ID, 부서이름 순으로 출력 
-- 테이블에 별칭을 사용한다.

SELECT 직원.EMPLOYEE_ID, 직원.FIRST_NAME,
       직원.SALARY, 직원.DEPARTMENT_ID, 부서.DEPARTMENT_NAME
  FROM EMPLOYEES 직원, DEPARTMENTS 부서
 WHERE 직원.DEPARTMENT_ID = 부서.DEPARTMENT_ID
ORDER BY 직원.EMPLOYEE_ID;

-- 데이터를 가져올 테이블 정보 : EMPLOYEES, JOBS
-- 직원의 이름과, 급여와 JOB_ID, JOB_TITLE 정보를 조회
SELECT E.FIRST_NAME
     , E.SALARY
     , J.JOB_ID
     , J.JOB_TITLE
  FROM EMPLOYEES E
     , JOBS J
 WHERE E.JOB_ID = J.JOB_ID
ORDER BY E.EMPLOYEE_ID;

-- 데이터를 가져올 테이블 정보 : EMPLOYEES, DEPARTMENTS
-- 직원ID가 100인 직원의 이름, 이메일, 부서ID, 부서명 조회
SELECT E.FIRST_NAME
     , E.EMAIL
     , E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME 
  FROM EMPLOYEES E
     , DEPARTMENTS D
 WHERE E.EMPLOYEE_ID = 100
   AND D.DEPARTMENT_ID = E.DEPARTMENT_ID;
   
-- INNER JOIN == EQUI
-- ANSI 조인 문법 : 미국 표준협회에서 만든 모든 DBMS에서 사용 가능한 문법이다.
-- INNER JOIN, CROSS JOIN, OUTER JOIN
-- INNER JOIN : 내부조인이라고 하며, 조인 조건에서 동일한 값이 있는 행만 반환

-- [ INNER JOIN ]
-- 3. SELECR   테이블1.컬럼명, 테이블2.컬럼명
-- 1. FROM     테이블1 INNER JOIN 테이블2
--    ON       테이블1.컬럼 = 테이블2.컬럼
-- 2. WHERE    원하는 행을 선별하기 위한 "조건식"


-- 데이터를 가져올 테이블 정보 : EMPLOYEES, DEPARTMENTS
-- 직원ID가 100인 직원의 이름, 이메일, 부서ID, 부서명 조회
SELECT E.FIRST_NAME
     , E.EMAIL
     , E.DEPARTMENT_ID
     , D.DEPARTMENT_NAME
  FROM EMPLOYEES E INNER JOIN DEPARTMENTS D -- INNER 생략가능
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 WHERE E.EMPLOYEE_ID = 100;

-- 조인 조건이 되는 특정 컬럼 : 같은 값(같은 의미를 가르키는 값?)을 가지는 컬럼
-- PK와 FK 관계로 대부분 조인 조건을 걸지만, 전부 그런것은 아니다.

-- 데이터를 가져올 테이블 정보 : DEPARTMENTS, EMPLOYEES
-- 부서명, 매니저ID, 메니저ID에 해당하는 직원이름->부서장의 이름
SELECT D.DEPARTMENT_NAME, D.MANAGER_ID, E.FIRST_NAME
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY MANAGER_ID;

-- 데이터를 가져올 테이블 정보 : DEPARTMENTS, LOCATIONS
-- 부서명, 위치ID, 위치ID에 대한 STREET_ADDERSS
SELECT * FROM LOCATIONS;
SELECT D.DEPARTMENT_NAME, D.LOCATION_ID, L.STREET_ADDRESS
  FROM DEPARTMENTS D JOIN LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID;

-- CROSS JOIN : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는경우 생길 수 있는 카티션 곱이라는 현상이 발생한다.
-- 카티션 곱 : 모든 경우의 수가 나오는 경우
SELECT *
FROM 수강생정보 CROSS JOIN 성적표;

-- OUTER JOIN : 외부 조인이라고 하며, 두 개의 테이블 간의 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을때 사용하는 조인 문법

-- LEFT OUTER JOIN : 왼쪽 테이블을 기준으로 NULL값도 포함시켜 출력
--> 오라클 조인 문법시 : 조인 조건절에 반대인 오른쪽 컬럼에 (+)작성
-- RIGHT OUTER JOIN : 오른쪽 테이블을 기준으로 NULL값도 포함시켜 출력
--> 오라클 조인 문법시 : 조인 조건절에 반대인 왼쪽 컬럼에 (+)작성
-- FULL OUTER JOIN : 양쪽의 NULL값도 포함시켜 출력
--> 오라클 조인 문법에선 지원 안함.

-- [ OUTER JOIN 사용 방법 ]
-- SELECT       테이블1.컬럼명, 테이블2.컬럼명
--   FROM       테이블1 (LEFT/RIGHT/FULL) OUTER JOIN 테이블2
--     ON       테이블1.컬럼 = 테이블2.컬럼

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
     , D.MANAGER_ID , E.FIRST_NAME
  FROM EMPLOYEES E LEFT OUTER JOIN DEPARTMENTS D -- 왼쪽 전부
    ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
     , D.MANAGER_ID , E.FIRST_NAME
  FROM EMPLOYEES E RIGHT OUTER JOIN DEPARTMENTS D -- 오른쪽 전부
    ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
     , D.MANAGER_ID , E.FIRST_NAME
  FROM EMPLOYEES E FULL OUTER JOIN DEPARTMENTS D -- 양쪽 전부
    ON D.MANAGER_ID = E.EMPLOYEE_ID
ORDER BY D.DEPARTMENT_ID;

-- 오라클 문법으로 적용 (+)를 WHERE절에 반대로
-- 오라클 문법에서는 FULL OUTER JOIN이 지원안함
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME
     , D.MANAGER_ID , E.FIRST_NAME
  FROM EMPLOYEES E ,DEPARTMENTS D
 WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)-- LEFT
ORDER BY D.DEPARTMENT_ID;

SELECT *
FROM EMPLOYEES E JOIN JOBS J 
ON E.JOB_ID = J.JOB_ID JOIN JOB_HISTORY J_H
ON E.EMPLOYEE_ID = J_H.EMPLOYEE_ID;
