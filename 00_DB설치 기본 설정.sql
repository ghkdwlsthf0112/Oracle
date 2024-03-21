/*
    # 
    
    1. 구글링
    2. 다운로드
    3. 설치 (설치 시 사용하는 포트번호 확인 \할 것 : 1521, 2030, )

    # 설치 후 확인해보기
    
    1. cmd에서 sqlplus로 실헹 여부 확인
    2. 관리자 계정으로 로그린 해보기
    3. spl deveiop을 다운 받아서 관리자 계정으로 로그린

    # 연습용 계정 설정하기
    
    1. 관리자 계정으로 로그인
    2. ALTER user hr ACCOUNT UNLOCK; (잠금해제 하지 않으면 접속 불가능)
    3. ALTER user hr IDENTIFIED BY 1234; (비밀번호 변경)
*/

-- CTRL + ENTER : 명령어 하나 실행하기
-- FS : 이 스트립드의 모든 명령어 실행하기
-- HR : 연습용 계정
-- SYS, SYSTEM : 관리자 계정

-- 데이터베이스에서 사용하는 주석

-- 현재 데이터베이스릐 테이블 목록 보기
SELECT * FROM tabs;
-- 현재 데이터베스의 계정 보기
SELECT * FROM all_users; -- 데이터베이스

-- 연습용 계정 hr 잠금 해제하기
ALTER user hr ACCOUNT UNLOCK;
-- 연습용 계정 hr 비밀번호 변경하기
ALTER user hr IDENTIFIED BY 1234;