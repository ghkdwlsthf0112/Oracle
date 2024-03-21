
CREATE SEQUENCE event_prize_id_seq NOCACHE NOCYCLE;

CREATE TABLE EventPrizes (
    prize_id NUMBER(3)
        CONSTRAINT prize_id_pk PRIMARY KEY,
    prize_name VARCHAR2(20),
    prize_rate NUMBER(3, 3),
    remain_qty NUMBER(3),
    init_qty NUMBER(3)
);
ALTER TABLE eventprizes RENAME CONSTRAINT prize_id_pk TO event_prize_id_pk;
SELECT * FROM eventprizes;


