-- 12_ANSI JOIN.sql

/*
    # ANSI JOIN
    
    - ANSI���� ������ ǥ�� JOIN ����
    -�ٸ� RDBMS������ ������ �� �ִ� ������ ����
    
    �� ANSI : America National Standard Institura, �̱� ���� ǥ�� �ⱸ
*/

-- CROSS JOIN
SELECT * FROM employees CROSS JOIN departments;

/*
    # INNER JOIN (���� ������ �����ϴ� �ุ �����ϴ� ����)
    
    - ���� ���ǿ���  ON���� ����ϰ� �ٸ� ���ǿ��� WHERE���� ����� �� �ִ�
    - �����ϴ� �� ���̺��� �����ϱ� ���� ����ϴ� �÷��� �̸��� ������ ���
    ON ��� USING Ű���带 ����� �� �ִ�
    - USING�� ����ϸ� ���ο� ����ߴ� �÷��� �̸� �ߺ� ������ �ذ�ȴ�
*/

SELECT
    *
FROM
         employees e
    INNER JOIN departments d ON e.department_id = d.department_id
WHERE
    salary >= 8000;
    
-- ���̺� ���ῡ ���Ǵ� �� �÷��� �̸��� ���� ��� ������ �ξ� ����������
    
SELECT * FROM employees
    INNER JOIN departments USING ( department_id )
WHERE
    salary <= 8000;
    

-- ����1 : ��� ������� �����ȣ/�̸�/��å�̸�(job_title)�� ��ȸ�غ�����
SELECT
    employee_id,
    first_name,
    job_title
FROM
         employees
    INNER JOIN jobs USING ( job_id )
ORDER BY employee_id;
    
-- ����2: job_title�� Programmer�� ������� �����ȣ/�̸�/�μ����� ��ȸ�غ�����
SELECT
    employee_id,
    first_name,
    department_id,
    department_name
FROM
         employees
    INNER JOIN jobs USING ( job_id )
    INNER JOIN department_name USING ( department_id )
WHERE
    job_title = 'Programmer';

-- ����3: Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� � ���� �ִ��� ��ȸ�غ�����
SELECT
    job_title
FROM
         employees
    INNER JOIN jobs USING ( job_id )
WHERE
    commission_pct IS NOT NULL;


-- ����4: Settle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ�� ��ȸ�غ�����
--      Hint. Seattle�� locations ���̺� �ִ�
SELECT
    first_name,
    salary,
    department_name,
    postal_code
FROM
         employees
    INNER JOIN departments USING ( department_id )
    INNER JOIN locations USING ( location_id )
WHERE
    city = 'Seattle'
ORDER BY
    first_name;
/*
    # OUTER JOIN
    
    1. LEFT OUTER JOIN : ������ ���̺� (+)�� �߰��ϴ� ȿ��
    2. RIGHT OUTER JOIN : ���� ���̺� (+)�� �߰��ϴ� ȿ��
    3. FULL OUTER JOIN : ���� ��ο� (+)�� �߰��ϴ� ȿ��
*/
-- LEFT OUTER JOIN : ���� ���̺��� �������� ���ߴ� �࿡ �����ϴ� OUTER JOIN
--                  �����ʿ� (+)�� ���� ȿ��
SELECT * FROM employees LEFT OUTER JOIN departments USING ( department_id )
ORDER BY department_id;

-- RIGHT OUTER JOIN : ������ ���̺��� �������� ���ߴ� �࿡ �����ϴ� OUTER JOIN
--                  ���ʿ� (+)�� ���� ȿ��
SELECT * FROM employees RIGHT OUTER JOIN departments USING ( department_id );

-- ANSI JOIN�� ���� ������ ���ʿ� (+)�� ������ ���Ѵ�
SELECT
    *
FROM
    employees   e,
    departments d
WHERE
    e.department_id (+) = d.department_id (+);

-- FULL OUTER JOIN : �� ���̺� �������� ���ߴ� ���� ��� �巯����    
SELECT * FROM employees FULL OUTER JOIN departments USING ( department_id );

-- ����1: ����̸�/���Ŵ����̸��� ��� ����ϵ� ����ϴ� �Ŵ����� ���� ����� ����غ�����
SELECT
    emp.first_name || ' ' || emp.lst_name AS "����̸�",
    mgr.first_name || ' ' || mgr.lst_name AS "���Ŵ��� �̸�"
FROM
      employees emp
   RIGHT OUTER JOIN employees mgr ON emp.manager_id = mgr.employee_id;

-- ����2: ��� ������ �Ҽӵ����̸�/�ּ�/�����ȣ/�ҼӺμ����翩��*�� ��ȸ�غ�����
SELECT
    city,
    street_address,
    postal_code,
    location_id,
    CASE
        -- �������� ���ߴ� �� (�Ҽ� �μ��� ���� ���)
        WHEN department_id IS NULL THEN 'F'
        -- �������� ������ �����ϴ��� ���� ����� T�̱� ������ DISTINCT�� ���డ��
        ELSE 'T'
    END AS "hasDept"
FROM
    locations LEFT OUTER JOIN departments USING (location_id)
ORDER BY
location_id;

