-- CHAPTER 07 DML (Data Manipuation Language)

-- DML 이란
-- 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제할때 사용하는 질의어이다.
-- 테이블에서 원하는 데이터를 입력, 수정, 삭제 한다.

-- DML 유형
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- INSERT 사용 방법
-- INSERT INTO [테이블 명] (컬럼 리스트...)
-- VALUES (값..)
--> INSERT INTO에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형이 맞아야 한다.

RENAME TB_EMP TO EMP;

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT * FROM EMP WHERE EMPNO = 7369;

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '81/02/20', 1600, 300, 30);

-- EMPNO가 7521인 직원의 모든 정보를 HR계정의 EMP 테이블에 추가하기
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7521, 'WARD', 'SALESMAN', 7698, '81/02/22', 1250, 500, 30);

INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7566, 'JONES', 'MANAGER', 7839, '81/04/02', 2975, NULL, 20);

ALTER TABLE EMP DROP CONSTRAINT CHECK_SAL;
INSERT INTO EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES (7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, '', 20);
-- NULL을 입력하거나 ''로 입력


-- UPDATE : 테이블의 데이터를 변경하고 싶을 때 사용
-- UPDAE [테이블 명]
-- SET 변경할 컬럼 = 데이터
-- WHERE 데이터를 변경할 대상 행을 선별하기 위한 조건;
-- WHERE를 생략하면 컬럼에 모든 데이터가 바뀜
-- WHERE에 조건은 PK를 사용하는게 가장 안전 = 의도치 않은 데이터도 바뀔 수 있기 때문

UPDATE EMP
SET SAL = 1000
WHERE ENAME = 'SMITH';

-- DELETE : 데이터를 삭제할때 사용하는 명령어
-- DELETE FROM [테이블 명]
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식;

SELECT * FROM EMP;

DELETE FROM EMP
WHERE EMPNO = 7566;


-- EMPNO가 7499인 직원의 보너스를 400으로 변경
UPDATE EMP
SET COMM = 400
WHERE EMPNO = 7499;
-- EMPNO가 7521인 직원의 급여를 1500으로 인상하고, 보너스는 600으로 인상
UPDATE EMP
SET SAL = 1500 ,COMM = 600
WHERE EMPNO = 7521;
-- EMPNO가 7369인 직원의 보너스를 200으로 책정
UPDATE EMP
SET COMM = 200
WHERE EMPNO = 7369;
-- EMPNO가 7499인 직원은 삭제
DELETE EMP;
WHERE EMPNO = 7499;
SELECT * FROM EMP;
COMMIT;
ROLLBACK;