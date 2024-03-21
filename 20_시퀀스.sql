-- 20_시퀀스.sql

/*
    # 시퀀스
    
    - 기본기로 사용허기 편리하도록 변호를 자동으로 생성해주는 DB 오브젝트
    
    CREATE SEQUENCE 시퀀스명
                    [START WITH n] - 시작 번호 설정
                    [INCREMENT BY n] - 증가 숫자 설정
                    [MAXVALUE n | NOMAXVALUE] - 최대 숫자 설정 
                    [MINVALUE DI NOMINVALUE]- 최소 숫자 설정 
                    [CYCLE I NOCYCLE] - 숫자 순환 여부 설정 
                    [CACHE n I NOCACHE]- 번호를 미리 만들어놓을 양을 설정
*/

-- 시퀀스 데이터 딕셔너리 뷰
SELECT * FROM user_sequences;
SELECT * FROM all_sequences;

CREATE SEQUENCE coffee_seq1;

CREATE SEQUENCE fruit_id_seq START WITH 10 INCREMENT BY 10;

-- 테스트용 테이블
SELECT * FROM dual;
SELECT 10 * 10 FROM dual;
SELECT upper('Apple') FROM dual;
SELECT upper('Smith') FROM dual;

-- 시퀀스.nextvalue : 다음 번호를 사용한다 (다시는 이전 번호로 돌아갈 수 없다)
SELECT coffee_seq.nextval FROM dual;
SELECT fruit_id_seq.nextval FROM dual;

--시퀀스.currval : 현재번호를 확인한다 ()을 실행한 이후에만 확인 가능
SELECT fruit_id_seq.currval FROM dual;
SELECT coffee_seq.currval FROM dual;

-- 시퀀스를 사용해 테이블을 INSERT하기
ALTER TABLE fruits MODIFY (
    fruit_id NUMBER(10)
    CONSTRAINT fruit_id_pk PRIMARY KEY
);

-- 기본기 값을 직접 계산하면 힘들기 때문에 시퀀스를 만들어 사용한다
INSERT INTO fruits(fruit_id, fruit_name, fruit_price)
VALUES (fruit_id_seq.nextval, 'Apple', 1234);


CREATE SEQUENCE bank_waiting_seq 
    START WITH 10 INCREMENT BY 20 
    MINVALUE 10 MAXVALUE 100 CYCLE NOCYCLE;

DROP SEQUENCE bank_waiting_seq;
SELECT bank_waiting_seq.nextval FROM dual;

-- 시퀀스 삭ㄱ제하기 : DROP SEQUENCE 시퀀스명;
-- 시퀀스 수정하기 : ARTER SEQUENCE [옵션은 CREATE SEQUENCE와 같음]











