SQL - on postgresql
#postgresql
These are my notes on learning SQL on PostgreSQL.

SQL MODULS
SQL - on postgresql
#postgresql
This is how I learn SQL
Hello My name is Sinan. My main purpose on this project is to show what sort of technical skills I know on SQL as well as my knowlodge on Structured query language.

**1.SQL DATA TYPES**

**Metinsel (String) Veri Tipleri**

-_CHAR_: Sabit uzunluktaki metin verilerini tanımlamak için kullanılır. Örnek kullanım; CHAR(20) şeklindedir. Burada giriş yapılacak metin uzunluğu
en fazla 20 karakter olabilir. Eğer metin 20 karakterden daha uzunsa geri kalan kısım atlanır. Eğer metin 20 karakterden kısaysa kalan kısımlar boşlukla
doldurulur.

-_VARCHAR_: Değişken uzunluktaki metin verilerini tanımlamak için kullanılır. Örnek kullanım VARCHAR(255) şeklindedir. 255 karakter uzunluğunda bir metin 
alanı oluşturulur. Eğer giriş verisi 20 karakter uzunluğundaysa yalnızca 20 karakterlik alan tutulur. 

-_TEXT_: Uzun metin verileri için kullanılır. CHAR ve VARCHAR'a göre daha uzun karakterdeki metin verilerini saklar. Bir makale veya bildiri içeriği TEXT
karakteri olarak tanımlanabilir. Max. 2^32-1 (4GB) veri saklayabilir. 

**Sayısal (Numeric) Veri Tipleri**

-_INTEGER(INT)_: Bir kişinin yaşı, ürün adet sayısı gibi tam sayıları tanımlamak için kullanılır. Genellikle 4 byte'lık bir veri tipidir. -2^31 
ile 2^31-1 arasında bir sayı saklayabilir.

-_SMALLINT_: Küçük tam sayılar için kullanılır. bir ürünün stok miktarını saklamak için SMALLINT kullanılabilir. genellikle 2 byte'lık bir veri tipidir ve
-2^15 ile  2^15-1 arasında bir sayı saklayabilir.

-_BIGINT_: Büyük tam sayılar için kullanılır. Örneğin, bir ülkenin nüfusunu saklamak için BIGINT kullanılabilir. BIGINT veri tipi genellikle 8 byte'lık bir veri 
tipidir ve -2^63 ile 2^63-1 arasında bir sayı saklayabilir.

-_FLOAT_: Ondalıklı sayılar için kullanılır. Örneğin, bir ürünün fiyatını saklamak için FLOAT kullanılabilir. FLOAT veri tipi genellikle 4 byte'lık bir veri tipidir 
ve ondalık noktasına kadar 7 veya 8 hane hassasiyette bir sayı saklayabilir.

-_DECIMAL_: Ondalıklı sayıları sabit bir hassasiyette saklar. Örneğin, DECIMAL(10,2) veri tipi, en fazla 10 rakamlı ve 2 ondalıklı sayıları saklar. Bu veri tipi, 
hassasiyet ve doğruluğu ön planda tutan uygulamalar için idealdir. Finansal hesaplamalar için DECIMAL(10,4) veri tipini kullanabilirsiniz.

-_DOUBLE PRECISION_:Ondalıklı sayıları daha yüksek bir hassasiyette saklar. Bu veri tipi, daha büyük sayıları ve daha yüksek hassasiyeti gerektiren uygulamalar için idealdir. 
Bir fiziksel ölçüm için DOUBLE PRECISION kullanabilirsiniz.

![image](https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/8c4cb3fb-d636-4a6e-9a61-4926641073dc)

**BOOLEAN Veri Tipi**

_BOOLEAN_ veri tipi, true/false (doğru/yanlış) değerlerini saklamak için kullanılır. Bu veri tipi, sadece iki değer alabilir: true ve false. Örnek verecek olursak:

Bir kullanıcının hesabının aktif/deaktif durumunu saklamak için BOOLEAN veri tipi kullanabilirsiniz.
Bir ürünün stokta/stokta olmadığı durumunu saklamak için BOOLEAN veri tipi kullanabilirsiniz.
Bir sorunun çözüldü/çözülmedi durumunu saklamak için BOOLEAN veri tipi kullanabilirsiniz.


**Tarih-Zaman Veri Tipleri**

-_DATE_: Sadece tarih bilgisini saklar, "2022-12-31" gibi. Örneğin bir ürünün son kullanma tarihini saklamak için DATE veri tipi kullanabilirsiniz.

-_TIME_: Sadece saat bilgisini saklar, "12:30:15" gibi. Bir siparişin saatini saklamak için TIME veri tipi kullanabilirsiniz.

-_DATETIME_: Tarih ve saat bilgisini birlikte saklar, "2022-12-31 12:30:15" gibi. Bir haberin yayınlanma tarihini saklamak için DATETIME veri tipi kullanabilirsiniz.

-_TIMESTAMP_: Tarih ve saat bilgisini birlikte saklar ve ayrıca bu bilgilerin hangi zaman diliminde olduğunu da saklar. Örneğin, "2022-12-31 12:30:15 UTC" gibi. 
Bir gönderinin zaman damgasını saklamak için TIMESTAMP veri tipi kullanabilirsiniz.

-_INTERVAL_: Zaman aralığını saklar. Örneğin "2 years 3 months 4 days" gibi. Bir projenin süresini saklamak için INTERVAL veri tipi kullanabilirsiniz.

**Array Veri Tipi**

SQL veritabanlarında, array veri tipleri bir dizi (koleksiyon) içinde birden çok veriyi saklamak için kullanılır. Array veri tipleri, bir kolon içinde birden çok 
veriyi saklamak için kullanılabilir ve genellikle bir tablo içinde bir kullanıcının birden çok özelliğini saklayabilir. Örneğin bir web sitesindeki kullanıcının 
bir veya birden çok telefon numarasını saklamak için array veri tipi kullanılabilir.


**2.Veri Tabanlarında Anahtar (Key) Kavramı**

İlişkisel veritabanları, verileri saklamak ve sorgulamak için SQL (Structured Query Language) kullanır. Veritabanlarında oluşturduğumuz tablonun bir diğer tablo ile ilişki kurabilmesi için anahtar kavramını anlamak gerekir. 

-_Primary Key (Birincil Anahtar)_

Primary Key (Birincil Anahtar) bir veri tabanında bir tablo içerisindeki her bir kaydı benzersiz bir şekilde tanımlamak için kullanılan bir anahtardır. Birincil anahtar, tablodaki diğer anahtarlar primary key'den referans alır. 

-_Foreign Key (Yabancı Anahtar)_

Foreign Key (Yabancı Anahtar) SQL'de bir başka tablonun birincil anahtarına bağlantı kurmak için kullanılan anahtardır. Foreign key, ilişkisel veri tabanlarında tablolar arasında ilişki tanımlamak için kullanılır.

Foreign key ile:
- Veri tabanındaki tablolar arasında ilişki kurulur.
- Veri güvenliği sağlanır.
- Veri kalitesi sağlanır.
- Veri normalizasyonu sağlanır.

![266414340-b30f0bd5-18cf-480a-b9d4-0d4f2cc6c7fc](https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/baa0feb4-c1a2-42f2-8618-d19d6aa4350f)

**3.SQL'de Temel Operatörler**

-_CREATE Komutu_

SQL'de, CREATE komutu veritabanı veya tablolarda yeni bir tablo oluşturmak için kullanılır. 

Tablo oluşturmak için genel kullanım şekli şöyledir:

    CREATE TABLE tablo_ismi (

       kolon1_ismi veri_tipi,

       . . .

    );

test_db isimli bir database oluşturmak ve bu database'de bir tablo tanımlamak için aşağıdaki işlemler yapılır;

    create database test_db; 

    create table ogrenci 
    ( 
      id integer, 
      isim varchar(30), 
      soyisim varchar(30), 
      primary key (id) 
    )
    ;
    create table ders
    ( 
       id integer primary key, 
       name varchar(30), 
       ogrenci_id integer 
       foreign key (pgrenci_id) references ogrenci(id) 
    )
    ;
    create table ogretmenler
    (
      isim varchar(30),
      soyisim varchar(30),
      ogretmen_id integer
    )
    
    -_ALTER/DROP Komutu_

- SQL'de, ALTER komutu veritabanı veya tablolarda mevcut olan tablonun yapısını veya özelliklerini değiştirmek için kullanılır. Genel olarak ALTER komutu ile tablolara kolon ekleme, kolon silme, kolon ismini değiştirme, kolon veri tipini değiştirme, constraint ekleme veya silme gibi işlemler yapılabilir. 

- SQL'de, DROP komutu veritabanı veya tablolarda mevcut olan tablo, index, view, procedure, trigger, sequence, synonym, domain, role, constraint gibi veritabanı objelerini silmek için kullanılır.

ALTER Kullanım Örnekleri:

    ALTER TABLE calisanlar ADD COLUMN cinsiyet VARCHAR(10) ---calisanlar tablosuna cinsiyet isimli kolon ekler.
    ALTER TABLE calisanlar DROP COLUMN cinsiyet ---calisanlar tablosundan cinsiyet isimli kolonu siler. 
    ALTER TABLE calisanlar RENAME COLUMN ad TO isim ---calisanlar tablosunda ad isimli sütunu isim olarak değiştirir.

ALTER komutu sadece tablolara değil aynı zamanda veritabanlarına da uygulanabilir. Örneğin;

    ALTER DATABASE veritabani_ismi SET default_character_set = utf8

- Genel olarak ALTER komutu ile tablolara kolon ekleme, kolon silme, kolon ismini değiştirme, kolon veri tipini değiştirme, constraint ekleme veya silme gibi işlemler yapılabilir.

- Constraint yani kısıtlamalar tabloya girebilecek veri türünü kısıtlamak için kullanılır.

  alter table ders add column ogretmen varchar(30)
;
  alter table ders alter ogretmen type varchar (50)
;
  alter table ders drop column ogretmen
;
  alter table ogretmen add constraint ogretmen_pkey primary key (ogretmen_id)
;
  alter table ogretmen drop constraint ogretmen_pkey primary key (ogretmen_id)
;
  alter table ogretmen rename to ogretmenler

```

- Aşağıdaki tablolarda, önce tabloları ekleyip arkasından kısıtlama eklenmiştir. Foreign key’i ‘ogrenci’ tablosunda ‘course_id’ yaparak diğer tabloda bağlanılan sütun referans gösterilmiştir.

create table ogrenci
(
ogrenci_id integer not null primary key,
isim varchar(30),
soyisim varchar(30),
course_id integer
)

create table course_info
(
course_id integer not null primary key,
course_title varchar(150)
)

alter table ogrenci add constraint course_id_fkey foreign key (course_id) references course_info (course_id)
alter table ogrenci drop constraint course_id_fkey
```

DROP Kullanım Örnekleri:

    DROP TABLE table_name;
    DROP INDEX index_name;
    DROP VİEW view_name;
    DROP PROCEDURE procedure_name;
    DROP TRIGGER trigger_name;
    DROP SEQUENCE sequence_name;
    DROP SYNONYM synonym_name;
    DROP DOMAIN domain_name;
    DROP ROLE role_name;
    DROP CONSTRAINT constraint_name;
 
- DROP; belirtilen tablo, index, view, procedure, trigger, sequence, synonym, domain, role, constraint gibi veritabanı objelerini veritabanından tamamen siler.

-_INSERT/COPY Komutu_

- SQL'de, INSERT komutu veritabanı veya tablolarda mevcut olan tablo'ya yeni veri eklemek için kullanılır.

      INSERT INTO table name values 
      ( 
        'ad', 
        'soyad', 
        yas 
      )
  
      INSERT INTO ogrenci VALUES 
        (21,'sinan','kosoglu'),
        (22,'kara','mehmet'),
        (23,'sara','sara'),
        (24,'mehmet','kosoglu'),
        (25,'Sabine','Korur')

  - COPY komutu, veritabanındaki bir tablonun verilerini veya verileri içeren bir dosyadan veritabanına veri yüklemek için kullanılır. Bu komut genellikle çok hızlı ve büyük veri setlerinin yüklenmesi için kullanılır.

      COPY quiz_info FROM 'C:\Program Files\PostgreSQL\15\bin\365_quiz_info.csv' delimiter ',' csv header
  - Bu komut ile belirtilen uzantı yolundan ',' virgül delimiter ile csv uzantılı bir dosyadan quiz_info dosya isminin veritabanına yüklenileceğini gösteriyor.

-_UPDATE Komutu_

- SQL'de, UPDATE komutu veritabanı veya tablolarda mevcut olan tabloda bulunan verileri güncellemek için kullanılır.

      UPDATE ogrenci
      SET soyisim = 'kosoglu'
      WHERE id = 23
      ;
      UPDATE ogrenci
      SET vize1 = 75, vize2 = 88, final = 100 
      WHERE id = 23

!!Update komutlarında where operatörünün yeri çok önemlidir. Eğer where komutu kullanılmaz ise belirli bir alan değil soyisimi bütün verilerin 'Kosoglu' yapacaktır. 2. örnekte ise eğer id=23 belirtilmeseydi bütün sütunların notlarını gösterilen gibi değiştirecektir. 

-_TRUNCATE/DELETE Komutu_

