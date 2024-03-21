-- 13_���� ����.spl

/*
    # ���� ����
    
    - ������ ���ο� ���Ե� �� �ٸ� ������
    - ���� ������ �����ϰ� �ִ� ������ ���� ������� �θ���
    - ���� ������ ���� ����� �� ������ ���� �������� ���� ���� �� ����������
      ���� �� ���������� �з��ȴ�
    - ���� ���� ����� ���Ѵٸ� �ַ� �⺻�⸦ ����Ͽ� �� ���� ��ȸ�Ѵ�
    - ���� �� �������� ������� �ϴ� ������
      ���� �� ���������� ������� �ϴ� �����ڰ� �������� �ִ�
    - ���� ������ ����� ���ؾ� �ϴ� ������� ���ǰų� ���̺� ������� Ȱ��� �� �ִ�
    
    # ���� �� ���� ����
    
    - ���� ������ ���� ����� �� �� ���� ���
    - ������ �������� ������ (=, >, <, <>, *=, >=, ...)
    
    # ���� �� ���� ����
    
     - ���� ������ ���� ����� 2�� �̻��� �� �ִ� ���
    -  ������ �������� ������ (IN. AND, SOME, ALL, ...) 
*/

-- 1. �񱳰� ��� �������� Ȱ���ϱ�
SELECT * FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE employee_id = 160);

-- ���� ������ ����� ���� ���� ������ ��� �Ϲ� �����ڴ� ����� �� ����
SELECT * FROM employees
WHERE salary >= (SELECT salary FROM employees WHERE first_name = 'Alexander');

-- 2. ��ȸ�ؾ� �� ���̺� ��� �������� ����ϱ�
SELECT * FROM (SELECT first_name, job_id FROM employees WHERE job_id = 'IT_PROG');

/*
    # ���� �� ���� ���� ������
    
    - IN     : ���� ���� �� ��ġ�ϴ� ���� �ϳ��� ������ true
    - ANY    : ���� ���� �� ������ ������Ű�� ���� �ϳ��� ������ true
    - SOME   : ANY�� ����
    - ALL    : ���� ������ ������ ��� ������Ű�� ��쿡�� true
    - EXISTS : ���� �ϳ��� ��ȸ�Ǹ� true
*/

-- IN

-- ex : Alexander��� ����� �����ִ� ��å�� ������ �ִ� ��� ����� ��ȸ
SELECT * FROM employees
WHERE job_id IN (SELECT job_id FROM employees WHERE first_name = 'Alexander');

-- ANY, SOME
SELECT * FROM employees WHERE salary >= ANY(5000, 8000, 9000, 15000);
SELECT * FROM employees WHERE salary = SOME(5000, 8000, 9000, 15000);

-- ex : 60�� �μ� ����� �� ���� �� ���� ������� ���� ���� ������ ��ȸ
SELECT * FROM employees
WHERE salary > ANY(SELECT salary FROM employees WHERE department_id = 60);

SELECT * FROM employees WHERE department_id = 60;

-- ALL

SELECT * FROM employees WHERE salary > ALL(5000, 8000, 9000, 15000);

-- ex: 60�� �μ��� ��� ����麸�� �� �߹��� ����� ��ȸ
SELECT * FROM employees 
WHERE salary > ALL(SELECT salary FROM employees WHERE department_id = 60);

-- EXISTS

-- ex: �ִ� �޿��� �޴� ����� �ִ� �μ��� ��ȸ
SELECT department_name FROM departments d
WHERE EXISTS (SELECT
    *
FROM
         employees e
    INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    e.salary = j.max_salary AND e.department_id = d.department_id);

-- ����1: job_title�� Manager�� ���ԵǴ� ������� ��ȭ��ȣ�� �̸����� ��ȸ�غ�����
SELECT * FROM employees WHERE job_id IN 
(SELECT job_id FROM jobs WHERE job_title LIKE '%Manager%')
ORDER BY employee_id;


-- ����2: ������� 2007���� ������� �Ҽ��� �μ����� ���� ���� ���̹��� ������� ��ȸ�غ�����
SELECT * FROM employees WHERE (salary, department_id)
IN (SELECT max(salary), department_id FROM employees
WHERE department_id IN
(SELECT department_id FROM employees WHERE hire_date LIKE '07/%')
GROUP BY department_id) ORDER BY employee_id;



-- ���� ������ 2�� �̻��� �ѹ��� ���ϴ� ��� (���� �� ��������)
SELECT * FROM employees WHERE 
(first_name, last_name) IN (('Steven', 'King'), ('Neena', 'Kochhar'));


