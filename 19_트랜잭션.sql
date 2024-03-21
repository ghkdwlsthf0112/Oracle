-- 19_트랜잭션.sql

/*
    # 트랜잭션 (Transcation)
    
    - 하나의 작업 단위 (ex : 송금)
    - 데이터베이스는 하나의 작업 트랜잭션에 속한 모든 작업이
      정상적으로 완료되는 경우에만 변경사항을 확정지을 수 있는 기능을 제공한다
    - 트랜잭션을 관리하기위해 COMIT, ROLLBACK, SEVEPOINT, ROLLBACKTRUE를 사용한다
    - 하나의 트랜잭션은 마지막 커밋 이후부터 새로운 커밋 사이에서
      실행된 모든 DML만을 의미한다
      (INSERT, UPDATE, DELETE는 트래잭션의 관리 대상이나
      CREATE, ALTER 등의 DLL은 트랜잭션의 관리 대상이 아니다)
*/
SELECT * FROM  fruits;
DELETE FROM fruits;

-- COMMIT: 여태까지 변경 사항을 확정 짓는다 (하나의 트랜잭션을 마무리한다)
COMMIT;

INSERT INTO fruits VALUEs ('Apple', 1234, 'C', 'KR');

-- ROLLBACK: 가장 최근에 했던 커밋으로 돌아간다
ROLLBACK;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SAVEPOINT mysavepoint1;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SAVEPOINT mysavepoint2;

UPDATE fruits SET fruit_price = fruit_price + 500 WHERE country_id = 'ZM';

SELECT * FROM fruits;

ROLLBACK TO mysavepoint2;
ROLLBACK TO mysavepoint1;
ROLLBACK TO mysavepoint2; -- 1로 돌아간 시점에서 mysavepoint2는 미래이므로 돌아갈 수 없디

-- 트랜잭션 작업 중 일부만 청소하고 계속해서 진행하고 싶은 경우
-- MYSAVEPOINT와 ROLLBACK TO를 활용한다












