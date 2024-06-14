

create sequence s_event_seq;
insert into s_member values('testuser5','2222','ccc','ccc','ccc','00/01/13','female','testuser7@example.com','24/06/11','default.png','01012341239');
insert into s_event values(event_seq.nextval,'testuser2','https://www.amazon.com/hz/wishlist/ls/3R5PIDFJ3SD4X?ref_=wl_share');
insert into s_allergy values('1','testuser9','魚');

insert into  S_GUEST values('1','testuser2','yes','g','kids:1','ㅊㅋㅊㅋ','no');

insert into  s_party values('1','testuser9','0','1','1');



insert into S_GUEST values('1','신랑3','신부3','test.jsp');

select * from s_member;
select * from S_GUEST;

select * from s_event;
select * from s_wedding_info;
select * from S_GUEST;





SELECT sg.e_no, swi.w_groom, swi.w_bride, swi.w_img, sm.m_id, sm.m_name, sm.m_phone, sm.m_email, sg.g_attend, sg.g_guest_type, sa2.allergy, sg.g_message, sg.g_relation, sp.p_adult, sp.p_child 
				FROM S_GUEST sg LEFT OUTER JOIN S_MEMBER sm ON sg.M_ID = sm.M_ID 
				LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO 
				LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID = sa.M_ID 
				LEFT OUTER JOIN S_ALLERGY sa2 ON sm.M_ID = sa2.M_ID 
				LEFT OUTER JOIN S_WEDDING_INFO swi ON se.E_NO = swi.E_NO 
				LEFT OUTER JOIN S_PARTY sp ON sg.M_ID = sp.M_ID WHERE se.M_ID = 'testuser' AND sg.E_NO = '1';
                
                SELECT 
    se.e_no, 
    swi.w_groom, 
    swi.w_bride, 
    swi.w_img, 
    sr.r_no, 
    sr.r_time, 
    st.t_pk, 
    st.t_preview, 
    st.t_template 
FROM 
    S_EVENT se 
    LEFT OUTER JOIN S_WEDDING_INFO swi ON se.e_no = swi.e_no 
    LEFT OUTER JOIN S_RECEPTION sr ON se.e_no = sr.e_no 
    LEFT OUTER JOIN S_TEMPLATE st ON se.e_no = st.e_no 
WHERE 
    se.t_pk = '1' 
    AND se.e_no = '1';
                