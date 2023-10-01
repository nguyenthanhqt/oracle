--quản lý không gian lưu trữ csdl
--nén, giám sát, tạo segment, các tiện ích segment
--thu hồi không gian lưu trữ
--nén dữ liệu
link:
https://www.tranvanbinh.vn/2020/11/quan-tri-temp-files.html
https://www.tranvanbinh.vn/2020/11/quan-tri-datafile.html
----- command-----
1. kiểm tra thông tin segment;
show parameters deferred_segment_creation ;

2. thu hồi dung lượng không dùng Shrink
    alter table [table.name] Shrink space compact ;
    alter table [table.name] Shrink space  ;

