-- 15_������ �߰�,����,����

/*
    # ���̺� ������ �߰��ϱ�
    
    -- INSERT INTO ���̺��(�÷�1, �÷�2, ...) 
    -- INSERT INTO ���̺�� VALUES(�ݵ�� ��� �÷����� �������)

*/
CREATE TABLE fruits (
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    fruit_id CHAR(2),
    country_id CHAR(2) NOT NULL
);
SELECT * FROM fruits;

INSERT INTO fruits(
    country_id, fruit_grade, fruit_price, fruit_name
) VALUES ('AU', 'SS', 2800, 'Banana');

INSERT INTO fruits(
    country_id, fruit_grade, fruit_price, fruit_name
) VALUES ('KR', 'A+', 15000, 'Strawberry');

-- # INSERT�ÿ� �÷��� ��� ���� ���� �� �ִ�
-- ��, ���� ���� �÷����� �� �߰��� �ڵ����� null�� ����
-- ���� ���� �÷��� null�� �ÿ����� �ʴ� �÷��� ��� ������ �߻��Ѵ�

-- ������ �÷��� fruit_price�� fruit_grade���� null�� �źεǾ���
INSERT INTO fruits(fruit_name, fruit_price) VALUES ('Grape', 'FR');
-- ������ �÷��� null�� ������� �ʾƼ� insert�� �źεǾ���
INSERT INTO fruits(fruit_name, fruit_price) VALUES ('Grape', 3000);

-- # �÷����� �ƿ� �����ϸ� ��� �÷� ���� ������� ����� �Ѵ�
INSERT INTO fruits VALUES ('Peach', 1800, 'A+', 'KR');

-- # ���������� INSERT �ϱ� (���̺� ������ ������ ��쿡�� ����)
INSERT INTO fruits(SELECT * FROM fruits);

/*
    # ���̺� ������ �����ϱ�
    
    - UPDATE ���̺�� SET �÷�1=��1, �÷�2=��2, ... WHERE ������
    - ���� ������ �������� ������ ��� ���� �����ȴ�
    - �ϳ��� �ุ �����ϱ� ���ؼ� �⺻Ű�� �Բ� ���� Ȱ���Ѵ�
*/
COMMIT; -- ��������� ���� ������ �����Ѵ� (DCL)

-- ������ �������� ������ �ش� ���̺��� ��� ���� �����ǹǷ� �����ؾ� �Ѵ�
UPDATE fruits SET fruit_name = 'PineApple';

-- ������ �����ؾ� ���ϴ� �ุ ������ �� �ִ�
UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';
    
ROLLBACK; -- ��������� ��� ����ϰ� ���� �ֱ��� COMMIT ���·� ���ư��� (DCL)

/*
    # ���̺� ������ �����ϱ�
    
    - DELETE FROM ���̺� WHERE ������;
    - 
*/

-- ������ ���� ������ ��� ���� �����ǹǷ� �����ؾ� �Ѵ�
DELETE FROM fruits;

-- ������ ����� ���ϴ� �ุ ���� ����
DELETE FROM fruits WHERE fruit_grade IS NULL;

ROLLBACK;

SELECT * FROM fruits WHERE country_id = 'KR';
SELECT * FROM fruits;
DROP TABLE fruits;

-- ����1: ���� �����ϰ� �����ߴ� ���̺� �˸��� �����͵��� �־����

--- ���̺� �̸�  :  ���
--        - �÷���   :  �̸� / ���� / ��ȭ��ȣ / ����...
--        - �� �÷��� Ÿ�� : VARCHAR2/ NUMBER / NUMBER / DATE
--        - �⺻Ű �÷� : 
--        - �ܷ�Ű �÷� : 
--CREATE TABLE child (
--    child_name VARCHAR2(10),
--    child_age NUMBER(3),
--    child_phone NUMBER(15),
--    child_birthday DATE(7)
--);

CREATE TABLE soccer_Team (
    team_id NUMBER(5) PRIMARY KEY,
    team_name VARCHAR (30),
    team_owner VARCHAR2(20),
    team_leader_id NUMBER(8)
);

INSERT INTO soccer_Team(
    team_id, team_name, team_owner, team_leader_id
) VALUES (805, '��Ʈ��', '�ٴϿ� ����', 7);

-- ����2: �� ���̺� �̻��� JOIN�Ͽ� ���ϴ� �����͸� ��ȸ�غ�����






