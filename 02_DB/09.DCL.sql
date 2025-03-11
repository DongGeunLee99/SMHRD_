-- CHAPTER 09 DCL (Data Control Language)

-- 사용자란?
-- 데이터베이스에 접속을 해서 데이터를 관리하는 "계정"으 사용자(USER)라고 한다.

-- 사용자 생성 (DDL)
-- CREATE USER 사용자 이름
-- IDENTIFIED BY 비밀번호 설정

-- DCL의 명령어 종류
-- GRANT : 권한 부여 명령어
-- REVOKE : 권한 회수 명령어
-- ROLE : 권한을 묶어서 부여할때 사용하는 명령어

-- 시스템 권한 부여 방법
-- GRANT   [시스템 권한]
-- TO      [사용자]
-- GRANT CREATE SESSION TO USER_DCL;


-- 시스템 권한 취소
-- REVOKE  [시스템 권한]
-- FROM    [사용자]


-- ROLE이란?
-- 여러 권한을 한 번에 부여하기 위해 사용한다.
-- 비슷한 종류의 권한끼리 모아 놓은 ROLE이라는 개념으로 한 번에 권한을 묶어서 부여한다.

-- ROLE의 종류
-- CONNECT : 데이터베이스에 접속에 필요한 권한
-- RESOURCE : 테이블, 시퀀스 등 객체 생성 권한
-- DBA : 데이터베이스를 관리하는 대부분의 시스템 권한

-- GRANT CONNECT, RESOURCE TO 사용자 ;


CREATE TABLE EMP (
    ENAME NUMBER(4)
);












