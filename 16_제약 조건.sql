-- 16_���� ����.sql

/*
    # ���Ἲ
    
    - ������ ���� ����
    - �����͸� ���Ծ��� ���·� �ùٸ��� �����ϴ� ��
    - �����͸� �ùٸ��� �����ϱ� ���ؼ��� �پ��� ������ �������� �������Ѿ� �Ѵ�
    - �����ͺ��̽����� �ٿ��� ���Ἲ���� ��Ű������ ����ϴ� ���� ���������̴�
    
    # ��ü ���Ἲ
    
    - ���̺��� �����ʹ� �ݵ�� �ϳ��� ���� ������ �� �־�� �Ѵ�
    - �� �ุ ������ �� ���� �����ʹ� ��ü ���Ἲ�� ���� �� �̴�
    - DB������ �������� ��ü �������� ��Ű�� ���ؼ� �⺻Ű(PK) ���������� ����Ѵ�
    
    # ���� ���Ἲ
    
    - ���� ���迡 �ִ� �����ʹ� ��ȿ�� �����͸� �����ؾ� �Ѵ�
    -DB������ �������� ���� ���Ἲ�� ��Ű�� ���� �ܷ�Ű(PK) ���������� ����Ѵ�
    
    # ������ ���Ἲ
    
    - �ϳ��� ������(�÷�)�� �����ϴ� ��ü���� ��� ���� Ÿ���̿��� �Ѵ�
    - DB������ �÷� Ÿ���� �����Ͽ� �ش� �÷��� ������ ���Ἲ�� �����Ѵ�
    
    # ������ ���Ἲ
    
    - �����Ͱ� ��Ȯ��, �ϰ���, ��ȿ���� �����ϴ� ��
    - CHECK ���� ���ǰ� NOT NULL ���������� ���� ������ ���ܼ��� ������ �� �ִ�
    
    # DB�� ���� ���ǵ�
    
    - UNIQUE : �ش� �����ο� �ߺ��ȴ� ���� ������� �ʴ´�
    - NOT NULL : �ش� �����ο� null�� ������� �ʴ´�
    - PRIMARY KEY : �⺻Ű, NOT NULL + UNIQUE, �� ���̺� �� �Ѱ��� ���� ����
    - POREIGN KEY : �ش� �������� �ܷ�Ű�� ����, ��� �÷��� â������ �����ؾ� �Ѵ�
                    �⺻Ű �Ǵ� UNIQUE ���������� ������ �÷��� ������ �� �ִ�
    - CHECK : ���ϴ� ������ ���� �����Ͽ� �ش� ������ �����ϴ� ��ü�� �߰� ����
*/

/*
    # ������ ��ųʸ� (Deta Dictionary)
    
    - �����Ϳ� ���� ������ (������ ����, ��Ÿ ������)
    - ���� DB�� ��Ȳ�� ����, DB�� �˾Ƽ� �����ϴ� ������
    - DB ����ڴ� ������ ��ųʸ��� ���� ������ �� ����
    
    # ������ ��ųʸ� ��
    - ������ ��ųʸ��� �����ڰ� Ȯ���� �� �ְԲ� �����ϴ� ��
        * �� - DB ������Ʈ �� �ϳ��� ��ü �÷��� �Ϻθ� �������� ���·�
                ��ȸ�� �� �ִ� �̴� ���̺� (���� ���̺��� �κ� ����)
    - �տ� user�� ���̸� ���� ���� DB ������ ������ ��ųʸ��� Ȯ���� �� �ִ� 
    - �տ� all�� ���̸� ��ü ������ ������ ��ųʸ��� Ȯ���� �� �ִ�
*/

-- ��� ������ �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_users;

-- ���� ������ ������ ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM user_tables;
-- ��� ������ ������ ����� �� �� �ִ� ������ ��ųʸ� ��
SELECT * FROM all_tables;

-- ���� ������ �����ϴ� �������� ����
SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE table_name = 'EMPLOYEES';

-- ��� ������ �����ϴ� �������� ����
SELECT * FROM all_constraints;

/*
    # CONXTRAINT
    
    -- P : Primary Key
    -- R : References (Foreign Key)
    -- U : Unique
    -- C : Check, Not Null

*/


