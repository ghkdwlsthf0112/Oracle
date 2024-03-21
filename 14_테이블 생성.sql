-- 14_테이블 생성.sql

/*
    # CRUD
    
    - 대부분의 프로그램들이 가지고 있는 기본적인 기능들
    - Create (데이터 생성)
    - Read   (데이터 읽기)
    - Update (데이터 수정)
    - Delete (데이터 삭제)


    # DML (Deta Man 데이터 조작)
    
    - 테이블의 데이터를 조작하는 명령어들
    - INSERT : 테이블에 데이터 추가하기 
    - SELECT : 테이블의 데이터 읽기
    _ UPDATE : 테이블의 데이터 수정하기
    - DELETE : 테이블의 데이터 삭제하기
    
    # DDL (Deta) 데이터 정의어
    
    - 다양한 DB 오브젝트를 정의하는 명령어
    (* DB 오브젝트 : 테이블, 뷰, 인덱스, 계정, ...)
    - CREATE : DB 오브젝트 생성
    - ALTER  : DB 오브젝트 수정
    - DROP   : DB 오브젝트 삭제
    - TRUNCATE : DB 오브젝트 완전 삭제 (복구 불가능)
    
    
    # DCL (데이터 제어 능력)
    
    - 데이터의 희름을 제어하기 위해 사용하는 명령어들
    - GRANT ; 권한 여부 (권한이 없으면 데이터 접근을 막는다)
    - REVOKE : 권한 회수
    - ROLLBACK : 작업 되돌리기
    - COMMIT : 작업 확정짓기 (롤백이 불가능한 상태로 만들기)
*/

/*
    # 테이블 생성하기
    
    Create TABLE 테이블명 (컬럼1 커럼타입1, 컬럼2 컬럼타입2, ...) 

*/
CREATE TABLE fruit (
    fruit_name VARCHAR2(30),
    fruit_price NUMBER(6),
    fruit_grade VARCHAR2(2),
    fruit_id CHAR(2)
);

DESC fruits;
SELECT * FROM countries;

-- # 테이블 삭제 : DROP TABLE 테이블명
DROP TABLE fruits;

-- DROP으로 삭제된 DB 오브젝트는 휴지통에서 확인할 수 있다
SHOW recyclebin;

-- 휴지통에 있는 테이블 복구하기
FLASHBACK TABLE fruits TO BEFORE DROP;

-- 휴지통 비우기
PURGE recyclebin;

-- 기존 테이블을 복사하여 새 테이블 만들기
CREATE TABLE employees2 AS (SELECT * FROM employees);

-- 테이블의 데이터 및 구조가 함께 복사된다
SELECT * FROM employees2;
DESC employees2;

-- 여러가지 테스트를 마음놓고 할 수 있다
SELECT * FROM employees2 INNER JOIN departments USING (department_id);

-- 테이블 구조만 복사하기 (데이터는 복사하고 싶지 않을 때)
CREATE TABLE employees3 AS (SELECT * FROM employees WHERE 1 = 0);

-- 일부러 거짓 조건을 사용하여 테이블의 구조만 복사
DESC employees3;
SELECT * FROM employees3;

-- TRUNCATE TABLE 테이블명 : 테이블 구조만 남기고 모든 행을 잘라버린다
TRUNCATE TABLE employees2;
SELECT * FROM employees2;

DROP TABLE employees2;
DROP TABLE employees3;
PURGE recyclebin;

/*
    저번에 설계했던 1:N 관계의 개체들을 테이블로 생성해보세요
    
        - 테이블 이름  :  어린이
        - 컬럼명   :  이름 / 나이 / 전화번호 / 생일...
        - 각 컬럼의 타입 : VARCHAR2/ NUMBER / NUMBER / DATE 
        - 기본키 컬럼 : 
        - 외래키 컬럼 : 
        
        
        - 테이블 이름  :  축구팀
        - 컬럼명   :  팀번호(PK)/ 팀이름(VARCHAR2)/구단주(VARCHAR2)/홈구장(NUMBER)
        - 각 컬럼의 타입  : 
        - 기본키 컬럼 : 팀번호
        - 외래키 컬럼 : 경기장 번호
        
        - 테이블 이름  :  경기장
        - 컬럼명   :  경기장번호(PK), 수용인원 / 주소 / 경기장타입 /...
        - 각 컬럼의 타입 : NUMBER / NUMBER / VARCHAR2/ CHAR/ ...
        - 기본키 컬럼 : 경기장 번호
        - 외래키 컬럼 : X
        
         - 테이블 이름  :  축구 선수
        - 컬럼명   : 선수번호 / 이름 / 나이 / 포지션 / 국적 / 소속 팀...
        - 각 컬럼의 타입 : NUMBER / VARCHAR2/ NUMBER / CHAR / CHAR / NUMBER
        - 기본키 컬럼 : 선수번호
        - 외래키 컬럼 : 국적, 소속팀번호
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
    team_leader_id NUMBER(8), -- 1:1 관계이지만 외래키를 사용하는 경우
    home_stadium_id NUMBER(5)
);

CREATE TABLE SoccerPlayer (
    player_id NUMBER(8),
    player_eng__name VARCHAR2 (25),
    player_kor__name VARCHAR2(40),
    player_position VARCHAR2(3),
    player_back_namber NUMBER(2),
    countly_id CHAR(2), --countries
    team_id NUMBER(5) --SoccerTeam 테이블로부터 땡겨올 외래키
);











