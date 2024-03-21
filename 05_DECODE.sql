-- 05_DECODE.spl

/*
    # DECODE

    - �ڹ��� switch case�� ������ ����
    - DECODE(col)
*/
SELECT 
    first_name,
    DECODE(department_id,
    10, '������',
    20, '�����ú�',
    30, '���ź�',
    40, '�λ��',
    60, 'IT',
    department_id
) as department_name
FROM 
employees;

SELECT * FROM departments;

/*
    ����: ��å�� ���� ������ ���� �λ�� �޿��� ����غ����� (�̸�/�޿� ����ϱ�)
    
        IT_PROS : 20%
        SB_CLERK : 5%
        ST_CLERK : 3%
        �� �� : ���� ����      
*/
SELECT 
    first_name,
    job_id,
    salary AS Original_salary,
    DECODE( job_id,
        'IT_PROS',salary * 1.2,
        'SB_CLERK', salary *1.05,
        'ST_CLERK', salary * 1.03,
    salary
    ) AS increased_salary
FROM 
employees; 