- SQL'de, TRUNCATE komutu veritabanı veya tablolarda mevcut olan tablonun verilerini silmek için kullanılır. Bu komut, veritabanındaki bir tablonun tüm satırlarını veya kayıtlarını hızlı bir şekilde siler.

      TRUNCATE ogrenci
      ;
      TRUNCATE quiz_info

- SQL'de, DELETE komutu veritabanı veya tablolarda mevcut olan tablonun verilerini silmek için kullanılır. Bu komut, veritabanındaki bir tablonun belirli satırlarını veya kayıtlarını siler.

      DELETE FROM ogrenci WHERE id = 25

- Yukarıdaki sorgu aynı UPDATE sorgusunda olduğu gibi WHERE koşulu ile filtreleme yapar. Eğer WHERE id = 25 filtresi kullanılmasaydı tablodaki tüm veriler silinirdi. Bu nedenle UPDATE komutunda olduğu gibi DELETE komutunda da WHERE koşulu da çok önemlidir. 

-_SELECT Komutu & Aritmetik Fonksiyonlar_

- SQL'de, SELECT komutu veritabanı veya tablolarda mevcut olan verileri sorgulamak için kullanılır. Bu komut, veritabanındaki bir tablonun veya birden fazla tablonun belirli satırlarını veya kayıtlarını seçerek döndürür.
  
      SELECT *
      FROM ogrenci
      ;
      SELECT isim, soyisim
      FROM ogrenci

![aritmetik işlemler tablosu](https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/48c95b79-3db6-46f6-be1d-32c9b313857d)

Ondalıklı işlemlerde ;

    SELECT 4.3534534-3.242352
    SELECT 45.0/4.0

- Float olarak almak için ondalıklı olarak yazılması gerekiyor. (.) nokta kullanılıyor. virgül değil!!
  
      UPDATE ogrenci
      SET vize1 = 75, vize2 = 88, final = 100 
      WHERE id = 23

**4.String Functions & Case When & Other Clauses**

_STRING FUNCTIONS (Metinsel Fonksiyonlar)_

- SQL'de string fonksiyonlar, karakter dizisi (string) verileri üzerinde işlemler yapmak için kullanılan işlevlerdir. Bu fonksiyonlar, string verilerini manipüle etmek, dönüştürmek veya karşılaştırmak için kullanılabilirler.
- Bu fonksiyonlar, SQL sorgularında kullanılan WHERE, SELECT, ORDER BY ve GROUP BY gibi ifadelerde sıklıkla kullanılırlar. Örneğin, bir tablodaki bir sütunun değerini kesmek veya birleştirmek, bir karakter dizisinde belirli bir alt dizenin konumunu bulmak veya belirli bir harf veya harf dizisini içeren tüm değerleri seçmek gibi işlemler için kullanılabilirler.
- Metinsel fonksiyonlar, verilerin manipülasyonunu daha kolay hale getirerek verilerin analiz edilmesini ve raporlanmasını kolaylaştırır. Ayrıca, birçok programlama dili ve veritabanı yönetim sistemi, metinsel fonksiyonlar da dahil olmak üzere string işleme için çeşitli fonksiyonlar sağlamaktadır.

*-CONCAT*

- PostgreSQL'de CONCAT()  fonksiyonu, verilen iki veya daha fazla dizeyi BİRLEŞTİREREK tek bir dize oluşturur. Fonksiyonun kullanımı şu şekildedir:

      SELECT concat(first_name, ' ', last_name) as full_name FROM employees;

- Concat fonksiyonu, özellikle metinleri birleştirmek gerektiği durumlarda kullanışlıdır. Ayrıca, concat fonksiyonu yerine || operatörü de kullanılabilir. Bu operatör de aynı şekilde iki dizeyi birleştirir:

string1 || string2

*-LEFT*

- LEFT()  fonksiyonu, verilen bir dizenin belirli bir sayıda sol karakterini EKRANA GETİRİR. Fonksiyonun kullanımı şu şekildedir:

      SELECT left(first_name, 3) as initial FROM employees; ---first_name sütunundan veri alır ve ilk üç karakterini EKRANA GETİRİR.

*-RIGHT*

- RIGHT fonksiyonu, verilen bir dizenin belirli bir sayıda sağ karakterini EKRANA GETİRİR. Fonksiyonun kullanımı şu şekildedir:

      SELECT right(phone_number, 4) as last_four_digits FROM employees; --phone sütunundan veri alır ve son dört karakterini EKRANA GETİRİR.

*-LENGTH*

- LENGTH() fonksiyonu, bir karakter dizisinin uzunluğunu döndüren bir fonksiyondur. Yani, bu fonksiyon bir karakter dizisindeki karakterlerin sayısını sayar.

      SELECT length(first_name), first_name FROM employees; --first_name'in karakter uzunluğunu verir.

*-LOWER*

- PostgreSQL'de LOWER() fonksiyonu, bir karakter dizisindeki tüm karakterleri küçük harflere dönüştürür.

      SELECT LOWER(first_name), LOWER(last_name) FROM employees;

*-UPPER*

- PostgreSQL'de UPPER() fonksiyonu, bir karakter dizisindeki tüm karakterleri büyük harflere dönüştürür.

      SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper FROM employees ORDER BY last_name_upper, first_name_upper;

*-TRIM*

- PostgreSQL'de TRIM() fonksiyonu, bir karakter dizisindeki boşlukları, belirtilen karakterleri veya karakter dizisini kırparak temizler."LEADING", "TRAILING" ve "BOTH" parametreleri, bu karakterleri nereden kaldıracağını belirtir.

TRIM([LEADING | TRAILING | BOTH] trim_character FROM string)

Örnekler:

    SELECT TRIM('   hello   '); -- "hello" 
    SELECT TRIM(LEADING '0' FROM '0001234'); -- "1234" 
    SELECT TRIM(TRAILING '!' FROM 'hello!!!!'); -- "hello" 
    SELECT TRIM(BOTH ' ' FROM '   hello   '); -- "hello"

Trim (Leading from string) —> Baştan 

Trim (Trailing from string) —> Sondan

Trim (Both from string) —> Her iki taraftan

	SELECT TRIM (LEADING
	FROM '  PostgreSQL TRIM'),
	TRIM (TRAILING
	FROM 'PostgreSQL TRIM   '),
	TRIM ('  PostgreSQL TRIM  ');

  ![Untitled](https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/2076a4a8-4af3-42c3-9297-6b7155037d27)

UPDATE customer
SET
  first_name = TRIM(first_name),
  last_name = TRIM(last_name);

Update edilmesi gereken bir durum olarak isim ve soyisimlerin önünde ve arkasında bulunan boşlukları kırpar ve günceller. 

*-REPLACE*

- PostgreSQL'deki REPLACE() fonksiyonu, bir karakter dizisinde belirli bir karakter dizisini bulur ve onu başka bir karakter dizisiyle değiştirir.
- Eksik yani tamamlanmamış bir veriyi değiştirmeye yarıyor. Örneğin; ‘stanbul’ yazısını ‘istanbul’ yapmak gibi.

      SELECT REPLACE(alan_adi, degisecek_veri, yeni_veri) FROM tablo_adı

      SELECT REPLACE(first_name, 'a', 'o'), REPLACE(last_name, 'a', 'o') FROM employees; --Tüm çalışanların isimlerindeki "a" harfini "o" harfi ile değiştirir. 

      SELECT REPLACE(email, 'sqltutorial.org', 'yahoo.com') FROM employees; -- e-posta adreslerindeki "sqltutorial.org" uzantısını "yahoo.com" ile  değiştirir.

*-SPLIT PART*

- PostgreSQL'deki SPLIT_PART() fonksiyonu, bir karakter dizisini belirli bir ayraç karakterine göre parçalar ve parçalardan birini seçer.
- “delimiter" bir ayraç karakteridir. 
  
      SELECT SPLIT_PART (string, delimiter, field) FROM tablo_adı

      SELECT SPLIT_PART(email, '@', 1) AS username FROM employees
  
SELECT SPLIT_PART(email, '@', 1) AS username FROM employees; --employees tablosundaki email adreslerini @ işaretini baz alarak iki parçaya ayırır ve 1. parçayı seçer. Böylece mail adreslerindeki ilk kısım kullanıcı adı olarak belirlenir. 

_CASE WHEN EXPRESSION_

- "CASE WHEN" SQL'de koşul ifadesi ile kullanılan bir kontrol yapısıdır.  Bu ifade, belirli bir koşulu test etmenizi ve koşulun doğru veya yanlış olmasına bağlı olarak farklı bir değer veya ifade döndürmenizi sağlar.

      CASE 

      WHEN condition1 THEN result1 

      WHEN condition2 THEN result2 

      ... 

      ELSE result 

      END

Örnek olarak, employee tablosunda ki çalışanların isim, soyisim, kimlik id si ve salary leri getirilmesi isteniyor. Fakat, bunun yanında asgari maaş olanlar için yanına düşük maaş 20.000 altın ve asgari ye kadar olan kısm için ortalama maaş geriye kalan maaşlara da normal maaş yazısı yanlarına getirilmesi koşulları yazılmış. 

    SELECT
      EMPLOYEE_ID,
      FIRST_NAME,
      LAST_NAME,
      SALARY,
    CASE
      WHEN SALARY < 11402 THEN 'Dusuk Maas'
      WHEN SALARY >= 11402
        AND SALARY < 20000 THEN 'Ortalama Maas'
          ELSE 'Normal'
         END
    FROM EMPLOYEES;

Örnek olarak, Bu sefer yanlarına maaşlara zamlı halleri ile getirilmesi için komutlar koşullar yazılmış. Maaş zamlarını belirlemek için asgari maaş, 20.000 tl ye kadar olan maaşlar ve geriye kalan maaşların zam oranları ve zamlı hallerini gösteriyor. 
      SELECT
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        SALARY,
      CASE
        WHEN SALARY < 11402 THEN SALARY * 1.5
        WHEN SALARY >= 11402
           AND SALARY < 20000 THEN SALARY * 1.25
            ELSE SALARY * 1.15
          END
      FROM EMPLOYEES;

Örnek olarak, bir "customers" tablosunda "city" sütunu bulunuyor ve müşterilerin yaşadıkları şehirleri sorgulamak istiyoruz. Aynı zamanda, bazı müşterilerin yaşadıkları şehirlerin yanlış yazıldığı fark ediliyor. Bu durumda, aşağıdaki örnek SQL sorgusu ile müşterilerin doğru şehirlerini elde edebiliriz:

    SELECT 

    customer_name, 

    CASE 

        WHEN city = 'Istanbl' THEN 'Istanbul' 

        WHEN city = 'Ankra' THEN 'Ankara'

        ELSE city 

    END AS city_corrected  

    FROM customers;

Örneğin, bir müşteri veritabanında, bir müşterinin ülkesine göre farklı vergi oranları uygulanması gerekiyorsa, "CASE WHEN" ifadesi kullanılabilir. Aşağıdaki örnek, bir müşterinin ülkesine göre farklı vergi oranları uygulayan bir sorgudur:

    SELECT name, country, 

       CASE WHEN country = 'USA' THEN price * 0.08 

            WHEN country = 'Canada' THEN price * 0.10 

            ELSE price * 0.12 

       END AS tax 

    FROM customers;

_OTHER CLAUSES (ORDER BY, AS, LIMIT, DISTINCT, HAVING)_

*-ORDER BY*

- SQL'de ORDER BY komutu, veritabanındaki belirli bir tablo veya sütun içindeki kayıtların belirli bir kriterlere göre sıralanmasını sağlar. Örneğin, müşterilerin adlarına göre sıralamak istediğinizde veya satışların tarih sırasına göre sıralamak istediğinizde ORDER BY kullanabilirsiniz.

      SELECT * FROM orders ORDER BY order_date,total_price; --"orders" tablosundaki siparişlerin tarih ve tutar sırasına göre sıralanmış halde döndürür.
     ; 
      SELECT * FROM employees ORDER BY hire_date -- "employees" tablosunda ki çalışanların işe alım zamanlarına göre ilk sıradan başlayarak sıralanmış halde ekrana getirecektir.
  
ASC: küçükten büyüğe
DESC: büyükten küçüğe

*-AS*

- SQL'de AS komutu, sorgularda kullanılan sütun veya tablo adlarının yerine farklı bir isim vermenizi sağlar. Bu, sorguların daha okunaklı ve anlaşılır olmasını sağlar. Örneğin, bir tablonun adı uzun ve anlaşılmazsa, bu tablonun sorgularda kullanılması için kısa ve anlaşılır bir ad vermeniz mümkündür.

      SELECT SUM(total_price) AS 'Total Sales' FROM orders; -- "orders" tablosundaki siparişlerin toplam tutarını döndürür ve sütun adını "Total Sales" olarak değiştirir. Aynı zamanda AS komutu ile tablo adlarınıda değiştirebilirsiniz. <br></br>

      SELECT * FROM customers AS 'Müşteriler' --"customers" tablosunun adını "Müşteriler" olarak değiştirir.

    SELECT employee_id,
      first_name,
      last_name,
      salary,
    CASE
       WHEN salary < 8500                     THEN salary1.5
       WHEN salary >= 8500 AND salary < 15000 THEN salary1.25
    ELSE salary*1.15
      END AS new_salary -- case when sütununun aliası olarak atanır.
      FROM employees AS e -- tablonun aliasını değiştirir. tablo join komutlarında kullanılabilir. 

