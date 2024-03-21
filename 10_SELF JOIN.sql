-- 10_SELF JOIN.spl

/*
    # SELF JOIN
    
    - �ϳ��� ���̺��� �ڱ� �ڽ��� �÷��� JOIN�Ͽ� ���ϴ� �����͸� ���� ���
    - �ڱ� �ڱ� ���̺��� �⺻Ű�� �ܷ�Ű�� ��� ����ϴ� ���
        ex: employee�� manager
    - ���� ������ ��� ��� �÷��� �̸��� �����ϹǷ� �÷��� �տ� ���̕����� 
*/
SELECT
    emp.first_name || ' ' || emp.last_name AS "��� �̸�",
    mgr.first_name || ' ' || mgr.last_name AS "�Ŵ��� �̸�"
FROM
    employees emp,
    employees mgr
WHERE
    emp.manager_id = mgr.employee_id;
    
-- ����1: �Ŵ��� �̸��� e�� ���ԵǴ� ������� ��� ������ ��ȸ�غ����� 
SELECT
    emp.*
FROM
    employees emp,
    employees mgr
WHERE
        emp.manager_id = mgr.employee_id
    AND lower(mgr.first_name) LIKE '%e%'
ORDER BY
    emp.employee_id;

-- ����2: ����ϴ� ����� 8�� �̻��� �Ŵ������� ������ ��ȸ�غ�����
-- group by, having, in
SELECT
    *
FROM
    employees
WHERE
    employee_id IN (
        SELECT
            manager_id
        FROM
            employees
        GROUP BY
            manager_id
        HAVING
            COUNT(*) >= 8
    );


    
    