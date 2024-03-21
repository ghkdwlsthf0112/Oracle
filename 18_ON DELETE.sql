--18_ON DELETE.sql

/*
    # ON DELETE
    
    - 외래키를 설정할 때 부모키를 삭제할 때의 정책을 설정한다
    - ON DELETE RESTRICT : 부모키를 삭제하려고 할 떄 삭제를 막는다
    - ON DELETE SET NULL : 부모키를 삭제하하고 
    - ON DELETE CASA : 부모키를 삭제하면 창조
*/ 
SELECT * FROM user_tables;

SELECT * FROM coffee;
SELECT * FROM fruits;

UPDATE fruits SET country_id = 'AR' WHERE country_id = 'KR';

ALTER TABLE fruits ADD CONSTRAINT fruits_c_id_fk
FOREIGN KEY(country_id) REFERENCES countries3(country_id)
ON DELETE SET NULL;

DELETE FROM countries3 WHERE country_id = 'AD';
