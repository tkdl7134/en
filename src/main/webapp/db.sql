

create sequence  s_templatet_seq;
insert into s_member values('testuser5','2222','ccc','ccc','ccc','00/01/13','female','testuser7@example.com','24/06/11','default.png','01012341239');
insert into s_event values(event_seq.nextval,'testuser2','https://www.amazon.com/hz/wishlist/ls/3R5PIDFJ3SD4X?ref_=wl_share');
insert into s_allergy values('1','testuser9','魚');

insert into  S_GUEST values('1','testuser2','yes','g','kids:1','ㅊㅋㅊㅋ','no');

insert into  s_party values('1','testuser9','0','1','1');



insert into s_template values('5','test','preview1.png','test.jsp','test.jsp');

select * from s_member;

select * from s_member;
select * from s_event;
select * from s_wedding_info;
select * from s_template;
select * from S_GUEST;

SELECT * FROM S_EVENT se LEFT OUTER JOIN S_TEMPLATE st ON se.E_NO = st.E_NO WHERE se.M_ID ='testuser';

SELECT * FROM s_wedding_info sw LEFT OUTER JOIN s_event se ON sw.e_no = se.e_no
        		LEFT OUTER JOIN s_template st ON sw.t_pk = st.t_pk WHERE se.t_pk = '1';
                 SELECT * FROM S_EVENT se LEFT OUTER JOIN S_TEMPLATE st ON se.E_NO = st.E_NO WHERE se.M_ID = 'testuser'";     
                 
SELECT *
FROM s_wedding_info sw
LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no
LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk
WHERE sw.e_no = '1';

SELECT * FROM s_wedding_info sw 
                LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no 
                LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk 
                WHERE sw.e_no = '1';
SELECT se.e_no, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, 
                sg.g_attend, sg.g_guest_type, sg.g_message, sg.g_relation, 
                sa.allergy, sp.p_adult, sp.p_child, sp.p_baby 
                FROM s_guest sg 
                LEFT JOIN s_member sm ON sg.m_id = sm.m_id
                LEFT JOIN s_event se ON sg.e_no = se.e_no 
                LEFT JOIN s_party sp ON sg.m_id = sp.m_id 
                LEFT JOIN s_allergy sa ON sg.m_id = sa.m_id 
                WHERE se.m_id = testuser4;
                
SELECT * FROM s_wedding_info sw 
               LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no 
                LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk 
                WHERE se.m_id = ? and sw.e_no = ?;
                
                
                SELECT se.e_no, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, 
                sg.g_attend, sg.g_guest_type, sg.g_message, sg.g_relation, 
                sa.allergy, sp.p_adult, sp.p_child, sp.p_baby 
                FROM s_guest sg 
                LEFT JOIN s_member sm ON sg.m_id = sm.m_id 
                LEFT JOIN s_event se ON sg.e_no = se.e_no 
                LEFT JOIN s_party sp ON sg.m_id = sp.m_id 
                LEFT JOIN s_allergy sa ON sg.m_id = sa.m_id 
                WHERE se.m_id = ? AND sg.e_no = ?;
                "
                
                SELECT se.e_no, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, 
                sg.g_attend, sg.g_guest_type, sg.g_message, sg.g_relation, 
                sa.allergy, sp.p_adult, sp.p_child, sp.p_baby 
                FROM s_guest sg 
                LEFT JOIN s_member sm ON sg.m_id = sm.m_id 
                LEFT JOIN s_event se ON sg.e_no = se.e_no 
                LEFT JOIN s_party sp ON sg.m_id = sp.m_id 
                LEFT JOIN s_allergy sa ON sg.m_id = sa.m_id 
                WHERE sg.e_no = ?