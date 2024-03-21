-- 07_�׷� �Լ�.spl

/*
    #
    
    - ���ϴ� �÷��� �������� �׷��� ��� ����� �� �ִ� �Լ���
    - �׷��� ���� �� ������ �Ǵ� �÷��� GROUP BY���� ������ �� �ִ�
    - �׷� �Լ��� ����ϸ� �Ϲ� �÷��� �Բ� ����� �� ����
    - �׷� �Լ��� ����ϸ� �׷� �Լ��� ����� 
*/
-- sum(column) : �ش� �÷��� ������ �����ִ� �׷� �Լ�

SELECT
    SUM(salary)
FROM
    employees; -- ��� ������� ���� ����

-- ang : �� �׷��� �ش� �÷� ��հ��� �� �� �ִ�
SELECT
    AVG(salary),
    SUM(salary) job_id
FROM
    employees
GROUP BY
    job_id;

-- count : �ش� �÷��� ���� ������ ���� �� �ִ� (null���� ���� �ʴ´�)
SELECT
    COUNT(commission_pct)
FROM
    employees;

SELECT
    department_id,
    COUNT(commission_pct)
FROM
    employees
GROUP BY
    department_id;

-- max : �׷캰 �� �÷� �ִ밪�� ���� �� �ִ�]
SELECT
    MAX(salary),
    job_id
FROM
    employees
GROUP BY
    job_id;


-- ����1: �� ��å�� ��� ������ ���غ����� (�� ���� �ƴ�)
SELECT
    AVG(salary * 12)
    || '$',
    job_id
FROM
    employees
GROUP BY
    job_id;

-- ����2: �� �μ����� ���� �ֱٿ� ����� �Ի��� ��¥�� ���� ������ �Ի��� ��¥�� ��ȸ�غ�����
SELECT
    department_id,
    MAX(hire_date) as recently,
    MIN(hire_date) AS oldest
FROM
    employees
GROUP BY
    department_id;
    
 /*
    # having
    
    - �׷� �Լ��� ��� ����� ����� ���� ������ �����ϰ� ���� ��� ����ϴ� ��\����
    - where���� �׷����� ����\ ��  ����Ǳ� ������
      �׷� �Լ��� ����� where���� �������� ����� �� ����
 */
 
 -- ex: ��� ������ 8000�� �Ѵ� ��å�� ��ȸ�ϰ� ���� ��
SELECT AVG(salary * 12), job_id FROM employees 
GROUP BY job_id HAVING AVG(salary) > 8000;    

-- ex: ������ 8000�� �Ѵ� ������� ��å�� ��� 
SELECT avg(salary), job_id FROM employees
WHERE salary > 8000 GROUP BY job_id;

-- ����1: ������ 8õ �޷� �̻��� ����� 3�� �̻��� �μ��� ����غ�����
SELECT department_id FROM employees
WHERE salary >= 8000 GROUP BY department_id HAVING COUNT(*) >=3;
    
    
    