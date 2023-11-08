-- 테이블 컬럼의 정보 조회
/*
(') 홑따옴표 : 문자열일 때
(") 쌍따옴표 : 컬럼명 
*/
/*
    <select>
    데이터 조회할 때 사용하는 구문
    
    >> RESULT SET : SELECT문을 통해 조회된 결과물(조회된 행들의 집합)
    
    [표현법]
    SELECT 조회하려는 컬럼명...
    FROM 테이블명
*/

SELECT * 
FROM EMPLOYEE;

SELECT *
FROM department;

--EMPLOYEE 테이블에서 사번, 이름, 전화번호만 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE;


--EMPLOYEE 테이블에서 사번, 이름, 급여
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;


-- 실습문제

-- 1. JOB테이블에서 직급명만 조회
SELECT * FROM JOB;
SELECT JOB_NAME FROM JOB;

-- 2. DEPARTMENT 테이블의 모든 컬럼 조회
SELECT * FROM department;

-- 3. DEPARTMENT 테이블의 부서코드, 부서명만 조회
SELECT DEPT_ID, DEPT_TITLE FROM department;


-- 4. EMPLOYEE 테이블에서 사원명, 이메일, 전화번호 , 입사일, 급여 조회
SELECT * FROM employee;
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE, SALARY FROM EMPLOYEE;

/*
    <컬럼값을 통한 산술연산>
    SELECT절 컬럼명 작성부분에 산술연산 기술 가능(이때 산술연산된 결과 조회)
*/

-- EMPLOYEE에서 사원명, 사원의 연봉(급여*12) 조회
SELECT EMP_NAME, SALARY*12
FROM employee;

-- EMPLOYEE 에서 사원명, 급여, 보너스
SELECT EMP_NAME, SALARY, BONUS
FROM EMPLOYEE;

-- EMPLOYEE에서 사원명, 급여, 보너스, 연봉, 보너스를 포함한 연봉((급여+(보너스*급여))*12)
SELECT EMP_NAME, SALARY, BONUS, SALARY*12, (SALARY+BONUS*SALARY)*12
FROM EMPLOYEE;
-- 산술 연산중 NULL 이 존재하면 결과는 무조건 NULL이 됨 별도 처리(나중에)

-- EMPLOYEE에서 사원명, 입사일, 근무일수(오늘날자-입사일)
-- DATE끼리도 연산 가능: 결과값은 일 단위
-- 오늘 날짜 : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE
FROM EMPLOYEE;
-- 함수수업시 Date 날짜 처리하면 초단위를 관리할수 

--------------------------------------------------------------------------------

/*
    <컬럼명에 별칭 지정하기>
    산술 연산 시 산술 수식 그대로 컬럼명이 됨. 이때 별칭을 부여하면 깔끔하게 처리
    
    [표현법]
    컬러명 별칭 / 컬럼명 AS 별칭 / 컬럼명 "별칭" / 컬렴명 AS "별칭"
    
    별칭에 띄어쓰기나 특수문자 포함되면 반드시 (") 쌍 따옴표를 넣어줘야 한다.
*/

-- EMPLOYEE 에서 사원명, 급여, 보너스, 연봉, 보너슬르 포함한 연봉 ((급여+(보너스*급여))*12)

SELECT EMP_NAME 사원명, SALARY AS 급여, BONUS "보너스", SALARY*12 "연봉(원)", ((SALARY+BONUS*SALARY)*12) "총 소득"
FROM EMPLOYEE;

SELECT EMP_NAME 사원명, HIRE_DATE AS 입사일, SYSDATE-HIRE_DATE "근무일수"
FROM EMPLOYEE;

--------------------------------------------------------------------------------

/*
    <리터럴>
    임의로 지정된 문자열(')
    
    SELECT절에 리터럴을 제시하면 마치 테이블상에 존재하는 데이터처럼 조회 가능
    조회된 RESULT SET의 모든 행에 반복적으로 출력
*/

--EMPLOYEE에 사번, 사원명, 급여, 원 AS 단위 조회
SELECT EMP_ID, EMP_NAME, SALARY, '원' AS "단위"
FROM EMPLOYEE;


--------------------------------------------------------------------------------

/*
    <연결 연산자 : ||>
    여러 컬럼들을 마치 하나의 컬럼값인 것 처럼 연결하거나, 컬럼값과 리터럴을 연결할 수 있음
*/
-- EMPLOYEE에 사번, 사원명, 급여를 하나의 컬럼으로 조회
SELECT EMP_ID || EMP_NAME || SALARY 
FROM EMPLOYEE;


SELECT EMP_ID, EMP_NAME, SALARY || '원'
FROM employee;

-- 홍길동의 월급은 9000000입니다
SELECT EMP_NAME ||'의 월급은 '||SALARY || '원 입니다'
FROM employee;

-- 홍길동의 전화번호는 PHONE 이고 이메일은 EMAIL 입니다.
SELECT EMP_NAME ||'의 전화번호는 '|| PHONE || ' 이고 이메일은 '|| EMAIL ||' 입니다'
FROM employee;
