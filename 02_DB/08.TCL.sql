-- CHAPTER 08. TCL (Transacion Control Language)
-- TCL

-- [ 트랙잭션 4가지 특성 ] - ACID
-- Atomicity   (원자성) : ALL or Noting , 모두 실행되거나 전혀 실행되지 않거나
-- Consistency (일관성) : 언제나 일관성 있는 상태를 유지하는 것
-- Isolation   (고립성) : 트랜잭션을 실행 시 다른 트랜잭션의 영향을 받지 않는 것
-- Durability  (지속석) : 성공적으로 수행된 트랜잭션은 영원히 반영이 되는 것

-- TCL의 명령어 종류
-- COMMIT : DB에 영구적으로 저장, 마지막 COMMIT 시점 이후의 트랜잭션 결과를 저장
-- ROLLBACK : 트랜잭션을 취소, 마지막 COMMIT 시점 까지만 복구가 가능
-- SAVEPOINT : 하나의 트랜잭션을 작게 분할하여 저장하는 기능을 수행하는 명령어, 중간 저장


-- 테이블 복사
CREATE TABLE TEST_EMP AS SELECT * FROM EMPLOYEES;
SELECT * FROM TEST_EMP;

DELETE FROM TEST_EMP;
SELECT * FROM TEST_EMP;

ROLLBACK;
SELECT * FROM TEST_EMP;

COMMIT;
SELECT * FROM TEST_EMP;

DROP TABLE TEST_EMP;