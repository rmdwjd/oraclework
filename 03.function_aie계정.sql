/*
    <함수>
    전달된 컬럼값을 읽어들여 함수를 실행한 결과 반환
    
    -단일행 함수 : N개의 값을 읽어들여 N개의 결과값을 반환(매 행마다 함수 실행)
    -그룹 함수 : N개의 값을 읽어들여 1개의 결과값을 반환(그룹별로 함수 실행)
    
    >> SELECT절에 단일행 함수와 그룹함수를 함께 사용할 수 없음
    >> 함수식을 기술할 수 있는 위치 : SELECT절, WHERE절, ORDER BY절, HAVING절
*/
--------------------------단일행 함수--------------------------
==============================================================
--                      <문자 처리 함수>
==============================================================
/*
    LENGTH / LENGTHB => NUMBER로 변환
    LENGTH(컬럼|'문자열') : 해당 문자열의 글자수 반환
    LENGHTB(컬럼|'문자열') : 해당 문자열의 BYTE수로 반환
     -한글 : XE버전일 때 => 1글자당 3byte(김, ㄱㄷㅏ 등도 1글자에 해당)                                                                                                                                                                                                                                                                                                                                                      
           EE버전일 때 => 1글자당 2byte
     -그외 : 1글자당 1byte
*/

SELECT LENGTH('오라클'),LENGTHB('오라클')
FROM DUAL; -- 오라클에서 제공하는 가상테이블

SELECT LENGTH('Oracle'), LENGTHB('Oracle')
from DUAL;

SELECT LENGTH('ㅇㅗㄹㅏㅋㅡㄹ')||'글자', LENGTHB('ㅇㅗㄹㅏㅋㅡㄹ')||'byte'
FROM DUAL;

SELECT EMP_NAME , LENGTH(EMP_NAME)||'글자', LENGTHB(EMP_NAME)||'byte', EMAIL, LENGTH(EMAIL)||'글자', LENGTHB(EMAIL)||'byte'
FROM EMPLOYEE;

----------------------------------------------------------

/*
    INSTR : 문자열로부터 특정 문자의 시작위치(INDEX)를 찾아서 반환(반환형:NUMBER)
    - ORACLE에서 INDEX번호는 1부터 시작
    - 찾는 문자가 없으면 0을 반환 
    
    INSTR(컬럼|'문자열','찾을 문자열',[찾을위치의 시작값,[순번])
    찾을위치의 시작값
    1 : 앞에서부터 찾기(기본값)
    -1 : 뒤에서부터 찾기
*/

SELECT INSTR('JAVASCRIPTJAVAORACLE','A') FROM DUAL; -- 결과 : 2
SELECT INSTR('JAVASCRIPTJAVAORACLE','A', 1) FROM DUAL; -- 결과 : 2
SELECT INSTR('JAVASCRIPTJAVAORACLE','A', -1) FROM DUAL; -- 결과 : 17
SELECT INSTR('JAVASCRIPTJAVAORACLE','A', 1, 3) FROM DUAL; -- 결과 : 12
SELECT INSTR('JAVASCRIPTJAVAORACLE','A', -1, 2) FROM DUAL; -- 결과 : 14

SELECT EMAIL, INSTR(EMAIL, '_')"_위치", INSTR(EMAIL,'@')"@위치"
FROM EMPLOYEE;