*-LIMIT*

- LIMIT, SQL sorgularında sorgunun sonucunda döndürülecek olan satır sayısını belirlemek için kullanılan bir ifadedir. Örneğin, veritabanındaki tüm müşteri kayıtlarını almak yerine sadece ilk 10 kaydı almak isteyebilirsiniz. Bu durumda, sorgunun sonunda LIMIT 10 kullanılır.

      SELECT * FROM customers LIMIT 10;

- Ayrıca, LIMIT ile OFFSET kullanarak belirli bir aralıkta kayıtları alabilirsiniz. Örneğin, 21. ila 30. müşteri kayıtlarını almak için:

      SELECT * FROM customers LIMIT 10 OFFSET 20; -customers tablosundaki 21. ila 30. kayıtları döndürür.

*-DISTINCT*

- DISTINCT, SQL sorgularında veritabanındaki aynı değerleri tekrar etmeden sadece farklı değerleri döndürmek için kullanılan bir ifadedir. Örneğin, veritabanındaki tüm müşteri kayıtlarını almak yerine sadece farklı müşteri adlarını almak isteyebilirsiniz. Bu durumda, sorgunun başına DISTINCT yazılır.

      SELECT DISTINCT name FROM customers;
      SELECT city, COUNT(DISTINCT name) FROM customers GROUP BY city; --customers tablosundaki tüm farklı şehirleri ve bu şehirlerde yaşayan farklı müşteri sayılarını döndürür.
  
      SELECT DISTINCT
        job_id,
        department_id
      FROM employees
      ORDER BY job_id DESC;
  
*-HAVING*

-  WHERE anahtar sözcüğü aggregate fonnksiyonlarıyla kullanılamadığı için HAVING SQL diline eklenmiştir. Kullanımı aşağıdaki gibidir:

        SELECT column_name(s)
        FROM table_name
        WHERE condition
        GROUP BY column_name(s)
        HAVING condition
        ORDER BY column_name(s);

       SELECT COUNT(CUstumerID), Country
       FROM Customers
       GROUP BY Country
       HAVING COUNT(CustomerID)>5;

- Yukarıdaki sorguda her ülkeddeki müşteri sayısı listelenir ve müşteri sayısı 5'ten fazla olan ülkeler seçilir. 
     
      SELECT COUNT(CustomerID), Country
      FROM Customers
      GROUP BY Country
      HAVING COUNT(CustomerID) > 5
      ORDER BY COUNT(CustomerID) DESC;

- Yukarıdaki sorguda müşteri sayısı 5'ten fazla olan ülkeler azalan şekilde sıralanır. COUNT(CostumerID) Where koşuluyla birlikte kullanılmaz. Bunun yerine GROUP BY HAVING ifadesi kullanılır.
- HAVING, group by komutundan sonra kullanılır. WHERE, group by komutundan önce kullanılır.

**-WHERE Komutu ve Karşılaştırma Operatörleri**

- WHERE komutu sorgulama işlemi sırasında belirli koşullara göre verileri filtrelemeye yarar.


	SELECT * FROM tablo_adi WHERE sartlar


**-Eşittir Operatörü (=)**

SQL'de WHERE komutu içinde kullanılan "=" (eşittir) operatörü, belirli bir kriterde eşit olan verileri seçmek için kullanılır. Örneğin, "employees" tablosundaki "last_name" sütununda "Smith" değerini içeren kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age = 25;

	SELECT * FROM employees WHERE first_name = 'Nancy'
	SELECT * FROM employees WHERE employee_id = 105

**Eşit Değildir Operatörü (<> ya da !=)**

SQL'de WHERE komutu içinde kullanılan "<>" (eşit değildir) operatörü, belirli bir kriterde eşit olmayan verileri seçmek için kullanılır. Örneğin, "employees" tablosundaki "last_name" sütununda "Smith" değerini içermeyen kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE employee_id != 105

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "last_name" sütununda "Smith" değerini içermeyen kayıtları gösterir.

Aynı şekilde "age" sütununda 25 değerini içermeyen kayıtları seçmek için:

	SELECT * FROM employees WHERE age <> 25;

	SELECT * FROM employees WHERE last_name <> 'Smith';
	SELECT * FROM employees WHERE employee_id <> 105

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerini içermeyen kayıtları gösterir.

**Büyüktür Operatörü (>)**

SQL'de WHERE komutu içinde kullanılan ">" (büyüktür) operatörü, belirli bir kriterde büyük olan verileri seçmek için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 değerinden büyük olan kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age > 25;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerinden büyük olan kayıtları gösterir.

	SELECT first_name, last_name FROM employees WHERE job_id > 6 

Aynı şekilde "salary" sütununda 50000 değerinden büyük olan kayıtları seçmek için:

	SELECT * FROM employees WHERE salary > 50000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "salary" sütununda 50000 değerinden büyük olan kayıtları gösterir.

**Büyük ya da Eşittir Operatörü (>=)**

	SELECT * FROM employees WHERE hire_date >= '1997-01-01'

**Küçüktür Operatörü (<)**

SQL'de WHERE komutu içinde kullanılan "<" (küçüktür) operatörü, belirli bir kriterde küçük olan verileri seçmek için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 değerinden küçük olan kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age < 25;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerinden küçük olan kayıtları gösterir.

Aynı şekilde "salary" sütununda 50000 değerinden küçük olan kayıtları seçmek için:

	SELECT * FROM employees WHERE salary < 50000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "salary" sütununda 50000 değerinden küçük olan kayıtları gösterir.

**Küçük ya da Eşittir Operatörü (<=)**

SQL'de WHERE komutu içinde kullanılan "<=" (küçük ya da eşittir) operatörü, belirli bir kriterde küçük veya eşit olan verileri seçmek için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 değerinden küçük ya da eşit olan kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age <= 25;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerinden küçük ya da eşit olan kayıtları gösterir.

Aynı şekilde "salary" sütununda 50000 değerinden küçük ya da eşit olan kayıtları seçmek için:

	SELECT * FROM employees WHERE salary <= 50000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "salary" sütununda 50000 değerinden küçük olan kayıtları gösterir.

**IS NULL Operatörü (IS NULL)**

SQL'de WHERE komutu içinde kullanılan "IS NULL" operatörü, belirli bir sütunda NULL değerinin olup olmadığını kontrol etmek için kullanılır. Örneğin, "employees" tablosundaki "phone" sütununda NULL değerinin olup olmadığını kontrol etmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE phone IS NULL;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "phone" sütununda NULL değeri olan kayıtları gösterir.

Aynı şekilde "email" sütununda NULL değerinin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE email IS NULL;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "email" sütununda NULL değeri olan kayıtları gösterir.

**AND (VE) Operatörü**

SQL'de WHERE komutu içinde kullanılan "AND" operatörü, birden fazla kriterin aynı anda gerçekleşmesini sağlamak için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 değerinden küçük ve "salary" sütununda 50000 değerinden büyük olan kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age < 25 AND salary > 50000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerinden küçük ve "salary" sütununda 50000 değerinden büyük olan kayıtları gösterir.

Aynı şekilde "employees" tablosundaki "gender" sütununda 'Female' ve "phone" sütununda NULL değerinin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE gender = 'Female' AND phone IS NULL;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "gender" sütununda 'Female' ve "phone" sütununda NULL değeri olan kayıtları gösterir.

**OR (VEYA) Operatörü**

SQL'de WHERE komutu içinde kullanılan "OR" operatörü, birden fazla kriterin en az birinin gerçekleşmesini sağlamak için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 değerinden küçük veya "salary" sütununda 50000 değerinden büyük olan kayıtları seçmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age < 25 OR salary > 50000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 değerinden küçük veya "salary" sütununda 50000 değerinden büyük olan kayıtları gösterir.

Aynı şekilde "employees" tablosundaki "gender" sütununda 'Female' veya "phone" sütununda NULL değerinin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE gender = 'Female' OR phone IS NULL;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "gender" sütununda 'Female' veya "phone" sütununda NULL olan kayıtları gösterir.

**IN (İÇİNDE) Operatörü**

SQL'de WHERE komutu içinde kullanılan "IN" operatörü, belirli değerler için arama yapmak için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25, 30 ve 35 değerlerinden birinin olup olmadığını kontrol etmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age IN (25, 30, 35);
	
Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25, 30 veya 35 değerlerinden birinin olan kayıtları gösterir.

Aynı şekilde "employees" tablosundaki "gender" sütununda 'Female' veya "Male" değerlerinin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE gender IN ('Female', 'Male');

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "gender" sütununda 'Female' veya 'Male' değerlerinden birinin olan kayıtları gösterir.

**BETWEEN (ARASINDA) Operatörü**

SQL'de WHERE komutu içinde kullanılan "BETWEEN" operatörü, belirli bir değer aralığı içinde arama yapmak için kullanılır. Örneğin, "employees" tablosundaki "age" sütununda 25 ve 35 arasındaki değerlerin olup olmadığını kontrol etmek için aşağıdaki sorguyu kullanabilirsiniz:

	SELECT * FROM employees WHERE age BETWEEN 25 AND 35;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 25 ve 35 arasındaki değerlerden birinin olan kayıtları gösterir.

Aynı şekilde "employees" tablosundaki "salary" sütununda 40000 ile 60000 arasındaki değerlerin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE salary BETWEEN 40000 AND 60000;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "salary" sütununda 40000 ile 60000 arasındaki değerlerden birinin olan kayıtları gösterir.

**LIKE (BENZER) Operatörü**

SQL'de WHERE komutu içinde kullanılan "LIKE" operatörü, belirli bir kalıp içinde arama yapmak için kullanılır. Örneğin, "employees" tablosundaki "name" sütununda "J%" harfleri ile başlayan isimlerin olup olmadığını kontrol etmek için aşağıdaki sorguyu kullanabilirsiniz.

	SELECT * FROM employees WHERE name LIKE 'J%';

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "name" sütununda "J%" harfleri ile başlayan isimlerin olan kayıtları gösterir.

Aynı şekilde "employees" tablosundaki "email" sütununda "@gmail.com" ile biten değerlerin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE email LIKE '%@gmail.com';

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "email" sütununda "@gmail.com" ile biten değerlerin olan kayıtları gösterir.

"_" kullanarak herhangi bir karakteri temsil edebilirsiniz. Örnek olarak "employees" tablosundaki "name" sütununda "J_n" harfleri ile başlayan isimlerin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE name LIKE 'J_n';

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "name" sütununda "J_n" harfleri ile başlayan isimlerin olan kayıtları gösterir.

 Aşağıdaki sorgu L ile başlayan, ardından bir joker karakter ardından nd ve ardından iki joker karakterle başlayan müşterileri döndürür:

  	    SELECT * FROM Customers
  		    WHERE city LIKE 'L_nd__';

**NOT (DEĞİL) Operatörü**

SQL'de NOT operatörü, bir koşulun tersini ifade eder.

Örneğin "employees" tablosundaki "age" sütununda 18 veya 60'dan küçük olan değerlerin olup olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE NOT (age < 18 OR age > 60);

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "age" sütununda 18 veya 60'dan küçük değerlerin olmayan kayıtları gösterir.

NOT operatörü genellikle NOT NULL, NOT IN, NOT BETWEEN gibi koşullar için kullanılabilir.

Örnek olarak "employees" tablosundaki "phone" sütununda NULL değerlerinin olmadığını kontrol etmek için:

	SELECT * FROM employees WHERE NOT phone IS NULL;

Bu sorgu "employees" tablosundaki tüm kayıtları seçer ve sadece "phone" sütununda NULL  olmayan kayıtları gösterir.

  **5.Aggregate Functions (Toplu Fonksiyonlar)**

- SQL'de Aggregate Functions (Toplu Fonksiyonlar), bir tablonun birden fazla satırındaki verileri tek bir değer olarak özetler. Bunlar genellikle COUNT, SUM, AVG, MAX, MIN gibi fonksiyonlardır. Bu fonksiyonlar sadece SELECT sorgularında kullanılabilir ve genellikle GROUP BY komutu ile birlikte kullanılır.

*-COUNT()*

- "employees" tablosunda kaç tane kayıt olduğunu hesaplamak için aşağıdaki sorguyu kullanabiliriz:

      SELECT COUNT(*) FROM employees;
  
- manager_id'si 100 olan kaç çalışan olduğu aşağıdaki sorguyla listelenir:
  
      SELECT COUNT(employee_id) FROM employees WHERE manager_id= 100;

***COUNT fonksiyonu, NULL değerlerini saymaz. Eğer NULL değerleri dahil edilmek isteniyorsa COUNT(column_name) yerine COUNT(*) kullanılmalıdır.

*-COUNT() with GROUP BY*

- Aşağıdaki SQL sorgusu "employees" tablosundaki kişilerin departmanlara göre gruplandırılmış sayısını döndürür.

      SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;

*-SUM, AVG & GROUP BY*

- SQL'de SUM fonksiyonu, bir tablonun belirli bir sütununda bulunan sayısal değerlerin toplamını hesaplar. Bu fonksiyon genellikle veritabanındaki verilerin toplamını belirlemek için kullanılır. SUM fonksiyonu sadece SELECT sorgularında kullanılabilir ve genellikle GROUP BY komutu ile birlikte kullanılır.

       SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;

