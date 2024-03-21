--17_테이블 수정하기.sql

/*
    # 테이블에 새 컬럼추가하기
    
    -ARTER TABLE 테이블명 ADD  
    - 새 컬럼에 추가되면 기존에 존재하건 행들은 해당 컬럼값이 nnull이 된다
    - 새 컬럼 NOT NULL 컬럼을 추가할 떄는 기본값을 반드시 설정해야 된다
*/
SELECT * FROM coffee;

ALTER TABLE coffee ADD (
    coffee_taste VARCHAR2(20)
        CONSTRAINT coffee_taste_nn NOT NULL,
    coffee_satis NUMBER(2, 1)
);

CREATE TABLE countries2 AS (SELECT * FROM countries);

ALTER TABLE countries2 MODIFY (
    country_id CHAR(2)
        CONSTRAINT coffee2_c_id_pk PRIMARY KEY
);

DESC countries2;

SELECT * FROM usrer_countries WHERE table_name = 'COUNTRIES'; 

ALTER TABLE coffee ADD (
    country_id CHAR(2)
         CONSTRAINT coffee_c_id_fk REFERENCES countries2 (country_id)
);

ALTER TABLE coffee DROP COLUMN coffee_taste;
ALTER TABLE coffee DROP COLUMN coffee_satis;

SELECT * FROM coffee;
UPDATE coffee SET country_id = 'AD';

-- 테이블 컬럼 이름 변경하기 : ARTER TABLE 테이브명  
ALTER TABLE coffee RENAME COLUMN coffee_satis TO coffee_satisfaction;


SELECT * FROM user_countries WHERE table_name = '';

RENAME contries2 TO contries23;

ALTER TABLE contries3 RENAME CONSTRAINT
    contries2_c_id_pk TO contries3_c_id_pk;














