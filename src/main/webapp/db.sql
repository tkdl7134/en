
create sequence s_event_seq;
insert into s_member values('testuser2','2222','bbb','bbb','bbb','00/01/01','male','testuser5@example.com','24/06/10','default.png','01012341234');
insert into s_event values(event_seq.nextval,'testuser2','https://www.amazon.com/hz/wishlist/ls/3R5PIDFJ3SD4X?ref_=wl_share');
insert into s_wedding_info values('3','신랑3','신부3','test.jsp');

insert into S_GUEST values('1','신랑3','신부3','test.jsp');

select * from s_member;
select * from s_event;
select * from s_wedding_info;
select * from S_GUEST;

SELECT * FROM S_GUEST sg LEFT OUTER JOIN S_MEMBER sm  ON sg.M_ID = sm.M_ID LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID =sa.M_ID LEFT OUTER JOIN S_ALLERGY sa2 on sm.M_ID =sa2.M_ID WHERE se.m_id = 'testuser' AND sg.E_NO ='1';
