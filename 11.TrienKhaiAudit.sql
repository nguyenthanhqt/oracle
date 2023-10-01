* TRIỂN KHAI AUDIT (bảo mật csdl)
-- bật tính năng audit

-- tạo các chính sách audit

-- Quản lý các log audit sinh ra

-- các bước cho phep audit hợp nhất
1. tắt insance csdl : shutdown immediate ;
2. tắt listener: lsnrctl stop ;
3.cho phép thực thi unified auditing: 
    cd $oracle_home/rdbms/lib
    make -f ins_rdbms.mk uniaud_on iocale ORACLE_HOME=$ORACLE_HOME ;
4. restart listener: lsnrctl start ;
SQL> startup ;

-- cấu hình audit

-- tạo chính sách hợp nhất
vd:
    create audit policy select_emp_plo action select on hr.employees ;

-- tạo cính sách audit tùy chọn audit mức hệ thống
-- quyền hệ thống
create audit policy audit_syspriv_poll privileges select any table, create library ;

-- tác động
create audit policy audit_actions_pol2 action audit, alter trigger ;
+ role
create audit policy audit_role_pol3 roles mgr_role ;
+ system privilege , tác động role:
create audit policy audit_mixed_pol4 privileges drop any table 
    actions create table, drop table, truncate table 
    role emp_role ;


-- tạo chính sách audit tác động cho object
create audit policy audit_objpriv_pol5
action select, update, lock on hr.employees ;

create audit policy audit_actions_pol6
    action all ;

create audit policy audit_actions_pol7
    actions execute, grant on hr.raise_salary_pro ;


-- hiển thị thông tin audit
select * from audit_unified_policies ;

select * from audit_unified_enabled_policies ;

