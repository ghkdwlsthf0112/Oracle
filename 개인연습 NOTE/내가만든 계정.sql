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

INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�̽±�', '���', 800.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�ְ���', '�븮', 1600.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�豤��', '�븮', 1200.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '������', '����', 2900.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�̰��', '�븮', 1200.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�̽¿�', '����', 2800.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '����ǥ', '����', 2400.00, 10);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '������', '����', 3000.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�����', '����', 5000.00, 10);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '�̵���', '�븮', 1500.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '���ȣ', '���', 1100.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '������', '���', 900.00, 30);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '����ȣ', '����', 3000.00, 20);
INSERT INTO EMP_TEST VALUES (EMPNO_seq.nextval, '������', '���', 1300.00, 10);
 
SELECT COUNT(*) FROM emp_test GROUP BY emp_test.deptno;

select MAX(sal), MIN(sal) from emp_test;

UPDATE emp_test SET job = '����', deptno = 30 WHERE empno = 55;

-- DELETE FROM EMP_TEST;