# Code thực hành Chương 2 - Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế

Repository này lưu **code STATA** và **dữ liệu** đi kèm với chương 2 trong quyển sách *Xây dựng dữ liệu bảng và phương pháp giả bảng từ dữ liệu chéo lặp lại: ứng dụng trong các bộ dữ liệu cấp hộ gia đình tại Việt Nam* (VARHS và VHLSS).

Các câu lệnh được trình bày dưới hai dạng:

- **`notebooks/Chương 2 - Xây dựng dữ liệu bảng và giả bảng.ipynb`** - Jupyter notebook chạy bằng **stata_kernel**, hiển thị code và output cạnh nhau có thể đọc trực tiếp trên GitHub.
- **`do_files/*.do`** - bốn file Stata `.do` gốc, dành cho người muốn chạy thẳng trong Stata.


---

## ⚠️ Lưu ý khi chạy các file: Cần đổi đường dẫn vào thư mục chứa dữ liệu (`cd`) trước khi chạy

Tất cả các file `.do` và notebook đều dùng đường dẫn cục bộ của tác giả gốc:

```stata
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VARHS\..."
```

**Trên các máy tính khác, để chạy được đoạn code và cho ra kết quả giống với trong sách, cần thay các dòng sau `cd "..."` thành đường dẫn tới thư mục `data/` trong repo bạn đã clone về.

Ví dụ, nếu thư mục dữ liệu được lưu vào `C:\Users\vn-data\panel-data-book`, cần đổi:

```stata
cd "D:\Một số phương pháp hiện đại xử lý và phân tích dữ liệu kinh tế\VARHS\2008-16Clean\2014_new"
```

thành:

```stata
cd "C:\Users\vn-data\panel-data-book\data\VARHS\2008-16Clean\2014_new"
```

Độc giả có thể dùng tính năng **Find & Replace** (Ctrl+H) trong Stata Do-file Editor / VS Code / Jupyter để đổi một lượt tất cả các đường dẫn.

---

## Cách chạy

### Chạy file `.do` bằng Stata

1. Tải toàn bộ thư mục dữ liệu (data) về máy và giữ nguyên cấu trúc hiện tại.
2. Sửa các đường dẫn sau từ khóa `cd` trong file `.do` như hướng dẫn ở trên.
3. Chạy file `.do` trong Stata.

### Chạy bằng Jupyter notebook

Trước tiên, độc giả cần cài đặt **stata_kernel** để có thể chạy các câu lệnh STATA bằng Jupyter Notebook.

```bash
pip install jupyterlab stata_kernel
python -m stata_kernel.install
```

Sau đó:

1. Sửa các ô `cd` trong notebook như hướng dẫn ở trên.
2. Chạy notebook bằng local host hoặc IDE.

> **Lưu ý:** `stata_kernel` cần Stata đã cài sẵn trên máy.

---

## Nguồn dữ liệu

- **VARHS** — Vietnam Access to Resources Household Survey, 2008–2016. CIEM, MOLISA, MPI, UNU-WIDER, University of Copenhagen, DANIDA. Dữ liệu được UNU-WIDER công bố tại [wider.unu.edu/database/viet-nam-data](https://www.wider.unu.edu/database/viet-nam-data).
- Bộ dữ liệu tái lập của Nguyen, Le và Nguyen (2021) được xây dựng từ VHLSS- Vietnam Household Living Standards Survey. Để dùng dữ liệu VHLSS gốc, vui lòng liên hệ trực tiếp Tổng Cục Thống Kê.
