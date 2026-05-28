# Code thực hành Chương 2 - Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế

Repository này lưu **code STATA** đi kèm với chương 2 trong quyển sách *Xây dựng dữ liệu bảng và phương pháp giả bảng từ dữ liệu chéo lặp lại: ứng dụng trong các bộ dữ liệu cấp hộ gia đình tại Việt Nam* (VARHS và VHLSS).

Các câu lệnh được trình bày dưới hai dạng:

- **`notebooks/Chương 2 - Xây dựng dữ liệu bảng và giả bảng.ipynb`** - Jupyter notebook chạy bằng **stata_kernel**, hiển thị code và output cạnh nhau có thể đọc trực tiếp trên GitHub.
- **`do_files/*.do`** - bốn file Stata `.do` gốc, dành cho người muốn chạy thẳng trong Stata.


---

## ⚠️ Lưu ý khi chạy các file: Cần đổi đường dẫn vào thư mục chứa dữ liệu VARHS (`cd`) trước khi chạy

Do dung lượng lớn và điều khoản bản quyền, **dữ liệu không được lưu trong repository này**. Độc giả cần tự tải dữ liệu từ nguồn gốc (xem mục [Nguồn dữ liệu](#nguồn-dữ-liệu) ở cuối file này) và sắp xếp **đúng cấu trúc thư mục** như bên dưới.

```
data/
    ├── VARHS/
    │   └── 2008-16Clean/
    │       ├── 2012_new/
    │       │   ├── Q2_New_12.dta
    │       │   └── Q8_New_12.dta
    │       ├── 2014_new/
    │       │   ├── Q1_New_14.dta
    │       │   ├── Q2_New_14.dta
    │       │   └── Q8_New_14.dta
    │       ├── 2016_new/
    │       │   ├── Q2_New_16.dta
    │       │   └── Q8_New_16.dta
    │       ├── panel_1216/
    │       │   └── middle_steps/       ← tạo sẵn thư mục rỗng này
    │       └── panelid.dta
    └── VHLSS/
        └── VHLSS data.dta
```

**Lưu ý quan trọng đối với VARHS:** tên các thư mục con (`2012_new`, `2014_new`, `2016_new`, `panel_1216/middle_steps`) và tên các file (`Q2_New_12.dta`, `panelid.dta`, …) phải **chính xác như trên** do code STATA tham chiếu trực tiếp đến các tên này. Hai thư mục `panel_1216/` và `panel_1216/middle_steps/` cần được tạo sẵn (kể cả khi đang rỗng) vì code sẽ ghi các file tạm vào đó.

Nếu cấu trúc thư mục được sắp xếp khác đi, độc giả vẫn sẽ chạy được code nếu điều chỉnh các đường dẫn `use "..."`, `save "..."` và `merge ... using "..."` trong file `.do`/notebook cho khớp.

```

Độc giả có thể dùng tính năng **Find & Replace** (Ctrl+H) trong Stata Do-file Editor / VS Code / Jupyter để đổi một lượt tất cả các đường dẫn.

---

## Cách chạy

### Chạy file `.do` bằng Stata

1. Tải toàn bộ thư mục dữ liệu (data) về máy và giữ nguyên cấu trúc hiện tại
2. Sửa các đường dẫn sau từ khóa `cd` trong file `.do` như hướng dẫn ở trên
3. Chạy file `.do` trong Stata

### Chạy bằng Jupyter notebook

Trước tiên, độc giả cần cài đặt **stata_kernel** để có thể chạy các câu lệnh STATA bằng Jupyter Notebook.

```bash
pip install jupyterlab stata_kernel
python -m stata_kernel.install
```

Sau đó:

1. Sửa các ô `cd` trong notebook như hướng dẫn ở trên
2. Chạy notebook bằng local host hoặc IDE

> **Lưu ý:** `stata_kernel` cần Stata đã cài sẵn trên máy.

---

## Nguồn dữ liệu

- **VARHS** hay Vietnam Access to Resources Household Survey 2008–2016 được UNU-WIDER công bố tại [wider.unu.edu/database/viet-nam-data](https://www.wider.unu.edu/database/viet-nam-data).
- Bộ dữ liệu tái lập của [Nguyen, Le và Nguyen (2021)](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0260415) được xây dựng từ VHLSS hay Vietnam Household Living Standards Survey. Để dùng dữ liệu VHLSS gốc, vui lòng liên hệ trực tiếp Tổng Cục Thống Kê.
