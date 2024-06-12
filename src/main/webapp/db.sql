
create sequence s_event_seq;
insert into s_member values('testuser5','2222','ccc','ccc','ccc','00/01/13','female','testuser7@example.com','24/06/11','default.png','01012341239');
insert into s_event values(event_seq.nextval,'testuser2','https://www.amazon.com/hz/wishlist/ls/3R5PIDFJ3SD4X?ref_=wl_share');
insert into s_allergy values('1','testuser9','魚');

insert into  S_GUEST values('1','testuser2','yes','g','kids:1','ㅊㅋㅊㅋ','no');





insert into S_GUEST values('1','신랑3','신부3','test.jsp');

select * from s_member;
select * from S_GUEST;

select * from s_event;
select * from s_wedding_info;
select * from S_GUEST;


SELECT * FROM S_GUEST sg LEFT OUTER JOIN S_MEMBER sm  ON sg.M_ID = sm.M_ID LEFT OUTER JOIN S_EVENT se ON sg.E_NO = se.E_NO LEFT OUTER JOIN S_ADDRESS sa ON sg.M_ID =sa.M_ID LEFT OUTER JOIN S_ALLERGY sa2 on sm.M_ID =sa2.M_ID WHERE se.m_id = 'testuser' AND sg.E_NO ='1';
