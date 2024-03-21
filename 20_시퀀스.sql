-- 20_������.sql

/*
    # ������
    
    - �⺻��� ������ ���ϵ��� ��ȣ�� �ڵ����� �������ִ� DB ������Ʈ
    
    CREATE SEQUENCE ��������
                    [START WITH n] - ���� ��ȣ ����
                    [INCREMENT BY n] - ���� ���� ����
                    [MAXVALUE n | NOMAXVALUE] - �ִ� ���� ���� 
                    [MINVALUE DI NOMINVALUE]- �ּ� ���� ���� 
                    [CYCLE I NOCYCLE] - ���� ��ȯ ���� ���� 
                    [CACHE n I NOCACHE]- ��ȣ�� �̸� �������� ���� ����
*/

-- ������ ������ ��ųʸ� ��
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

CREATE SEQUENCE coffee_seq1;

CREATE SEQUENCE fruit_id_seq START WITH 10 INCREMENT BY 10;

-- �׽�Ʈ�� ���̺�
SELECT * FROM dual;
SELECT 10 * 10 FROM dual;
SELECT upper('Apple') FROM dual;
SELECT upper('Smith') FROM dual;

-- ������.nextvalue : ���� ��ȣ�� ����Ѵ� (�ٽô� ���� ��ȣ�� ���ư� �� ����)
SELECT coffee_seq.nextval FROM dual;
SELECT fruit_id_seq.nextval FROM dual;

--������.currval : �����ȣ�� Ȯ���Ѵ� ()�� ������ ���Ŀ��� Ȯ�� ����
SELECT fruit_id_seq.currval FROM dual;
SELECT coffee_seq.currval FROM dual;

-- �������� ����� ���̺��� INSERT�ϱ�
ALTER TABLE fruits MODIFY (
    fruit_id NUMBER(10)
    CONSTRAINT fruit_id_pk PRIMARY KEY
);

-- �⺻�� ���� ���� ����ϸ� ����� ������ �������� ����� ����Ѵ�
INSERT INTO fruits(fruit_id, fruit_name, fruit_price)
VALUES (fruit_id_seq.nextval, 'Apple', 1234);


CREATE SEQUENCE bank_waiting_seq 
    START WITH 10 INCREMENT BY 20 
    MINVALUE 10 MAXVALUE 100 CYCLE NOCYCLE;

DROP SEQUENCE bank_waiting_seq;
SELECT bank_waiting_seq.nextval FROM dual;

-- ������ �褡���ϱ� : DROP SEQUENCE ��������;
-- ������ �����ϱ� : ARTER SEQUENCE [�ɼ��� CREATE SEQUENCE�� ����]