- SQL'de AVG fonksiyonu, bir tablonun belirli bir sütununda bulunan sayısal değerlerin ortalamasını hesaplar. Bu fonksiyon genellikle veritabanındaki verilerin ortalamasını belirlemek için kullanılır. AVG fonksiyonu sadece SELECT sorgularında kullanılabilir ve genellikle GROUP BY komutu ile birlikte kullanılır.

      SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;

*-MIN, MAX & GROUP BY*

- SQL'de MAX fonksiyonu, bir tablonun belirli bir sütununda bulunan en yüksek değeri döndürür. Bu fonksiyon genellikle veritabanındaki verilerin en yüksek değerini belirlemek için kullanılır. MAX fonksiyonu sadece SELECT sorgularında kullanılabilir ve genellikle GROUP BY komutu ile birlikte kullanılır.

      SELECT MAX(salary) FROM employees WHERE department_id = 8;
      SELECT department_id, MAX(salary) FROM employees GROUP BY department_id;

- SQL'de MIN fonksiyonu, bir tablonun belirli bir sütununda bulunan en düşük değeri döndürür. Bu fonksiyon genellikle veritabanındaki verilerin en düşük değerini belirlemek için kullanılır. MIN fonksiyonu sadece SELECT sorgularında kullanılabilir ve genellikle GROUP BY komutu ile birlikte kullanılır.

      SELECT MIN(salary) FROM employees WHERE department_id = 3;
      SELECT department_id, MIN(salary) FROM employees GROUP BY department_id;


**6.SQL'de JOIN Komutu**

- SQL join işlemleri, bir veya daha fazla tablo arasında veri eşleme işlemidir. Tablolar arasındaki ilişkilere göre farklı join türleri bulunmaktadır.

  1. Inner Join: Veritabanındaki iki veya daha fazla tablo arasındaki eşleşen verilerin birleştirilmesini sağlar. Inner join, yalnızca ilişkili olan verilerin seçilmesine olanak tanır. İlişkili veriler, belirli bir kriter (örneğin, birleştirme anahtarı) üzerinden eşleştirilir. Eşleşmeyen veriler atılır ve sadece eşleşen veriler görüntülenir. Inner join, verileri birleştirirken verilerin verimli bir şekilde sorgulanmasını ve analiz edilmesini sağlar.
  2. Left Join: Veritabanındaki iki veya daha fazla tablo arasındaki verilerin birleştirilmesini sağlar. Left join, sol tablo içindeki tüm verileri ve sağ tablo ile eşleşen verileri seçer. Eşleşmeyen sağ tablo verileri NULL olarak görüntülenir. Bu tür bir join, sol tablo verilerinin tümünün görüntülenmesini ve eşleşmeyen sağ tablo verilerinin belirlenmesini sağlar. Left join, verilerin tamamının analiz edilmesi, raporlama veya veri keşfetme gibi amaçlar için kullanılabilir.
  3. Right Join: Veritabanındaki iki veya daha fazla tablo arasındaki verilerin birleştirilmesini sağlar. Right join, sağ tablo içindeki tüm verileri ve sol tablo ile eşleşen verileri seçer. Eşleşmeyen sol tablo verileri NULL olarak görüntülenir. Bu tür bir join, sağ tablo verilerinin tümünün görüntülenmesini ve eşleşmeyen sol tablo verilerinin belirlenmesini sağlar. Right join, verilerin tamamının analiz edilmesi, raporlama veya veri keşfetme gibi amaçlar için kullanılabilir.
  4. Full Outer Join: Veritabanındaki iki veya daha fazla tablo arasındaki verilerin tam birleştirilmesini sağlar. Full outer join, sol ve sağ tablodaki tüm verileri, her iki tablo arasındaki eşleşen ve eşleşmeyen verileri de dahil olmak üzere seçer. Eşleşmeyen veriler NULL olarak görüntülenir. Full outer join, verilerin tamamının analiz edilmesi, raporlama veya veri keşfetme gibi amaçlar için kullanılabilir. Ayrıca, iki tablo arasındaki eşleşmeyen verilerin belirlenmesine ve düzeltilmesine yardımcı olabilir.
  5. Cross Join: Veritabanındaki iki veya daha fazla tablo arasında herhangi bir ilişki olmaksızın verilerin birleştirilmesini sağlar. Bu join türü, her bir kayıt için diğer tablonun tüm kayıtlarıyla birleştirilmesini sağlar. Yani bir tablo içindeki her bir kayıt diğer tablo içindeki tüm kayıtlarla eşleştirilir. Cross join, verileri çok fazla artırabilir ve performans sorunlarına yol açabilir, bu yüzden performansı önemli olan uygulamalarda sıklıkla kullanılmaz. Ancak veri keşfetme ve analitik uygulamalarda kullanılabilir.
 
*-INNER JOIN*

Aşağıdaki durumlarda inner join kullanılabilir:

- Eşleşen verilerin belirlenmesi: Inner join, iki tablo arasındaki eşleşen verilerin belirlenmesine yardımcı olabilir.
- Verilerin filtrelenmesi: Inner join, verilerin belirli bir kriterle filtrelenmesi gerektiğinde kullanılabilir. Örneğin, belirli bir tarih aralığında yapılan siparişlerin listelenmesi gerektiğinde.
- Verilerin eşleştirilmesi: Inner join, iki tablo arasındaki verilerin eşleştirilmesi gerektiğinde kullanılabilir. Örneğin, müşteri bilgileri ve sipariş bilgilerinin eşleştirilmesi gerektiğinde.
- Verilerin sınırlandırılması: Inner join, verilerin belirli bir kriterle sınırlandırılması gerektiğinde kullanılabilir. Örneğin, belirli bir şehirdeki müşterilerin siparişlerinin listelenmesi gerektiğinde.
 
         SELECT students.student_id, students.name, departments.department

         FROM students

         INNER JOIN departments

         ON students.student_id = departments.student_id;
  
<img width="255" alt="269634855-f4f0d7a0-b5ef-4c96-ae0f-1e702068265c" src="https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/b49a5b5b-c046-41ff-b533-6bb16f853cdd">

*-LEFT JOIN*

SQL'de LEFT JOIN yaparken ON kısmında, sol tablo ile sağ tablo arasındaki eşleşme kriterleri belirtilmelidir. Kriter olarak herhangi bir sütun ismi kullanılabilir. ON kısmında yazılan koşul tablo satırlarının birbirine eşleşip eşleşmeyeceğini belirler. Eğer belirtilen koşul sağlanıyorsa, iki tablo arasındaki kayıtlar birleştirilir. Eğer belirtilen koşul sağlanmıyorsa, sol tablo için NULL değerleri kullanılır.
Aşağıdaki durumlarda left join kullanılabilir:

Eşleşmeyen verilerin belirlenmesi: Left join, sol tablo içindeki eşleşmeyen verilerin belirlenmesine yardımcı olabilir.

Sol tablo verilerinin tam görüntülenmesi: Left join, sol tablo verilerinin tamamının görüntülenmesi gerektiğinde kullanılabilir.

Sol tablo verilerinin sağ tablo verileriyle eşleştirilmesi: Left join, sol tablo verilerinin sağ tablo verileriyle eşleştirilmesi gerektiğinde kullanılabilir.

Verilerin filtrelenmesi: Left join, verilerin belirli bir kriterle filtrelenmesi gerektiğinde kullanılabilir. Örneğin, belirli bir tarih aralığında yapılan siparişlerin listelenmesi gerektiğinde.

	SELECT students.student_id, students.name, departments.department
	FROM students
	LEFT JOIN departments
	ON students.student_id = departments.student_id;
 
*-RIGHT JOIN*

ON kısmında, bir RIGHT JOIN sorgusu içinde hangi tabloların birbirlerine nasıl eşleneceğini tanımlayan bir koşul yazmalısınız. Genellikle, iki tablo arasındaki ilişkiyi belirlemek için bir veya daha fazla eşleşme kriterini belirleyen bir sütun veya sütunlar belirtilir.
Aşağıdaki durumlarda right join kullanılabilir:

Eşleşmeyen verilerin belirlenmesi: Right join, sağ tablo içindeki eşleşmeyen verilerin belirlenmesine yardımcı olabilir.

Sağ tablo verilerinin tam görüntülenmesi: Right join, sağ tablo verilerinin tamamının görüntülenmesi gerektiğinde kullanılabilir. Sol tablo verilerinin sağ tablo verileriyle eşleştirilmesi: Right join, sağ tablo verilerinin sol tablo verileriyle eşleştirilmesi gerektiğinde kullanılabilir.

Verilerin filtrelenmesi: Right join, verilerin belirli bir kriterle filtrelenmesi gerektiğinde kullanılabilir. Örneğin, belirli bir tarih aralığında yapılan siparişlerin listelenmesi gerektiğinde.

	SELECT *
	FROM student_learning AS sl
	RIGHT JOIN student_info AS si
	ON sl.student_id=si.student_id
	ORDER BY student_country
 
*-FULL OUTER JOIN*

Aşağıdaki durumlarda full outer join kullanılabilir:

Eşleşmeyen verilerin belirlenmesi: Full outer join, iki tablo arasındaki eşleşmeyen verilerin belirlenmesine yardımcı olabilir.

Verilerin tam analizi: Full outer join, verilerin tamamının analiz edilmesi, raporlama veya veri keşfetme gibi amaçlar için kullanılabilir.

Verilerin tam eşleştirilmesi: Full outer join, iki tablo arasındaki verilerin tam eşleştirilmesi gerektiğinde kullanılabilir. Örneğin, müşteri bilgileri ve sipariş bilgilerinin tam bir listesi gerektiğinde.

Verilerin tam görüntülenmesi: Full outer join, verilerin tamamının görüntülenmesi gerektiğinde kullanılabilir. Örneğin, müşteri bilgileri ve sipariş bilgilerinin tamamının görüntülenmesi gerektiğinde.

	SELECT Customers.customer_id, Customers.first_name, Orders.amount
	FROM Customers
	FULL OUTER JOIN Orders
	ON Customers.customer_id = Orders.customer;

*-CROSS JOIN*

SQL'de, Cross Join iki tablo arasındaki tüm satırların kombinasyonunu oluşturan bir join türüdür. Cross join, tablo adını takip eden ON koşulu olmaksızın bir tablo ile diğer tablonun her satırının birleştirilmesi sonucu oluşur.
Aşağıdaki durumlarda Cross Join kullanılabilir:

Tüm verilerin birleştirilmesi: Cross join, veritabanındaki tüm verilerin birleştirilmesi gerektiğinde kullanılabilir.

Çoklu veri analizi: Cross join, çoklu veri analizi yapmak için verilerin birleştirilmesi gerektiğinde kullanılabilir.

Cartesian product: Cross join, veritabanındaki verilerin bir Cartesian product olarak birleştirilmesi gerektiğinde kullanılabilir.

Veri üretimi: Cross join, veritabanındaki verilerin üretilmesi ve yeniden yapılandırılması gerektiğinde kullanılabilir.

	SELECT *
	FROM table1
	CROSS JOIN table2;
veya;

	SELECT *
	FROM table1,table2;
 
Join komutlarının görselleştirilmesi aşağıdaki gibidir:
![UI25E](https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/cca87df1-8086-4048-ae92-ab9279c8301c)

**7.Union ve Union All**

- SQL'de UNION, birden fazla SELECT sorgusundan gelen sonuçları birleştirmek için kullanılan bir operatördür. UNION, tek bir tablo gibi görünen ve her SELECT sorgusundan gelen satırları içeren bir tablo oluşturur.

      SELECT column1, column2, ...

      FROM table1

      UNION

      SELECT column1, column2, ...

      FROM table2;

**Not:** UNION kullanırken, her SELECT sorgusu aynı sayıda sütun, aynı sütun isimleri ve aynı veri türleri içermelidir.

- SQL'de UNION ALL, birden fazla SELECT sorgusundan gelen tüm sonuçların birleştirilmesini sağlar. UNION ALL ile her SELECT sorgusundan gelen tüm satırlar tek bir tablo gibi görünen bir tablo olarak sunulur.

      SELECT column1, column2, ...

      FROM table1

      UNION ALL

      SELECT column1, column2, ...

      FROM table2;

**UNION ALL ile UNION arasındaki fark**, UNION ALL sonuçların içinde yinelenen satırları içerirken, UNION yinelenen satırları atar ve tek bir kopyasını sunar.

- Diyelim ki A ve B isimli iki tablomuz olsun, A tablosu 1,2 verilerini içersin, B tablosu 2,3 verilerini içersin.

- Bu iki tablonun UNION ve UNION ALL ile birleşim sorgusu şu şekilde olacaktır:

      SELECT column1

      FROM A

      UNION 

      SELECT column1

      FROM B;


      SELECT column1

      FROM A

      UNION ALL

      SELECT column1

      FROM B;


- Bu iki sorgunun çıktıları ise şöyle görünecektir:

<img width="529" alt="269642696-71c78e30-70a9-4c39-b15c-a14d879cbd94" src="https://github.com/SinanKosoglu/SinanKosoglu/assets/140150167/b8bb1b55-e76c-4109-bd58-d1febd18271b">

