* ----------------- VARHS 2012 -----------------

* Thiết lập thư mục làm việc
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VARHS\2008-16Clean"

* Tải lên dữ liệu bảng hỏi 2
use "2012_new\Q2_New_12", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_12 = string(tinh_2012) + "_" + string(quan_2012) + "_" + string(xa_2012) + "_" + string(ma_h0_2012)

* Lấy dữ liệu về tổng diện tích đất được nhà nước cấp cho MỖI hội
gen area_given = p5q3a_ if p5q4_ == 1
collapse (sum) plot_given = area_given, by(hh_id_12)

keep hh_id_12 plot_given

save "panel_1216\middle_steps\Q2_cleaned", replace

use "2012_new\Q8_New_12", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_12 = string(tinh_2012) + "_" + string(quan_2012) + "_" + string(xa_2012) + "_" + string(ma_h0_2012)

* Lấy dữ liệu về số nợ còn lại
collapse (sum) loan = p39q7_, by(hh_id_12)

keep hh_id_12 loan

save "panel_1216\middle_steps\Q8_cleaned", replace

merge 1:1 hh_id_12 using "panel_1216\middle_steps\Q2_cleaned"

* Kiểm tra
tab _merge

replace loan = 0 if _merge == 2

gen year = 12

drop _merge

save "panel_1216\merged_data_12", replace

* ----------------- VARHS 2014 -----------------

* Tải lên dữ liệu bảng hỏi 2
use "2014_new\Q2_New_14", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_14 = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)

* Lấy dữ liệu về tổng diện tích đất được nhà nước cấp cho MỖI hội
gen area_given = p5q3a_ if p5q4_ == 1
collapse (sum) plot_given = area_given, by(hh_id_14)

keep hh_id_14 plot_given

save "panel_1216\middle_steps\Q2_cleaned", replace

use "2014_new\Q8_New_14", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_14 = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)

* Lấy dữ liệu về số nợ còn lại
collapse (sum) loan = p41q7_, by(hh_id_14)

keep hh_id_14 loan

save "panel_1216\middle_steps\Q8_cleaned", replace

merge 1:1 hh_id_14 using "panel_1216\middle_steps\Q2_cleaned"

* Kiểm tra
tab _merge

replace loan = 0 if _merge == 2

gen year = 14

drop _merge

save "panel_1216\merged_data_14", replace

* ----------------- VARHS 2016 -----------------

* Tải lên dữ liệu bảng hỏi 2
use "2016_new\Q2_New_16", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_16 = string(tinh_2016) + "_" + string(quan_2016) + "_" + string(xa_2016) + "_" + string(ma_h0_2016)

* Lấy dữ liệu về tổng diện tích đất được nhà nước cấp cho MỖI hội
gen area_given = p5q3a_ if p5q4_ == 1
collapse (sum) plot_given = area_given, by(hh_id_16)

keep hh_id_16 plot_given

save "panel_1216\middle_steps\Q2_cleaned", replace

use "2016_new\Q8_New_16", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_16 = string(tinh_2016) + "_" + string(quan_2016) + "_" + string(xa_2016) + "_" + string(ma_h0_2016)

* Lấy dữ liệu về số nợ còn lại
collapse (sum) loan = p40q7_, by(hh_id_16)

keep hh_id_16 loan

save "panel_1216\middle_steps\Q8_cleaned", replace

merge 1:1 hh_id_16 using "panel_1216\middle_steps\Q2_cleaned"

* Kiểm tra
tab _merge

replace loan = 0 if _merge == 2

gen year = 16

drop _merge

save "panel_1216\merged_data_16", replace

* ----------------- PANEL ID -----------------

use "panelid", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id_12 = string(tinh_2012) + "_" + string(quan_2012) + "_" + string(xa_2012) + "_" + string(ma_h0_2012)
gen hh_id_14 = string(tinh_2014) + "_" + string(quan_2014) + "_" + string(xa_2014) + "_" + string(ma_h0_2014)
gen hh_id_16 = string(tinh_2016) + "_" + string(quan_2016) + "_" + string(xa_2016) + "_" + string(ma_h0_2016)

* Với bảng cho ba năm 2012-2016, loại bỏ các hộ không xuất hiện trong cả 3 năm và các năm khảo sát ngoài 2012-2016
drop if missing(tinh_2012) & missing(tinh_2014) & missing(tinh_2016)
keep if year == 12 | year == 14 | year == 16

* Tạo một mã duy nhất cho từng hộ
egen panel_id = group(hh_id_12 hh_id_14 hh_id_16)

* Lưu file master tạm
tempfile master merged12 merged14 merged16 final
save `master'

* -----------------
* Năm 2012
* -----------------
use `master', clear
keep if year == 12

preserve
keep if !missing(tinh_2012)
merge 1:1 hh_id_12 year using "panel_1216\merged_data_12.dta"
tempfile nonmiss12
save `nonmiss12'
restore

keep if missing(tinh_2012)
append using `nonmiss12'
save `merged12'

* -----------------
* Năm 2014
* -----------------
use `master', clear
keep if year == 14

preserve
keep if !missing(tinh_2014)
merge 1:1 hh_id_14 year using "panel_1216\merged_data_14.dta"
tempfile nonmiss14
save `nonmiss14'
restore

keep if missing(tinh_2014)
append using `nonmiss14'
save `merged14'

* -----------------
* Năm 2016
* -----------------
use `master', clear
keep if year == 16

preserve
keep if !missing(tinh_2016)
merge 1:1 hh_id_16 year using "panel_1216\merged_data_16.dta"
tempfile nonmiss16
save `nonmiss16'
restore

keep if missing(tinh_2016)
append using `nonmiss16'
save `merged16'

* -----------------
* Gộp lại

use `merged12', clear
append using `merged14'
append using `merged16'
save `final', replace

* Loại bỏ các cột không còn cần thiết
keep panel_id year plot_given loan

* Khai báo dữ liệu bảng
xtset panel_id year

bysort panel_id: gen obs_count = _N

tab obs_count

keep if obs_count == 3

* Khai báo dữ liệu bảng
xtset panel_id year
