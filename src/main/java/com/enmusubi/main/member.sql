CREATE TABLE Member (
    m_id VARCHAR2(50) PRIMARY KEY,
    m_pw VARCHAR2(50) NOT NULL,
    m_name VARCHAR2(50) NOT NULL,
    m_name_kana VARCHAR2(50) NOT NULL,
    m_birth DATE NOT NULL,
    m_gender VARCHAR2(10) NOT NULL,
    m_email VARCHAR2(100) NOT NULL,
    m_regdate DATE DEFAULT SYSDATE NOT NULL,
    m_img BLOB NOT NULL,
    m_phone VARCHAR2(20) NOT NULL
);

-- テストデータの挿入
INSERT INTO Member (m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, m_img, m_phone) 
VALUES ('testuser', 'password123', 'Test User', 'テスト ユーザー', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'testuser@example.com', EMPTY_BLOB(), '123-456-7890');

select * from member;

drop table member;