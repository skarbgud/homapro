create table tbl_member (
    userId      varchar2(50)    not null,
    userPass    varchar2(100)   not null,
    userName    varchar2(30)    not null,
    userPhon    varchar2(20)    not null,
    userAddr1   varchar2(100)    null,
    userAddr2   varchar2(100)    null,
    userAddr3   varchar2(100)    null,
    regDate    date            default sysdate,
    verify      number          default 0,
    primary key(userId)
);

select *from tbl_member;
insert into tbl_member(userId, userPass, userName, userPhon)
 values('���̵�','��й�ȣ','�г���','��ȭ��ȣ');
 
SELECT * FROM tbl_member;

update tbl_member
    set 
        verify = 9
        where userId = 'skarbgud123@naver.com';

select * from FREEBOARD;
create table freeBoard(
    fb_num number not null,
    fb_subject varchar2(30) not null,
    fb_content varchar2(3000) not null,
    userId varchar2(50) not null,
    fb_date Date default sysdate,
    fb_readCount number default 0,
    primary key(fb_num),
    foreign key(userId) references tbl_member(userId) on cascade
);
    

create sequence freeBoard_seq;


//�������� ����
insert into freeBoard(fb_num,fb_subject,fb_content,userId)
      select freeBoard_seq.nextval,fb_subject,fb_content,userId from freeBoard;
select passwordhint from tbl_member;

select*from tbl_member;
select userId from tbl_member where userId = '2222';
alter table tbl_member modify (userEmail varchar2(100) not null);
commit;
alter table tbl_member rename column repassword to passwordhint;
update tbl_member set rePassword = '하얀색' where userId = '2222';
alter table tbl_member add (gender varchar2(12));
rollback;
select userPass from tbl_member where userId = '9999' and userEmail = '9999@naver.com' and passwordhint = '울산';
delete from tbl_member where userId = '3333';
delete from tbl_member where userId = '5555';
select userId from tbl_member where userId = '2222';
select userId from tbl_member where userName = '2222' and userEmail = '2222@naver.com';

insert into tbl_member values('1111','1111','1111','1111','1111','1111','1111');
update tbl_member set userPass = '2222' where userPass = '1111' and passwordhint = '1111';
update tbl_member set userPass = '9999' where userPass = '9999';

select*from tbl_member;
drop table tbl_member;
//���̵�Ȯ��
select userId from tbl_member where userId = '2222';
//�̸����÷��߰�
alter table tbl_member add (userEmail varchar2(100));
//not null �߰�
alter table tbl_member modify (userEmail varchar2(100) not null);


commit
//�ѹ�
rollback;


//���â ���̺� ����
create table Comments(
 fb_num number not null,
 c_num number not null,
 c_content varchar2(2000) not null,
 userId varchar2(20) not null,
 c_date date default sysdate,
 primary key(fb_num, c_num)
 );

 
alter table Comments
    add CONSTRAINT Comment_fb_num foreign key(fb_num)
    references freeBoard(fb_num) ON DELETE CASCADE;
    
alter table Comments
    add CONSTRAINT Comment_userId foreign key(userId)
    references tbl_member(userId) ON DELETE CASCADE;
    
create sequence Comments_seq;      



