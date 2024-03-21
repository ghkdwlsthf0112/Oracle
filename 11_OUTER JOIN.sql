-- 11_OUTER JOIN.sql

/*
    # OUTER JOIN
    
    - JOIN ������ �������� ���Ͽ� �������� ���ϴ� ���� �߰��� Ȯ���� �� �ִ� JOIN
    - (+)�� ���� �ʿ� null�� �߰��ؼ� ������ �������� ���ߴ� ���� �巯����
*/
SELECT * FROM employees;

SELECT
    employee_id,
    first_name,
    e.department_id AS "edid",
    d.department_id AS "ddid",
    department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id(+) = d.department_id;

SELECT
    employee_id,
    first_name,
    e.department_id,
    department_name
FROM
    employees   e,
    departments d
WHERE
    e.department_id = d.department_id(+);

-- ����1: �μ���ȣ/�μ���/�ּ�/���ø� ��ȸ�ϵ� �Ҽӵ� �μ��� �ϳ��� ���� ���� ������
--       �Բ� ��ȸ�ϵ��� �غ�����
SELECT d.department_id, d.department_name, street_adress, city 
FROM departments dept, locations loc WHERE dept.location_id(+) = loc.location_id 
ORDER BY dept.department_id;

-- ����2 : �Ҽӵ� ����� ���� �μ��� ��ȸ�غ�����

SELECT
    dept.*
FROM
    employees   emp,
    departments dept
WHERE
        emp.department_id (+) = dept.department_id
    AND emp.employee_id IS NULL
ORDER BY
    dept.department_id;











