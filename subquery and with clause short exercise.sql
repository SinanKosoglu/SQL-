Create database TestingAirway

Create table Passenger 
(
	ID integer primary key,
	booking_id integer,
	gender varchar(1),
	name varchar(30),
	dateofbirth date
)

select * from passenger

show datestyle
set datestyle TO MDY
set datestyle to DMY
set datestyle to YMD
set datesytle to ydm

truncate table passenger -- içeriğini tamamen sildi.
drop table passenger -- tabloyu tamamen sildi.

Copy passenger from 'C:\Program Files\PostgreSQL\15\bin\passenger.csv' delimiter ',' csv header 

create table payment
(
	ID integer primary key,
	Booking_id integer,
	amount integer,
	card_type varchar(50),
	payment_status varchar (50),
	card_number varchar(50),
	payment_date timestamp without time zone
)
select * from payment

Copy payment from 'C:\Program Files\PostgreSQL\15\bin\payment.csv' delimiter ',' csv header

drop table payment -- tabloyu tamamen sildi.

create table booking
(
	ID integer primary key,
	contact_id integer, 
	contact_email varchar(50),
	company varchar(30),
	member_sales varchar(30),
	user_id varchar(30),
	user_register_date timestamp without time zone,
	environment varchar(30),
	booking_date timestamp without time zone
)

select * from booking

Copy booking from 'C:\Program Files\PostgreSQL\15\bin\booking.csv' delimiter ',' csv header

--** Veri setinden notlar:
-- Müşterileri contactID temsil ediyor. 
-- Sepet sayısı için BookingID, yolcu sayısı için passengerID baz alınmalıdır. 
-- Bir sepette birden fazla yolcu (passengerID) olabilir fakat sadece bir contactID olabilir.
-- Üye olmayan müşterilerin, üyelik tarihi boş bırakılmıştır.
-- Payment statuslar için iadeler başarılı veya başarısız sayılmamalıdır. 

select * from payment

-- ALT SORGULAR  (subquery)
-- SQL' DE "alt sorgu" (subquery) bir başka sorgu içinde kullanılan ve veri çekmek için kullanılan sorgu anlamındadır. 

select * from booking
where id in (select booking_id from passenger where gender ='F')
;
select * 
from booking as b
inner join (select * from passenger where gender='F') 
as p on p.booking_id=b.id
;
select *,
		(select round(avg(amount), 2) as avg_amount from payment) as avg_amount 
from booking
-- subquery where id in ve inner join yani join lerden sonra kullanılabilir. 
-- subquery ile yazdığım sorgu bir tabloymuş gibi hareket ediliyor. 
-- having ve select'ten sonra kullanılabiliyor. 
-- alt sorgularda ekstra bir tablo yaratılıyor. 
-- Bir tabloda ki verileri teker teker yazacağına her bir bilgi karşılığına gelecek şekilde kout karşına filtre edilmiş şekilde getiriyor.)

-- veri tabanı açısından çok fazla alt sorgu kullanmak performansı kötü etkiler. 
-- bunun yerine temp tablo kullanmak gerekebilir. 

-- ÖRNEK 1
-- Ödeme tarihi 2020 yılındaki booking id lerin contact id bilgisi nedir?
select * from payment
select * from booking

select 
	b.contact_id	
from
	booking as b
left join 
	payment as p on p.id=b.id
where
	 p.PAYMENT_DATE >= '2020-01-01'
				AND p.PAYMENT_DATE < '2021-01-01'
;
SELECT CONTACT_ID
FROM BOOKING
WHERE ID IN
		(SELECT BOOKING_ID
			FROM PAYMENT
			WHERE PAYMENT_DATE >= '2020-01-01'
				AND PAYMENT_DATE < '2021-01-01')
-- performans açısından kötü bir işlemdir. 
;
-- örnek 2 
-- 2021 yılında kart tipi kredi kartı olan booking_idlerin sepet cinsiyet dağılımı nasıldır?
select * from payment -- Card_type ve payment_date
-- şartların ikisini de where komutu altında yazdık.
select * from passenger -- Gender saydırma F ve M 
-- count ve * ile sütunları ayarladık. ardından group by yaptık ana amacımız bu. sonra filtre attık
-- booking_id üzerinden eşleştirme.

SELECT GENDER,
	COUNT (*)
FROM PASSENGER
WHERE booking_ID IN
		(SELECT BOOKING_ID
			FROM PAYMENT
			WHERE CARD_TYPE = 'KrediKartı'
				AND PAYMENT_DATE >= '2021-01-01'
				AND PAYMENT_DATE < '2022-01-01')
GROUP BY GENDER

-- WITH 
-- SQL'de "WITH" (common table expression) komutu, bir sorgunun ara sonuçlarınını tanımlayan geçici bir tablo oluşturur. 
-- "with" sorgusu sorgudan önce yazılır. Beraberinde gelecek bir tablo gibi düşünebiliriz. 

