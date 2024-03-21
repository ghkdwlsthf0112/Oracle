-- 08_����.spl

/*
    # ORDER BY �÷��� (ASC|DESC)
    
    - ��ȸ�� ���ϴ� �÷� �������� �����Ͽ� ��ȸ�ϴ� ����
    - ASC :�������� (Ascending)
    - DESC : �������� (Descending)
    - �Է��� ���� ������ �⺻������ ASC�� �����Ѵ�
*/

-- ���������� null�� ���� ���߿� �����Ѵ�
SELECT * FROM employees ORDER BY first_name;
SELECT * FROM employees ORDER BY first_name DESC;
SELECT * FROM employees ORDER BY phone_number ASC;

-- ���������� null�� ���� ���� �����Ѵ�
SELECT first_name, job_id, commission_pct FROM employees
ORDER BY commission_pct DESC;


-- ���� ������ ������ ������ �� �ִ�

-- ex �μ���ȣ�� �����ϰ�, �μ���ȣ�� ������ �� �������� �����ϰ�,
-- ���� ������ �̸��� �������� ���Ѵ�
SELECT * FROM employees ORDER BY department_id ASC, last_name ASC;

SELECT * FROM employees 
ORDER BY department_id, last_name, first_name, salary DESC;

-- ����1: �̸��� i�� ���ԵǾ� �ִ� ������� ���� ���� ���� ������ ��ȸ

-- upper(column) : ���� ��� �빮�ڷ� ����
-- lower(column) : ���� ��� �ҹ��ڷ� ����
SELECT * FROM employees WHERE lower(first_name) LIKE '%i%' ORDER BY salary DESC;

-- ����2: ��� ������� �� �������� �������� �����ϰ�
--       ���� ���� �̸� �������� �������� �����Ͽ� ��ȸ
SELECT * FROM employees ORDER BY last_name ASC, first_name ASC;

-- ����3: �� �μ��� ��� ����, ��� ���� ��ȸ�ϰ� ��� �������� �������� �����Ͽ� ��ȸ
SELECT
    department_id,
    AVG(salary),
    COUNT(*)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    "��� ����" DESC;

/*
    # �Ҽ��� �ڸ��� �Լ�
    
    - ceil(value) : ������ �ø�
    - floor(value) : ������ ����
    - round(value, num) : �Ҽ��� �ݿø��ϱ�
    - trunc(value, num) : �Ҽ��� �ڸ���
*/



