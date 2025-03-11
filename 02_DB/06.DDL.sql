-- CHAPTER 06. DDL

-- DDL (Data Definition Language) : 데이터 정의어

-- DDL의 명령어 종류
-- CREATE : 테이블 같은 객체를 생성하는 명령어
-- ALTER : 테이블 같은 객체를 변경하는 명령어
-- REMANE : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP : 테이블 같은 객체를 삭제하는 명령어

-- [ 테이블 생성시 자주 사용하는 자료형 ]

-- VARCHAR2(N) : 가변형 문자형, N크기만큼 입력 받음
-- NUMBER(P,S) : 숫자형 값을 P자리만큼 입력받고 S자리만큼 소수를 입력
-- Ex) NUMBER(3) -> 999, NUMBER(3,2) -> 9.99
-- 소괄호를 생략하면 최대 값인 38크기가 들어간다.
-- DATE : 현재 날짜 값을 입력받음


-- 해당 테이블을 드래그(선택) 후 SHIFT + F4
DESC EMP;
DESC DEPT;


CREATE TABLE DEPT (
    DEPTNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
);

-- EMP테이블 만들기
CREATE TABLE EMP (
    EMPNO NUMBER(4),
    ENAME VARCHAR2 (10),
    JOB VARCHAR2 (9),
    MGR NUMBER (4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER (7,2),
    DEPTNO NUMBER(2)
);

-- 제약조건이란?
-- 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
-- 데이터의 정확성을 유지하기 위한 목적으로 사용됨
-- 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받는다.

-- [ 제약 조건의 종류 ]
-- PRIMARY KEY (PK) : 기본 키, NOT NULL + UNIQUE => NULL값 불가 + 중복 불가
-- UNIQUE KEY (UK) : 고유 키, NULL값 입력 가능 단, 중복 불가
-- NOT NULL : NULL값 불가, 꼭 입력 되어야 하는 데이터일때 설정.
-- CHECK : TURE OR FALSE로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능.
-- FOREIGN KEY (FK) : 외래키, 테이블을 연결하는 키

-- 테이블에 제약조건 지정하기
-- ALTER TABLE [테이블 명] ADD CONSTRAINT [제약조건 이름] [제약조건(컬럼의 정보)];

SELECT * FROM EMP;
SELECT * FROM DEPT;
-- 테이블에 PK 제약조건 지정하기
ALTER TABLE EMP ADD CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO);

-- DEPT 테이블에 PK 제약조건 지정하기
ALTER TABLE DEPT ADD CONSTRAINT DEPT_DEPTNO_PK PRIMARY KEY(DEPTNO);

-- 테이블에 UK 제약조건 지정하기
ALTER TABLE EMP ADD CONSTRAINT JOB_UK UNIQUE(JOB);

-- 테이블에 CHECK 제약조건 지정하기
ALTER TABLE EMP ADD CONSTRAINT CHECK_SAL CHECK(SAL BETWEEN 1000 AND 90000);

-- 테이블에 FK 제약조건 지정하기
-- ALTER TABLE [테이블 명] ADD CONSTRAINT [제약조건 이름] [제약조건(해당 컬럼)]
-- REFERENCES [참조 테이블(해당 컬럼)];

-- EMP 테이블에 FK 제약조건 설정하기
ALTER TABLE EMP ADD CONSTRAINT DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO);

-- 제약조건 변경
-- ALTER TABLE [테이블 명] MODIFY [컬럼 명] [바꿀 제약조건];
ALTER TABLE EMP MODIFY ENAME NOT NULL;


ALTER TABLE EMP ADD CONSTRAINT ENAME NOT NULL;
SELECT * FROM DEPT;
SELECT * FROM EMP;
DELETE EMP;
ALTER TABLE EMP ADD CONSTRAINT EMP_EMPNO_PK PRIMARY KEY(EMPNO);
ALTER TABLE EMP ADD CONSTRAINT DEPTNO_FK FOREIGN KEY(DEPTNO)
REFERENCES DEPT(DEPTNO);

-- 제약조건 삭제
-- ALTER TABLE [테이블 명] DROP CONSTRAINT [제약조건 이름];
ALTER TABLE EMP DROP CONSTRAINT JOB_UK;

SELECT * FROM DETP;
ALTER TABLE DETP DROP CONSTRAINT EMP_DEPTNO_FK;


-- 테이블에 컬럼 추가하기
SELECT * FROM EMP;
-- ALTER TABLE[테이블 명] ADD [컬럼 명] [자료형(크기)];
ALTER TABLE EMP ADD PHONE_NUMBER VARCHAR2(10);

-- 컬럼 이름 변경하기
-- ALTER TABLE [테이블 명] RENAME COLUMN [기존 컬럼명] TO [바꿀 컬럼명];
ALTER TABLE EMP RENAME COLUMN PHONE_NUMBER TO TEL;

-- 컬럼의 자료형 변경하기
-- ALTER TABLE [테이블 명] MODIFY [컬럼 명] [바꿀 제약조건(길이)];
ALTER TABLE EMP MODIFY TEL VARCHAR2(20);

SELECT * FROM EMP;
-- 컬럼 삭제하기
-- ALTER TABLE [테이블 명] DROP COLUMN [컬럼 명];
ALTER TABLE EMP DROP COLUMN TEL; 

-- 테이블 이름 변경
-- REMANE [기존 테이블 명] TO [바꿀 테이블 명];
RENAME EMP TO TB_EMP;
SELECT * FROM TB_EMP;

RENAME DEPT TO TB_DEPT;
SELECT * FROM TB_DEPT;

-- 테이블을 복사하는 쿼리문
-- CREATE TABLE [테이블 명] AS [정보를 가져올 쿼리문]
---> 내용만 복사된다.  제약조건은 복사가 되지 않는다.
CREATE TABLE DUAL_EMP AS SELECT * FROM EMPLOYEES;
SELECT * FROM DUAL_EMP;

-- 테이블의 데이터 삭제
DELETE FROM DUAL_EMP;

-- 되돌리기
ROLLBACK;

-- TRUNCATE : 데이터를 영구 삭제
TRUNCATE TABLE DUAL_EMP;

-- DROP TABLE : 테이블 삭제
DROP TABLE TB_DEPT CASCADE CONSTRAINT;

-- 테이블 삭제시 FK/PK때문에 삭제가 안될 경우 해결 방법
-- 1. 참조 되어있는 테이블의 FK를 먼저 삭제 후 해당 테이블 삭제
-- 2. 삭제할때 테이블의 제약조건도 강제로 삭제
---> CASCADE CONSTRAINT (옵션)
