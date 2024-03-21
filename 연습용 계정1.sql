--CREATE TABLE fruits (
--    fruit_name VARCHAR2(30),
--    fruit_price NUMBER(6),
--    fruit_grade VARCHAR2(2),
--    fruit_id CHAR(2),
--    country_id CHAR(2) NOT NULL
--);
--
--INSERT INTO fruit (fruit_name, fruit_price, fruit_grade, fruit_id, country_id)
--VALUES('Apple', '5000', 'A+', 'KR');
--
--DELETE FROM fruits WHERE fruit_grade IS NULL;
--
--UPDATE fruits SET fruit_name = 'PineApple';

CREATE TABLE bread(
    bread_name VARCHAR2(20),
     bread_price NUMBER(5)
);

INSERT INTO bread VALUES('½Ä»§', 3000);
INSERT INTO bread VALUES('¸ð´×»§', 2500);
INSERT INTO bread VALUES('¹Ù°ÔÆ®', 3500);
