select * from customers limit 100 -- customer unique id sayısı 96096
select * from order_items limit 100 --112650 adet ürün satışı var
select * from order_payments limit 100
select * from order_reviews limit 100
select * from orders limit 100 --99441 adet sipariş
select * from product_category_name_translation limit 100 - 71 adet ürün kategorisi var
select * from products limit 100 --32951 ürün var
select * from sellers limit 100
-- 1.case 1.soru
-- aylık olarak order dağılımını inceleyin. tarih verisi için order_approved_at

Select 
	extract ('Month' from order_approved_at) as AY,
	count (order_id) as onaylı_siparis_sayisi
from
	orders
group by 
	1
order by
	1
;
-- 1. case 2. soru
--Aylık olarak order status kırılımında order sayılarını inceleyiniz. 
--Sorgu sonucunda çıkan outputu excel ile görselleştiriniz. 
--Dramatik bir düşüşün ya da yükselişin olduğu aylar var mı? Veriyi inceleyerek yorumlayınız.

select 
	order_status,
	extract ('Month' from order_approved_at) as Ay,
	count(order_status) as siparis_durumu
from 
	orders
group by 	
	1,2
order by 
	2
;
-- 1.case 3. soru
--Ürün kategorisi kırılımında sipariş sayılarını inceleyiniz. 
--Özel günlerde öne çıkan kategoriler nelerdir? Örneğin yılbaşı, sevgililer günü

select 
	pt.product_category_name_english,
	sum(oi.order_item_id) as siparis_sayisi
from 
	products as p
left join 
	order_items as oi on p.product_id = oi.product_id
left join 
	product_category_name_translation as pt on p.product_category_name = pt.product_category_name
where
	pt.product_category_name_english is not null
group by 
	1
order by 
	2 desc
	
;
select 
	pt.product_category_name_english,
	sum(oi.order_item_id) as siparis_sayisi,
	to_char(o.order_approved_at, 'dd-mon') as gun_ay
from 
	products as p
left join 
	order_items as oi on p.product_id = oi.product_id
left join 
	product_category_name_translation as pt on p.product_category_name = pt.product_category_name
left join
	orders as o on o.order_id = oi.order_id
where 
	pt.product_category_name_english is not null
group by 
	1,3
order by
	3
;
--1. case 4.soru
--Haftanın günleri(pazartesi, perşembe, ….) ve ay günleri (ayın 1’i,2’si gibi) bazında order sayılarını inceleyiniz. 
--Yazdığınız sorgunun outputu ile excel’de bir görsel oluşturup yorumlayınız.
	select 
		sum(order_item_id) as siparis_sayisi,
		to_char(order_approved_at, 'DAY') as Gün,
		date_part('day', order_approved_at::TIMESTAMP) as gun_sayi
	from 
		order_items as oi
	left join 
		orders as o on o.order_id = oi.order_id
	group by 
		2,3
-- 2. case 1. soru
--Hangi şehirlerdeki müşteriler daha çok alışveriş yapıyor? 
--Müşterinin şehrini en çok sipariş verdiği şehir olarak belirleyip analizi ona göre yapınız. 
-- şehir bazında sipariş adedi
select
	c.customer_city as musteri_sehri,
	count(o.order_id) as siparis_adedi
from
	customers as c
left join 
	orders as o on o.customer_id = c.customer_id
group by 
	1
order by 
	2 desc
limit 20
--CEVAP 2. kısım
WITH CustomerCityOrders AS (
    SELECT
        c.customer_unique_id,
        c.customer_city,
        o.order_id
    FROM
        customers c
    JOIN
        orders o ON c.customer_id = o.customer_id
),
CityOrderCounts AS (
    SELECT
        customer_unique_id,
        customer_city,
        COUNT(order_id) AS order_count,
        ROW_NUMBER() OVER (PARTITION BY customer_unique_id ORDER BY COUNT(order_id) DESC) AS city_rank
    FROM
        CustomerCityOrders
    GROUP BY
        1,2
)
SELECT
    customer_unique_id,
    customer_city AS most_ordering_city,
	order_count as max_orders
FROM
    CityOrderCounts
WHERE
    city_rank = 1
ORDER BY
    3 desc
limit 20
;
--case 3. 1.soru
--Siparişleri en hızlı şekilde müşterilere ulaştıran satıcılar kimlerdir? Top 5 getiriniz. 
--Bu satıcıların order sayıları ile ürünlerindeki yorumlar ve puanlamaları inceleyiniz ve yorumlayınız. 
select * from order_items limit 100 --112650 adet sipariş
select * from order_reviews limit 100 
select * from orders limit 100 --99441 adet sipariş 
select * from sellers limit 100
-- order_delivered_customer_date - 96476 adet null olmayan veri
-- order_approved_at - 99281 adet null olmayan veri
with siparis_sevk_zamanı as(
select 
	order_id as siparis_id,
	age (order_delivered_customer_date, order_approved_at) as sevk_zamanı
from 
	orders
where 
	order_delivered_customer_date > order_approved_at and order_status ='delivered'
order by 
	2 asc
)
select
	oi.seller_id as satıscı,
	count(siparis_id) as top_siparis_adedi,
	avg(sevk_zamanı) as ort_siparis_zamanı,
	round(avg(oi.order_item_id),2) as ort_siparis_miktarı,
	round(avg(ordrev.review_score),2) as ort_siparispuanı,
    count(ordrev.review_comment_message) as top_yorum_sayısı
