
[문항2]
CREATE TABLE MEMBER(
	ID VARCHAR2(10) PRIMARY KEY,
	NAME VARCHAR2(10) NOT NULL,
	AGE NUMBER ,
	ADDRESS VARCHAR2(60) NOT NULL
);
COMMENT ON COLUMN MEMBER.ID IS '회원ID';
COMMENT ON COLUMN MEMBER.NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.AGE IS '회원나이';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원주소';

CREATE TABLE ORDERS(
	ORDER_NO VARCHAR2(10) PRIMARY KEY,
	ORDER_ID VARCHAR2(10) NOT NULL,
	ORDER_PRODUCT VARCHAR2(20) NOT NULL,
	COUNT NUMBER NOT NULL ,
	ORDER_DATE DATE,
    FOREIGN KEY(ORDER_ID) REFERENCES MEMBER(ID)
);

COMMENT ON COLUMN ORDERS.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDERS.ORDER_ID IS '주문고객';
COMMENT ON COLUMN ORDERS.ORDER_PRODUCT IS '주문제품';
COMMENT ON COLUMN ORDERS.COUNT IS '주문수량';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '주문일자';

[문항3]
INSERT INTO MEMBER VALUES ('dragon', '박문수', 20, '서울시');
INSERT INTO MEMBER VALUES ('sky', '김유신', 30, '부산시');
INSERT INTO MEMBER VALUES ('blue', '이순신', 25, '인천시');


INSERT INTO ORDERS VALUES ('o01', 'sky', '케익', 1, '2023-11-05');
INSERT INTO ORDERS VALUES ('o02', 'blue', '고로케', 3, '2023-11-10');
INSERT INTO ORDERS VALUES ('o03', 'sky', '단팥빵', 5, '2023-11-22');
INSERT INTO ORDERS VALUES ('o04', 'blue', '찹쌀도넛', 2, '2023-11-30');
INSERT INTO ORDERS VALUES ('o05', 'dragon', '단팥빵', 4, '2023-11-02');
INSERT INTO ORDERS VALUES ('o06', 'sky', '마늘바게트', 2, '2023-11-10');
INSERT INTO ORDERS VALUES ('o07', 'dragon', '라이스번', 7, '2023-11-25');

[문항4]
SELECT * 
FROM MEMBER
WHERE NAME  LIKE '%신%'
ORDER BY '기본키' DESC;

[문항5]
SELECT ORDER_PRODUCT , COUNT
FROM ORDERS
JOIN MEMBER ON (MEMBER.ID = ORDERS.ORDER_ID)
WHERE NAME = '김유신';

SELECT ORDER_PRODUCT , COUNT
FROM ORDERS , MEMBER
WHERE ID = ORDER_ID
AND NAME = '김유신';

[문항6]

CREATE VIEW GREAT_ORDER
AS SELECT ID , ORDER_PRODUCT , COUNT, ORDER_DATE
FROM MEMBER
JOIN ORDERS ON (ID = ORDER_ID)
WHERE COUNT>=3
WITH CHECK OPTION;

[문항7]
ALTER TABLE ORDERS ADD RELEASE CHAR(1) DEFAULT 'Y';
ALTER TABLE ORDERS MODIFY ORDER_PRODUCT VARCHAR(50);
ALTER TABLE ORDERS RENAME COLUMN COUNT TO ORDER_NAME;


