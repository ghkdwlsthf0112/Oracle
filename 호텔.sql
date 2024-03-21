CREATE USER hotelDB IDENTIFIED BY "hotel";

GRANT CREATE SESSION TO hotelDB; -- 해당 계정에 접속할 수 있는 권한을 부여
GRANT CREATE TABLE TO hotelDB; -- 해당 계정에 테이블 생성 권한을 부여
GRANT RESOURCE TO hotelDB;