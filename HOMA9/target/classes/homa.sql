//회원
create table tbl_member (
    userId      varchar2(50)    not null,
    userPass    varchar2(100)   not null,
    userName    varchar2(30)    not null,
    userPhon    varchar2(20)    not null,
    userAddr1   varchar2(100)    null,
    userAddr2   varchar2(100)    null,
    userAddr3   varchar2(100)    null,
    gender      varchar2(30)    not null,
    passwordHint    varchar2(100) not null,
    userEmail   varchar2(100)   not null,
    regDate    date            default sysdate,
    verify      number          default 0,
    primary key(userId)
);



SELECT * FROM tbl_member;

update tbl_member
    set 
        verify = 9
        where userId = 'skarbgud123@naver.com';


//자유게시판
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

//공지사항
create table Notice(
    no_num number not null,
    no_subject varchar2(30) not null,
    no_date DATE default sysdate,
    no_readCount number default 0,
    no_content varchar2(3000) not null,
    userId varchar2(50) not null,
    primary key(no_num),
    foreign key(userId) references tbl_member(userId) on delete cascade
)



//더미파일 생성
insert into freeBoard(fb_num,fb_subject,fb_content,userId)
      select freeBoard_seq.nextval,fb_subject,fb_content,userId from freeBoard;



//커밋
commit;
//롤백
rollback;


//댓글창 테이블 생성
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

create table Matching(
    mat_workStart varchar2(20) not null,
    mat_workEnd varchar2(20) not null,
    mat_job varchar2(20) not null,
    mat_wakeUp number not null,
    mat_clean number not null,
    mat_person varchar2(20) not null,
    mat_gender varchar2(20) not null,
    mat_region1 varchar2(30) not null,
    mat_region2 varchar2(30) not null,
    mat_food varchar2(30) not null,
    userId varchar2(20) not null,
    mat_workDetail number not null,
    mat_jobDetail number not null,
    mat_wakeUpDatil number not null,
    mat_cleanDetail number not null,
    mat_personDetail number not null,
    mat_genderDetail number not null,
    mat_regionDetail number not null,
    mat_foodDetail number not null
);

alter talbe Matching
    add constraint mat_userId foreign key(userId)
    references tbl_member(userId) ON delete cascade;
    
alter table tbl_member add constraint addr unique (userAddr1);
alter table tbl_member add constraint addr2 unique (userAddr3);

alter table Matching
    add constraint address1 foreign key(mat_region1)
    references tbl_member(userAddr1) ON delete cascade;
    
alter table Matching
    add constraint address2 foreign key(mat_region2)
    references tbl_member(userAddr3) ON delete cascade;
