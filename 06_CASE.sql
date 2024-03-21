-- 06_CASE.spl

/*
    # CASE
    
    -DECODEsms switch-case처럼 정확하게 일치하는 경우만 매칭이 가능하다
    - case는 if문처럼 원하는 조건에 따라 원하는 동잗을 할 수 있다
    
    
    CASE
        WHEN 조건 THEN 출력값
        WHEN 조건2 THEN 출력값
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
    
    