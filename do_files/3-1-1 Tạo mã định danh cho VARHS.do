* Thiết lập thư mục làm việc
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VARHS\2008-16Clean\2014_new"

* Tải lên dữ liệu bảng hỏi 2
use "Q2_New_14", clear

* Kiểm tra các biến định danh
summarize tinh_2014
summarize quan_2014
summarize xa_2014
summarize ma_h0_2014

* Tạo biến định danh hộ (dạng số)
gen hh_id_num = ma_h0_2014 + xa_2014*10^2 + quan_2014*10^4 + tinh_2014*10^6

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_str = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)

*------------------------

* Tải lên dữ liệu bảng hỏi 1
use "Q1_New_14", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen ind_id_str = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014) + "_" + string(p1stt_)
