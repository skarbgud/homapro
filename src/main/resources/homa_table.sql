drop table tbl_member;
drop table freeboard;
drop table notice;
drop table comments;
drop table Notice;
drop table matching;
drop table room;
drop table report;
drop sequence freeBoard_seq;
drop sequence notice_seq;
drop sequence Comments_seq;
drop sequence room_r_num_seq;
drop sequence report_rp_num;
create sequence freeBoard_seq;
create sequence notice_seq;
create sequence Comments_seq;
create sequence room_r_num_seq;
create sequence report_rp_num;

//ȸ��
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
    kakao       varchar2(30) not null,
    userEmail   varchar2(100)   not null,
    regDate    date            default sysdate,
    verify      number          default 0, 
    primary key(userId)
);
//�����Խ���
create table freeBoard(
    fb_num number not null,
    fb_subject varchar2(100) not null,
    fb_content varchar2(3000) not null,
    fb_date Date default sysdate,
    fb_readCount number default 0,
    userId varchar2(50) not null,
    userName varchar2(30) not null,
    comment_cnt number default 0,
    primary key(fb_num),
    foreign key(userId) references tbl_member(userId) on delete cascade
);
create sequence freeBoard_seq;
//��������
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
create sequence notice_seq;
//���
create table Comments(
 fb_num number not null,
 c_num number not null,
 c_content varchar2(2000) not null,
 userId varchar2(20) not null,
 c_date date default sysdate,
 primary key(fb_num, c_num),
 foreign key(fb_num) references freeboard(fb_num) on delete cascade,
 foreign key(userId) references tbl_member(userId) on delete cascade
 );
 create sequence Comments_seq;

//��Ī
create table Matching(
    mat_bedTime varchar2(20) not null,
    mat_job varchar2(20) not null,
    mat_wakeUp varchar2(20) not null,
    mat_clean varchar2(20)not null,
    mat_person varchar2(20) not null,
    mat_gender varchar2(20) not null,
    mat_region varchar2(100) not null,
    mat_food varchar2(30) not null,
    userId varchar2(20) not null,
    mat_bedTimeDetail number not null,
    mat_jobDetail number not null,
    mat_wakeUpDetail number not null,
    mat_cleanDetail number not null,
    mat_personDetail number not null,
    mat_genderDetail number not null,
    mat_regionDetail number not null,
    mat_foodDetail number not null,
    foreign key(userId) references tbl_member(userId) on delete cascade,
);

//������ ���̺�
create table room(
r_num NUMBER   NOT NULL,
r_date   Date   default sysdate,
r_count   NUMBER   default 0,
r_kind   VARCHAR2(50)   NOT NULL,
r_address1   VARCHAR2(100)   NOT NULL,
r_address2   VARCHAR2(100)   NOT NULL,
r_price   NUMBER    NOT NULL,
r_species   VARCHAR2(100)   NOT NULL,
r_enter   VARCHAR2(50)   NOT NULL,
r_live   VARCHAR2(50)   NOT NULL,
r_gender   VARCHAR2(12)   NOT NULL,
r_available   VARCHAR2(12)   NOT NULL,
r_img   VARCHAR2(500)   NOT NULL,
r_content   VARCHAR2(1000) NOT NULL,
r_kakao   VARCHAR2(30) NOT NULL,
r_area   NUMBER   NOT NULL,   
r_option VARCHAR2(100)   NULL,
userId   VARCHAR2(50)   NOT NULL,
primary key(r_num),
foreign key(userId) references tbl_member(userId) on delete cascade
);
create sequence room_r_num_seq;


//�Ű��ϱ� 
create table report(
    rp_num      NUMBER    not null,
    userId  varchar2(50)   not null,
    rp_content    varchar2(300)    not null,
    rp_reportId   varchar2(50)   not null,
    rp_date    date          default sysdate,
    fb_num    number          null,
    r_num  number  null,
    userName varchar2(30) not null,
    primary key(rp_num),
    foreign key(fb_num) references freeBoard(fb_num) on delete cascade,
    foreign key(r_num) references room(r_num) on delete cascade
);
create sequence report_rp_num;

//������Ʈ ���̺�
create table blacklist(
    black_num number primary key,
    userId varchar2(50) not null,
    userName varchar2(30) not null,
    foreign key(userId) references tbl_member(userId) on delete cascade
);
create sequence black_num_seq;