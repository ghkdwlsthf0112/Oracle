--18_ON DELETE.sql

/*
    # ON DELETE
    
    - �ܷ�Ű�� ������ �� �θ�Ű�� ������ ���� ��å�� �����Ѵ�
    - ON DELETE RESTRICT : �θ�Ű�� �����Ϸ��� �� �� ������ ���´�
    - ON DELETE SET NULL : �θ�Ű�� �������ϰ� 
    - ON DELETE CASA : �θ�Ű�� �����ϸ� â��
*/ 
SELECT * FROM user_tables;

SELECT * FROM coffee;
SELECT * FROM fruits;

UPDATE fruits SET country_id = 'AR' WHERE country_id = 'KR';

ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries3(country_id)
ON DELETE SET NULL;

DELETE FROM countries3 WHERE country_id = 'AD';