from
	siparis_sevk_zamanı as ssz
join
	order_items as oi on ssz.siparis_id = oi.order_id
join
	order_reviews as ordrev on ssz.siparis_id = ordrev.order_id
group by 
	1
having
	count(siparis_id) > 50
order by 
	3
limit
	5
;
Select avg(order_item_id) from order_items 
;	
--96395 teslim edilmiş başarılı makul sevk!
select
	*
from
	orders
where 
	order_delivered_customer_date < order_approved_at
--61 adet veride sipariş onay zamanı teslimat zamanından daha ileri bir tarihte!! Bu hata yüzünden bu veriler de hariç bırakıldı. 
;
-- case 3 soru 2
--Hangi satıcılar daha fazla kategoriye ait ürün satışı yapmaktadır? 
--Fazla kategoriye sahip satıcıların order sayıları da fazla mı? 
select * from order_items limit 100 
select * from orders limit 100 
select * from products limit 100 
;
select
	oi.seller_id as satıcılar,
	count(distinct p.product_category_name) as tekil_kategori_sayisi,
	sum(oi.order_item_id) as siparis_top_sayısı
from
	order_items as oi
left join 
	products as p on p.product_id = oi.product_id
group by
	1
order by 
	2 desc
limit 
	100
;	
--case 4 1.soru	
--Ödeme yaparken taksit sayısı fazla olan kullanıcılar en çok hangi bölgede yaşamaktadır? Bu çıktıyı yorumlayınız.
select * from orders limit 100
select * from order_payments limit 100
select * from customers limit 100 
-- taksit sayısı 1in üzerinde olanlar fazla.
WITH taksit_azcok AS
	(SELECT c.customer_id AS id,
			c.customer_city AS sehir, 
			CASE
							WHEN op.payment_instalments >= 13 THEN 'fazla'
							ELSE 'az'
			END AS taksiti_fazla_az
		FROM order_payments AS op
		LEFT JOIN orders AS o ON o.order_id = op.order_id
		LEFT JOIN customers AS c ON c.customer_id = o.customer_id
		ORDER BY taksiti_fazla_az DESC)
SELECT sehir,
	taksiti_fazla_az,
	COUNT(taksiti_fazla_az) AS taksiti_fazla_az_sayisi
FROM taksit_azcok
WHERE TAKSITI_FAZLA_AZ ='fazla'
GROUP BY 1,2
HAVING COUNT(TAKSITI_FAZLA_AZ) != 1
ORDER BY 3 DESC
-- cevap yukarıda
select 
	distinct payment_type,
	count(payment_instalments)
from 
	order_payments
where payment_instalments > 23
group by
	distinct payment_type
--23 taksitten yüksek siparis sayısı
Select 
	order_id,
	payment_type,
	payment_instalments
from
	order_payments
where
	payment_instalments > 23
--23taksitten yüksek order_idler
select
	distinct order_status
from
	orders
--siparis durumları listesi
;
--case 4 2.soru
--Ödeme tipine göre başarılı order sayısı ve toplam başarılı ödeme tutarını hesaplayınız. 
--En çok kullanılan ödeme tipinden en az olana göre sıralayınız.
SELECT * FROM ORDERS LIMIT 100 --delivered başarlı order olanlar
SELECT * FROM ORDER_PAYMENTS LIMIT 100 --payment_type ödeme tipi ve payment_value ödeme tutarı
;
SELECT 
	op.payment_type AS odeme_tipi,
	COUNT(o.order_id) AS topsiparis_sayisi,
	SUM(op.payment_value) AS topodeme_miktari
FROM 
	order_payments AS op
LEFT JOIN 
	orders AS o ON o.order_id = op.order_id
WHERE 
	o.order_status = 'delivered'
GROUP BY 
	1
ORDER BY 
	2 DESC
--cevap yukarıda
--100756 adet delivered sipariş  
select order_id, order_status from orders where order_status = 'delivered' 
--96478 adet başarılı sipariş sayısı
select order_id, payment_type, payment_value from order_payments
--4.case 3. soru
--Tek çekimde ve taksitle ödenen siparişlerin kategori bazlı analizini yapınız. 
--En çok hangi kategorilerde taksitle ödeme kullanılmaktadır?
SELECT * FROM ORDER_PAYMENTS LIMIT 100
SELECT * FROM ORDER_ITEMS LIMIT 100
SELECT * FROM PRODUCTS LIMIT 100
;
WITH kategori_taksit_miktari AS
	(SELECT p.product_category_name AS urun_kategori_ismi,
			CASE
							WHEN op.payment_instalments = 1 THEN 'tekcekim'
							ELSE 'taksitli'
			END AS tekcekim_taksitli,
			COUNT (CASE
														WHEN op.payment_instalments = 1 THEN 'tekcekim'
														ELSE 'taksitli'
										END) AS tekcekim_taksitlimiktari
		FROM order_payments AS op
		LEFT JOIN order_items AS oi ON oi.order_id = op.order_id
		LEFT JOIN products AS p ON p.product_id = oi.product_id
		GROUP BY 1,	2)
SELECT urun_kategori_ismi,
	tekcekim_taksitlimiktari AS taksitmiktari 
FROM kategori_taksit_miktari
WHERE tekcekim_taksitli = 'taksitli'
ORDER BY 2 DESC
--**
select * from orders where order_status = 'canceled'