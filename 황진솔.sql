select * from consumer;
select * from orders;

CREATE TABLE consumer (
    consumer_number INTEGER CONSTRAINT consumer_number_pk PRIMARY KEY,
    consumer_name VARCHAR(20) NOT NULL,
    consumer_password VARCHAR2(100)    
);

CREATE SEQUENCE consumer_number_seq START WITH 1 INCREMENT BY 1 NOCACHE;

INSERT INTO CONSUMER VALUES(consumer_number_seq.nextval, 'Ȳ����', '1234');
INSERT INTO CONSUMER VALUES(consumer_number_seq.nextval, 'ȫ�浿', '1111');
INSERT INTO CONSUMER VALUES(consumer_number_seq.nextval, '����', '0123');

CREATE TABLE orders(
    order_number INTEGER CONSTRAINT order_number_pk PRIMARY KEY,
    order_day DATE NOT NULL,
    order_price INTEGER NOT NULL,
    order_juso VARCHAR2(200),
    delivery_completed DATE NOT NULL,
    pay_total NUMBER(10) NOT NULL,
    discount NUMBER(2) NOT NULL,
    point NUMBER(2) NOT NULL
);

CREATE SEQUENCE order_number_seq START WITH 1 INCREMENT BY 1 NOCACHE;

INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-22', '23000', '��⵵', '2023-12-30', '23000', '2', '2');
INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-23', '24000', '����', '2023-12-24', '24000', '3', '3');
INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-24', '25000', '������', '2023-12-25', '25000', '4', '4');
INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-25', '26000', '���ֵ�', '2023-12-26', '26000', '5', '5');
INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-26', '27000', '�λ�', '2023-12-27', '27000', '6', '6');
INSERT INTO orders VALUES(order_number_seq.nextval, '2023-12-27', '28000', '����', '2023-12-28', '28000', '7', '7');


SELECT
    c.consumer_number,
    c.consumer_name,
    o.order_number,
    o.order_day,
    o.order_price
FROM
        consumer c
    INNER JOIN orders o ON c.consumer_number = o.order_number;
   
