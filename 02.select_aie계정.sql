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


--------------------------------------------------------------------------------

/*
    <DISTINCT>
    컬럼의 중복된 값들을 한번씩만 표시하고자 할 때
*/

SELECT JOB_CODE
FROM EMPLOYEE;

-- EMPLOYEE에서 직급 코드 중복 제외하고 조회
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

-- EMPLOYEE에서 부서 코드 중복 제외하고 조회
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- EMPLOYEE에서 직급 코드 , 부서 코드 중복 제외하고 조회 원할 때 DISTINCT 
SELECT DISTINCT JOB_CODE, DEPT_CODE
FROM EMPLOYEE; -- 잘못된 결과 출력됨 / 하나만 있을 때만 중복제외 가능


/*
    <WHERE절>
    조회하고자 하는 테이블에서 특정 조건에 만족하는 데이터만 조회할 때
    WHERE절에 조건식을 제시
    
    [표현법] 
    SELECT 컬럼, 컬럼, 산술연산, ...
    FROM 테이블명
    WHERE 조건식
    
    >> 비교 연산자
    >, <, >=, <= : 대소비교
    = : 같은지비교
    !=, ^=, <> : 같지않은지 비교

*/

-- EMPLOYEE에서 부석코드가 'D9' 사원들이 모든 컬럼 조회
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- EMPLOYEE에서 부서코드가 'D1'이 아닌 사원들의 사번, 사원명, 부서코드 조회
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE <> 'D1';

-- EMPLOYEE에서 급여가 400만원 이상인 사원들의 사원명, 부서코드, 급여 조회
 SELECT EMP_NAME, DEPT_CODE, SALARY
 FROM EMPLOYEE
 WHERE SALARY >= 4000000;

-- EMPLOYEE에서 재직중인 사원의 사번, 사원명, 입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';

------실습문제-------

--1. 급여가 300만원 이상인 사원들의 사원명, 급여, 입사일, 연봉 조회
SELECT  EMP_NAME, SALARY, HIRE_DATE, SALARY*12 AS 연봉
FROM EMPLOYEE
WHERE SALARY >= 3000000;

--2. 연봉이 5000만원 이상인 사원들의 사원명, 급여, 연봉, 부서코드 조회
SELECT EMP_NAME, SALARY, SALARY*12 "연봉", DEPT_CODE
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;

--3. 직급코드가 'J3'이 아닌 사원들의 사번, 사원명, 직급코드, 퇴사여부 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE, ENT_YN
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

/*
    >> 논리연산자
    여러개의 조건을 묶어서 제시하고자 할 때
    
    AND (-이면서, 그리고)
    OR (--이거나, 또는)
    NOT (부정) : 컬럼명 앞 또는 BETWEEN 앞에 쓴다
*/

-- 부서코드가 D9이면서 급여가 500만원 이상인 사원들의 사원명, 부서코드 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D9' AND SALARY >= 5000000;

-- 부서코드가 'D6'이거나 급여가 300만원 이상인 사원들의 사원명, 부서코드, 급여 조회
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;

-- 급여가 350만원 이상 600만원 이하인 사원의 사번, 사원명, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE 6000000 >= SALARY AND SALARY >= 3500000; 


-------------------------------------------------------------------------------

/*
    >> BETWEEN AND
    -이상 -이하의 범위의 조건을 제시할 때
    
    [표현법]
    비교대상 컬럼 BETWEEN 하한값 AND 상한값
    -> 해당 컬럼 값이 하한값 이상이고 상한값 이하인 경우
*/

-- 급여가 350만원 이상 600만원 이하인 사원의 사번, 사원명, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN  3500000 AND 6000000 ; 


-- 급여가 350만원 이상 600만원 이하를 제외한 사번, 사원명, 급여 조회
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY NOT  BETWEEN 3500000 AND 6000000 ; 

-- 입사일이 90/01/01 ~ 01/12/31 사이인 사원의 사번, 사원명, 입사일 조회
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/12/31';

------------------------------------------------------------------------------

/*
    >> LIKE
    비교하고자 하는 컬럼값이 내가 제시한 특정 패턴에 만족하는 경우 조회
    
    [표현법]
    비교대상컬럼 LIKE '특정패턴'
    : 특정패턴 제시시 '%','_' 와일드카드로 사용할 수 있음
    
    % : 0글자 이상
    EX) 비교대상 컬럼 LIKE '문자%' => 비교대상 컬럼값이 '문자'로 시작되는 것들을 조회
        비교대상 컬럼 LIKE '%문자' => 비교대상 컬럼값이 '문자'로 끝나는 것들을 조회
        비교대상 컬럼 LIKE '%문자%' => 비교대상 컬럼값이 '문자'가 포함되는 것들은 모두 조회
        
    _ : 1글자
    EX) 비교대상 컬럼 LIKE '_문자' => 비교대상 컬럼값의 '문자'앞에 무조건 한 글자가 올 경우 조회(3글자만 조회)
        비교대상 컬럼 LIKE '문자_' => 비교대상 컬럼값의 '문자'뒤에 무조건 한 글자가 올 경우 조회(3글자만 조회)
        비교대상 컬럼 LIKE '_문자_' => 비교대상 컬럼값의 '문자'앞뒤에 무조건 한 글자씩 올 경우 조회(4글자만 조회)
    
*/

-- 사원들 중 성이 '전'씨인 사원들의 사번, 사원명
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'전%';

-- 사원들 중 '하'가 포함되어 있는 사원들의 사번, 사원명
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%하%';

-- 사원들 중 가운데 글자가 '하'가 들어있는 사원(3글자)들의 사번, 사원명 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_하_';

-- 전화번호 중 3번째 글자가 '1'인 사원의 사번, 사원명, 전화번호 조회
SELECT EMP_ID, EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

-- 이메일 중 _앞에 글자가 3글자인 사원들의 사번, 사원명, 이메일 조회
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%'; -- 언더바 4개

/*
    - 와일드 카드로 인식이 됨
    - 데이터와 와일드카드를 구분이어지어야 됨
    : 데이터값으로 취급하고자 하는 값 앞에 나만의 와일드카드(아무거나 문자,숫자,특수문자) 제시하고
      나만의 와일드카드 ESCAPE로 등록해야 함
*/
 
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$'; 
