--1 kiểm tra control file > đảm bảo có 2 controlfile
select * from v$controlfile ;
show parameter control ;

-- cấu hình phân vùng fast recovery area mạc định
select * from v@parameter where name like '%recovery_file%'
show parameter db_recovery_file_dest ;

--3 cấu hình nhiều redolog group
select * from v$log ;
select * from v$logfile ;

--4 Đặt csdl ở chế độ archivelog
select * from v$insance ;
select * from v$database ;
archive log list ;