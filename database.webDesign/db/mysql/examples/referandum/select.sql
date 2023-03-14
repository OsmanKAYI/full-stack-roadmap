# Ödevler
- Markdown öğrenilecek
- https://www.snipaste.com/ DENE

# Xampp İçin

xamlp/mysql/bin dizinine geç
mysql -u root

şu komutu çalıştır

CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY 'dbadmin';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


***********************************************************************

SELECT Yapısı

SELECT: specifies which column to return.
FROM: specifies from which table to fetch the data.
WHERE: specifies how to filter the data.
GROUP BY: arranges the data to be returned by groups.
HAVING: filters groups by predicates.
ORDER BY: sorts the results.
LIMIT

select * from referandum where il="ADANA"

select il from referandum

select distinct il from referandum

select il from referandum group by il

select il, count(1) as ILCE from referandum group by il

select il, count(1) as OSMAN from referandum group by il

select il as "City", count(1) as "İlçe Sayısı" from referandum group by il

select il as "City", count(1) as "İlçe Sayısı" from referandum where ilce is not null group by il 

select il, ilce from referandum where ilce LIKE 'A%'

select il, ilce from referandum where ilce LIKE 'A%' order by 2

select il, ilce from referandum where ilce LIKE '_Ğ%' order by 2

select il, ilce from referandum where ilce LIKE '____'

select il, sum(kayitli) as "Seçmen Adedi" from referandum group by il

select il, sum(kayitli) as "Seçmen Adedi" from referandum group by il order by 2 desc limit 5 

select il, count(1) as "ilce adedi", sum(kayitli) as "Seçmen Adedi" from referandum group by il order by 3 desc limit 5

select il, count(1) as "ILCEADET", sum(kayitli) as "Seçmen Adedi" from referandum group by il  having ILCEADET >= 20 order by 2 desc limit 3

select bolgeid, sum(kayitli) as "SeçmenAdedi" from referandum group by bolgeid

select * from bolgeler

select referandum.bolgeid, bolgeler.bolgeadi, sum(kayitli) as "SeçmenAdedi" 
from referandum, bolgeler 
where referandum.bolgeid = bolgeler.bolgeid
AND il like 'A%'
group by bolgeadi


select referandum.bolgeid, bolgeadi, sum(kayitli) as "SeçmenAdedi" 
from referandum, bolgeler 
where referandum.bolgeid = bolgeler.bolgeid
AND il like 'A%'
group by bolgeadi


select referandum.bolgeid as Bolge1, bolgeler.bolgeid as Bolge2, bolgeadi, sum(kayitli) as "SeçmenAdedi" 
from referandum, bolgeler 
where referandum.bolgeid = bolgeler.bolgeid
AND il like 'A%'
group by bolgeadi


select referandum.bolgeid as Bolge1, bolgeler.bolgeid as Bolge2, bolgeler.bolgeadi, sum(kayitli) as "SeçmenAdedi" 
from referandum, bolgeler 
where referandum.bolgeid = bolgeler.bolgeid
AND il like 'A%'
group by bolgeadi


select R.bolgeid as Bolge1, B.bolgeid as Bolge2, B.bolgeadi, sum(kayitli) as "SeçmenAdedi" 
from referandum R, bolgeler B
where R.bolgeid = B.bolgeid
AND il like 'A%'
group by bolgeadi