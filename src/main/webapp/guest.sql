SELECT * FROM s_guest;

SELECT * FROM s_Member;

INSERT INTO s_guest (g_guest_type, )

CREATE TABLE s_Member (
    m_id VARCHAR2(40 char) PRIMARY KEY,
    m_pw VARCHAR2(40 char) NOT NULL,
    m_name VARCHAR2(20 char) NOT NULL,
    m_name_kana VARCHAR2(20 char) NOT NULL,
    
    m_birth VARCHAR2(20 char) NOT NULL,
    m_gender VARCHAR2(10 char) NOT NULL,
    m_email VARCHAR2(50 char) NOT NULL,
    m_regdate VARCHAR2(30 char) NOT NULL,
    m_img VARCHAR2(20 char) NOT NULL,
    m_phone VARCHAR2(15 char) NOT NULL
);

CREATE TABLE g guest (
	e_no number(8) not null,
	m_id VARCHAR2(40 char) not null,
	g_attend VARCHAR2(5 char) not null,
	g_guest_type VARCHAR2(5 char) not null,
	g_age_type VARCHAR2(30 char) not null,
	g_allergy_or VARCHAR2(5 char) not null,
	g_message VARCHAR2(5 char) not null,
	g_relation VARCHAR2(100 char)
);

CREATE TABLE s_allergy (
	e_no number(8) not null,
	m_id VARCHAR2(40 char) not null,
	ALLERGY VARCHAR2(100 char) not null
);

CREATE TABLE s_party {
	e_no number(8) not null,
	m_id VARCHAR2(40 char) not null,
	p_age_type VARCHAR2(10 char) not null,
	p_numberof number(3) not null
};

CREATE TABLE S_address {
	m_id VARCHAR2(40 char) not null,
	s_address VARCHAR2(100 char) not null,
	s_postcode VARCHAR2(20 char) not null
};
	
-- 1. 데이터 삽입: s_guest 테이블에 데이터 삽입
INSERT INTO s_guest (e_no, m_id, g_attend, g_guest_type, g_allergy_or, g_message, g_relation)
VALUES (1, 'user123', '참석', '신랑', 'N', 'Congratulations!', '친구');

-- 2. 데이터 삽입: s_party 테이블에 데이터 삽입
INSERT INTO s_party (e_no, m_id, p_age_type, p_numberof)
VALUES (1, 'user123', '성인', 2);

-- 3. 데이터 삽입: s_allergy 테이블에 데이터 삽입
INSERT INTO s_allergy (e_no, m_id, allergy)
VALUES (1, 'user123', '없음');

-- 4. 데이터 삽입: s_member 테이블에 데이터 삽입
INSERT INTO s_member (m_id, m_pw, m_name, m_name_kana, m_name_rome, m_birth, m_gender, m_email, m_regdate, m_img, m_phone)
VALUES ('user123', 'encrypted_password', '홍길동', 'ホン ギルドン', 'Hong Gildong', '2000-01-01', '남성', 'user123@example.com', '2024-06-12', 'profile.jpg', '010-1234-5678');

-- 5. 데이터 삽입: s_address 테이블에 데이터 삽입
INSERT INTO s_address (m_id, a_address, a_postcode)
VALUES ('user123', '서울특별시 강남구', '06000');

SELECT 
    g.g_attend,
    g.g_guest_type,
    g.g_relation,
    p.p_age_type,
    p.p_numberof,
    m.m_name,
    m.m_name_kana,
    m.m_name_rome,
    m.m_email,
    m.m_phone,
    a.a_address,
    a.a_postcode,
    g.g_allergy_or,
    al.allergy
FROM 
    s_guest g
LEFT OUTER JOIN 
    s_party p ON g.e_no = p.e_no AND g.m_id = p.m_id
LEFT OUTER JOIN 
    s_member m ON g.m_id = m.m_id
LEFT OUTER JOIN  
    s_address a ON m.m_id = a.m_id
LEFT OUTER JOIN 
    s_allergy al ON g.e_no = al.e_no AND g.m_id = al.m_id
WHERE 
    g.e_no = 1 AND g.m_id = 'testuser3';