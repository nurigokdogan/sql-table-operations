-- 1)CREATE DATABASE komutuyla  yeni bir veritabanı oluşturunuz.

MariaDB [(none)]> create database dataBase1;
Query OK, 1 row affected (0.00 sec)

-- 2)Veritabanına USE komutuyla geçiniz.

MariaDB [(none)]> use dataBase1;
Database changed


-- 3)Aşağıdaki tabloyu oluşturan CREATE TABLE komutunu yazınız (personelNo birincil anahtardır/PRIMARY KEY, personelin adı ve soyadı NULL olamaz, pasaportNo verilmediyse ‘??????????’ deðeri default/kabul_edilen deðer olacaktır.)

MariaDB [dataBase1]> create table personel(personelNO int primary key,adi varchar(20) not null,soyadi varchar(20) not null,dogumyeri varchar(20),dogumtarihi date,pasaportNO varchar(11) default"???????????");
Query OK, 0 rows affected (0.27 sec)


-- 4) 5 kaydı tabloya ekleyen INSERT komutlarını yazınız

MariaDB [dataBase1]> insert into personel values('121','nuri','gokdogan','corum','1997/09/15','151405');
Query OK, 1 row affected (0.06 sec)

MariaDB [dataBase1]> insert into personel values('122','ali','emin','amasya','1998/12/14','151404');
Query OK, 1 row affected (0.11 sec)

MariaDB [dataBase1]> insert into personel values('123','nisa','kivanc','mersin','2018/02/17','151403');
Query OK, 1 row affected (0.07 sec)

MariaDB [dataBase1]> insert into personel values('124','sima','aydn','samsun','1999/05/16','151402');
Query OK, 1 row affected (0.08 sec)

MariaDB [dataBase1]> insert into personel values('125','ahmet','yilmaz','istanbul','2000/02/14','151401');
Query OK, 1 row affected (0.05 sec)
 
MariaDB [dataBase1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        122 | ali   | emin     | amasya    | 1998-12-14  | 151404     |
|        123 | nisa  | kivanc   | mersin    | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
5 rows in set (0.00 sec)


-- 5)Bu tablodan soyadında ‘E’ harfi olan öðrencileri silen DELETE komutunu yazınız

MariaDB [dataBase1]> delete from personel where soyadi like "%e%";
Query OK, 1 row affected (0.06 sec)

MariaDB [dataBase1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        123 | nisa  | kivanc   | mersin    | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
4 rows in set (0.00 sec)


-- 6)Doðum tarihi ‘2018-02-17’ olan personelin doðun yerini ‘Aydın’ olarak değiştiren UPDATE komutunu yazınız.

MariaDB [dataBase1]>  update personel set dogumyeri='aydin' where dogumtarihi='2018/02/17';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0




MariaDB [dataBase1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        123 | nisa  | kivanc   | aydn      | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
4 rows in set (0.00 sec)


-- 7)Bu tablodaki pasaportNo sütununu silen ve 11 rakamlı TCKimlikNo alanını ekleyen ALTER TABLE komutlarını yazınız.

MariaDB [dataBase1]> alter table personel add column tckimlikno varchar(11);
Query OK, 0 rows affected (0.70 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [dataBase1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO | tckimlikno |
+------------+-------+----------+-----------+-------------+------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     | NULL       |
|        123 | nisa  | kivanc   | aydin     | 2018-02-17  | 151403     | NULL       |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     | NULL       |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     | NULL       |
+------------+-------+----------+-----------+-------------+------------+------------+
4 rows in set (0.00 sec)


-- 8)Tablodaki en yaşlı kişinin doğum tarihini yazdıran SELECT komutunu yazınız.

MariaDB [dataBase1]> select min(dogumtarihi) from personel;
+------------------+
| min(dogumtarihi) |
+------------------+
| 1997-09-15       |
+------------------+
1 row in set (0.00 sec)


-- 9)Doğum yerlerine göre her þehirden kaç personel olduðunu listeleyen SELECT komutunu yazınız.

MariaDB [dataBase1]> select dogumyeri,count(*) from personel group by dogumyeri;
+-----------+----------+
| dogumyeri | count(*) |
+-----------+----------+
| aydin     |        1 |
| corum     |        1 |
| istanbul  |        1 |
| samsun    |        1 |
+-----------+----------+
4 rows in set (0.00 sec)


-- 10)‘2000-01-01’ tarihinden önce Samsun doðumlu kişilerin kayıtlarını listeleyen SELECT komutunu yazınız.

MariaDB [dataBase1]> select * from personel where dogumyeri="samsun" and dogumtarihi < 20000101;
+------------+------+--------+-----------+-------------+------------+------------+
| personelNO | adi  | soyadi | dogumyeri | dogumtarihi | pasaportNO | tckimlikno |
+------------+------+--------+-----------+-------------+------------+------------+
|        124 | sima | aydn   | samsun    | 1999-05-16  | 151402     | NULL       |
+------------+------+--------+-----------+-------------+------------+------------+
1 row in set (0.00 sec)

MariaDB [dataBase1]> exit
