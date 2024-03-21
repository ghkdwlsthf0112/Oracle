-- 15_데이터 추가,수정,삭제

/*
    # 테이블에 데이터 추가하기
    
    -- INSERT INTO 테이블명(컬럼1, 컬럼2, ...) 
    -- INSERT INTO 테이블명 VALUES(반드시 모든 컬럼값을 순서대로)

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

-- # INSERT시에 컬럼을 모두 적지 않을 수 있다
-- 단, 적지 않은 컬럼에는 행 추가시 자동으로 null이 들어간다
-- 적지 않은 컬럼이 null을 ㅓ용하지 않는 컬럼인 경우 에러가 발생한다

-- 생략한 컬럼이 fruit_price와 fruit_grade에는 null이 거부되었다
INSERT INTO fruits(fruit_name, fruit_price) VALUES ('Grape', 'FR');
-- 생략한 컬럼이 null을 허용하지 않아서 insert가 거부되었다
INSERT INTO fruits(fruit_name, fruit_price) VALUES ('Grape', 3000);

-- # 컬럼명을 아예 생략하면 모든 컬럼 값을 순서대로 적어야 한다
INSERT INTO fruits VALUES ('Peach', 1800, 'A+', 'KR');

-- # 서브쿼리로 INSERT 하기 (테이블 구조가 동일한 경우에만 가능)
INSERT INTO fruits(SELECT * FROM fruits);

/*
    # 테이블 데이터 수정하기
    
    - UPDATE 테이블명 SET 컬럼1=값1, 컬럼2=값2, ... WHERE 조건절
    - 만약 조건을 지정하지 않으면 모든 행이 수정된다
    - 하나의 행만 수정하기 위해서 기본키와 함께 자주 활용한다
*/
COMMIT; -- 현재까지의 변경 사항을 저장한다 (DCL)

-- 조건을 지정하지 않으면 해당 테이블의 모든 행이 수정되므로 주의해야 한다
UPDATE fruits SET fruit_name = 'PineApple';

-- 조건을 지정해야 원하는 행만 수정할 수 있다
UPDATE fruits
SET
    fruit_name = 'PineApple',
    fruit_price = 5000
WHERE
    fruit_name = 'Apple';
    
ROLLBACK; -- 변경사항을 모두 취소하고 가장 최근의 COMMIT 상태로 돌아간다 (DCL)

/*
    # 테이블 데이터 삭제하기
    
    - DELETE FROM 테이블에 WHERE 조건절;
    - 
*/

-- 조건을 적지 않으면 모든 행이 삭제되므로 주의해야 한다
DELETE FROM fruits;

-- 조건을 적어야 원하는 행만 삭제 가능
DELETE FROM fruits WHERE fruit_grade IS NULL;

ROLLBACK;

SELECT * FROM fruits WHERE country_id = 'KR';
SELECT * FROM fruits;
DROP TABLE fruits;

-- 연습1: 직접 설계하고 정의했던 테이블에 알맞은 데이터들을 넣어보세요

--- 테이블 이름  :  어린이
--        - 컬럼명   :  이름 / 나이 / 전화번호 / 생일...
--        - 각 컬럼의 타입 : VARCHAR2/ NUMBER / NUMBER / DATE
--        - 기본키 컬럼 : 
--        - 외래키 컬럼 : 
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
) VALUES (805, '토트넘', '다니엘 레비', 7);

-- 연습2: 두 테이블 이상을 JOIN하여 원하는 데이터를 조회해보세요






