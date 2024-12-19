CREATE DATABASE akademik_1;

USE akademik_1;

CREATE TABLE dosen (
    Nip varchar(12) NOT NULL,
    Nama_Dosen varchar(25) NOT NULL,
    PRIMARY KEY (Nip)
);

CREATE TABLE mahasiswa (
    Nim varchar(9) NOT NULL,
    Nama_Mhs varchar(25) NOT NULL,
    Tgl_Lahir date NOT NULL,
    Alamat varchar(50) NOT NULL,
    Jenis_Kelamin enum('Laki-laki', 'Perempuan') NOT NULL,
    IPK decimal(3,2),
    PRIMARY KEY (Nim)
);

CREATE TABLE matakuliah (
    Kode_MK varchar(6) NOT NULL,
    Nama_MK varchar(20) NOT NULL,
    Sks int(2) NOT NULL,
    PRIMARY KEY (Kode_MK)
);

CREATE TABLE perkuliahan (
    Nim varchar(9) DEFAULT NULL,
    Kode_MK varchar(6) DEFAULT NULL,
    Nip varchar(12) DEFAULT NULL,
    Kehadiran decimal(5,2),
    Nilai_Bobot char(1) NOT NULL,
    Nilai_Angka decimal(5,2),
    Poin varchar(1),
    KEY Nip (Nip),
    KEY Nim (Nim),
    KEY Kode_MK (Kode_MK),
    CONSTRAINT perkuliahan_ibfk_1 FOREIGN KEY (Nip) REFERENCES dosen (Nip) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT perkuliahan_ibfk_2 FOREIGN KEY (Nim) REFERENCES mahasiswa (Nim) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT perkuliahan_ibfk_3 FOREIGN KEY (Kode_MK) REFERENCES matakuliah (Kode_MK) ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM dosen;

SELECT * FROM dosen
WHERE Nip = "0429038801";

INSERT INTO dosen (Nip, Nama_Dosen) 
VALUES ("0429038801", "Mariana, S.Kom., MMSI.");

UPDATE dosen 
SET Nama_Dosen = "Nurita, S.Kom., MMSI." 
WHERE Nip = "0429038801";

DELETE FROM dosen
WHERE Nip = "0429038801";

SELECT * FROM nilai_mahasiswa WHERE nilai < 75;

CREATE TABLE dosen (
    nip VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255),
    telepon VARCHAR(15)
);
DELIMITER //

CREATE PROCEDURE SP_Tambah_Dosen(
    IN p_nip VARCHAR(20),
    IN p_nama VARCHAR(100),
    IN p_alamat VARCHAR(255),
    IN p_telepon VARCHAR(15)
)

BEGIN
    INSERT INTO dosen (nip, nama, alamat, telepon)
    VALUES (p_nip, p_nama, p_alamat, p_telepon);
END //

DELIMITER ;

CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT
);

DELIMITER //

CREATE PROCEDURE SP_Tambah_MataKuliah(
    IN p_kode_mk VARCHAR(10),
    IN p_nama_mk VARCHAR(100),
    IN p_sks INT
)
BEGIN
    INSERT INTO mata_kuliah (kode_mk, nama_mk, sks)
    VALUES (p_kode_mk, p_nama_mk, p_sks);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_Query_Dosen(
    IN p_nip VARCHAR(20)
)
BEGIN
    SELECT * FROM dosen
    WHERE nip = p_nip;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_Query_MataKuliah(
    IN p_kode_mk VARCHAR(10)
)
BEGIN
    SELECT * FROM mata_kuliah
    WHERE kode_mk = p_kode_mk;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_Update_Dosen(
    IN p_nip VARCHAR(20),
    IN p_nama VARCHAR(100),
    IN p_alamat VARCHAR(255),
    IN p_telepon VARCHAR(15)
)
BEGIN
    UPDATE dosen
    SET nama = p_nama, alamat = p_alamat, telepon = p_telepon
    WHERE nip = p_nip;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_Update_MataKuliah(
    IN p_kode_mk VARCHAR(10),
    IN p_nama_mk VARCHAR(100),
    IN p_sks INT
)
BEGIN
    UPDATE mata_kuliah
    SET nama_mk = p_nama_mk, sks = p_sks
    WHERE kode_mk = p_kode_mk;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE SP_Delete_MataKuliah(
    IN p_kode_mk VARCHAR(10)
)
BEGIN
    DELETE FROM mata_kuliah
    WHERE kode_mk = p_kode_mk;
END //

DELIMITER ;