-- 'with' komutu ile başlanılan sorgularda oluşturulan geçici tabloya isim verilmesi gerekiyor ve (...) parantez içinde yazılması gerekiyor.
-- !! soru !! her kontak id nin kaç tane rezervasyon yaptığını bulmak için nasıl bir komut yazılmalı?
-- ** with komutları nerelerde kullanılır ** --  
-- yinelenen sorgu parçalarını tekrarını önlemek için 
-- sorguları basitleştirmek için kullanılır. 
-- geçici tablo oluşturmak için
-- sorguları kolaylaştırmak için
-- sorguları anlaşılır bir şekilde gruplanmasını 

-- performansı arttırıcı etkisi olabilir. veritabanı sunucusu, geçici tablolardakki verileri saklamak için bellekte yer ayırabilir. 

-- ortalama bıraktığı miktar 300 liradan fazla olan bookingid (sepetin), bu işlemler hangi platformdan geliyor?
select * from booking
select * from payment
select count (*) satirsayisi, count(distinct (booking_id)) tekil_satirsayisi from payment

--** Subquery ile yapılışı **--
SELECT ENVIRONMENT as portal,
	COUNT(ENVIRONMENT) as portal_kisisayisi
FROM BOOKING
WHERE ID IN
		(SELECT BOOKING_ID
			FROM PAYMENT
			GROUP BY BOOKING_ID
			HAVING AVG (AMOUNT) > 300)
GROUP BY ENVIRONMENT
-- WHERE, FROM tarafından ana tablodan getirilmesi istenen satırlarda bir filtre işlevi görmektedir. 
-- Yani sorguya bazı kısıtlamalar getirerek ana tablo içerisinden kullanılacak olan veriyi seçmektedir. 
-- Bu işlem gruplamadan önce yapılmaktadır. 
-- WHERE komutu, toplama işlevli koşullar olan aggregate fonksiyonlarda kullanılmamaktadır.

-- HAVING ise GROUP BY komutu ile gruplanmış olan veriden sonra filtreleme yapmaktadır. 
-- Bu sebeple gruplandıktan sonra bir filtre verilecekse o filtrede SUM, AVG, COUNT gibi aggregate fonksiyonların bulunması gerekmektedir.
;
--**WİTH KOMUTU İLE YAPILIŞI**--
WITH ORT_HARCAMA as
	(SELECT BOOKING_ID
		FROM PAYMENT
		GROUP BY BOOKING_ID
		HAVING AVG (AMOUNT) > 300)
SELECT ENVIRONMENT,
	COUNT(*) AS SATIR_SAYISI
FROM BOOKING AS B
INNER JOIN ORT_HARCAMA AS OH ON b.id=oh.booking_id 
GROUP BY ENVIRONMENT

-- Doğum tarihine göre (genç yaşlı segmentle) ödeme başarılı veya başarısız durumunu incele. yaş segmentine göre grupla.
select * from payment
select * from passenger

WITH ODEMEBASARI_YAS AS
	(SELECT DATEOFBIRTH,
			PAYMENT_STATUS,
			CASE
							WHEN DATEOFBIRTH < '1970-01-01' THEN 'yasli'
							WHEN DATEOFBIRTH >= '1970-01-01'
												AND DATEOFBIRTH < '1990-01-01' THEN 'ortayasli'
							WHEN DATEOFBIRTH >= '1990-01-01' THEN 'genc'
			END AS YAS_SEGMENT
		FROM PASSENGER AS PS
		INNER JOIN PAYMENT AS PY ON PS.BOOKING_ID = PY.BOOKING_ID)
SELECT YAS_SEGMENT,
	PAYMENT_STATUS,
	COUNT (*)
FROM ODEMEBASARI_YAS
GROUP BY YAS_SEGMENT,
	PAYMENT_STATUS
	
--dikkat edilecek durumlardan bir tanesi de iki tabloyu birleştiriken eğer aynı isim varsa başına kısaltmasını ve'.' nokta koyup öyle yazılması gerekiyor.
  
-- BAŞKA ÖRNEKLER-- 
-- müşteri bazlı rezervasyon adedi ve yolcu adedi nedir?
WITH booking_count as
(
	Select contact_id, count (id) as booking_count
	from booking 
	group by contact_id
)
, 
passenger_count as
(
	select booking_id, count(distinct booking_id) as passenger_count 
	from passenger 
	group by booking_id
)
	select 
	b.id,
	b.contact_id,
	company,
	booking_date,
	bc.booking_count,
	pc.passenger_count
	from booking as b
	left join booking_count as bc on bc.contact_id=b.contact_id
	left join passenger_count as pc on pc.booking_id=b.id
	
where b.contact_id = 736711 -- booking.contact_id bazlı filtreleme yapılabilir.
	
-- 'left join' komutunun olmasının sebebi 'booking' tablosunda 'null' değerler var, bütün değerlerin gelmesini istiyoruz.
-- 'Inner join' komutu kullandığımızda bu örnek özelinde bir veri kaybı yaşandığı görülmüyor fakat daha dikkatli incelenmesi gerekir...

-- Booking id si bazında gender sayısı nedir? 

select * from passenger

select 
	booking_id,
	count(gender) as gender_sayısı
from 
	passenger
group by 
	booking_id
order by 
	gender_sayısı desc