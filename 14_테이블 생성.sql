-- 14_���̺� ����.sql

/*
    # CRUD
    
    - ��κ��� ���α׷����� ������ �ִ� �⺻���� ��ɵ�
    - Create (������ ����)
    - Read   (������ �б�)
    - Update (������ ����)
    - Delete (������ ����)


    # DML (Deta Man ������ ����)
    
    - ���̺��� �����͸� �����ϴ� ��ɾ��
    - INSERT : ���̺� ������ �߰��ϱ� 
    - SELECT : ���̺��� ������ �б�
    _ UPDATE : ���̺��� ������ �����ϱ�
    - DELETE : ���̺��� ������ �����ϱ�
    
    # DDL (Deta) ������ ���Ǿ�
    
    - �پ��� DB ������Ʈ�� �����ϴ� ��ɾ�
    (* DB ������Ʈ : ���̺�, ��, �ε���, ����, ...)
    - CREATE : DB ������Ʈ ����
    - ALTER  : DB ������Ʈ ����
    - DROP   : DB ������Ʈ ����
    - TRUNCATE : DB ������Ʈ ���� ���� (���� �Ұ���)
    
    
    # DCL (������ ���� �ɷ�)
    
    - �������� ���� �����ϱ� ���� ����ϴ� ��ɾ��
    - GRANT ; ���� ���� (������ ������ ������ ������ ���´�)
    - REVOKE : ���� ȸ��
    - ROLLBACK : �۾� �ǵ�����
    - COMMIT : �۾� Ȯ������ (�ѹ��� �Ұ����� ���·� �����)
*/

/*
    # ���̺� �����ϱ�
    
    Create TABLE ���̺�� (�÷�1 Ŀ��Ÿ��1, �÷�2 �÷�Ÿ��2, ...) 

*/
CREATE TABLE fruit (
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    fruit_id CHAR(2)
);

DESC fruits;
SELECT * FROM countries;

-- # ���̺� ���� : DROP TABLE ���̺��
DROP TABLE fruits;

-- DROP���� ������ DB ������Ʈ�� �����뿡�� Ȯ���� �� �ִ�
SHOW recyclebin;

-- �����뿡 �ִ� ���̺� �����ϱ�
FLASHBACK TABLE fruits TO BEFORE DROP;

-- ������ ����
PURGE recyclebin;

-- ���� ���̺��� �����Ͽ� �� ���̺� �����
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- ���̺��� ������ �� ������ �Բ� ����ȴ�
SELECT * FROM employees2;
DESC employees2;

-- �������� �׽�Ʈ�� �������� �� �� �ִ�
SELECT * FROM employees2 INNER JOIN departments USING (department_id);

-- ���̺� ������ �����ϱ� (�����ʹ� �����ϰ� ���� ���� ��)
CREATE TABLE employees3 AS (SELECT * FROM employees WHERE 1 = 0);

-- �Ϻη� ���� ������ ����Ͽ� ���̺��� ������ ����
DESC employees3;
SELECT * FROM employees3;

-- TRUNCATE TABLE ���̺�� : ���̺� ������ ����� ��� ���� �߶������
TRUNCATE TABLE employees2;
SELECT * FROM employees2;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;

/*
    ������ �����ߴ� 1:N ������ ��ü���� ���̺�� �����غ�����
    
        - ���̺� �̸�  :  ���
        - �÷���   :  �̸� / ���� / ��ȭ��ȣ / ����...
        - �� �÷��� Ÿ�� : VARCHAR2/ NUMBER / NUMBER / DATE 
        - �⺻Ű �÷� : 
        - �ܷ�Ű �÷� : 
        
        
        - ���̺� �̸�  :  �౸��
        - �÷���   :  ����ȣ(PK)/ ���̸�(VARCHAR2)/������(VARCHAR2)/Ȩ����(NUMBER)
        - �� �÷��� Ÿ��  : 
        - �⺻Ű �÷� : ����ȣ
        - �ܷ�Ű �÷� : ����� ��ȣ
        
        - ���̺� �̸�  :  �����
        - �÷���   :  ������ȣ(PK), �����ο� / �ּ� / �����Ÿ�� /...
        - �� �÷��� Ÿ�� : NUMBER / NUMBER / VARCHAR2/ CHAR/ ...
        - �⺻Ű �÷� : ����� ��ȣ
        - �ܷ�Ű �÷� : X
        
         - ���̺� �̸�  :  �౸ ����
        - �÷���   : ������ȣ / �̸� / ���� / ������ / ���� / �Ҽ� ��...
        - �� �÷��� Ÿ�� : NUMBER / VARCHAR2/ NUMBER / CHAR / CHAR / NUMBER
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : ����, �Ҽ�����ȣ
*/

--CREATE TABLE child (
--    child_name VARCHAR2(10),
--    child_age NUMBER(3),
--    child_phone NUMBER(15),
--    child_birthday DATE(7)
--);



CREATE TABLE SoccerTeam (
    team_id NUMBER(5),
    team_name VARCHAR (30),
    team_owner VARCHAR2(20),
    team_leader_id NUMBER(8), -- 1:1 ���������� �ܷ�Ű�� ����ϴ� ���
    home_stadium_id NUMBER(5)
);

CREATE TABLE SoccerPlayer (
    player_id NUMBER(8),
    player_eng__name VARCHAR2 (25),
    player_kor__name VARCHAR2(40),
    player_position VARCHAR2(3),
    player_back_namber NUMBER(2),
    countly_id CHAR(2), --countries
    team_id NUMBER(5) --SoccerTeam ���̺�κ��� ���ܿ� �ܷ�Ű
);