UNION ve UNION ALL komutlarının kullanımı durumlarına göre değişebilir, ancak genel olarak aşağıdaki durumlarda kullanılabilir:

- Birden fazla tablo için veri toplama: Eğer birden fazla tablo içinden aynı veri türlerine sahip sütunları birleştirmek isterseniz, UNION veya UNION ALL kullanabilirsiniz.
- Veri filtreleme: SELECT sorguları ile farklı veri kümelerini filtreleyebilir ve sonuçları UNION veya UNION ALL ile birleştirebilirsiniz.
- Veri birleştirme: Veri birleştirme işlemi yaparken UNION veya UNION ALL kullanabilirsiniz. Örneğin, aynı müşterinin birden fazla siparişi olsun ve her siparişin farklı bir tablo içinde olduğunu düşünelim. Bu verileri birleştirmek için UNION veya UNION ALL kullanabilirsiniz.
- Yinelenen verileri içermemek: Eğer yinelenen verileri içermemek isterseniz, UNION kullanmalısınız. Ancak, yinelenen verilerin olmasının önemi yoksa, UNION ALL kullanabilirsiniz.
- Her durumda en uygun komutu seçmek, veri yapısı ve işlem gereksinimlerine bağlı olarak değişebilir.

**8. SQL’DE ALT SORGULAR (SUBQUERY)**

- SQL'de "alt sorgu" (subquery), bir başka sorgunun içinde yer alan ve veri çekmek için kullanılan bir sorgu anlamında kullanılır. Bu sorgular, bir çok koşul veya filtreleme uygulanmasına olanak tanır ve çoklu tablo işlemleri yapmak için kullanılabilir.

- SQL'de alt sorgular, bir veri tabanındaki verileri daha karmaşık veya çok katmanlı sorgular oluşturmak için kullanılabilir. Örnek olarak:

  1. Verileri filtrelemek: Alt sorgular, verileri belirli bir kriterle sınırlandırarak daha küçük veri kümelerini oluşturmanıza olanak tanır.
  2. İç içe sorgular yapmak: Alt sorgular, bir tablonun verilerini başka bir tablo ile eşleştirmek ve veri çekmek için kullanılabilir.
  3. Koşullu sorgular yapmak: Alt sorgular, bir sorgunun sonucuna göre diğer sorguların yürütülmesini sağlar.
  4. Çoklu tablo işlemleri yapmak: Alt sorgular, bir veri tabanındaki birden fazla tablonun verilerini birleştirmek ve analiz etmek için kullanılabilir.

- SQL'de iç içe sorgular, SELECT, FROM, WHERE, HAVING, ve GROUP BY gibi komutlardan sonra yazılabilir. İç içe sorgular, verileri filtrelemek, birleştirmek, gruplandırmak veya birleştirilmiş verilere göre işlem yapmak için kullanılabilir.

- Aşağıdaki sorgu, employees tablosundaki tüm çalışanların bölümünü ve maaşlarını çeker ve sadece Londra'daki bölümlerin verilerini görüntüler. İç sorgu, Londra'daki bölümleri belirlemek için kullanılır ve dış sorguda FROM komutu ile bu bölümlerin verileri çekilir. Son olarak, maaşlar toplanır ve bölümlere göre gruplandırılır.

      SELECT department, SUM(salary)

      FROM employees

      WHERE department IN (SELECT department FROM departments WHERE location = 'London')

      GROUP BY department

- Aşağıdaki sorguda, customers ve orders tablosu birleştirilir ve sadece 2022-01-01 tarihli siparişler görüntülenir. İç sorgu, sadece belirli bir tarihte yapılan siparişleri belirlemek için kullanılır ve dış sorguda INNER JOIN komutu ile bu siparişlere ait müşteri verileri çekilir.

      SELECT customers.name, orders.order_id

      FROM customers

      INNER JOIN (SELECT customer_id, order_id FROM orders WHERE order_date = '2022-01-01') AS orders

      ON customers.customer_id = orders.customer_id;

- Aşağıdaki sorgu, customers tablosundaki tüm müşterilerin adını ve sadece 2022-01-01 tarihli sipariş yapan müşterilerin sipariş numaralarını çeker. İç sorgu, belirli bir tarihte yapılan siparişleri belirlemek için kullanılır ve dış sorguda WHERE komutu ile sadece bu siparişleri yapan müşterilerin verileri çekilir.

      SELECT customers.name, orders.order_id

      FROM customers

      WHERE customer_id IN (SELECT customer_id FROM orders WHERE order_date = '2022-01-01');

  - Aşağıdaki sorgu, ürün kategorisine göre satış verilerinin toplamını çeker ve sadece electronics kategorisi için satışların ortalamasından daha fazla satış yapan kategorileri görüntüler. İç sorgu, sadece belirli bir ürün kategorisi için satışların ortalamasını belirlemek için kullanılır ve dış sorguda HAVING komutu ile sadece belirli bir ortalamanın üstünde satış yapan kategoriler görüntülenir.
 
        SELECT product_category, SUM(sales)

        FROM sales_data

        GROUP BY product_category

        HAVING SUM(sales) > (SELECT AVG(sales) FROM sales_data WHERE product_category = 'electronics');

- Aşağıdaki sorgu, müşteri tablosundaki tüm müşterilerin verilerini çeker ve her müşterinin sipariş tablosundaki toplam harcamasını belirleyen bir iç sorgu kullanır. Dış sorguda, sadece 1000 doların üzerinde harcama yapan müşteriler görüntülenir. Bu örnekte, iç sorgu ve dış sorgu arasında bir bağımlılık yoktur, çünkü her iki sorgu farklı tablolardan verileri çeker ve birbirine bağımlı değildir.

      SELECT customer_id,
      order_date,
      (SELECT SUM(amount) FROM orders WHERE customer_id = customers.customer_id) AS total_spent
      FROM customers
      WHERE total_spent > 1000;

- Aşağıdaki sorgu, order_details tablosundaki tüm sipariş detaylarını çeker ve her ürün adı için toplam satılan miktarı belirleyen bir iç sorgu kullanır. Dış sorguda, sadece 500 adetten fazla satılan ürünler görüntülenir. Bu örnekte, iç sorgu ve dış sorgu arasında bir bağımlılık vardır, çünkü iç sorgu dış sorguda kullanılan verileri filtrelemek için kullanılır.

      SELECT order_id,
      product_name,
      quantity,
      (SELECT SUM(quantity) FROM order_details WHERE product_name = outer_query.product_name) AS total_quantity_sold
      FROM order_details AS outer_query
      GROUP BY product_name
      HAVING total_quantity_sold > 500;

- Bu sorguda, orders tablosundaki order_id 10'a eşit olan müşteri customer_id'sini seçen bir alt sorgu kullanılır ve bu customer_id customers tablosuyla join edilir. Böylece, order_id 10'a ait müşteri bilgileri ve sipariş bilgileri eşleştirilir.

      SELECT customers.customer_name,
      orders.order_id,
      orders.order_date
      FROM customers
      JOIN orders
      ON customers.customer_id = (SELECT customer_id FROM orders WHERE order_id = 10)

- SQL'de alt sorgular, belirli durumlarda veritabanı işlemlerini kolaylaştırır ve optimize eder.

   1.Verilerin filtrelenmesi: Alt sorgular, verilerin belirli koşullara göre filtrelenmesini kolaylaştırır. Örneğin, bir tablo içindeki belirli bir değere sahip kayıtları seçmek isteyebilirsiniz.
   2.Değer hesaplamaları: Alt sorgular, veritabanındaki veriler üzerinde çeşitli hesaplamalar yapmanıza olanak tanır. Örneğin, belirli bir ürün adı için toplam satış miktarını hesaplamak isteyebilirsiniz.
   3.Bir verinin eşleştirilmesi: Alt sorgular, veritabanındaki iki veya daha fazla tablo arasında bir eşleştirme yapmanıza olanak tanır. Örneğin, müşterilerle ilgili verileri tutan bir tablo ile siparişlerle ilgili verileri tutan bir tablo arasında eşleştirme yapabilirsiniz.
   4.Çoklu sorguları tek bir sorguda yapmak: Alt sorgular, bir sorguda birden fazla veritabanı sorgusu yapmanıza olanak tanır. Bu, kodunuzun daha kolay okunmasını ve anlaşılmasını sağlar ve veritabanı performansını optimize etmeye yardımcı olabilir.

**9.WITH CLAUSE**

- SQL'de "WITH" (Common Table Expression) komutu, bir sorgunun ara sonuçlarını tanımlayan geçici bir tablo oluşturmanıza olanak tanır. Bu tablo, birkaç farklı sorguda kullanılabilecek ve sorgular arasında veri paylaşımını kolaylaştırabilir.

- "WITH" komutu, bir sorgu içinde belirli bir koşulu sağlamanız gereken verileri ayrı bir tablo olarak tanımlamanızı sağlar. Daha sonra bu tablo, diğer sorguların içinde tekrar kullanılabilir. Bu, sorguların okunabilirliğini ve anlaşılabilirliğini artırır ve aynı verilerin birden fazla kez sorgulanmasını önler.

      WITH employee_sales AS (

             SELECT name, SUM(sales) AS total_sales

             FROM employees

             GROUP BY name

      )

      SELECT *

      FROM employee_sales

      WHERE total_sales > 5000;

- Bu sorguda, employees tablosundaki her bir çalışanın adı ve satışlarının toplamını tanımlayan "employee_sales" adlı geçici bir tablo oluşturulmuştur. Daha sonra, bu tablo "SELECT" sorgusu içinde kullanılır ve sadece "total_sales" değeri 5000'den büyük olan satırlar görüntülenir.

- SQL'de "WITH" komutu içinde bir subquery da tanımlanabilir. Örnek olarak, aşağıdaki sorguda, "employee_sales" adında bir geçici tablo tanımlanmış ve bu tablo içinde bir subquery kullanılmıştır:

      WITH employee_sales AS (

            SELECT name, SUM(sales) AS total_sales

            FROM employees

            WHERE name IN (

                    SELECT name

                    FROM employees

                    WHERE department = 'sales'

            )

           GROUP BY name

      )  

      SELECT *

      FROM employee_sales

      WHERE total_sales > 5000;

- Bu sorguda, "employees" tablosundan "department" alanı "sales" olan çalışanların adını tanımlayan subquery kullanılmıştır. Sonrasında bu subquery kullanılarak "employee_sales" adlı geçici tablo oluşturulmuş ve sadece "total_sales" değeri 5000'den büyük olan satırlar görüntülenmiştir.

      WITH employee_sales AS (

               SELECT name, SUM(sales) AS total_sales

               FROM employees

               WHERE department = 'sales'

               GROUP BY name

               UNION

               SELECT name, SUM(sales) AS total_sales

               FROM employees

               WHERE department = 'marketing'

               GROUP BY name

      )

      SELECT *

      FROM employee_sales

      WHERE total_sales > 5000;

- Bu sorguda, "employees" tablosundan "department" alanı "sales" olan ve "department" alanı "marketing" olan çalışanların adı ve satışlarının toplamı tanımlanmıştır. Sonrasında bu veriler "employee_sales" adlı geçici tablo oluşturulmuş ve sadece "total_sales" değeri 5000'den büyük olan satırlar görüntülenmiştir.

- SQL'de "WITH" komutu, aşağıdaki durumlarda kullanılır:

 1. Yinelenen sorgu parçalarının tekrarını önlemek: "WITH" komutu, aynı sorgu parçalarının tekrar kullanılmasını önler ve kodun okunabilirliğini arttırır.
 2. Geçici tablo oluşturmak: "WITH" komutu ile geçici tablolar tanımlanabilir ve bu tablolardaki veriler diğer sorgular tarafından kullanılabilir.
 3. Zorlukla yapılabilecek sorguları kolaylaştırmak: "WITH" komutu, zorlukla yapılabilecek sorguları kolaylaştırır ve kodun okunabilirliğini arttırır.
 4. Sorguların anlaşılır bir şekilde gruplanması: "WITH" komutu, sorguları anlaşılır bir şekilde gruplamaya yardımcı olur ve kodun okunabilirliğini arttırır.

**10. Veri Tipi Değiştirme**

- SQL'de veri tipini değiştirmek için **cast (dönüştürme)** fonksiyonu kullanılır. Bu fonksiyon, verinin belirli bir veri tipine dönüştürülmesini sağlar.

      SELECT cast(kolon_adi as veri_tipi)

      FROM tablo;

      SELECT cast('123' as integer);
  
- Ayrıca veriyi cast etmek için :: operatorü kullanılabilir. Bu operator, verinin belirli bir veri tipine dönüştürülmesini sağlar.

:: operatorünün kullanımı şu şekildedir:

    SELECT veri::veri_tipi

    FROM tablo;


    SELECT '123'::integer;

- timestamp veri tipindeki bir timestamp değeri, date veri tipine dönüştürülür:

      SELECT CAST('2023-02-12 10:30:00' AS timestamp)::date;
  
- Aynı sonuç date fonksiyonu kullanılarak elde edilebilir:
  
      SELECT date('2023-02-12 10:30:00');

