--SQL'de sorgu optimizasyonu:

--1-) Select * from tablo yerine, sadece ihtiyaç duyulan sütunların yazılması daha hızlı bir sorgu sağlar.

select * from booking

Select 
	id,
	contactid,
	contactemail,
	company,
	membersales,
	userid,
	userregisterdate,
	environment,
	bookingdate
	from 
booking

--SQL içerisindeki IN içinde bulunan değer çok fazla olmamalıdır.

select * from booking where contactid in (...);

select * from booking where bookingdate::date IN ('2020-12-01', '2020-12-03', ... ,'2020-12-15')
-- Bu sorgu yerine;
select * from booking where bookingdate::date BETWEEN '2020-12-01' AND '2020-12-15'
--Kullanılabilir (BETWEEN kullanmak zaman dönüşüm fonksiyonlarına göre de daha hızlı bir sorgu sağlar)

--LIMIT
select * from booking
LIMIT 100

--INDEX Kullanmak:

--Index’ler veritabanı arama motorlarının veri sorgulamayı hızlandırmak amacıyla kullandığı 
--özel veri yapılarıdır.

--Basitçe bir index, indexlenmek istenen tablodaki istenilen sütun verilerini (pointer)işaretler.

--Klişe ama çok açık bir örnek olarak kitaplardaki index/içindekiler kısmı göz önüne alınabilir.

--Bir index SELECT ve WHERE ifadeli sorguları hızlandırmaya yardım ederken INSERT ve UPDATE operasyonları 
--gerçekleştirilirken ek bir adım gerektiği için veri yazmayı yavaşlatmaktadır.

--Tek index’li bir tabloda bir yazma işlemi (INSERT ya da UPDATE) gerçekleştirirseniz, 
--aslında iki tane işlem yapmış olursunuz. Biri tablo verisini yazmak ya da güncellemek için 
--diğeri ise index’i yazma ve düzenleme için yapılır. 
--Index işleminde index verileri sıralama tipine göre yeniden düzenlenir.

--Verimiz belirlediğimiz index yapısına göre işaretlenir ve bir düzen içerisinde sıralı bir biçimde tutulur.
--Yani bir veri kaydedilirken/güncellenirken index’lediğimiz sütun üzerinden bir işlem adımı daha eklemiş
--oluruz. 
--Index’imiz üzerinden sorgu gerçekleştirdiğimizde de tüm veriler üzerinden değil indexler üzerinden bir 
--okuma işlemi gerçekleştirmiş ve daha hızlı bir veri okuma yapmış oluruz.

--Bu tablodaki email sütunuyla ilgili oldukça fazla sorgulama/okuma işlemi olduğunu düşünelim:

SELECT * FROM booking WHERE contactemail = '1@enuygun.com';

--email sütunu için herhangi bir index olmadığından, veritabanı motorunun ilgili kullanıcıyı aramak için 
--booking tablosunun tümünü taraması gerekiyor.
--Bütün tabloyu taramak, tablo yapısı büyüdükçe sorgunun sonuca ulaşmasını geciktirir ve daha fazla 
--zaman alır.

--İlgili sütun üzerinde index oluşturma:

CREATE INDEX idx_booking_contactemail ON booking(contactemail);

--Where is null gibi ifadelerden kaçınmak da performansı arttırır.
--Order by gerekmediği sürece kullanılmamalıdır. Order by kullanımı da performansı etkiler.
--İç içe sorgular performansı kötü etkiler. Bunun yerine JOIN kullanılmalıdır.
--Subquery'ler yerine WITH-CLAUSE gibi temp tablo yapıları kullanmak performansı arttırır.
--UNION ALL kullanımı UNION kullanımından daha hızlı sonuç verir.
--UNION ALL yinelenen satırları kaldırmak için kullanılan match'leme işlemini kaldırır.
--Dolayısıyla daha hızlı bir sorgulama sağlar.
