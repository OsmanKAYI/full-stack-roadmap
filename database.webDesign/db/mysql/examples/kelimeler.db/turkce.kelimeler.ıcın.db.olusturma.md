# Türkçe Kelimeler İçin Veri Tabanı Oluşturma

## 1. Projeyi bilgisayara indir

```
wget -O A.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/A.txt
wget -O B.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/B.txt
wget -O C.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/C.txt
wget -O Ç.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Ç.txt
wget -O D.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/D.txt
wget -O E.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/E.txt
wget -O F.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/F.txt
wget -O G.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/G.txt
wget -O Ğ.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Ğ.txt
wget -O H.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/H.txt
wget -O I.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/I.txt
wget -O İ.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/İ.txt
wget -O J.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/J.txt
wget -O K.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/K.txt
wget -O L.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/L.txt
wget -O M.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/M.txt
wget -O N.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/N.txt
wget -O O.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/O.txt
wget -O Ö.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Ö.txt
wget -O P.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/P.txt
wget -O R.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/R.txt
wget -O S.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/S.txt
wget -O Ş.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Ş.txt
wget -O T.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/T.txt
wget -O U.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/U.txt
wget -O Ü.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Ü.txt
wget -O V.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/V.txt
wget -O Y.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Y.txt
wget -O Z.txt https://raw.githubusercontent.com/ekartal/turkce-kelime-database/master/Z.txt
```

ya da

`git clone git@github.com:ekartal/turkce-kelime-database.git`

## 2. İndirilenleri aynı dosyada topla

`cat ?.txt | sort > kelimeler.txt`

## 3. `kelimelerDB` adlı veri tabanı oluştur

## 4. Sütunları `id` ve `kelime` olan `kelimeler` adlı bir tablo oluştur

## 5. İndirilen ve tek dosyada toplanan kelimeri tabloya kaydet

## 6. Kelimeleri tekrarsız yap

### Çift kelimeleri seç

```
SELECT * FROM kelimeler t1
INNER JOIN kelimeler t2
WHERE
    t1.id < t2.id AND
    t1.kelime = t2.kelime;
```

### Çift kelimeleri sil

```
DELETE t1 FROM kelimeler t1
INNER JOIN kelimeler t2
WHERE
    t1.id < t2.id AND
    t1.kelime = t2.kelime;
```

**Note:** "WHERE" bölümünde kullanılacak sütun adı önceden "index" olarak eklenirse komut çalıştığında sonuca ulaşması için gereken süre hatırı sayılır miktarda azalır.

### Kelimelerin uzunluklarını hesaplama ve tabloya ekleme

```
update kelimeler set boy = length(kelime);
```

**Note:** `length` ile yaptığımız işlemler farklı karakterlerin birden fazla bit yer kaplayarak sistemde depolanmasından dolayı hataya zemin oluşturabilir. Mesela;

```
length(osman)
> 5 sonucunu verirken
length(şeyma)
> 6 sonucunu verecektir.
```

Bu yüzden `char_length` tercih edilir.

### WORDLE benzeri bir çalışma

`update kelimeler set boy = char_length(kelime);` cümleciği ile `kelimeler` tablosundaki her bir kelimenin uzunluğunu bulunup `boy` sütununa yazdırılır. <br>

`update kelimeler set boy = 0 where kelime like "% %";` cümleciği ile arasında boşluk olan kelimeler için `boy` sütunu sıfır yapılır. <br>

`select * from kelimeler where kelime like "%'%" limit 10;` cümleciği ile içerisinde kesme işareti (') olan kelimeler seçilir.

```
select * from kelimeler where
-- kelime like "_____"
BOY = 5
AND kelime not like "%h%"
AND kelime not like "%a%"
AND kelime not like "%s%"
AND kelime not like "%ı%"
AND kelime not like "%r%"
AND kelime not like "%m%"
AND kelime not like "%v%"
AND kelime not like "%i%"
AND kelime not like "%t%"
AND kelime not like "%z%"
AND kelime not like "_e___"
AND kelime not like "___k_"

AND kelime like "%e%"
AND kelime like "%k%"
AND kelime like "___ek"
```

# Türkçe İmla Klavuzu İçin Veri Tabanı Oluşturma

## 1. Projeyi bilgisayara indir

`wget -O imla.txt https://raw.githubusercontent.com/emrahcom/turkce_kelimeler/master/imla_kilavuzu.txt`

## 2. `kelimelerDB` adlı veri tabanı oluştur

## 3. Sütunları `id` ve `imla` olan `imla` adlı bir tablo oluştur

## 4. İndirilen kelimeri tabloya kaydet

# Türkçe Eş Anlamlı Kelimeler İçin Veri Tabanı Oluşturma

## 1. Projeyi bilgisayara indir

`wget -O esanlam.csv https://raw.githubusercontent.com/yusufusta/Es-Anlamlilar/master/EsAnlamlilar.csv`

## 2. `kelimelerDB` adlı veri tabanı oluştur

## 3. Sütunları `id`, `kelime`, `esanlam`, `esanlam2`, `esanlam3` ve `esanlam4` olan `esanlam` adlı bir tablo oluştur

## 4. İndirilen kelimeri tabloya kaydet

### DB boşlukları yok etme (önündeki ve sonundaki, aradakilere dokunmaz!)

```
UPDATE esanlam SET
kelime = trim(kelime),
esanlam = trim(esanlam),
esanlam2 = trim(esanlam2),
esanlam3 = trim(esanlam3),
esanlam4 = trim(esanlam4);
```