- **TO_CHAR fonksiyonu**, veritabanındaki bir veriyi belirli bir formatta görüntülemek için kullanılır. Bu fonksiyon, veriyi belirli bir düzen içinde görüntülemek için özelleştirilmiş bir şekilde biçimlendirir. TO_CHAR fonksiyonu, tarih ve saat verileri, sayılar, yüzdeler ve diğer veriler gibi farklı veri tipleri için kullanılabilir.

      SELECT TO_CHAR(date '2023-02-12', 'DD-MON-YYYY');

    - YYYY: 4 haneli yıl (örnek: 2022)
    - YY: 2 haneli yıl (örnek: 22)
    - MM: Ay (örnek: 02)
    - DD: Gün (örnek: 12)
 
          SELECT TO_CHAR(date '2023-02-12', 'DAY-MON-YY');

          Output:
          "SUNDAY-FEB-23"
      
**11. Date/Time Fonksiyonları**

- PostgreSQL veritabanı sisteminde birçok tarih ve zaman fonksiyonu bulunur. Aşağıdaki en sık kullanılan tarih ve zaman fonksiyonları listelenmiştir:

1. current_date: Bugünün tarihini döndürür.
2. current_time: Şu andaki saati döndürür.
3. current_timestamp: Şu anki tarih ve saati döndürür.
4. date_trunc: Belirtilen birimi kullanarak tarihi birleştirir.
5. extract: Belirtilen birimi kullanarak tarih veya zaman verisinden bir parçayı döndürür.
6. age: İki tarih arasındaki farkı döndürür.
7. date_part: Belirtilen birimi kullanarak tarih verisinden bir parçayı döndürür.
8. to_date: Metin verisini tarih verisine dönüştürür.
9. to_timestamp: Metin verisini zaman damgası verisine dönüştürür.
10. interval: İki tarih arasındaki farkı döndürür.
11. now: Şu anki tarih ve saati döndürür.

        SELECT date_trunc('month', '2023-02-10 13:30:15'::TIMESTAMP);
    
        Result:
        2023-02-01 00:00:00


        SELECT EXTRACT(YEAR FROM '2022-06-01 12:30:15'::TIMESTAMP);  -- 2022
        SELECT EXTRACT(DAY FROM '2022-06-01 12:30:15'::TIMESTAMP);   -- 1
        SELECT EXTRACT(HOUR FROM '2022-06-01 12:30:15'::TIMESTAMP);  -- 12
        SELECT EXTRACT(MINUTE FROM '2022-06-01 12:30:15'::TIMESTAMP); -- 30



        SELECT AGE('2022-06-02 12:30:15', '2022-06-01 12:30:15');

        Result:
        1 day


        SELECT EXTRACT(DAY FROM AGE('2022-06-02 12:30:15', '2022-06-01 12:30:15'));




        SELECT date_part('year', '2022-06-01 12:30:15'::TIMESTAMP);  -- 2022
        SELECT date_part('day', '2022-06-01 12:30:15'::TIMESTAMP);   -- 1
        SELECT date_part('hour', '2022-06-01 12:30:15'::TIMESTAMP);  -- 12
        SELECT date_part('minute', '2022-06-01 12:30:15'::TIMESTAMP); -- 30



        SELECT to_date('2022-06-01', 'YYYY-MM-DD');
        SELECT to_date('01-06-2022', 'DD-MM-YYYY');


        SELECT to_timestamp('2022-06-01 10:30:00', 'YYYY-MM-DD HH:MI:SS');
        SELECT to_timestamp('2022-06-01', 'YYYY-MM-DD') + interval '1 month';
        SELECT NOW() + INTERVAL '1 day';


**12. Desen Eşleştirme**

- SQL’de pattern matching (desen eşleştirme), belirli bir desene sahip metinleri bulmak için kullanılan bir işlemdir. Pattern matching, LIKE, SIMILAR TO, ve POSIX Regular Expressions olmak üzere üç farklı yöntemle yapılabilir.

**-LIKE:** Bu operatör, SQL'de en yaygın olarak kullanılan desen eşleştirme yöntemidir. LIKE operatörü, deseni temsil etmek için joker karakterler kullanır. % karakteri, sıfır veya daha fazla karakteri temsil ederken, _ karakteri tek bir karakteri temsil eder.

**-SIMILAR TO:** Bu operatör, LIKE operatörüne benzer, ancak daha karmaşık desenler için daha uygun olabilir. SIMILAR TO operatörü, % ve _ joker karakterleri yanı sıra [ ] karakter sınıfları ve { } alternatif desenler gibi ek joker karakterleri destekler.

**-POSIX Regular:** Bu yöntem, düzenli ifadeler (regular expressions) kullanarak desen eşleştirme yapmak için kullanılır. PostgreSQL'de, ~ veya ~* operatörleri kullanılarak POSIX regular expressions desteklenir. 

- PostgreSQL'de POSIX regular expressions (düzenli ifadeler) ve pattern matching (desen eşleştirme) kavramları benzer ama farklıdır.

- Pattern matching, belirli bir desene sahip metinleri bulmak için kullanılan bir işlemdir. PostgreSQL'de, desen eşleştirme için genişletilmiş SQL sözdizimi kullanılır. Bu sözdizimi, belirli karakterleri veya karakter sınıflarını temsil etmek için özel semboller içerir. Örneğin, LIKE operatörü, % karakteri ile birçok karakteri temsil edebilir. Örneğin, 'abc%' ifadesi, 'abc', 'abcdef' ve 'abc123' gibi metinlerle eşleşir.

- Regular expressions, pattern matching'in bir alt kümesidir ve daha güçlü bir araçtır. Regular expressions, metnin belirli bir desenini ifade etmek için kullanılan bir dizi özel karakterdir. Örneğin, . herhangi bir karakteri temsil ederken, + bir veya daha fazla önceki karakteri temsil eder. Regular expressions, pattern matching'den daha esnek bir desen eşleştirme sağlar ve daha kapsamlı ve karmaşık desenler için kullanılabilir.

- Özetle, PostgreSQL'de pattern matching ve regular expressions benzer işlemlerdir, ancak regular expressions daha güçlü bir araçtır ve daha karmaşık desenler için daha uygundur.

      SELECT * FROM employees WHERE first_name LIKE 'John%';

- Bu sorgu, employees tablosunda 'name' sütununda 'John' ile başlayan tüm kayıtları getirecektir. Örneğin, 'John Doe', 'John Smith', vb.

      SELECT * FROM employees WHERE first_name LIKE 'Smith%J';
  
- Bu sorgu, employees tablosunda 'name' sütununda 'Smith' ile başlayan ve son karakteri 'J' olan tüm kayıtları getirecektir.

      SELECT * FROM employees WHERE first_name LIKE '_ohn%'

- Bu sorgu, employees tablosunda 'name' sütununda bir karakterle başlayan ve 'ohn' ile devam eden tüm kayıtları getirecektir. Örneğin, 'John', 'Tohn', 'Bohn', vb.

      SELECT * FROM employees WHERE first_name LIKE '_a%'

- Bu sorgu, employees tablosunda 'name' sütununda ikinci karakteri 'a' olan tüm kayıtları getirecektir.

      SELECT * FROM employees WHERE first_name LIKE '%e_'

- Bu sorgu, employees tablosunda 'name' sütununda 'e' harfiyle biten ve son karakteri herhangi bir karakter olan tüm kayıtları getirecektir. Örneğin, 'Kate', 'Steve', 'Rose', vb.

- Tablodaki "fruit" sütununda "apple" veya "orange" kelimesini içeren kayıtları döndürmek istediğimizi varsayalım. Bu durumda SIMILAR TO ve | operatörlerini kullanarak aşağıdaki sorguyu yazabiliriz:

      SELECT * FROM table_name WHERE fruit SIMILAR TO '%(apple|orange)%';

- SIMILAR TO ve {m} kullanarak "apple" kelimesinin ardından 5 tane "e" karakteri olan kayıtları sorgulayabiliriz:

      SELECT * FROM table_name WHERE description SIMILAR TO 'apple{5}';
      Output:
      "appleeeee"
- {m,} bir önceki öğenin m veya daha fazla kez tekrarını gösterir.
- {m,n} bir önceki öğenin en az m ve en fazla n kez tekrarını gösterir.

      SELECT 'aaaaab' SIMILAR TO 'a{5}b'; -- true
      SELECT 'aaab' SIMILAR TO 'a{4}b'; -- false
      SELECT 'aabb' SIMILAR TO 'a{2}b{2}'; -- true
      SELECT 'abab' SIMILAR TO 'a{1,2}b{1,2}'; -- true

- Aşağıdaki örnekte, tablodaki description sütununda yer alan veriler içerisinde, apple kelimesi geçen ve pie kelimesi geçen gruplar arasında arama yapacağız. Bunun için, apple kelimesini pie kelimesi ile birlikte gruplandırarak, bu iki kelimenin arka arkaya yer alması gerektiğini ifade ediyoruz:

      SELECT * FROM table_name WHERE description SIMILAR TO '%apple%(pie)%';

- Aşağıdaki örnekte, tablodaki description sütununda yer alan veriler içerisinde, red, green veya blue kelimeleri ile başlayan satırları arayacağız. Bunun için, [] kullanarak bu üç renk kelimesinin başlangıcını ifade eden bir karakter sınıfı oluşturuyoruz:

      SELECT * FROM table_name WHERE description SIMILAR TO '[r|g|b]*%';

  **POSIX Regular Expressions**

  - regexp_count: bir metindeki belirtilen pattern'in kaç kez tekrarlandığını sayar
  - regexp_instr: bir metindeki belirtilen pattern'in ilk karakterinin konumunu döndürür
  - regexp_like: bir metin ifadesinin, belirli bir regular expression pattern'ine uyup uymadığını test eder
  - regexp_match: bir metindeki pattern'leri tespit eder ve sonuç olarak bir dizi döndürür
  - regexp_substr: bir metindeki belirtilen pattern'in ilk oluşumunun alt dizesini döndürür
  - regexp_replace: bir metindeki belirli pattern'leri başka bir string ile değiştirir
  - PostgreSQL, regular expression desenlerinde kullanılabilen constraints (kısıtlamalar) sağlar. Bu kısıtlamalar, eşleşmelerin belirli koşulları karşılaması gerektiğini belirtir ve desenin daha kesin olmasını sağlar. İşte PostgreSQL'de kullanılabilen bazı constraints:

- ^: Bir desenin satırın başlangıcına eşleşmesi gerektiğini belirtir. Örneğin, ^a deseni, sadece metnin başında a karakteri varsa eşleşir.
- $: Bir desenin satırın sonuna eşleşmesi gerektiğini belirtir. Örneğin, a$ deseni, sadece metnin sonunda a karakteri varsa eşleşir.
- \b: Bir desenin kelime sınırlarına (word boundary) eşleşmesi gerektiğini belirtir. Bir kelime sınırı, kelimenin başlangıcı, bitişi veya bir kelime karakteriyle olmayan bir karakterle ayrılmış olmasıdır. Örneğin, \btest\b deseni, sadece "test" kelimesiyle ayrılmış bir metinde eşleşir.
- \B: Bir desenin kelime sınırlarına eşleşmemesi gerektiğini belirtir. Örneğin, \Btest\B deseni, sadece "test" kelimesiyle ayrılmamış bir metinde eşleşir.
- (?=...): Bir desenin bir sonraki desenle eşleşmesi gerektiğini belirtir. Ancak, sonraki desen eşleştirme sonucuna dahil edilmez. Örneğin, a(?=b) deseni, sadece a karakteri varsa ve onu takip eden karakter b ise eşleşir, ancak b karakteri sonuçta dahil edilmez.
- (?!...): Bir desenin bir sonraki desenle eşleşmemesi gerektiğini belirtir. Örneğin, a(?!b) deseni, a karakteri varsa ve onu takip eden karakter b değilse eşleşir.
- Bu constraints, PostgreSQL'de regular expression desenlerinin daha spesifik olmasını sağlar ve metin verileri üzerinde daha kısıtlı eşleştirme işlemleri gerçekleştirmek için kullanılabilir. Örneğin, belirli bir kelimenin sadece tam olarak eşleştiği yerlerin tespit edilmesi veya bir desenin belirli bir kelime sınırı ile sınırlanması için kullanılabilir.

**Regular Expression Atoms**

- PostgreSQL, regular expression desenlerinde kullanılabilen bir dizi atom sağlar. Bu atomlar, desenlerin belirli karakterlerini veya karakter gruplarını belirtmek için kullanılır. İşte PostgreSQL'de kullanılabilen bazı atomlar:

- . (nokta): Herhangi bir tek karakteri eşleştirir, yeni satır karakteri (\n) hariç.
- [] (köşeli parantezler): Köşeli parantezler, içindeki karakter sınıfının herhangi bir karakteri ile eşleşir. Örneğin, [abc] deseni, a, b veya c karakterleriyle eşleşir. Köşeli parantezler içinde ayrıca karakter aralıkları ([a-z], [0-9]) veya karakter kümeleştiricileri ([^abc], [^a-z]) de kullanılabilir.
- () (yuvarlak parantezler): Yuvarlak parantezler, içindeki deseni bir alt desen olarak gruplandırır. Bu, desenlerin parçalarını gruplandırmak veya gruplandırılmış alt desenlerin eşleşen metinlerini geri almak için kullanılabilir.
- {} (süslü parantezler): Süslü parantezler, önceki atomun tekrarlanmasını belirtmek için kullanılır. Örneğin, a{3} deseni aaa metniyle eşleşir. Süslü parantezler içinde ayrıca minimum ve maksimum tekrar sayıları da belirtilebilir (a{2,4}).
- \ (ters eğik çizgi): Ters eğik çizgi, bir sonraki karakterin özel bir anlamı olmadan doğrudan karakter olarak işlenmesini sağlar. Örneğin, . deseni, bir nokta karakteriyle eşleşir.

