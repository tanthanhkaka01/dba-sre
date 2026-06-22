# DBA SRE Knowledge Base

Repo này dùng để public các tài liệu, ghi chú, báo cáo và hình ảnh liên quan đến công việc DBA/SRE.

Mục tiêu là gom lại các nội dung có thể chia sẻ công khai, giúp việc tra cứu, tham khảo và cập nhật tài liệu được rõ ràng hơn.

## Cấu trúc repo

```text
.
├── README.md
├── images/
├── docs/
└── reports/
```

## Thư mục

- `images/`: Lưu hình ảnh minh họa, sơ đồ kiến trúc, screenshot hoặc diagram dùng trong tài liệu.
- `docs/`: Lưu tài liệu dạng markdown hoặc text, ví dụ runbook, guideline, checklist, ghi chú kỹ thuật.
- `reports/`: Lưu các báo cáo, bản tổng hợp hoặc tài liệu xuất bản dạng PDF.

## Nội dung hiện có

- `reports/oracle8i-legacy-db-public-handled-summary.pdf`: Báo cáo tổng hợp public về xử lý hệ thống Oracle 8i legacy database.

## Quy ước cập nhật

- Đặt tên file rõ nghĩa, ưu tiên chữ thường và dấu gạch ngang, ví dụ `oracle-backup-checklist.md`.
- Với tài liệu markdown, đặt trong `docs/`.
- Với báo cáo đã xuất bản hoặc bản PDF, đặt trong `reports/`.
- Với hình ảnh dùng trong tài liệu, đặt trong `images/` và tham chiếu bằng đường dẫn tương đối.
- Không đưa thông tin nhạy cảm lên repo public, bao gồm mật khẩu, IP nội bộ, thông tin khách hàng, dữ liệu cá nhân hoặc log chưa được làm sạch.

## Ghi chú

Các tài liệu trong repo phản ánh kinh nghiệm thực tế và ghi chú kỹ thuật cá nhân. Khi áp dụng vào môi trường production, cần kiểm tra lại theo phiên bản hệ thống, chính sách vận hành và yêu cầu bảo mật cụ thể.
