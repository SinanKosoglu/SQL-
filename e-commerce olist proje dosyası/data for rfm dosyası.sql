create database datafor_rfm_analysis
set datestyle TO 'DD.MM.YYYY HH24:MI:SS'
Create table rfmdata (
	invoiceno character varying (150),
	stockcode character varying (150),
	description text,
	quantity integer,
	invoicedate character varying (150),
	unitprice real,
	customerid character varying (150),
	country character varying (150)
)
;
select * from rfmdata limit 100
;
COPY rfmdata FROM 'C:\Program Files\PostgreSQL\15\bin\data.csv' delimiter ',' csv header
;
COPY rfmdata FROM 'C:\Program Files\PostgreSQL\15\bin\data.csv' WITH (FORMAT CSV, ENCODING 'LATIN1');
;
COPY rfmdata (invoiceno,stockcode,description,quantity,invoicedate,unitprice,customerid,country)
FROM 'C:\Program Files\PostgreSQL\15\bin\data.csv' delimiter ',' csv header
;
ALTER TABLE rfmdata ALTER COLUMN invoicedate TYPE timestamp without time zone ;

;
UPDATE rfmdata
SET invoicedate = to_timestamp(invoicedate, 'MM/DD/YYYY HH24:MI');
ALTER TABLE rfmdata
ALTER COLUMN invoicedate TYPE timestamp USING invoicedate::timestamp;
;
--Tabloyu bu sekilde olusturdum. ardindan £ sembolu utf 8 desteklemiyor. ancak win 1251 destekliyor. 
--encodingi win1251 yapinca datayi hic degistirmeden hata almadan import edebildim
--RFM ANALİZİ
--recency - müşteri bazlı en son sipariş ile bir önce ki sipariş arasında ne kadar zaman var. 
--frequency - alışveriş sıklığı satış bazlı
--monetary - para bazlı
select * from rfmdata order by 1 limit 500
--recency
--Her müşteri en son alışveriş tarihinden '2011-12-09' önce ne zaman alışveriş yapmış. 
--Normalde bugünün tarihinden önce ne zaman alışveriş yapmış bakılır. 
WITH lastinvoicedate AS
	(SELECT customerid,
			MAX(invoicedate)::date AS last_invoice_date
		FROM rfmdata
		WHERE customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
		GROUP BY 1
		ORDER BY 2)
SELECT customerid,
	(SELECT MAX(invoicedate)::date FROM rfmdata)::date - last_invoice_date AS recency
FROM lastinvoicedate
WHERE 
	(SELECT MAX(invoicedate)::date FROM rfmdata)::date - last_invoice_date != 0;
--The query filters out records where the recency is not equal to zero, 
--meaning it selects customers whose last purchase date is not the same as the maximum purchase date for all customers in the dataset.

--frequency: müşteri ne kadar sıklıkla alışveriş yapıyor.
--müşteri bazlı kesilmiş fatura adedi.

select
	customerid as müşteri,
	count(distinct invoiceno) as alışveriş_sayısı 
from
	rfmdata
WHERE 
	customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
group by 
	1
order by 
	2 desc

--Monetary
--her müşteri ne kadar ödemiş.

Select
	customerid as musteri,
	round(sum(quantity*unitprice)::numeric,2) as monetary
from
	rfmdata
where 
	customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
group by 1 
order by 2 desc 

--rfm çıktılarını birleştirme ve cevap
with rfm_segment_analysis as (
with RFM_SCORES AS (
with recency as (
WITH lastinvoicedate AS
	(SELECT customerid,
			MAX(invoicedate)::date AS last_invoice_date
		FROM rfmdata
		WHERE customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
		GROUP BY 1
		ORDER BY 2)
SELECT customerid,
	(SELECT MAX(invoicedate)::date FROM rfmdata)::date - last_invoice_date AS recency
FROM lastinvoicedate
WHERE 
	(SELECT MAX(invoicedate)::date FROM rfmdata)::date - last_invoice_date != 0
),
frequency as (
select
	customerid,
	count(distinct invoiceno) as frequency 
from
	rfmdata
WHERE 
	customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
group by 
	1
order by 
	2 desc
),
monetary as (
Select
	customerid,
	round(sum(quantity*unitprice)::numeric,2) as monetary
from
	rfmdata
where 
	customerid is not null and unitprice > 0.0 and quantity > 0 and invoiceno not like 'C%'
group by 1 
order by 2 desc 
)
select 
r.customerid as musteri,
case 
when recency >=300 then 5
when recency >=220 then 4
when recency >=150 then 3
when recency >=75 then 2
else 1 end as recency_score,
case 
when frequency >=50 then 1
when frequency >=20 then 2
when frequency >=10 then 3
when frequency >=3 then 4
else 5 end as frequency_score,
case
when monetary >=20000 then 1
when monetary >=10000 then 2
when monetary >=5000 then 3
when monetary >=1000 then 4
else 5 end as monetary_score,
((CASE
        WHEN recency >= 300 THEN 5
        WHEN recency >= 220 THEN 4
        WHEN recency >= 150 THEN 3
        WHEN recency >= 75 THEN 2
        ELSE 1
    END +
    CASE
        WHEN frequency >= 50 THEN 1
        WHEN frequency >= 20 THEN 2
        WHEN frequency >= 10 THEN 3
        WHEN frequency >= 3 THEN 4
        ELSE 5
    END +
    CASE
        WHEN monetary >= 20000 THEN 1
        WHEN monetary >= 10000 THEN 2
        WHEN monetary >= 5000 THEN 3
        WHEN monetary >= 1000 THEN 4
        ELSE 5
    END) / 3) AS rfm_ort
from recency as r
join frequency as f on r.customerid=f.customerid
join monetary as m on r.customerid=m.customerid
group by 1,2,3,4
)
Select
musteri,
recency_score,
frequency_score,
monetary_score,
rfm_ort,
case
when rfm_ort = 5 then 'Asleap / Koalas'
when rfm_ort = 4 then 'About to sleep / Cant loose'
when rfm_ort = 3 then 'Promising loyal customers'
when rfm_ort = 2 then 'Potential Loyalist'
when rfm_ort = 1 then 'Champions' 
end as segments
from 
RFM_SCORES
)
select
segments,
count(segments) as total_segments
from
rfm_segment_analysis
group by 1
