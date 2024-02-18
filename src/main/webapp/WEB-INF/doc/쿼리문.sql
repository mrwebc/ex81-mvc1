drop database if exists jsp_mvc;
create database jsp_mvc default character set utf8;

use jsp_mvc;

drop table if exists board;
drop table if exists user;

create table user(
    userid      varchar(28)     primary key,
    password    varchar(8)      not null,
    name        varchar(30)     not null,
    role        varchar(5)      default 'User'
) default character set utf8;

create table board(
    seq         int         primary key auto_increment,
    title       varchar(200)    not null,
    nickname    varchar(30) not null,
    content     text    not null,
    regdate     datetime            default now(),
    cnt         int     default 0,
    userid      varchar(28)
) default character set utf8;

insert into user values('duly', '1234', '둘리', 'Admin');
insert into user values('hani', '1234', '하니', 'User');
insert into user values('micol', '1234', '마이콜', 'Guest');

insert into board(seq, title, nickname, content, regdate, userid) 
values(1, '첫번째 게시물', '둘리', '첫번째 게시물 내용', subdate(curdate(), interval 7 day), 'duly');

insert into board(seq, title, nickname, content, regdate, userid) 
values(2, '두번째 게시물', '하니', '두번째 게시물 내용.', subdate(curdate(), interval 6 day), 'hani');

insert into board(seq, title, nickname, content, regdate, userid) 
values(3, '세번째 게시물', '마이콜', '세번째 게시물 내용.', subdate(curdate(), interval 5 day), 'micol');

insert into board(seq, title, nickname, content, regdate, userid) 
values(4, '네번째 게시물', '둘리', '네번째 게시물 내용.', subdate(curdate(), interval 4 day), 'duly');

insert into board(seq, title, nickname, content, regdate, userid) 
values(5, '다섯번째 게시물', '하니', '다섯번째 게시물 내용.', subdate(curdate(), interval 3 day), 'hani');

insert into board(seq, title, nickname, content, regdate, userid) 
values(6, '여섯번째 게시물', '마이콜', '여섯번째 게시물 내용.', subdate(curdate(), interval 2 day), 'micol');

insert into board (seq, title, nickname, content, regdate, userid) 
values (7 , '일곱번째 게시물', '둘리', '일곱번째 게시물 내용.', subdate(curdate(), interval 1 day), 'duly');


select * from user;

select * from board;


select * from board where title like '%번째%' order by seq desc