/*
    1. ���̺� ������ ���ÿ� �������� �߰��ϱ�
    
    - ���̺� ������ �÷���� �÷�Ÿ�� �ڿ� ���������� �߰��� �� �ִ�
    - ������ �߰�/����/������ ���������� ������ �޴´�
    - �������� �̸��� �������� ������ ����Ŭ���� ������ �ڵ� �̸��� ����Ѵ� 
        (� �߸��� �ؼ� ���������� �����ߴ��� �˱� ���������)
    - "�÷��� �÷�Ÿ�� CONSTRAINT �������Ǹ� ��������Ÿ��"�� ���� ���������� �̸��� ���� ������ �� �ִ�
    - �� �����ο� �������� ���������� ������ ���� �ִ�
*/
CREATE TABLE coffee1 (
    coffee_id NUMBER(4) PRIMARY KEY,
    coffee_name VARCHAR2(40) NOT NULL
                            UNIQUE,
    coffee_price NUMBER(5) CHECK(coffee_price >= 0),
    coffee_size CHAR(1) CHECK(coffee_size IN('T', 'G', 'V'))
                         NOT NULL
);

INSERT INTO coffee VALUES(1, '�Ƹ޸�ī��', 1500, null);
INSERT INTO coffee VALUES(2, '�Ƹ޸�ī��(T)', 1200, 'T');
INSERT INTO coffee VALUES(3, '�Ƹ޸�ī��(L)', 1200, 'L');

SELECT * FROM coffee;
SELECT * FROM  user_constraints;

-- ���̺��� �����ϸ� ������ǵ� �Բ� �����ȴ�
DROP TABLE coffee;
PURGE RECYCLEBIN;

CREATE TABLE coffee(
    coffee_id NUMBER(4)
        CONSTRAINT coffee_id_pk PRIMARY KEY,
    coffee_name VARCHAR2(40)
        CONSTRAINT coffee_name_uk UNIQUE
        CONSTRAINT coffee_name_nn NOT NULL,
    coffee_price NUMBER(5)
        CONSTRAINT coffee_price_positive CHECK(coffee_price >= 0)
        CONSTRAINT coffee_price_nn NOT NULL,
    coffee_size CHAR(1)
        CONSTRAINT coffee_size_nn NOT NULL
        CONSTRAINT coffee_size_chk CHECK(coffee_size IN('T', 'G', 'V'))
);

SELECT * FROM user_constraints WHERE table_name = 'COFFEE';

INSERT INTO coffee VALUES (1, 'Americano', 2000, 'T');
INSERT INTO coffee VALUES (2, 'Caffe Latte', 2300, 'T');
INSERT INTO coffee VALUES (3, 'ī���', 2500, 'A');
INSERT INTO coffee VALUES (3, 'ī���', -2500, 'V');

/*
    # ���̺� ���� �Ŀ� �������� ���� �߰��ϱ�
    
    - ARTER TEBLE ���̺�� AND CONSTRAINT �������Ǹ� ��������Ÿ��(�ķ���);
    - NOT NULL, CHECK�� MODIFY�� �÷��� �����ؾ� �Ѵ�
    - ARTER TEBLE ���̺�� MODIFY�� CREATE TABLE�� ������ ����
*/

CREATE TABLE snacks (
    snack_id   NUMBER(5),
    snack_name   VARCHAR2(50),
    snack_price   NUMBER(6)  
);
SELECT * FROM snacks;
SELECT * FROM user_constraint WHERE table_name = 'snacks';


ALTER TABLE snacks ADD CONSTRAINT snack_id_pk PRIMARY KEY (snack_id);
ALTER TABLE snacks ADD CONSTRAINT snack_name_pk PRIMARY KEY (snack_name);


ALTER TABLE snacks MODIFY (
    snack_name VARCHAR2(100) -- �������� �� �ƴ϶� �÷� Ÿ�Ե� ���� ����
        CONSTRAINT snack_name_nn NOT NULL,
    snack_price NUMBER(6) DEFAULT 1000
        CONSTRAINT snack_price_positive CHECK (snack_price >= 0)
        CONSTRAINT snack_price_nn NOT NULL
);

INSERT INTO snacks (snack_id, snack_name) VALUES(1, '��īĨ');
INSERT INTO snacks (snack_id, snack_name, snack_price) VALUES(1, '��īĨ', null);


