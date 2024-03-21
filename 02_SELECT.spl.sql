-- SELSCT

/*
    #
    
    - ���ϴ� ���̺��� ���ϴ� �÷��� ��ȸ�� �� �ִ� ������
    - ���� �ɷ��� ��ȸ�� ���� ,�� ����Ѵ�
    - �÷��� �ڸ��� *�� ���� ���� ��� �÷��� �����Ѵ�
    - �÷���� ���̺���� ��ҹ��ڸ� �������� �ʴ´�
*/
SELECT
    country_name,
    country_id
FROM
    countries;

SELECT
    country_id,
    country_name
FROM
    countries;

SELECT
    *
FROM
    countries;

SELECT
    country_name,
    country_id
FROM
    countries; 

-- ����1 : ��� �μ�(departments)�� �μ���ȣ�� �μ����� ��ȸ�غ�����
SELECT
    departments_id,
    departments_name
FROM
    departments;

-- ����2 : ��� ���(employees)�� ���/�̸�/����/������� ��ȸ�غ�����
SELECT
    employees_id,
    first_name,
    hire_date
FROM
    employees;

/*
    # DESC ���̺�� (describe)
    
    - �ش� ���̺��� �÷� ������ �� �� �ִ�
    - �÷���, NULL ���� ����, �÷� Ÿ�� �� ũ�⸦ �� �� �ִ�
    
    # NUMBER(n), NUMBER(n,m)
    
    - t\���� �����͸� ������ �� �ִ� �÷� Ÿ��
    - ���ڰ� �ϳ��� ���������� ������ ���̸� ��Ÿ����
    - ���ڰ� �δ� ���������� ���� ��ü�� ���̿� �Ҽ��� �ڸ����� ��Ÿ����

    NUMBER(6) : ���� 6�ڸ�
    NUMBER(8, 2) : ���� 6�ڸ� + �Ҽ� 2�ڸ�
    NUMBER(2, 2) : �Ҽ� 2�ڸ�
    
    # VARCHAR2(n)
    
    - ���ڸ� ������ �� �ִ� Ÿ��
    - ����Ǵ� �������� ũ�⿡ ���� �˸��� ������ ����ϵ��� ����Ǿ� �ִ�
    - ���� ������ ȿ�������� ����� �� �ִ�
    
    # CHAR(n)
    
    - ���ڸ� ������ �� ������ ũ�Ⱑ �ڵ����� �������� �ʴ� �÷� Ÿ��
    - ������ Ÿ�� ũ�̿� ������ �ʰ� ������ ������ �����Ѵ�
    - �ش� �÷��� ���ݿ� ���� ���� ������ ���� ������ �� �ִ�
    - ���� �ڵ� (KR,)ó�� ���̰� �����¾� �ִ� �ุ ���� �÷��� 
      CHAR Ÿ���� �� ȿ������ �� �ִ�
      
      # DATE
      
      - ��¥ �� �ð� �����͸� ������ �� �ִ� �÷� Ÿ��
*/
DESC countries;
DESC employees;

SELECT
    *
FROM
    employees;


--  # �÷� ��ȸ�� AS�� �̿��� �ش� �÷��� �̸��� ���ϴ� �̸����� �����Ͽ� ��ȸ�� �� �ִ�
SELECT
    first_name AS �̸�,
    salary     AS ����
FROM
    employees;

-- # �÷��� ��� �����ڸ� Ȱ���Ͽ� �� �÷��� ����� ����� ��ȸ�� �� �ִ�
SELECT
    salary     AS "�� ��ġ",
    salary * 2 AS "�� ��ġ!!",
    salary * 3 AS "�� ��ġ!!",
    first_name AS "�̸�"
FROM
    employees;

-- # �÷������� ����� �� �ִ�  
SELECT
    *
FROM
    employees;

SELECT
    employee_id,
    first_name,
    job_id,
    commission_pct * salary AS "�� �� Ŀ�̼�"
FROM
    employees;
    
    
-- # NVL (column, value) �Լ�
--  - ����� �� �ش� �÷� ���� null�� ��� ��� ����� ���� �������ش� 
SELECT
    employee_id,
    first_name,
    job_id,
    nvl(commission_pct, 0) * salary AS "�� �� Ŀ�̼�"
FROM
    employees;
    
-- # �÷��� �̾���̱� ����ϱ�
SELECT
    first_name
    || ' '
    || last_name AS "salary"
FROM
    employees;

SELECT
    first_name
    || ':'
    || salary AS "salary"
FROM
    employees;

SELECT
    salary
    || '/'
    || nvl(commission_pct, 0) AS "salary"
FROM
    employees;

-- # SELECT DISTINCT : �� �����͸� �� ������ ��ȸ�Ѵ� (�������� ���� �� ��ȸ)
SELECT DISTINCT
    job_id
FROM
    employees;

SELECT DISTINCT
    department_id
FROM
    employees;

SELECT DISTINCT
    first_name
FROM
    employees;
        
-- ����1 : ��� ������� ���/Ǯ����/��å/����/Ŀ�̼Ǳݾ��� ��ȸ�غ�����
SELECT
    employee_id,
    first_name
    || ' '
    || last_name AS "FULL_NAME",
    job_id, 
    salary * 12,
    nvl(commission_pct, 0) * salary AS "Ŀ�̼Ǳݾ�"
FROM
    employees;