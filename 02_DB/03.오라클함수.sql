-- CHAPTER 03. 오라클 함수

-- 함수 (FUNCTION)
-- 입력 값(INPUT)넣어 특정한 기능(프로그램)을 통해 결과 값(OUTPUT)출력
-- 사용자 정의 함수 : 사용자가 필요에 의해 직접 정의한 함수

-- 내장 함수 : 오라클에서 미리 만들어 놓은 함수, 필요할때 마다 호출해서 사용
-- 문자형, 숫자형, 날짜형, 변환형, NULL처리 함수, 조건 함수

-- 함수이름()
-- 함수를 실행할때 사용하는 입력 값 : 인자값, 매개변수

-- 문자형 함수
-- UPPER(), LOWER() : 문자 데이터를 대,소문자로 변환하여 출력

-- DUAL 테이블 : 테스트용 테이블
-- 결과 값 확인 용도로 사용하는 오라클 최고 관리자 테이블이다.
SELECT 'abcde123@@'
     , UPPER('abcde123@@')
  FROM DUAL;

-- 직원의 FIRST_NAME을 대문자로 출력, EMAIL을 소문자로 출력
SELECT FIRST_NAME
     , EMAIL
     , UPPER(FIRST_NAME)
     , LOWER(EMAIL)
FROM EMPLOYEES;

-- LENGTH() : 문자 데이터의 길이를 구하는 함수
SELECT 'HELLOW WORLD'
     , LENGTH('HELLOW WORLD')
FROM DUAL;

-- 직원의 FIRST_NAME의 길이가 5 이상의 직원들의 이름을 출력
SELECT FIRST_NAME
     , LENGTH(FIRST_NAME)
  FROM EMPLOYEES
 WHERE LENGTH(FIRST_NAME) >= 5;
 
-- SUBSTR() : 문자열을 추출하는 함수
-- SUBSTR(입력값, 시작위치, 추출길이)
-- 문자열 데이터의 시작 위치부터 추출 길이만큼 출력
SELECT '빅데이터분석 서비스개발자과정'
     , SUBSTR('빅데이터분석 서비스개발자과정', 8, 5)
FROM DUAL;

-- 입사일에서 연도, 월, 일 별로 출력
-- 각 컬럼에는 연도, 월, 일 별로 별칭을 사용해서 출력
SELECT * FROM EMPLOYEES;

SELECT FIRST_NAME
     , HIRE_DATE
     , SUBSTR(HIRE_DATE, 1, 2) AS "연도"
     , SUBSTR(HIRE_DATE, 4, 2) AS "월"
     , SUBSTR(HIRE_DATE, -2) AS "일"
FROM EMPLOYEES;