SELECT * FROM snacks;

/*
     # ���̺� �������� �����ϱ�
     
     - ALTER TABLE ���̺�� DROP CONSTRAINT �������Ǹ�;
*/
SELECT * FROM user_constraint WHERE table_name = 'SNACKS';
ALTER TABLE snacks DROP CONSTRAINT snack_price_nn;

/*
     ���̺� �������� �̸� �����ϱ�
     
     - ALTER TABLE ���̺�� PENAME CONSTRAINT �����̸� or �ٲ��̸�;
*/
ALTER TABLE snacks RENAME CONSTRAINT snack_id_pk TO snacks_snack_id_pk;


/*
    3. ���̺� �������� �������� �߰�
    
    - ���ο��� �ø��� ��� ������ ���� ���� ���������� �����ϴ� ���
    - DEFAR
*/
CREATE TABLE Clothes (
    clothe_id NUMBER(5),
    clothe_type VARCHAR2(15),
    clothe_name VARCHAR2(50),
    clothe_size VARCHAR2(10),
        CONSTRAINT clothes_type_nn NOT NULL, 
    clorhe_name VARCHAR2(50),
    clothe_size VARCHAR2(10),
    CONSTRAINT clothes_id_pk PRIMARY KEY(clothes_id),
    CONSTRAINT clothes_size CHECK(clothes_size IN ('L', 'XL', 'S', 'XXL', 'M'))
);

SELECT * FROM user_constraint WHERE table_name = 'CLOTHES';

/*
     # �ܷ�Ű �����ϱ�
     
     - �ܷ�Ű ���������� ������ �� �ٸ� ���̺��� PK �Ǵ� UK���� �����ؾ� �Ѵ�
     - �ܷ�Ű�� �������� �÷��� ���� �߰��� �� �����ϴ� �÷��� �����ϴ� ��
     �Ǵ� null�� �߰��� �� �ִ�
*/

CREATE TABLE CoffeeBeans (
    bean_id NUMBER(5),
        CONSTRAINT CoffeeBeans_bean_id_pk PRIMARY KEY,
    bean_name VARCHAR2(30)
        CONSTRAINT CoffeeBeans_bean_name_nn NOT NULL,
    country_id CHAR(2)
        CONSTRAINT CoffeeBeans_country_id_fk REFERENCES countries (country_id)
);

ALTER TABLE coffeebeans DROP CONSTRAINT coffeebeans_c_id_fk;

-- 2. ALTER TABLE - ADD CONSTRAINT
ALTER TABLE coffeebeans
ADD CONSTRAINT coffeebeans_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries (country_id);

-- 3. ���̺� �������� �߰��ϱ�

CREATE TABLE CoffeeBeans (
    bean_id NUMBER(5),
    bean_name VARCHAR2(30)
        CONSTRAINT CoffeeBeans_bean_name_nn NOT NULL,
    country_id CHAR(2),
        CONSTRAINT CoffeeBeans_country_id_pk PRIMARY KEY(bean_id),
        CONSTRAINT CoffeeBeans_country_id_fk FOREIGN KEY(country_key)
            REFERENCES countries (country_id)
);

SELECT * FROM usrer_countries WHERE table_name = 'COUNTRIES';
SELECT * FROM countries;

INSERT INTO coffeebean VALUES(1, '���ٺ��Ŀ����', 'ZW');
INSERT INTO coffeebean VALUES(2, '�ѱ�Ŀ����', 'KR');
INSERT INTO coffeebean VALUES(3, '������𸣴�Ŀ����', null);
INSERT INTO coffeebean VALUES(4, '�Ϻ�Ŀ����', 'JP');
INSERT INTO coffeebean VALUES(5, '�Ƹ���Ŀ����', 'AR');

/*
    ����: 1:N ���̺� �������� �ùٸ��� �߰��غ���
*/

CREATE TABLE Soccerteam (
    team_id NUMBER(5),
        CONSTRAINT Soccerteam_team_id_pk PRIMARY KEY(team_id),
    team_name VARCHAR (30)
        CONSTRAINT CoffeeBeans_bean_name_nn NOT NULL,
    team_owner VARCHAR2(20),
    team_leader_id NUMBER(8)
   
);









