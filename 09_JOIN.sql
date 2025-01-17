-- 09_JOIN.spl

/*
    # 기본키 (Primary Key. PK)
    
    - 한 테이블에서 하나의 행을 유일하게 구분할 수 있는 컬럼
    - 각 테이블의 기본키는 하나만 설정할 수 있다
    - 기본키로 설정된 컬럼에는 중복 값이 없어야 한다
    - 기본키로 설정된 컬럼에는 null이 없어야 한다
    
    # 후보키 (Candidate Key)
    
    - 기본키가 될 자격이 있지만 기본키로 설정하지 않은 컬럼
    
    # 외래키 (Foreign Key)
    
    - 다른 테이블에서는 기본키(또는 후보키)이지만 현재 테이블에서는 
      중복되는 값을 지닌 일반 컬럼인 경우
      ex : employees의 department_it는 외래키
            departments의 department_id는 기본키
    - 외래키 컬럼에는 참조하는 기본키(또는 후보키) 컬럼에 없는 값이
      존재해서는 안된다 (참조 무결성)
    - 어떤 테이블의 기본키(또는 후보키) 가 다른 케이블의 외래키로 설정되었다면
      두 테이블간에는 1:N의 관계(일대디 관계)가 향상되었다고 할 수 있다
      ex: 부서 하나에는 사원이 여러명이 소속할 수 있다
      
      - 개체 간 관계의 종류
      
      - 1:1 관계 : 같은 테이블 안에 컬럼으로 넣는다
      - 1:N 관계 : 부서 - 사원, 게시글 - 댓글, 회원 - 게시글, ...
      - N:N 관계 : 학원 - 학생, 선생 - 학생, 과목 - 교수, 렌트카 - 대여자
      
      # JOIN
      
      - 기본키와 외래키로 엮여 관계가 형성되어 있는 테이블의 정보를 종합해서
      원하는 정보로 만들어 조회하는 것
*/

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;

/*
    # CROSS JOIN
    
    - JOIN에 사용되는 테이블들의 모든 행을 조합하여 나올 수 있는 
    모든 경우를 출력하는 JOIN
    - 그저 모든 행을 조합했을 뿐인 쓸모었는 정보
*/
SELECT * FROM employees; --107rows
SELECT * FROM departments; --27row
SELECT * FROM employees, departments;

/*
    CROSS JOIN을 하면 두 테이블에 존재하는 모든 컬럼을 조회할 수 있다
    같은 이름의 컬럼이 존재하는 경우에는 반드시 어느 테이블 소속인지 명확하게 해야한다
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
    테이블 이름이 너무 길어서 적기 싫을 때 테이블 이름에도 별칭을 지정할 수 있다
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
    
    - 두 테이블에서 서로 동일한 값을 지닌 컬럼(주로 기본키와 외래키)들을 이용하여
    으로 부터 의미있는 데이터들만 컬럼내는 JOIN   
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
    
-- 연습1 : 모든 사원들의 사원번호/이름/직책이름(job_title)을 조회해보세요
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
    
-- 연습2: job_title이 Programmer인 사원들의 사원번호/이름/부서명을 조회해보세요


-- 연습3: 커미션을 받는 사원들의 직책이름(job_title)은 어떤 것이 있는지 조회해보세요
SELECT DISTINCT
    job_title
FROM
    employees e,
    jobs      j
WHERE
        e.job_id = j.job_id
    AND e.commission_pct IS NOT NULL;

-- 연습4: Settle에서 근무하는 사원들의 이름/월급/부서명/우편번호를 조회해보세요
--      Hint. Seattle은 locations 테이블에 있다





/*
    (1) 사원과 부서처럼 1:N 관계로 설정할 수 있는 실제 사례를 하나 생각해보세요
        PARENTS - CHILD
        
    (2) 1:N 관계로 설정한 각 객체를 테이블 형태로 설계해보세요
    
        - 테이블 이름  :  축구팀
        - 컬럼명   :  팀번호(PK)/ 팀이름(VARCHAR2)/구단주(VARCHAR2)/홈구장(NUMBER)
        - 각 컬럼의 타입  : 
        - 기본키 컬럼 : 팀번호
        - 외래키 컬럼 : 경기장 번호
        
        - 테이블 이름  :  경기장
        - 컬럼명   :  경기장번호(PK), 수용인원 / 주소 / 경기장타입 /...
        - 각 컬럼의 타입 : NUMBER / NUMBER / VARCHAR2/ CHAR/ ...
        - 기본키 컬럼 : 경기장 번호
        - 외래키 컬럼 : X
        
         - 테이블 이름  :  축구 선수
        - 컬럼명   : 선수번호 / 이름 / 나이 / 포지션 / 국적 / 소속 팀...
        - 각 컬럼의 타입 : NUMBER / VARCHAR2/ NUMBER / CHAR / CHAR / NUMBER
        - 기본키 컬럼 : 선수번호
        - 외래키 컬럼 : 국적, 소속팀번호
*/












