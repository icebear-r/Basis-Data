Table: database biodata(pengguna)
Columns:
NAMA : Maya varchar(50) PK 
Usia : 37 int PK 
Pekerjaan : Direktur Pemasaran di StartUp teknologi varchar(50) PK 
Lokasi : Jakarta Pusat, Indonesia varchar(50) PK 
Keluarga : Lily (6) dan Leo (4) varchar(50) PK 
Hobi : Marathon, menghadiri pameran seni, Bermain piano varchar(50) PK 
User ID Maya

Table: jadwal (pengguna)
Columns:
Jadwal Bu Maya int PK 
Nama Kegiatan varchar(50) PK 
Mulai Kegiatan time PK 
Selesai Kegiatan time PK 
Hari date PK 
User ID Maya int PK

Table: kegiatan fisik (pengguna)
Columns:
Aktifitas int PK 
Jadwal Bu Maya varchar(50) PK 
Kegiatan Fisik (Lari Marathon) varchar(50) PK 
Waktu Kegiatan (06:00) time PK 
Kegiatan Fisik (Bermain Piano) varchar(50) PK 
Waktu Kegiatan (20:00) time PK 
Kegiatan Fisik (Menghadiri Seni) varchar(50) PK 
Waktu Kegiatan (12:00) time PK 
User ID Maya int PK

Table: makanan sehat (pengguna)
Columns:
Salad Buah varchar(50) PK 
Tempe Dan Tahu varchar(50) PK 
Smoothie varchar(50) PK 
User ID Maya int PK