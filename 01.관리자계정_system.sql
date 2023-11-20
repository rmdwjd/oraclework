-- 한줄 주석 (ctrl + /)
/*
여러줄 주석
alt + shift + c
*/

-- 커서가 깜박거릴 때 : 그 줄 실행
-- 나의 계정 보기
show user;

-- 사용자계정 조회
select * from DBA_USERS;

-- 계정 만들기
-- [표현법] create user 사용자명 identified by 비밀번호;
-- 오라클 12버전 부터 일반 사용자는 c##을 붙여 이름을 작명한다.
-- CREATE user user1 IDENTIFIED BY 1234;
CREATE user c##user1 IDENTIFIED by user123;
create user c##user2 IDENTIFIED by "1234";

-- 사용자 이름에 c## 붙이는 거 회피하는 방법
ALTER SESSION SET "_oracle_script" = true;
create user user3 identified by user3;

-- 사용자 이름은 대소문자를 가리지 않는다
-- 실제 사용할 계정 생성
create user aie identified by aie;

-- 권한생성
-- [표현법] grant 권한1, 권한2, ... to 계정명;
grant RESOURCE, CONNECT to aie;

-- 테이블 스페이스 얼마만큼의 영역을 할당할 것인지를 부여
alter user aie default TABLESPACE users quota unlimited on users;

-- 테이블 스페이스의 영역을 특정 용량만큼 할당하려면
alter user c##user1 quota 30M on users;


-- user 삭제
-- [표현법] drop user 사용자명; => 테이블이 없는 상태
-- [표현법] drop user 사용자명 cascade; => 테이블이 있을 때
drop user user3;

-- 과제용 계정 생성
ALTER SESSION set "_oracle_script" = true;
create user workbook identified by workbook;
grant RESOURCE, CONNECT to workbook;
alter user workbook default TABLESPACE users quota UNLIMITED on users;



-- DDL 사용자 계정 만들기
ALTER SESSION set "_oracle_script" = true;
create user ddl identified by ddl;
grant RESOURCE, CONNECT to ddl;
alter user ddl default TABLESPACE users quota UNLIMITED on users;

