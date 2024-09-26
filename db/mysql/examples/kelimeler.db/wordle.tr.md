# 2022.04.03

```
select * from kelimeler where
-- kelime like "_____"
BOY = 5
-- 1. DENEME ---> erika
AND kelime not like "%e%"
AND kelime not like "%i%"
AND kelime not like "%k%"
AND kelime not like "%a%"
AND kelime not like "_r___"
AND kelime like "%r%"

-- 2. DENEME ---> muzır
AND kelime not like "%z%"
AND kelime not like "%ı%"
AND kelime not like "m____"
AND kelime like "%m%"
AND kelime like "%u%"
AND kelime like "_u__r"

-- 3. DENEME ---> humor
AND kelime not like "%h%"
AND kelime not like "%o%"
AND kelime like "_um_r"

-- 4. DENEME ---> dumur
```

# 2022.04.04

```
select * from kelimeler where
-- kelime like "_____"
BOY = 5
-- 1. DENEME ---> erika
AND kelime not like "%r%"
AND kelime not like "%i%"
AND kelime not like "___k_"
AND kelime not like "____a"
AND kelime like "%e%"
AND kelime like "%k%"
AND kelime like "%a%"
AND kelime like "e____"

-- 2. DENEME ---> elhak
AND kelime not like "%l%"
AND kelime not like "%h%"
AND kelime not like "____k"
AND kelime like "___a_"

-- 3. DENEME ---> enkaz
```
