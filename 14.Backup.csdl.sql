https://www.youtube.com/watch?v=poGjA590XLM&list=PLdxDYNyqNPwEsFCEtaSxHzgKzzBEiP2Le&index=51
-- thực hiện backup
select * from v$database; 

select * from v$instance ;

rman target /

backup database plus archivelog ; -- backup full ;

https://www.youtube.com/watch?v=Iiy3V_hJq54&list=PLdxDYNyqNPwEsFCEtaSxHzgKzzBEiP2Le&index=52

-- tao lich backup
-- bakcup leve 0
vi /home/oracle/12cworkshoplabs/labs/backup_level0.rcv 
run{
    crosscheck backup ;
    delete noprompt expired backup;
    delete obsolete;
    delete backup complete berore 'sysdate-4' device type disk;
    backup as compressed backupset incemental leve 0 database filesperset 10 skip readoly skip offline maxsetsize 1g tag leve 0;
    crosscheck archivelog all;
    delete noprompt expired archivelog all;
    backup as compressed backupset archivelog all filesperset 10 tag arch;
    delete noprompt archivelog until time 'sysdte-1';
}

vi /home/oracle/12cworkshoplabs/labs/backup_level1.rcv 
run{
    crosscheck backup ;
    delete noprompt expired backup;
    delete obsolete;
    delete backup complete berore 'sysdate-4' device type disk;
    backup as compressed backupset incemental leve 0 database filesperset 10 skip readoly skip offline maxsetsize 1g tag leve 0;
    crosscheck archivelog all;
    delete noprompt expired archivelog all;
    backup as compressed backupset archivelog all filesperset 10 tag arch;
    delete noprompt archivelog until time 'sysdte-1';
}


vi /home/oracle/12cworkshoplabs/labs/backup_level0.sh 
target='target /'
rcvcat='nocatlog'
freq=24
time=`date'+%H%M%S'`
cmdfile=/home/oracle/12cworkshoplabs/labs/backup_level0.rcv 
rman $target $rcvcat cmdfile $cmdfile
exit


vi /home/oracle/12cworkshoplabs/labs/backup_level1.sh 
target='target /'
rcvcat='nocatlog'
freq=24
time=`date'+%H%M%S'`
cmdfile=/home/oracle/12cworkshoplabs/labs/backup_level1.rcv 
rman $target $rcvcat cmdfile $cmdfile
exit


-- tao crontab de chay dinh ky