Ayrıca;

- \d: Sayısal karakterlerin yerini tutar. [0-9] ifadesi ile aynıdır.
- \D: Sayısal olmayan karakterlerin yerini tutar. [^0-9] ifadesi ile aynıdır.
- \w: Kelime karakterlerinin yerini tutar. [a-zA-Z0-9_] ifadesi ile aynıdır.
- \W: Kelime karakteri olmayan karakterlerin yerini tutar. [^a-zA-Z0-9_] ifadesi ile aynıdır.
- \s: Boşluk karakterlerinin yerini tutar. [\r\n\t\f\v ] ifadesi ile aynıdır.
- \S: Boşluk karakteri olmayan karakterlerin yerini tutar. [^\r\n\t\f\v ] ifadesi ile aynıdır.
- Örneğin, "\d+" deseni, bir veya daha fazla sayısal karakteri eşleştirir. "\w+" deseni, bir veya daha fazla kelime karakterini eşleştirir. "\s+" deseni, bir veya daha fazla boşluk karakterini eşleştirir.
- +: Bir önceki atomun bir veya daha fazla tekrarlanması gerektiğini belirtir. Örneğin, a+ deseni, en az bir a karakteri içeren herhangi bir metinle eşleşir.
- : Bir önceki atomun sıfır veya daha fazla tekrarlanabileceğini belirtir. Örneğin, a deseni, herhangi bir sayıda a karakteri içeren herhangi bir metinle eşleşir, hatta hiç a karakteri içermeyen metinlerle bile.
- ?: Bir önceki atomun sıfır veya bir kez tekrarlanabileceğini belirtir. Örneğin, a? deseni, bir metinde ya bir a karakteri olabilir ya da olmayabilir.
- {n}: Bir önceki atomun tam olarak n kez tekrarlanması gerektiğini belirtir. Örneğin, a{3} deseni, aaa karakterleri içeren herhangi bir metinle eşleşir.
- {n,}: Bir önceki atomun en az n kez tekrarlanması gerektiğini belirtir. Örneğin, a{3,} deseni, en az üç a karakteri içeren herhangi bir metinle eşleşir.
- {n,m}: Bir önceki atomun en az n kez ve en fazla m kez tekrarlanması gerektiğini belirtir. Örneğin, a{2,4} deseni, en az iki ve en fazla dört a karakteri içeren herhangi bir metinle eşleşir.

      SELECT regexp_count('Hello World! This is an example.', 'example');
  
- Bu sorgu sonucunda, regexp_count fonksiyonu "example" kelimesinin metin içinde 1 kez geçtiğini sayacak ve 1 sonucunu döndürecektir.
  
      SELECT regexp_instr('Hello World! This is an example.', 'example');

- Bu sorgu sonucunda, regexp_instr fonksiyonu "example" kelimesinin metin içinde 19. karakterden başladığını döndürecektir. Dikkat ederseniz, regexp_instr fonksiyonu sıfırdan değil, bir (1) numaralı karakterden başlayarak konumu hesaplar.

      SELECT * FROM table_name WHERE regexp_like(description, 'apple');

- Bu sorgu, "description" sütununda "apple" kelimesi geçen tüm kayıtları döndürür.

      SELECT description, regexp_match(description, '\d+') AS match

      FROM products;
  
- Bu sorgu, "description" sütunundaki her satırı, bu satırdaki tüm rakamları içeren alt dize olarak eşleşen bir diziyle birlikte döndürür. Örneğin, "Apple pie with 5 apples" satırı, "{5}" dizisiyle birlikte döndürülür.

      regexp_substr(string, pattern [, position [, occurrence [, flags ]]])

- regexp_substr fonksiyonu, bir metin ifadesinde verilen bir desene (pattern) uyan alt dizgeyi (substring) döndürür.
- string: işlem yapılacak metin ifadesi.
- pattern: aranan desen (pattern).
- position: desen aramanın başlayacağı pozisyon. Varsayılan değeri 1'dir.
- occurrence: desenin kaçıncı kez tekrar ettiği bilgisini içeren bir sayı. Varsayılan değeri 1'dir.
- flags: opsiyonel bir bayraklar dizisi (array) veya NULL. Bayraklar, arama sırasında kullanılan ek ayarları belirtmek için kullanılır.

**13. Window Fonksiyonları**

- window functions (pencere işlevleri) bir veri kümesindeki verileri gruplandırmak, sıralamak, analiz etmek ve özetlemek için kullanılan özel bir fonksiyon türüdür. Window functions, verilerin üzerinde hareketli bir pencere (window) oluşturarak çalışırlar ve pencerenin içindeki verilere uygulanır. Pencere, veri kümesindeki belirli bir sıraya göre belirlenir ve pencere boyutu ve konumu özelleştirilebilir.
- Bu fonksiyonlar, GROUP BY veya HAVING gibi diğer SQL işlevlerinden farklı olarak, aynı sorguda kullanıldığında her bir satır için bir sonuç döndürür ve veri kümesinin özeti olarak çalışmazlar. Window functions, genellikle verilerin sıralanması veya toplamı gibi bir önceki veya bir sonraki satıra göre işlem yapılmasını gerektiren işlemler için kullanılır.

        <window function> ( [expression] ) OVER (

            [PARTITION BY partition_expression, ... ]

            [ORDER BY sort_expression [ASC|DESC], ... ]

            [ROWS frame_specification] 

        ) 
**Window function:** Bir hesaplama yapmak veya analiz etmek için kullanılan özel bir SQL işlevidir. Örnekler arasında SUM, AVG, ROW_NUMBER, RANK, LAG, LEAD ve NTILE sayılabilir. <br></br>
**Partition by:** Veri kümesinin bölüneceği sütunlar için bir ifadedir. Bu ifade, her bölme için ayrı bir hesaplama yapmak için kullanılır. Yani, belirli bir sütuna göre gruplandırarak birden fazla pencere oluşturulabilir.  <br></br>
**Order by:** Veri kümesindeki sıralama sütunlarının bir ifadesidir. Bu ifade, pencere sıralamasını belirlemek için kullanılır. Örneğin, LAG veya LEAD fonksiyonları ile bir önceki veya bir sonraki satıra göre hesaplama yapmak isteyenler için sıralama yapmak önemlidir.  <br></br>
**Frame specification:** Window function'ın çalıştığı pencerenin boyutunu belirleyen bir ifadedir. Bu ifade, sıradan belirli bir sayıda satır önce ve sonra olacak şekilde belirtilen ROWS BETWEEN ifadesi ile belirlenir. Ayrıca, bir RANGE BETWEEN ifadesi ile belirtilen sürekli bir aralıkta çalıştırılabilir.  <br></br>

    | Month | Item  | Amount |

    +-------+-------+--------+

    | Jan   | Apple | 10     |

    | Jan   | Pear  | 20     |

    | Feb   | Apple | 15     |

    | Feb   | Pear  | 25     |

Yukarıda verilen sales tablosunda ürün satış miktarları verilmiştir. Her bir ürünün ayrı ayrı satışları olduğunu varsayalım. Her bir ürünün aylık toplam satışını görmemiz gerekiyor. 

    SELECT Month, Item, Amount, SUM(Amount) OVER (PARTITION BY Item) AS TotalSales

    FROM sales;

    Output:

    | Month | Item  | Amount | TotalSales |

    +-------+-------+--------+------------+

    | Jan   | Apple | 10     | 25         |

    | Feb   | Apple | 15     | 25         |

    | Jan   | Pear  | 20     | 45         |

    | Feb   | Pear  | 25     | 45         |


Bu örnekte window function kullanımı ile her bir ürünün aylık toplam satışı, PARTITION BY ifadesi ile ürünlere göre gruplandırılarak hesaplanmıştır. Bu şekilde, her bir ürünün aylık toplam satışını elde edebiliriz.

_WINDOW FUNCTIONS WITH AGGREGATE_

- Örneğin, "sales" adlı bir tabloda yer alan verileri ele alalım:

      | Month | Store  | SalesAmount |

      +-------+--------+------------+

      | Jan   | Store1 | 100        |

      | Jan   | Store2 | 200        |

      | Feb   | Store1 | 150        |

      | Feb   | Store2 | 250        |

- Bu veri setinde, her ay farklı mağazalarda yapılan satışların toplamı yer alıyor. Her bir mağazanın aylık toplam satışını ve her bir mağazada hangi üründen ne kadar satıldığını hesaplamak için aşağıdaki SQL sorgusunu kullanabiliriz:

      SELECT Month, Store, SalesAmount, SUM(SalesAmount) OVER (PARTITION BY Store) AS StoreTotal,

           SUM(SalesAmount) OVER (PARTITION BY Store, Month) AS ProductTotal

      FROM sales;

      Output:

      | Month | Store  | SalesAmount | StoreTotal | ProductTotal |

      +-------+--------+------------+-----------+--------------+

      | Jan   | Store1 | 100        | 250       | 100          |

      | Jan   | Store2 | 200        | 450       | 200          |

      | Feb   | Store1 | 150        | 250       | 150          |

      | Feb   | Store2 | 250        | 450       | 250          |
  

  _ROW_NUMBER_

- "ROW_NUMBER" fonksiyonu, sorgu sonucunda dönen her bir satır için benzersiz bir sayısal değer oluşturur. Bu sayılar, belirli bir sıralama düzeni (örneğin, bir sütuna göre artan veya azalan sıralama) içinde sıralanır ve her satıra bir sayı atanır. ROW_NUMBER fonksiyonu, sorgu sonucunda dönen tüm satırlarda benzersiz bir sayısal değer oluşturur ve her satıra bir sıra numarası atar.

- ROW_NUMBER fonksiyonu genellikle, bir tablodan bir alt küme seçerek veya bir tablodaki satırları belirli bir sıralama düzenine göre sıralayarak sorgular oluştururken kullanılır. ROW_NUMBER fonksiyonu, ayrıca verileri sayfalama veya satır sınırlandırma işlemlerinde kullanılan bir araçtır.

- Örneğin, aşağıdaki sorgu, "orders" tablosundan müşteri adına göre gruplandırılmış toplam sipariş sayısını ve her müşteriye ait siparişlerin ROW_NUMBER değerini gösterir:

      SELECT 

      customer_name, 

      COUNT(*) AS total_orders, 

      ROW_NUMBER() OVER (PARTITION BY customer_name ORDER BY order_date) AS row_number

      FROM
          orders
      GROUP BY
          customer_name;

  - Elimizde bir "orders" tablosu olduğunu varsayalım. Bu tablo, bir e-ticaret sitesindeki siparişleri temsil eden kayıtları içermektedir. Her bir siparişin sipariş numarası, müşteri adı, tarih ve toplam tutar bilgileri yer alır. Aşağıdaki SQL sorgusu, her bir siparişe numarasını (row number) atayan bir window function kullanarak bu tablodaki kayıtları sıralayacaktır:
 
        SELECT ROW_NUMBER() OVER (ORDER BY order_date) AS order_number, customer_name, order_date, total_amount

        FROM orders;

        Output:

        | order_number | customer_name | order_date | total_amount |

        +--------------+---------------+------------+--------------+

        | 1            | John Smith    | 2022-01-01 | 120.00       |

        | 2            | Jane Doe      | 2022-01-05 | 75.00        |

        | 3            | Bob Johnson   | 2022-01-06 | 250.00       |

        | 4            | Alice Brown   | 2022-01-10 | 500.00       |

        | 5            | Mark Wilson   | 2022-01-15 | 100.00       |

_RANK_

- "RANK" fonksiyonu, sorgu sonucunda dönen verileri belirli bir sıralama düzenine göre sıralar ve her bir satıra bir sıra numarası atar. Ancak, ROW_NUMBER fonksiyonundan farklı olarak, RANK fonksiyonu, birden fazla satırın aynı sıralama düzeninde aynı değere sahip olması durumunda aynı sıra numarasını atar.

- RANK fonksiyonu, genellikle bir tablodan bir alt küme seçerek veya bir tablodaki satırları belirli bir sıralama düzenine göre sıralayarak sorgular oluştururken kullanılır. RANK fonksiyonu, verileri gruplandırıp sıralamak, eşit değerlere sahip verileri ayırmak ve özetleme raporları oluşturmak için kullanışlı bir araçtır.

- Diyelim ki bir üniversitenin öğrenci kayıt sistemine sahipsiniz ve her öğrencinin adı, bölümü ve not ortalaması bilgilerini sakladığınız bir "students" tablonuz var. Aşağıdaki örnek sorgu, her öğrencinin not ortalamasına göre sıralayarak, öğrencilerin aldığı sıralamayı "RANK" fonksiyonu kullanarak gösterir:

      SELECT 

          name, 

          department, 

          grade_average, 

          RANK() OVER (ORDER BY grade_average DESC) AS rank

      FROM students;

      Output:

      | name     | department  | grade_average | rank |

      +----------+-------------+---------------+------+

      | Alice    | Mathematics | 98            | 1    |

      | Bob      | History     | 90            | 2    |

      | Charlie  | Physics     | 90            | 2    |

      | David    | Biology     | 87            | 4    |

      | Elizabeth| Mathematics | 84            | 5    |

