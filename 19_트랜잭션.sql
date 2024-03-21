-- 19_Ʈ�����.sql

/*
    # Ʈ����� (Transcation)
    
    - �ϳ��� �۾� ���� (ex : �۱�)
    - �����ͺ��̽��� �ϳ��� �۾� Ʈ����ǿ� ���� ��� �۾���
      ���������� �Ϸ�Ǵ� ��쿡�� ��������� Ȯ������ �� �ִ� ����� �����Ѵ�
    - Ʈ������� �����ϱ����� COMIT, ROLLBACK, SEVEPOINT, ROLLBACKTRUE�� ����Ѵ�
    - �ϳ��� Ʈ������� ������ Ŀ�� ���ĺ��� ���ο� Ŀ�� ���̿���
      ����� ��� DML���� �ǹ��Ѵ�
      (INSERT, UPDATE, DELETE�� Ʈ������� ���� ����̳�
      CREATE, ALTER ���� DLL�� Ʈ������� ���� ����� �ƴϴ�)
*/
SELECT * FROM  fruits;
DELETE FROM fruits;

-- COMMIT: ���±��� ���� ������ Ȯ�� ���´� (�ϳ��� Ʈ������� �������Ѵ�)
COMMIT;

INSERT INTO fruits VALUEs ('Apple', 1234, 'C', 'KR');

-- ROLLBACK: ���� �ֱٿ� �ߴ� Ŀ������ ���ư���
ROLLBACK;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SAVEPOINT mysavepoint1;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SAVEPOINT mysavepoint2;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SELECT * FROM fruits;

ROLLBACK TO mysavepoint2;
ROLLBACK TO mysavepoint1;
ROLLBACK TO mysavepoint2; -- 1�� ���ư� �������� mysavepoint2�� �̷��̹Ƿ� ���ư� �� ����

-- Ʈ����� �۾� �� �Ϻθ� û���ϰ� ����ؼ� �����ϰ� ���� ���
-- MYSAVEPOINT�� ROLLBACK TO�� Ȱ���Ѵ�












