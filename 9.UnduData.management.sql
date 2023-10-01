* quản trị dữ liệu undo
-- bật temporary undo:
    alter session set temp_undo_enabled=true ;
    alter system set temp_undo_enabled=true ;

-- Giám sát undo
    select to_char (begin_time, 'dd/mm/yy hh24:mi:ss'), txncount, maxconcurency, undoblkcnt, uscount, nospaceerrcnt
    from v$tempundostat ;
    