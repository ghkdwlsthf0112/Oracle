-- 06_CASE.spl

/*
    # CASE
    
    -DECODEsms switch-caseó�� ��Ȯ�ϰ� ��ġ�ϴ� ��츸 ��Ī�� �����ϴ�
    - case�� if��ó�� ���ϴ� ���ǿ� ���� ���ϴ� ������ �� �� �ִ�
    
    
    CASE
        WHEN ���� THEN ��°�
        WHEN ����2 THEN ��°�
    END

*/
SELECT
    first_name,
    job_id,
    CASE
        WHEN job_id = 'IT_PROG' THEN salary * 1.2
        WHEN job_id LIKE '%_CLERK' THEN salary * 1.03
        ELSE salary
    END AS "increased_salary"
FROM 
    employees;
    
    