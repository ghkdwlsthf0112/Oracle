--17_���̺� �����ϱ�.sql

/*
    # ���̺� �� �÷��߰��ϱ�
    
    -ARTER TABLE ���̺�� ADD  
    - �� �÷��� �߰��Ǹ� ������ �����ϰ� ����� �ش� �÷����� nnull�� �ȴ�
    - �� �÷� NOT NULL �÷��� �߰��� ���� �⺻���� �ݵ�� �����ؾ� �ȴ�
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

-- ���̺� �÷� �̸� �����ϱ� : ARTER TABLE ���̺��  
ALTER TABLE coffee RENAME COLUMN coffee_satis TO coffee_satisfaction;


SELECT * FROM user_countries WHERE table_name = '';

RENAME contries2 TO contries23;

ALTER TABLE contries3 RENAME CONSTRAINT
    contries2_c_id_pk TO contries3_c_id_pk;














