/*
    <PL/SQL>
    PROCEDURAL LANGUAGE EXTENSTION TO SQL
    
    오라클 자체에 내장되어 있는 절차적 언어
    SQL문장 내에서 변수의 정의, 조건처리(IF), 반복처리(LOOP, FOR, WHILE)등을 지원하여 SQL단점보완
    다수의 SQL문을 한번에 실행 가능(BLOCK 구조)
    
    * PL/SQL 구조
    - [선언부 (DECLARE SECTION)] : DECLARE로 시작, 변수나, 상수를 선언 및 초기화하는 부분
    - 실행부 (EXECUTABLE SECTION) : BEGIN으로 시작, SQL문 또는 제어문(조건문, 반복문)등의 로직을 기술하는 부분
    - [예외처리부 (EXCEPTION SECTION)] : EXCEPTION으로 시작,
                                        예외 발생시 해결하기 위한 구문을 미리 기술해 둘 수 있는 부분
*/
-- * 화면에 오라클 출력(껐다 다시 켜면 반드시 실행해야 함)
SET SERVEROUTPUT ON;

-- HELLO ORACLE 출력
BEGIN
    -- System.out.prinln("hello oracle") java
    DBMS_OUTPUT.PUT_LINE('HELLO OACLE');
END;
/

------------------------------------------------------------------------------------------------------------
/*
    1. DECLARE (선언부)
    변수 및 상수 선언하는 공간 ( 선언과 동시에 초기화도 가능 )
    일반타입 변수, 레퍼런스타입 변수, ROW타입의 변수
*/

/*
-- 1.1 일반타입 변수 선언 및 초기화
    [표현식] 변수명 [CONSTANT] 자료형 [:=값];
*/
DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14;
BEGIN
    EID := 500;
    ENAME := '장남일';
    -- System.out.prinln("EID : " + EID);
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : '|| ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/
    
DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14;
BEGIN
    EID := &번호;
    ENAME := '&이름';
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/

/*
    1.2 레퍼런스타입 변수 선언 및 초기화
        : 어떤 테이블의 어떤 컬럼의 데이터타입을 참조해서 그타입으로 지정
        
    [표현식] 변수명 테이블명.컬럼명%TYPE;
*/
DECLARE 
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    EID := '300';
    ENAME := '유재석';
    SAL := 3000000;
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SAL);
END;
/

DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    -- 1. 사번이 200번인 사원의 사번 사원명 급여 찾아 변수에 저장
    /*
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO EID, ENAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = 200;
    */
    
    -- 2. 입력받아 검색하여 변수에 저장
    SELECT EMP_ID, EMP_NAME, SALARY
    INTO EID, ENAME, SAL
    FROM EMPLOYEE
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SAL);
END;
/


/*
    레퍼런스타입 변수로 EID, ENMAE, JCODE, SAL, DTITLE를 선언하고
    각 자료형 EMPLOYEE(EMP_ID, EMP_NAME, JOB_CODE, SALARY),
    DEPARTMENT (DEPT_TITLE)들을 참조하도록
    
    사용자가 입력한 사번의 사원의 사번, 사원명, 직급코드, 급여, 부서명, 조회한 후 각 변수에 담아 출력
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
    INTO EID, ENAME, JCODE, SAL, DTITLE
    FROM EMPLOYEE
    JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
    WHERE EMP_ID = '&사번';
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENMAE : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('JCODE : ' || JCODE);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
    DBMS_OUTPUT.PUT_LINE('DTITLE : '||DTITLE);
END;
/
    
    
