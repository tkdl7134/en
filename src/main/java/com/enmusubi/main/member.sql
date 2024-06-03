-- Memberテーブルの作成
CREATE TABLE Member (
    m_id VARCHAR2(40 char) PRIMARY KEY,
    m_pw VARCHAR2(40 char) NOT NULL,
    m_name VARCHAR2(10 char) NOT NULL,
    m_name_kana VARCHAR2(20 char) NOT NULL,
    m_birth VARCHAR2(20 char) NOT NULL,
    m_gender VARCHAR2(10 char) NOT NULL,
    m_email VARCHAR2(50 char) NOT NULL,
    m_regdate VARCHAR2(30 char) NOT NULL,
    m_img VARCHAR2(20 char) NOT NULL,
    m_phone VARCHAR2(15 char) NOT NULL
);

-- テスト用アカウントを Member テーブルに挿入
INSERT INTO Member (
    m_id, m_pw, m_name, m_name_kana, m_birth, m_gender, m_email, m_regdate, m_img, m_phone
) VALUES (
    'testuser',  -- ユーザーID
    'password123',  -- パスワード
    'テスト',  -- 名前
    'テストカナ',  -- 名前のカナ
    '1990-01-01',  -- 生年月日
    '男性',  -- 性別
    'testuser@example.com',  -- メールアドレス
    '2024-06-03',  -- 登録日
    'default.png',  -- 画像
    '09012345678'  -- 電話番号
);

-- Memberテーブルのデータを選択
SELECT * FROM Member;

-- Memberテーブルの削除
DROP TABLE Member;

-- Addressテーブルの作成
CREATE TABLE Address (
    m_id VARCHAR2(40 char) PRIMARY KEY,
    a_address VARCHAR2(100 char) NOT NULL,
    a_postcode VARCHAR2(20 char) NOT NULL
);

-- Addressテーブルのデータを選択
SELECT * FROM Address;

-- Addressテーブルの削除
DROP TABLE Address;