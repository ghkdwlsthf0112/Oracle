CREATE TABLE EMP_TEST(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(10),
    SAL NUMBER(7,2),
    DEPTNO NUMBER(2)
);

SELECT * FROM EMP_TEST;

CREATE SEQUENCE EMPNO_seq START WITH 1001 INCREMENT BY 1 NOCACHE;
drop sequence EMPNO_seq;

INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '이승기', '사원', 800.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '최경주', '대리', 1600.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '김광현', '대리', 1200.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '양의지', '차장', 2900.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '이경규', '대리', 1200.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '이승엽', '차장', 2800.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '나대표', '차장', 2400.00, 10);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '유현주', '부장', 3000.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '김미현', '사장', 5000.00, 10);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '이동국', '대리', 1500.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '장민호', '사원', 1100.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '류현진', '사원', 900.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '강백호', '부장', 3000.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '원태인', '사원', 1300.00, 10);
 
SELECT COUNT(*) FROM emp_test GROUP BY emp_test.deptno;

select MAX(sal), MIN(sal) from emp_test;

UPDATE emp_test SET job = '차장', deptno = 30 WHERE empno = 55;

-- DELETE FROM EMP_TEST;