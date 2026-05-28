* Thiết lập thư mục làm việc
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VHLSS"

* Tải lên dữ liệu
use "VHLSS data", clear

* Tạo mã định danh hộ (dạng chuỗi-string)
gen hh_id = string(tinh) + "_" + string(huyen) + "_" + string(xa) + "_" + string(diaban) + "_" + string(hoso)

* Tính toán năm sinh của chủ hộ
gen birth_year = year - agehead

* Chỉ giữ lại các biến cần thiết (với sexhead là giới tính của chủ hộ, thubq là thu nhập bình quân đầu người, tinh là mã tỉnh, tobacexp là chi tiêu dành cho thuốc lá)

keep hh_id birth_year sexhead tinh thubq tobacexp year

* Tạo cohort năm sinh
gen birth_cohort = ""

* Nhóm dưới 1935
replace birth_cohort = "<1935" if birth_year < 1935

* Các nhóm 5 năm từ 1935 - 1980
replace birth_cohort = string(floor(birth_year/5)*5) + "-" + string(floor(birth_year/5)*5 + 5) if birth_year >= 1935 & birth_year < 1980

* Nhóm từ 1980 trở đi
replace birth_cohort = ">=1980" if birth_year >= 1980

* Tạo mã định danh pseudo-panel theo các cohort năm sinh
egen birth_cohort_id = group(birth_cohort), label

* Hiển thị bảng ma trận quy mô của từng cohort theo từng năm
tab birth_cohort_id year

* Tạo mã định danh pseudo-panel cohort năm sinh x sexhead
egen birth_sex_cohort_id = group(birth_cohort sexhead), label

* Hiển thị bảng ma trận quy mô của từng cohort theo từng năm
tab birth_sex_cohort_id year

* Tạo mã định danh pseudo-panel cohort tinh
egen tinh_cohort_id = group(tinh), label

* Hiển thị các nhóm bách phân vị của quy mô các nhóm cohort theo từng năm

preserve
    contract tinh_cohort_id year, freq(obs_count)
    summarize obs_count, detail
restore

* Tạo dữ liệu cho từng cohort theo năm

gen cohort_id = tinh_cohort_id

collapse (mean) thubq tobacexp, by(cohort_id year)

* Khai báo dữ liệu bảng
xtset cohort_id year
