

create sequence  s_templatet_seq;
insert into s_member values('testuser5','2222','ccc','ccc','ccc','00/01/13','female','testuser7@example.com','24/06/11','default.png','01012341239');
insert into s_event values(event_seq.nextval,'testuser2','https://www.amazon.com/hz/wishlist/ls/3R5PIDFJ3SD4X?ref_=wl_share');
insert into s_allergy values('1','testuser9','魚');

insert into  S_GUEST values('1','testuser2','yes','g','kids:1','ㅊㅋㅊㅋ','no');

insert into  s_party values('1','testuser9','0','1','1');



insert into s_template values('5','test','preview1.png','test.jsp','test.jsp');

select * from s_member;


select * from s_event;
select * from s_wedding_info;
select * from s_template;
select * from S_GUEST;

SELECT * FROM S_EVENT se LEFT OUTER JOIN S_TEMPLATE st ON se.E_NO = st.E_NO WHERE se.M_ID ='testuser';

SELECT * FROM s_wedding_info sw LEFT OUTER JOIN s_event se ON sw.e_no = se.e_no
        		LEFT OUTER JOIN s_template st ON sw.t_pk = st.t_pk WHERE se.t_pk = '1';
                 "SELECT * FROM S_EVENT se LEFT OUTER JOIN S_TEMPLATE st ON se.E_NO = st.E_NO WHERE se.M_ID = 'testuser'";     
                 
SELECT *
FROM s_wedding_info sw
LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no
LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk
WHERE sw.e_no = '1';

SELECT * FROM s_wedding_info sw 
                LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no 
                LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk 
                WHERE sw.e_no = '1';
                 
                 