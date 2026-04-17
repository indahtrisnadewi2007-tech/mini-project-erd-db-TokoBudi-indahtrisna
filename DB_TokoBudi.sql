CREATE DATABASE DB_TokoBudi;
USE DB_TokoBudi;

CREATE TABLE Distributor (
	ID_Supplier VARCHAR(10) PRIMARY KEY,
	Nama_Supplier VARCHAR(50) NOT NULL,
	Alamat_Gudang VARCHAR(50),
	Nomor_Kontak INT,
	Tahun_Mulai_Kontrak INT
	);

CREATE TABLE Faktur (
	ID_Faktur VARCHAR(10) PRIMARY KEY,
	ID_Supplier VARCHAR(10) FOREIGN KEY REFERENCES Distributor (ID_Supplier),
	Tanggal_Pesan DATE,
	Tanggal_Terima DATE
	);

CREATE TABLE Barang (
	ID_Barang VARCHAR(10) PRIMARY KEY,
	Nama_Barang VARCHAR(20),
	Harga_Beli INT,
	Harga_Jual INT
	);

CREATE TABLE DetailFaktur (
	ID_Detail VARCHAR(10) PRIMARY KEY,
	ID_Barang VARCHAR(10) FOREIGN KEY REFERENCES Barang (ID_Barang),
	ID_Faktur VARCHAR(10) FOREIGN KEY REFERENCES Faktur (ID_Faktur),
	Jumlah INT,
	Margin DECIMAL(10,2)
	);

INSERT INTO Distributor (ID_Supplier,Nama_Supplier,Alamat_Gudang,Nomor_Kontak,Tahun_Mulai_Kontrak) VALUES
('SUP1','PT. Sumber Makmur','Sukabumi',123, 2018),
('SUP2','PT. Sumber Makmur','Solo',123,2018),
('SUP3','PT. Sumber Makmur','Cirebon',123,2018),
('SUP4','PT.Snack Jaya','Depok',456,2020),
('SUP5','PT. Snack Jaya','Bekasi',456,2020);

INSERT INTO Faktur (ID_Faktur,ID_Supplier,Tanggal_Pesan,Tanggal_Terima) VALUES
('FKTUR1','SUP1','2026-1-10','2026-1-15'),
('FKTUR2','SUP2','2026-1-10','2026-1-15'),
('FKTUR3','SUP3','2026-2-15','2026-2-17'),
('FKTUR4','SUP4','2026-3-1','2026-3-2'),
('FKTUR5','SUP5','2026-3-1','2026-3-2');

INSERT INTO Barang (ID_Barang,Nama_Barang,Harga_Beli,Harga_Jual) VALUES
('BRG1','Beras Premium',10000,12000),
('BRG2','Minyak Goreng',14000,16500),
('BRG3','Sabun Mandi',3000,4500),
('BRG4','Keripik Kentang',8000,11000);

INSERT INTO DetailFaktur (ID_Detail,ID_Barang,ID_Faktur,Jumlah) VALUES 
('DF1','BRG1','FKTUR1',2),
('DF2','BRG2','FKTUR2',3),
('DF3','BRG3','FKTUR3',1),
('DF4','BRG4','FKTUR4',5);