-- REPLACE() 특정 문자를 다른 문자로 바꾸어 주는 함수
-- REPLACE(문자열 데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 바꿔야 할 문자를 생략시 바꾸고 싶은 문자는 문자열 데이터에서 삭제
SELECT '빅데이터!분석'
    , REPLACE('빅데이터!분석', '!', ' ') AS " "
    , REPLACE('빅데이터!분석', '!') AS " "
    FROM DUAL;
    
-- HIRE_DATE에서 /를 -로 바꾸기
SELECT HIRE_DATE
     , REPLACE(HIRE_DATE, '/', '-')
     , REPLACE(HIRE_DATE, '/')
FROM EMPLOYEES;

-- 숫자형 함수
-- ROUND() 특정 위치에서 반올림 하는 함수
-- ROUND(반올림 할 숫자, 반올림 위치)
-- 반올림 위치 생략시 소수점 첫째 자리에서 반올림
SELECT 1234.15156
     , ROUND(1234.15156, 2)
     , ROUND(1234.15156)
FROM DUAL;

-- MOD() : 숫자를 나눈 나머지 값을 구하는 함수
-- 홀수, 짝수를 구분할때 유용하게 사용
-- MOD(나눈셈 될 숫자, 나눌 숫자)

SELECT MOD(10, 2) AS "0"
     , MOD(10, 3) AS "1"
     , MOD(15, 6) AS "3"
FROM DUAL;

-- 날짜형 함수
-- SYSDATE : 현재 날짜와 시간을 출력하는 함수
-- 입력시 바로 출력, 현재 시간을 초 단위까지 출력할 수 있다
-- 연산 가능
-- 날짜 데이터끼리는 연산 불가

-- 날짜형식 세팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY-MM-DD HH24:MI:SS

SELECT SYSDATE
FROM DUAL;

SELECT SYSDATE AS "현재날짜"
     , SYSDATE - 1 AS "어제의 날짜"
--     , SYSDATE - SYSDATE 날짜 데이터끼리는 연산 불가
FROM DUAL;

-- 날짜형 데이터 활용 (실무)
SELECT SYSDATE AS 현재
     , SYSDATE +1 AS "하루 더함"
     , SYSDATE + 1/24 AS "한시간 더함"
     , SYSDATE + 1/24/60 AS "일분 더함"
     , SYSDATE + 1/24/60/60 AS "일초 더함"
  FROM DUAL;
  
SELECT SYSDATE FROM DUAL;

-- ADD_MONTHS() : 몇개월 이후 날짜를 구하는 함수
-- ADD_MONTHS(날짜데이터, 연산할 개월수)

SELECT ADD_MONTHS(SYSDATE, 6)
FROM DUAL;


-- 형변환 형태의 종류
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
-- 문자가 들어가면 암시적 형변환이 되지 않음
SELECT '1000' + 2000
  FROM DUAL;

-- 명시적 형변환 : 데이터 변환 형 함수를 사용해서 사용자가 직접 자료형을 지정해주는 것

-- 변환형 함수

-- TO_CHAR() : 날짜 숫자 데이터를 문자 데이터로 변환 해주는 함수
-- TO_CHAR(변환할 데이터, 출력 형태)
SELECT SALARY
      ,TO_CHAR(SALARY, 'L999,999')
  FROM EMPLOYEES;

-- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
-- TO_NUMBER(문자열 데이터, 인식 될 숫자 형태)
SELECT TO_NUMBER('1,000', '999999') + 2000
FROM DUAL;

-- TO_DATE() : 문자 데이터를 날짜 데이터로 변환하는 함수
-- TO_DATE(문자열 데이터, 인식 될 날짜 형태)
SELECT TO_DATE('250108', 'YY/MM/DD')
FROM DUAL;

-- NULL 처리 함수
-- NVL / NVL2

-- NVL(NULL인지 여부를 검사할 데이터, NULL일 경우 반환할 데이터)
-- NVL2(NULL인지 여부를 검사할 데이터, NULL이 아닐 경우 반환할 데이터, NULL일 경우 반환할 데이터)
SELECT FIRST_NAME, COMMISSION_PCT
     , NVL(COMMISSION_PCT, 0)
     , NVL2(COMMISSION_PCT, 1, 0)
  FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
    , NVL2(MANAGER_ID, '직원', '사장')
FROM EMPLOYEES;

-- 조건 함수
-- DECODE() : 상황에 따라서 다른 데이터를 반환하는 함수
-- 검사 대상과 비교해서 지정한 값을 반환
-- DECODE(검사대상이 될 컬럼or데이터<기준><1>, 비교 값<2>, 일치 시 반환될 값<3>, 일치하지 않을때 반환 값<마지막>)

-- 직원테이블에서 직원ID, 이름, 매니저ID 출력
-- 매니저가 있는 직원은 '직원'으로 출력
-- 매니저가 없는 직원은 '사장'으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID
     , DECODE(MANAGER_ID, NULL, '사장', '직원')
FROM EMPLOYEES;

-- DECODE함수를 이용해서 직원ID가 100인 사람은 사장, 101인 사람은 전무이사
-- 102인 사람은 상무이사, 103인 사람은 팀장으로 출력하시오

SELECT EMPLOYEE_ID, FIRST_NAME
     , DECODE(EMPLOYEE_ID, 100, '사장'
     , 101, '전무이사', 102, '상무이사', 103, '팀장', '직원')
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID;