-- 22_���� �����ϱ�.sql

-- ���� ���ӵ� ���� ����
SHOW user;

-- �� ���� �����ϱ� (���� �ִ� ���������� ���డ��)
CREATE USER testuser IDENTIFIED BY "1234";

-- ����� ���� ������ ��ųʸ� ��
SELECT username, to_char(created, 'MM/DD HH24:MI:SS') FROM all_users;

-- ���� ������ ���� ���� �ֱ� (GRANT ���� TO ����)
GRANT CREATE SESSION TO testuser; -- �ش� ������ ������ �� �ִ� ���� �ο�
GRANT CREATE TABLE TO testuser; -- �ش� ������ ���̺� ���� ���� �ο�
GRANT RESOURCE TO testuser; -- ���� ������ ����� �� �ִ� ���� �ο�

-- ������ ���� ���� (REVOKE ���� FROM ����) 
REVOKE RESOURCE FROM testuser;

-- ���� ��й�ȣ �����ϱ�
ALTER USER testuser IDENTIFIED BY "4321";

-- ���� �����ϱ�
DROP USER testuser;






