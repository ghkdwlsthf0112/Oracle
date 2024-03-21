-- 04_집합.sql

SELECT * FROM employees; --107명

SELECT * FROM employees WHERE first_name LIKE '%a%'; -- 66명
SELECT * FROM employees WHERE first_name LIKE '%e%'; -- 56명

-- INTERSECT : 교집합

-- 이름에 a가 포함되고
SELECT * FROM employees WHERE first_name LIKE '%a%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%e%'; --27명

-- union :합집합

-- 이름에 a가 호함되거나 또는 e가 포함되는 모든 사원들을 조회
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION
SELECT * FROM employees WHERE first_name LIKE '%e%'; --95명

-- union all : 합집합 (중복행 제거 안함)

-- 이름에 a가 포함되는 사원들을 모두 조회한 후 이름에 e가 포함
SELECT * FROM employees WHERE first_name LIKE '%a%'
UNION ALL
SELECT * FROM employees WHERE first_name LIKE '%e%'; --122행

-- minus : 차집합
SELECT * FROM employees WHERE first_name LIKE '%a%'
MINUS
SELECT * FROM employees WHERE first_name LIKE '%e%';

-- first_name에 e는 포함되지만 a는 포함되지 않는 사원들을 조회
SELECT * FROM employees WHERE first_name LIKE '%e%'
INTERSECT
SELECT * FROM employees WHERE first_name LIKE '%a%';











