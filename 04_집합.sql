-- 04_����.sql

SELECT * FROM employees; --107��

SELECT * FROM employees WHERE first_name LIKE '%a%'; -- 66��
SELECT * FROM employees WHERE first_name LIKE '%e%'; -- 56��

-- INTERSECT : ������

-- �̸��� a�� ���Եǰ�
SELECT * FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%e%'; --27��

-- union :������

-- �̸��� a�� ȣ�Եǰų� �Ǵ� e�� ���ԵǴ� ��� ������� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT * FROM employees WHERE first_name LIKE '%e%'; --95��

-- union all : ������ (�ߺ��� ���� ����)

-- �̸��� a�� ���ԵǴ� ������� ��� ��ȸ�� �� �̸��� e�� ����
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION ALL
SELECT * FROM employees WHERE first_name LIKE '%e%'; --122��

-- minus : ������
SELECT * FROM employees WHERE first_name LIKE '%a%'
MINUS
SELECT * FROM employees WHERE first_name LIKE '%e%';

-- first_name�� e�� ���Ե����� a�� ���Ե��� �ʴ� ������� ��ȸ
SELECT * FROM employees WHERE first_name LIKE '%e%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%a%';











