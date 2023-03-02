 ÖDEV1-NURÝ GÖKDOÐAN-1306170084-BÝLGÝSAYAR MÜHENDÝSLÝÐÝNE GÝRÝÞ BIMU1053

1)CREATE DATABASE komutuyla odev1 adli yeni bir veritabaný oluþturunuz.
MariaDB [(none)]> create database odev1;
Query OK, 1 row affected (0.00 sec)
2)Odev veritabanýna USE komutuyla geçiniz.
MariaDB [(none)]> use odev1;
Database changed
3)Aþaðýdaki tabloyu oluþturan CREATE TABLE komutunu yazýnýz (personelNo birincil anahtardýr/PRIMARY KEY, personelin adý ve soyadý NULL olamaz, pasaportNo verilmediyse ‘??????????’ deðeri default/kabul_edilen deðer olacaktýr.)
MariaDB [odev1]> create table personel(personelNO int primary key,adi varchar(20) not null,soyadi varchar(20) not null,dogumyeri varchar(20),dogumtarihi date,pasaportNO varchar(11) default"???????????");
Query OK, 0 rows affected (0.27 sec)
4)5 kaydý tabloya ekleyen INSERT komutlarýný yazýnýz
MariaDB [odev1]> insert into personel values('121','nuri','gokdogan','corum','1997/09/15','151405');
Query OK, 1 row affected (0.06 sec)

MariaDB [odev1]> insert into personel values('122','ali','emin','amasya','1998/12/14','151404');
Query OK, 1 row affected (0.11 sec)

MariaDB [odev1]> insert into personel values('123','nisa','kivanc','mersin','2018/02/17','151403');
Query OK, 1 row affected (0.07 sec)

MariaDB [odev1]> insert into personel values('124','sima','aydn','samsun','1999/05/16','151402');
Query OK, 1 row affected (0.08 sec)

MariaDB [odev1]> insert into personel values('125','ahmet','yilmaz','istanbul','2000/02/14','151401');
Query OK, 1 row affected (0.05 sec)
 
MariaDB [odev1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        122 | ali   | emin     | amasya    | 1998-12-14  | 151404     |
|        123 | nisa  | kivanc   | mersin    | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
5 rows in set (0.00 sec)

5)Bu tablodan soyadýnda ‘E’ harfi olan öðrencileri silen DELETE komutunu yazýnýz
MariaDB [odev1]> delete from personel where soyadi like "%e%";
Query OK, 1 row affected (0.06 sec)

MariaDB [odev1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        123 | nisa  | kivanc   | mersin    | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
4 rows in set (0.00 sec)

6)Doðum tarihi ‘2018-02-17’ olan personelin doðun yerini ‘Aydýn’ olarak deðiþtiren UPDATE komutunu yazýnýz.
MariaDB [odev1]>  update personel set dogumyeri='aydin' where dogumtarihi='2018/02/17';
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0




MariaDB [odev1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO |
+------------+-------+----------+-----------+-------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     |
|        123 | nisa  | kivanc   | aydn      | 2018-02-17  | 151403     |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     |
+------------+-------+----------+-----------+-------------+------------+
4 rows in set (0.00 sec)

7)Bu tablodaki pasaportNo sütununu silen ve 11 rakamlý TCKimlikNo alanýný ekleyen ALTER TABLE komutlarýný yazýnýz.
MariaDB [odev1]> alter table personel add column tckimlikno varchar(11);
Query OK, 0 rows affected (0.70 sec)
Records: 0  Duplicates: 0  Warnings: 0

MariaDB [odev1]> select * from personel;
+------------+-------+----------+-----------+-------------+------------+------------+
| personelNO | adi   | soyadi   | dogumyeri | dogumtarihi | pasaportNO | tckimlikno |
+------------+-------+----------+-----------+-------------+------------+------------+
|        121 | nuri  | gokdogan | corum     | 1997-09-15  | 151405     | NULL       |
|        123 | nisa  | kivanc   | aydin     | 2018-02-17  | 151403     | NULL       |
|        124 | sima  | aydn     | samsun    | 1999-05-16  | 151402     | NULL       |
|        125 | ahmet | yilmaz   | istanbul  | 2000-02-14  | 151401     | NULL       |
+------------+-------+----------+-----------+-------------+------------+------------+
4 rows in set (0.00 sec)

8)Tablodaki en yaþlý kiþinin doðum tarihini yazdýran SELECT komutunu yazýnýz.
MariaDB [odev1]> select min(dogumtarihi) from personel;
+------------------+
| min(dogumtarihi) |
+------------------+
| 1997-09-15       |
+------------------+
1 row in set (0.00 sec)

9)Doðum yerlerine göre her þehirden kaç personel olduðunu listeleyen SELECT komutunu yazýnýz.
MariaDB [odev1]> select dogumyeri,count(*) from personel group by dogumyeri;
+-----------+----------+
| dogumyeri | count(*) |
+-----------+----------+
| aydin     |        1 |
| corum     |        1 |
| istanbul  |        1 |
| samsun    |        1 |
+-----------+----------+
4 rows in set (0.00 sec)

10)‘2000-01-01’ tarihinden önce Samsun doðumlu kiþilerin kayýtlarýný listeleyen SELECT komutunu yazýnýz.
MariaDB [odev1]> select * from personel where dogumyeri="samsun" and dogumtarihi < 20000101;
+------------+------+--------+-----------+-------------+------------+------------+
| personelNO | adi  | soyadi | dogumyeri | dogumtarihi | pasaportNO | tckimlikno |
+------------+------+--------+-----------+-------------+------------+------------+
|        124 | sima | aydn   | samsun    | 1999-05-16  | 151402     | NULL       |
+------------+------+--------+-----------+-------------+------------+------------+
1 row in set (0.00 sec)

MariaDB [odev1]> exit
