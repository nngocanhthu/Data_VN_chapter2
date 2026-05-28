* Thiết lập thư mục làm việc
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VARHS\2008-16Clean\2014_new"

* Tải lên dữ liệu bảng hỏi 2
use "Q2_New_14", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_str = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)

* Lấy dữ liệu về tổng diện tích đất được nhà nước cấp cho MỖI hội
gen area_given = p5q3a_ if p5q4_ == 1
collapse (sum) plot_given = area_given, by(hh_id_str)

keep hh_id_str plot_given

save "Q2_cleaned", replace

use "Q8_New_14", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_str = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)

* Lấy dữ liệu về số nợ còn lại
collapse (sum) loan = p41q7_, by(hh_id_str)

keep hh_id_str loan

save "Q8_cleaned", replace

merge 1:1 hh_id_str using "Q2_cleaned"

* Kiểm tra
tab _merge

replace loan = 0 if _merge == 2

save "merged_data", replace
