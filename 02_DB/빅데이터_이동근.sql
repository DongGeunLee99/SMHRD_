
--Question 1
--다음 아래의 문제를 읽고 빈 칸을 채우시오.  ( 15점 )
--
--여러 사용자가 공유하여 사용할 수 있도록 통합해서 저장한 운영 데이터의 집합을 데이터 베이스 라고 합니다.
--
--이러한 데이터 베이스를 효율적으로 관리하고 조작하기 위해서 DBMS가 등장하였습니다.
--
--이 DBMS는 데이터 베이스의 데이터 조작과 관리를 극대화한 시스템 소프트웨어입니다.
--
--DBMS 는 오라클, MYSQL, 마리아DB 등 종류가 많지만 데이터 베이스에 접근하고 조작하기 위한 
--
--표준 언어는 전 세계에서 동일하게 사용하고 있습니다.
--
--이러한 표준 언어를 SQL 이라고 합니다. 



--Question 2
--다음 아래의 문제를 읽고 빈 칸을 체우시오. ( 10점 )
--오라클 데이터베이스에서는 논리적인 업무 수행을 위한 단위를 “트랜잭션(Transaction)” 이라 합니다. 
--
--트랜잭션이 모두 완료가 되면 수행 상태를 확정하기 위해 COMMIT 라는 명령어를 작성합니다. 
--
--혹시라도 트랜잭션 도중에 문제가 발생하거나 되돌리고 싶을 때 ROLLBACK 라는 명령어를 작성합니다. 
--
--이 문법은 TCL(Transaction Control Language ) 에 속한 문법입니다.



--Question 3
--다음 아래의 문제를 읽고 답을 서술하시오.  ( 10점 )
--SELECT 쿼리가 실행되는 순서에 알맞게 기술하시오.
--( SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY )

-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY



--Question 4
--다음 아래의 문제를 읽고 답을 서술하시오.  ( 10점 )
--DML, DDL, DCL 에 해당하는 문법을 각각 2가지 이상 기술하시오.

-- DDL -> CREATE, ALTER, RENAME, TRUNCATE, DROP
-- DML -> SELECT, INSERTM UPDATEM DELETE
-- DCL -> GRANT, REVOKE, ROLE




--Question 5
--다음 아래의 문제를 읽고 답을 서술하시오. ( 10점 )
--아래의 SQL구문은 EMPLOYEES 테이블에서 JOB_ID별 평균 연봉이 13000을 초과하는 JOB_ID와 평균연봉을 출력하려고 합니다. 하지만 아래 쿼리는 오류가 발생합니다.
--원인과 올바르게 수정한 조치사항을 각각 기술하시오. [연봉 단위 = '만' ]
--연봉 : SALARY

SELECT JOB_ID , AVG(SALARY) AS 평균연봉
  FROM EMPLOYEES 
 GROUP BY JOB_ID
 HAVING AVG(SALARY) > 13000
 ORDER BY 평균연봉 DESC;
-- 원인 --
--SQL에서의 실행순서에 문제가 있다.
--WHERE절이 GROUP BY절보다 먼저 진행되기 때문에 JOB_ID별 평균 연봉을 계산할 수 없어서 에러가 발생한 것이다.
--이와 같은 경우에는 HAVING절을 사용해서 JOB_ID별 평균 연봉을 계산해야 한다.
------------------------------------------------------------------------


--Question 6
--다음 아래의 문제를 읽고 알맞은 SQL 명령문을 작성하시오. ( 15점 )

-- 문제6-1
--조인을 이용하여 아래 조건에 맞게 쿼리를 작성해주세요. (10점)
--EMPLOYEES 테이블과 DEPARTMENTS 테이블에서 동시에 데이터를 가져오기 위해 조인을 하려고 합니다.
--두 테이블은 모두 DEPARTMENT_ID 컬럼을 가지고 이를 이용해 관계를 가지고 있습니다. 
--우리가 가져오고자 하는 컬럼 정보는 아래와 같습니다.
--
--[ EMPLOYEES    => EMPLOYEE_ID , EMAIL , SALARY    ] 
--[ DEPARTMENTS => DEPARTMENT_NAME , LOCATION_ID ] 
--
--단, 직원의 연봉(SALARY)이 14000원 이상인 대상만 출력하도록 쿼리를 작성해주세요. 
--(출력 순서는 상관 없습니다)

SELECT E.EMPLOYEE_ID, E.EMAIL, E.SALARY, D.DEPARTMENT_NAME, D.LOCATION_ID
  FROM EMPLOYEES E JOIN DEPARTMENTS D
    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
    WHERE SALARY >= 14000;
    
    
--문제6-2
--아래 오라클 방식의 쿼리를 ANSI 방식으로 변경해주세요.  (5점)
--오라클 방식 쿼리
--
--SELECT A.DEPARTMENT_ID 
--     , A.DEPARTMENT_NAME 
--     , A.MANAGER_ID 
--     , B.FIRST_NAME 
--     , B.LAST_NAME 
--  FROM DEPARTMENTS A 
--     , EMPLOYEES B 
-- WHERE A.MANAGER_ID = B.EMPLOYEE_ID(+)
--   AND A.LOCATION_ID = 1700 ;
    
SELECT A.DEPARTMENT_ID 
     , A.DEPARTMENT_NAME 
     , A.MANAGER_ID 
     , B.FIRST_NAME 
     , B.LAST_NAME 
  FROM DEPARTMENTS A 
     LEFT OUTER JOIN EMPLOYEES B 
 ON A.MANAGER_ID = B.EMPLOYEE_ID
   AND A.LOCATION_ID = 1700 ;


--Question 7
--다음 아래의 문제를 읽고 알맞은 SQL 명령문을 작성하시오. ( 10 점 )
--직종(JOB_ID)가 IT_PROG 와 AD_PRES 에 해당하는 직원 중에서
--급여(SALARY)를 8000 이상을 받고 있는 직원들의 정보만 출력하시오.
--출력할 직원들의 정보 (FIRST_NAME, JOB_ID, SALARY)

SELECT FIRST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AD_PRES')
AND SALARY >= 8000;


--Question 8
--다음 아래 ERD와 데이터를 확인하고 답하시오 ( 20점 )
--
--문제8-1
--위의 ERD를 확인하고 EMP 테이블을 생성하는데, 제약조건 지정은  ERD 의 제약조건명의 기준으로 설정하시오.
--
--문제8-2
--위의 ERD를 확인하고 DEPT 테이블을 생성하는데, 제약조건 지정은  ERD 의 제약조건명의 기준으로 설정하시오.
--  (제약조건:  DNAME는  NOT NULL)
CREATE TABLE HR.EMP (
    EMPNO NUMBER(4),
    ENAME VARCHAR2 (10),
    JOB VARCHAR2 (9),
    MGR NUMBER (4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER (7,2),
    DEPTNO NUMBER(2)
);
CREATE TABLE HR.DEPT (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

ALTER TABLE HR.EMP ADD CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO);

ALTER TABLE HR.DEPT ADD CONSTRAINT DEPT_DEPTNO_PK PRIMARY KEY(DEPTNO);

ALTER TABLE HR.EMP ADD CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES HR.DEPT(DEPTNO);

ALTER TABLE HR.DEPT MODIFY DNAME NOT NULL;