- Bu çıktıda, her bir öğrencinin adı, bölümü ve not ortalaması yanı sıra aldığı sıralama da yer almaktadır. "Alice" en yüksek not ortalamasına sahip olduğu için birinci sıraya yerleştirilirken, "Bob" ve "Charlie" aynı not ortalamasına sahip oldukları için ikinci sırayı paylaşırlar. "David" ve "Elizabeth" ise sırasıyla dördüncü ve beşinci sıralarda yer alırlar.

_DENSE RANK_

- DENSE_RANK, SQL'deki bir pencere işlevi (window function) olarak kullanılan bir fonksiyondur. RANK fonksiyonuna benzer şekilde sorgu sonuçlarındaki satırları sıralamaya yarar, ancak RANK fonksiyonundan farklı olarak eşit sıralama değerlerine sahip satırlar için aynı sıra numarası atar ve sıradaki boşlukları atlama özelliğine sahiptir.
  
- DENSE_RANK fonksiyonu, RANK fonksiyonundan farklı olarak, eşit sıralama değerlerine sahip satırlar için aynı sıra numarası atar ve sıradaki boşlukları atlama özelliğine sahiptir. Bu özellikleri nedeniyle, özellikle sınıflama veya sıralama yaparken kullanışlı bir araçtır.

- Örneğin, bir "orders" tablosu var ve bu tablo siparişlerin id'si, müşteri id'si ve sipariş miktarı bilgilerini içeriyor.

      SELECT 

           customer_id, 

           order_amount, 

       DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY order_amount DESC) as rank

      FROM orders;

  - Bu sorgu, müşterilerin siparişlerinin miktarına göre sıralanmış halini, her müşterinin sıralamasını ve müşteri id'sini verir. "DENSE_RANK()" fonksiyonu, müşteri id'sine göre ayrılmış ve sipariş miktarına göre sıralanmış bir pencereye uygulanır ve her müşterinin sipariş miktarına göre sıralamasını belirler. Eşit sipariş miktarına sahip müşteriler aynı sıralamaya sahip olacaktır, ancak DENSE_RANK() fonksiyonu sıradaki boşlukları atlar.
 
_PERCENT RANK_

- Percent rank pencere fonksiyonu, her bir satırın sıralama içindeki yüzdelik pozisyonunu hesaplar. Bu fonksiyon, sıralamanın yüzdelik oranını hesaplamak için kullanılır. Özellikle, bir sıralama içindeki her bir öğenin, tüm öğelerin yüzdesel sırası nedir diye sormak istediğinizde kullanılır.

- Bu fonksiyon, "0" ile "1" arasında bir değer döndürür. "0" değeri, sıralamanın en düşük değerini temsil ederken, "1" değeri, sıralamanın en yüksek değerini temsil eder. Diğer tüm değerler ise, sıralamadaki her bir öğenin yüzdelik pozisyonunu ifade eder.

- Varsayalım ki "orders" tablosunda siparişlerin id'si, müşteri id'si ve sipariş miktarı bilgileri tutulmaktadır. Aşağıdaki sorgu, müşterilerin siparişlerinin miktarına göre sıralanmış haliyle birlikte, her bir siparişin yüzdelik pozisyonunu verir:

      SELECT 

          customer_id, 

          order_amount, 

          PERCENT_RANK() OVER (ORDER BY order_amount) as percentile_rank

      FROM orders;


  _NTILE Fonksiyonu_

- NTILE() fonksiyonu, bir veri kümesini eşit sayıda parçaya bölerek, her bir parçanın sıralama içindeki yerini belirlemek için kullanılan bir SQL pencere fonksiyonudur. Bu fonksiyon, veri kümesini belirtilen sayıda bölüme ayırarak her bir bölümdeki satırları numaralandırır. Bu sayede, sıralama içindeki her satırın, veri kümesindeki n tane eşit büyüklükteki parçalardan hangisinde yer aldığı belirlenir.

- NTILE() fonksiyonu, bir veri kümesindeki her bir elemanın, kümedeki eşit sayıda parçalardan hangisinde yer aldığını belirlemek için kullanılabilir. Bu sayede, örneğin bir sınıftaki öğrencilerin notlarının sıralamasına göre, sınıfı 5 eşit parçaya bölerek her bir öğrencinin hangi yüzdelik dilimde yer aldığı belirlenebilir.

- Örneğin, "students" adında bir tabloda öğrencilerin isimleri ve notları tutulmaktadır. Bu tablodaki öğrencilerin notlarına göre sıralama yapılarak, her bir öğrencinin hangi yüzdelik dilimde yer aldığı belirlenebilir. Aşağıdaki sorgu, öğrencileri notlarına göre sıralayarak, 4 parçaya ayırır ve her bir öğrencinin hangi yüzdelik dilimde yer aldığını belirler:

      SELECT 

           name, 

           grade, 

       NTILE(4) OVER (ORDER BY grade) as percentile_rank

      FROM students;

  _Lag Fonksiyonu_

- Lag, SQL'de bir önceki satırdaki değerini almak için kullanılır. Lag fonksiyonu, bir sorgu sonucunu, bir sütundaki her bir satırın bir önceki satırındaki değerleri ile genişletebilir.
 
- Lag fonksiyonu genellikle zamana bağlı verilerde kullanılır. Örneğin, bir hisse senedi fiyatı zaman serisindeki her bir günün önceki günündeki fiyatına ihtiyaç duyulabilir.
 
- Örneğin, aşağıdaki sorgu, "orders" adlı bir tablodaki siparişlerin tarihlerine göre önceki tarihlerini gösterir:

      SELECT 

           order_date, 

           LAG(order_date, 1, NULL) OVER (

              ORDER BY order_date

           ) AS prev_order_date

      FROM orders;

- Bu sorgu, "orders" tablosundaki siparişleri tarihlerine göre sıralar ve her bir siparişin önceki sipariş tarihini prev_order_date sütununda gösterir.

- Örneğin, bir şirketin aylık satışlarını takip eden bir "sales" adlı bir tablo var diyelim. Bu tablonun "month" ve "revenue" adında iki sütunu var ve aşağıdaki gibi görünüyor:

         month  | revenue

        --------+---------

         201901 |  100000

         201902 |   90000

         201903 |  110000

         201904 |  120000

         201905 |  130000

- Bu tablodaki her bir ay için, önceki ayın gelirlerine göre ne kadar artış veya azalış olduğunu hesaplamak istiyoruz. Bunu yapmak için, aşağıdaki sorguyu kullanabiliriz:

         Select
         month,
         revenue, 
         LAG(revenue) OVER (

              ORDER BY month

         ) AS prev_month_revenue, 

        revenue - LAG(revenue) OVER (

            ORDER BY month

        ) AS revenue_change

       FROM sales;

       Output:

      month  | revenue | prev_month_revenue | revenue_change

      --------+---------+--------------------+----------------

      201901 |  100000 |               NULL |           NULL

      201902 |   90000 |              100000 |          -10000

      201903 |  110000 |               90000 |           20000

      201904 |  120000 |              110000 |           10000

      201905 |  130000 |              120000 |           10000


_LEAD Fonksiyonu_

- LEAD fonksiyonu, bir tablodaki bir sütunun bir sonraki satırdaki değerini döndürür. Bu, LAG fonksiyonunun tam tersidir.

- Bu fonksiyon, özellikle bir tablodaki sütunlardaki değerleri karşılaştırmak ve karşılaştırmalar arasındaki farkları bulmak için kullanışlıdır. Örneğin, bir tablodaki bir sütunun değerlerinin artış hızını veya azalış hızını hesaplamak gibi birçok senaryoda kullanılabilir.

- Örneğin, bir şirketin aylık satışlarını takip eden bir "sales" adlı bir tablo var diyelim. Bu tablonun "month" ve "revenue" adında iki sütunu var ve aşağıdaki gibi görünüyor:

      month  | revenue

      --------+---------

      201901 |  100000

      201902 |   90000

      201903 |  110000

      201904 |  120000

      201905 |  130000

- Bu tablodaki her bir ay için, bir sonraki ayın gelirlerine göre ne kadar artış veya azalış olduğunu hesaplamak istiyoruz. Bunu yapmak için, aşağıdaki sorguyu kullanabiliriz:

        SELECT 

           month, 

           revenue, 

           LEAD(revenue) OVER (

                  ORDER BY month

           ) AS next_month_revenue, 

           LEAD(revenue) OVER (

                  ORDER BY month

           ) - revenue AS revenue_change

        FROM sales;

        Output:

      month  | revenue | next_month_revenue | revenue_change

      --------+---------+--------------------+----------------

      201901 |  100000 |               90000 |          -10000

      201902 |   90000 |              110000 |           20000

      201903 |  110000 |              120000 |           10000

      201904 |  120000 |              130000 |           10000

      201905 |  130000 |                NULL |           NULL


_FIRST VALUE Fonksiyonu_

- "FIRST_VALUE" fonksiyonu, bir sütunda bulunan değerlerin ilk değerini döndürür.

- Özellikle, "FIRST_VALUE" fonksiyonu, bir sütundaki değerlerin ilk değerine ihtiyaç duyulan durumlarda kullanışlıdır. Ayrıca, bir sütundaki verileri sıralamak ve ilk değeri belirlemek için de kullanılabilir.

- Örneğin, aşağıdaki sorgu, "employees" tablosundaki departmanlardaki çalışanların maaşlarının ortalamasını ve en yüksek maaşa sahip ilk çalışanın adını listeler:

      SELECT department_id, AVG(salary) AS avg_salary, 

       FIRST_VALUE(first_name || ' ' || last_name) OVER (PARTITION BY department_id ORDER BY salary DESC) AS highest_paid_employee

      FROM employees

      GROUP BY department_id;

- Bu sorgu, "employees" tablosundan verileri alır ve her departman için, "department_id" sütunundaki departman ID'sini, "salary" sütunundaki maaşların ortalamasını ve "FIRST_VALUE" fonksiyonunu kullanarak en yüksek maaşa sahip ilk çalışanın adını belirler.

- "OVER" ifadesi, "PARTITION BY" ifadesi ile birlikte kullanılarak, her departman için ayrı ayrı işlem yapılmasını sağlar. "ORDER BY" ifadesi, "salary" sütununa göre sıralama yaparak, en yüksek maaşa sahip ilk çalışanın adını belirler.

_LAST VALUE Fonksiyonu_

- SQL'deki "LAST_VALUE" fonksiyonu, bir sütunda bulunan değerlerin son değerini döndürür.

- "LAST_VALUE" fonksiyonu, bir sütundaki verileri sıralamak ve son değeri belirlemek için kullanılabilir. Ayrıca, bir sütunda bulunan son değeri diğer değerlerle karşılaştırmak ve karşılaştırma sonucuna göre bir işlem yapmak için de kullanılabilir.

- Örneğin, aşağıdaki sorgu, "sales" tablosundaki satış verilerini alır ve her gün için satış miktarının artış oranını ve son satış miktarını listeler:

        SELECT sale_date, sale_amount, 
        (sale_amount - LAG(sale_amount, 1, sale_amount) OVER (ORDER BY sale_date)) / LAG(sale_amount, 1, sale_amount) OVER (ORDER BY           sale_date) AS increase_rate,
        LAST_VALUE(sale_amount) OVER (ORDER BY sale_date) AS last_sale_amount
        FROM sales;
- Bu sorgu, "sales" tablosundan verileri alır ve her satış için, "sale_date" sütunundaki satış tarihini, "sale_amount" sütunundaki satış miktarını, "LAG" fonksiyonunu kullanarak önceki satış miktarını belirler.

- "OVER" ifadesi, "ORDER BY" ifadesi ile birlikte kullanılarak, verilerin satış tarihine göre sıralanmasını sağlar.

-  "LAST_VALUE" fonksiyonu, son satış miktarını belirler. Bu örnek, "LAST_VALUE" fonksiyonunun, bir sütundaki son değere ihtiyaç duyulan durumlarda nasıl kullanılabileceğini gösterir.
    

**Dipnot: Window functions group by'daki bazı kısıtlamaları ortadan kaldırır.*

- Örneğin aşağıdaki gibi bir group by sorgusu yazıldığında;

      select 
	    count(distinct(employee_id)) as calisan_sayısı,
	    department_id,
	    first_name,
	    last_name
      from employees
      group by department_id

hata verecektir. Ya da aşağıdaki gibi bir sorgu yazıldığında;

    select 
	    sum(salary) toplam_maas,
	    department_id,
	    first_name,
	    last_name
    from employees
    group by department_id

Gene hata verecektir. Group by ile first_name, last_name isimleri getirilemez. Window fonksiyonları
bu kısıtları ortadan kaldırmak için kullanışlıdır.

    select 
	    first_name, 
	    last_name,
	    department_id,
	    sum(salary) over (partition by department_id) as sum_salary
    from employees


    select 
	    first_name, 
	    last_name,
	    department_id,
	    count(employee_id) over (partition by department_id) as calisan_sayisi
    from employees



