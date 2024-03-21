-- 09_JOIN.spl

/*
    # �⺻Ű (Primary Key. PK)
    
    - �� ���̺��� �ϳ��� ���� �����ϰ� ������ �� �ִ� �÷�
    - �� ���̺��� �⺻Ű�� �ϳ��� ������ �� �ִ�
    - �⺻Ű�� ������ �÷����� �ߺ� ���� ����� �Ѵ�
    - �⺻Ű�� ������ �÷����� null�� ����� �Ѵ�
    
    # �ĺ�Ű (Candidate Key)
    
    - �⺻Ű�� �� �ڰ��� ������ �⺻Ű�� �������� ���� �÷�
    
    # �ܷ�Ű (Foreign Key)
    
    - �ٸ� ���̺����� �⺻Ű(�Ǵ� �ĺ�Ű)������ ���� ���̺����� 
      �ߺ��Ǵ� ���� ���� �Ϲ� �÷��� ���
      ex : employees�� department_it�� �ܷ�Ű
            departments�� department_id�� �⺻Ű
    - �ܷ�Ű �÷����� �����ϴ� �⺻Ű(�Ǵ� �ĺ�Ű) �÷��� ���� ����
      �����ؼ��� �ȵȴ� (���� ���Ἲ)
    - � ���̺��� �⺻Ű(�Ǵ� �ĺ�Ű) �� �ٸ� ���̺��� �ܷ�Ű�� �����Ǿ��ٸ�
      �� ���̺����� 1:N�� ����(�ϴ�� ����)�� ���Ǿ��ٰ� �� �� �ִ�
      ex: �μ� �ϳ����� ����� �������� �Ҽ��� �� �ִ�
      
      - ��ü �� ������ ����
      
      - 1:1 ���� : ���� ���̺� �ȿ� �÷����� �ִ´�
      - 1:N ���� : �μ� - ���, �Խñ� - ���, ȸ�� - �Խñ�, ...
      - N:N ���� : �п� - �л�, ���� - �л�, ���� - ����, ��Ʈī - �뿩��
      
      # JOIN
      
      - �⺻Ű�� �ܷ�Ű�� ���� ���谡 �����Ǿ� �ִ� ���̺��� ������ �����ؼ�
      ���ϴ� ������ ����� ��ȸ�ϴ� ��
*/

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

/*
    # CROSS JOIN
    
    - JOIN�� ���Ǵ� ���̺���� ��� ���� �����Ͽ� ���� �� �ִ� 
    ��� ��츦 ����ϴ� JOIN
    - ���� ��� ���� �������� ���� ������� ����
*/
SELECT * FROM employees; --107rows
SELECT * FROM departments; --27row
SELECT * FROM employees, departments;

/*
    CROSS JOIN�� �ϸ� �� ���̺� �����ϴ� ��� �÷��� ��ȸ�� �� �ִ�
    ���� �̸��� �÷��� �����ϴ� ��쿡�� �ݵ�� ��� ���̺� �Ҽ����� ��Ȯ�ϰ� �ؾ��Ѵ�
*/
SELECT
    employee_id,
    first_name,
    last_name,
    employees.department_id AS "emp_dept_id",
    departments.department_id AS "dept_dept_id",
    department_name
FROM
    employees,
    departments;
    
 /*
    ���̺� �̸��� �ʹ� �� ���� ���� �� ���̺� �̸����� ��Ī�� ������ �� �ִ�
 */
    
SELECT
    employee_id,
    first_name,
    last_name,
    emp.department_id AS "emp_dept_id",
    dept.department_id AS "dept_dept_id",
    department_name
FROM
    employees emp,
    departments dept;

/*
    # EQUI JOIN
    
    - �� ���̺��� ���� ������ ���� ���� �÷�(�ַ� �⺻Ű�� �ܷ�Ű)���� �̿��Ͽ�
    ���� ���� �ǹ��ִ� �����͵鸸 �÷����� JOIN   
*/
SELECT
    employee_id,
    first_name,
    department_name
FROM
    employees   emp,
    departments dept
WHERE
    emp.department_id = dept.department_id
ORDER BY
    employee_id ASC;
    
-- ����1 : ��� ������� �����ȣ/�̸�/��å�̸�(job_title)�� ��ȸ�غ�����
SELECT
    e.employee_id,
    e.first_name,
    j.job_title
FROM
    employees e,
    jobs j
WHERE
    e.job_id = j.job_id
ORDER BY
    employee_id;
    
-- ����2: job_title�� Programmer�� ������� �����ȣ/�̸�/�μ����� ��ȸ�غ�����


-- ����3: Ŀ�̼��� �޴� ������� ��å�̸�(job_title)�� � ���� �ִ��� ��ȸ�غ�����
SELECT DISTINCT
    job_title
FROM
    employees e,
    jobs      j
WHERE
        e.job_id = j.job_id
    AND e.commission_pct IS NOT NULL;

-- ����4: Settle���� �ٹ��ϴ� ������� �̸�/����/�μ���/�����ȣ�� ��ȸ�غ�����
--      Hint. Seattle�� locations ���̺� �ִ�





/*
    (1) ����� �μ�ó�� 1:N ����� ������ �� �ִ� ���� ��ʸ� �ϳ� �����غ�����
        PARENTS - CHILD
        
    (2) 1:N ����� ������ �� ��ü�� ���̺� ���·� �����غ�����
    
        - ���̺� �̸�  :  �౸��
        - �÷���   :  ����ȣ(PK)/ ���̸�(VARCHAR2)/������(VARCHAR2)/Ȩ����(NUMBER)
        - �� �÷��� Ÿ��  : 
        - �⺻Ű �÷� : ����ȣ
        - �ܷ�Ű �÷� : ����� ��ȣ
        
        - ���̺� �̸�  :  �����
        - �÷���   :  ������ȣ(PK), �����ο� / �ּ� / �����Ÿ�� /...
        - �� �÷��� Ÿ�� : NUMBER / NUMBER / VARCHAR2/ CHAR/ ...
        - �⺻Ű �÷� : ����� ��ȣ
        - �ܷ�Ű �÷� : X
        
         - ���̺� �̸�  :  �౸ ����
        - �÷���   : ������ȣ / �̸� / ���� / ������ / ���� / �Ҽ� ��...
        - �� �÷��� Ÿ�� : NUMBER / VARCHAR2/ NUMBER / CHAR / CHAR / NUMBER
        - �⺻Ű �÷� : ������ȣ
        - �ܷ�Ű �÷� : ����, �Ҽ�����ȣ
*/












