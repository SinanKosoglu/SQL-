select * from booking limit 100
select * from payment limit 100
select * from passenger limit 100
--Gün kırılımında, ilgili tarihte en yüksek başarılı ödeme yapılan rezervasyon id'si ile 
--bu rezervasyonun tüm yolcu bilgilerini getirin. 
--bookingid,bookingdate,contactid,passengerid,passengername,passengergender

WITH max_amount AS (
        SELECT b.booking_date::date AS bookingdate,
               b.id AS booking_id,
               b.contact_id,
               p.amount,
               rank() OVER (PARTITION BY booking_date::date ORDER BY p.amount DESC) AS rn
          FROM booking AS b
         INNER JOIN payment AS p
            ON b.id = p.booking_id
         WHERE p.payment_status = 'ÇekimBaşarılı'
       ) 
SELECT ma.bookingdate,
       ma.booking_id,
       ma.amount,
       ma.contact_id,
       p.id AS passenger_id,
       p.name AS passenger_name,
       p.gender
  FROM max_amount AS ma
  LEFT JOIN passenger AS p
    ON p.booking_id = ma.booking_id
 WHERE rn = 1
 ORDER BY ma.bookingdate
;


--Aynı sorgunun from'dan sonra subquery ile yazılmış hali


SELECT bookingdate,
       booking_id,
       amount,
       contactid,
       p.id AS passenger_id,
       p.name AS passenger_name,
       p.gender
  FROM (SELECT bookingdate::date AS bookingdate,
               b.id AS booking_id,
               b.contactid,
               p.amount,
               rank() OVER (PARTITION BY bookingdate::date ORDER BY p.amount DESC) AS rn
          FROM booking AS b
         INNER JOIN payment AS p
            ON b.id = p.bookingid
         WHERE p.paymentstatus = 'ÇekimBaşarılı') AS ma
  LEFT JOIN passenger AS p
    ON p.bookingid = ma.booking_id
 WHERE rn = 1
 ORDER BY bookingdate



--Her ay için, ilgili ayda toplam başarılı ödeme tutarına göre müşterileri 10 ntile'a ayırın. 
--Bu grupları a+,a,b+,b,c+,c.. gibi sınıflara ayırarak segmente edin.

--Tarih olarak payment_date kullanınız.
--Aylık olarak, her müşterinin toplam başarılı ödeme tutarını hesaplayınız.
--Örneğin; Sibel Ocak Ayında 100 TL, Murat Nisan ayında 250 TL ...
--Daha sonra bu veri setini her ay için 10 ntile'a bölün.
--ntile(10) OVER (PARTITION BY payment_month ORDER BY amount)
--Daha sonra ntile çıktısına göre a+,a,b+,b,c+,c.. gibi sınıflara ayırarak segmente edin.


with all_data as (
select 
    date_trunc('month', paymentdate) as payment_month,
    b.contactid,
    sum(p.amount) as total_amount,
    ntile(10) OVER (PARTITION BY date_trunc('month', paymentdate) ORDER BY sum(p.amount)) as nt
from payment as p 
left join booking as b on b.id=p.bookingid
where p.paymentstatus='ÇekimBaşarılı'
group by 1,2
)
select 
payment_month,
case 
when nt=1 then 'A+'
when nt=2 then 'A'
when nt=3 then 'B+'
when nt=4 then 'B'
when nt=5 then 'C+'
when nt=6 then 'C'
when nt=7 then 'D+'
when nt=8 then 'D'
when nt=9 then 'E+'
when nt=10 then 'E+'
END AS contact_segment,
count(distinct contactid) as contact_count
from all_data
group by 1,2

--Her müşterinin en fazla ödeme yaptığı company'i o müşterinin companysi olarak belirleyiniz.
--Bu case row_number konu anlatımında anlatılmıştır.

WITH contacts_with_companies AS (
        SELECT b.contactid,
               b.company,
               count(DISTINCT p.id) AS payment_count
          FROM payment AS p
         INNER JOIN booking AS b
            ON b.id = p.bookingid
         WHERE p.paymentstatus = 'ÇekimBaşarılı'
         GROUP BY 1,
                  2
       ),
       row_num AS (
        SELECT contactid,
               company,
               payment_count,
               row_number() OVER (PARTITION BY contactid ORDER BY payment_count DESC) AS rn
          FROM contacts_with_companies
       ) SELECT contactid,
       company
  FROM row_num
 WHERE rn = 1
 ;
 
--Her company'nin yolcularının yaşı kırılımında aylık olarak yolcu sayısını getirin.Her müşterinin en fazla ödeme yaptığı company'i o müşterinin companysi olarak belirlenmelidir.
--Bu case row_number konu anlatımında anlatılmıştır.
--Bu soru zorunlu değildir. 

WITH contacts_with_companies AS (
        SELECT b.contactid,
               b.company,
               count(DISTINCT p.id) AS payment_count
          FROM payment AS p
         INNER JOIN booking AS b
            ON b.id = p.bookingid
         WHERE p.paymentstatus = 'ÇekimBaşarılı'
         GROUP BY 1,
                  2
       ),
       row_num AS (
        SELECT contactid,
               company,
               payment_count,
               row_number() OVER (PARTITION BY contactid ORDER BY payment_count DESC) AS rn
          FROM contacts_with_companies
       ),
contacts_companies as (
SELECT contactid,
       company
  FROM row_num
 WHERE rn = 1
    )
    , all_ages as 
    (
select 
cc.contactid,
cc.company,
p.id as passenger_id,
EXTRACT ( YEAR FROM (AGE ( current_date , p.dateofbirth)) ) as passenger_age
from contacts_companies  as cc 
inner join booking as b on cc.contactid=b.contactid
inner join passenger as p on p.bookingid=b.id
order by 1
)
select company,
       case 
       when passenger_age>=22 AND passenger_age<33 THEN '22-32'
        when passenger_age>=32 AND passenger_age<43 THEN '32-42'
         when passenger_age>=42 AND passenger_age<53 THEN '42-52'
          when passenger_age>=52 AND passenger_age<63 THEN '52-62'
           when passenger_age>=62 AND passenger_age<73 THEN '62-72'
            when passenger_age>=72 AND passenger_age<83 THEN '72-82'
            ELSE '83+' END AS age_segment,
            count(distinct passenger_id) as passenger_count
from all_ages 
group by 1,2





