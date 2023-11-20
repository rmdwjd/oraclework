/*
    TCL : Transaction Control Language
    트랜젝션 제어어
    
    * 트랜젝션
    - 데이터베이스의 논리적 연산단위
    - 데이터의 변경사항(DML)들을 하나의 트랜잭션에 묶어서 처리
        DML문 한 개를 수행할 때 트랜잭션이 존재하면 해당 트랜잭션에 같이 묶어서 처리
        트랜잭션이 존재하지 않으면 트랜잭션을 만들어서 묶음
        COMMIT 하기 전까지의 변경사항들을 하나의 트랜잭션에 담게 됨
    - 트랜잭션의 대상이 되는 SQL : INSERT, UPDATE, DELETE
    
    COMMIT (트랜잭션 종료 처리 후 확정)
    ROLLBACK (트랜잭션 취소)
    SAVEPOINT (임시저장)
    
    - COMMIT; 진행 : 한 트랜잭션에 담겨있는 변경사항들을 실제 DB에 반영시키겠다는 의미
    - ROLLBACK; 진행 : 한 트랜잭션에 담겨있는 변경사항들은 삭제(취소)한 후 마지막 COMMIT 시점으로 돌아감
    - SAVEPOINT 포인트명; 진행 : 현재 이 시점에 해당 포인트명으로 임시저장점을 정의해두는 것
                ROLLBACK 진행시 전체 변경사항들을 다 삭제하는 것이 아니라 일부만 롤백 가능
*/

SELECT * FROM EMP_01;

-- 사번이 300번인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 300;

-- 사번이 301번인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 301;
-- 위의 트랜잭션에 DELETE 301 들어감
-- 실제 DB에 반영안됨

ROLLBACK;
--300, 301 되살아남

-- 사번이 200번인 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 200;

SELECT * FROM EMP_01;

INSERT INTO EMP_01 VALUES(500, '남길동', '기술지원부');

COMMIT;

ROLLBACK;

---------------------------------------------------------------------

-- 216, 217, 214 사원 삭제
DELETE FROM EMP_01
WHERE EMP_ID IN (216, 217, 214);

-- 임시저장점 만들기
SAVEPOINT SP;

SELECT * FROM EMP_01;

-- 501번 추가
INSERT INTO EMP_01 VALUES(501, '이세종', '총무부');

-- 사원 218번 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 218;

-- 임시저장점 SP지점가까지만 ROLLBACK 하고 싶으면
ROLLBACK TO SP;

SELECT * FROM EMP_01
ORDER BY EMP_ID;

COMMIT;

/*
    * 자동 COMMIT 되는 경우
    - 정상종료
    - DCL 과 DDL 명령문이 수행된 경우

    * 자동 ROLLBACK되는 경우
    - 비정상 종료
    - 전원꺼짐, 정전, 컴퓨터 DOWN
*/

--사번이 300, 500 삭제
DELETE FROM EMP_01
WHERE EMP_ID IN (300, 500);

--사번이 302 삭제
DELETE FROM EMP_01
WHERE EMP_ID = 302;

-- DDL문
CREATE TABLE TEST(
    T_ID NUMBER
);

ROLLBACK; -- DDL문 실행하는 순간 COMMIT 됨 -> ROLLBACK 해도 소용X
-- > DDL문 (CREATE , ALTER, DROP) 을 수행하는 순간 트랜잭션이 있던 변경사항들은 무조건 COMMIT 된다

SELECT * FROM EMP_01;

