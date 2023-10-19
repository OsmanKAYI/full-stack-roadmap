# Markdown-HTML

Markdown, 2004 yilinda John Gruber tarafindan olusturuldu. Asil amaci kolay okuma ve yazmayi saglamakla beraber kolayca HTML (artik bir cok diger formatlara) donusum saglamaktir.

<!-- Markdown, HTML'i kapsar, yani her HTML dosyasi gecerli bir Markdown dosyasidir, bu demektir
ki Markdown icerisinde HTML etiketleri kullanabiliriz, ornegin bu yorum elementi, ve
markdown isleyicisinde etki etmezler. Fakat, markdown dosyasi icerisinde HTML elementi olusturursaniz,
bu elementin iceriginde markdown soz dizimlerini kullanamazsiniz. -->

<!-- Markdown ayrica isleyiciden isleyiciye farklilik gosterebilir. Bu rehberde
evrensel ozelliklere uygun anlatimlar olacaktir. Bir cok isleyici bu rehberdeki
anlatimlari destekler -->

<!-- Basliklar -->
<!-- Kolayca <h1>'den <h6>'ya HTML etiketleri olusturabilirsiniz.
Kare (#) sayisi bu elementin numarasini belirleyecek ve devaminda getirdiginiz
yazi bu elementin icerigi olacaktir
-->

````md
# Bu bir <h1>

## Bu bir <h2>

### Bu bir <h3>

#### Bu bir <h4>

##### Bu bir <h5>

###### Bu bir <h6>

<!-- Markdown ayrica h1 ve h2 icin 2 alternatif yol daha tasir -->

# Bu bir h1

## Bu bir h2

<!-- Basit yazi stilleri -->
<!-- Markdown ile yazilar kolayca italik ve kalin belirtilebilir -->

_Bu yazi italik._
_Bu yazi da italik._

**Bu yazi kalin.**
**Bu yazi da kalin.**

**_Bu yazi hem kalin hem italik._**
**_Bu da oyle!_**
_**Hatta bu bile!**_

<!-- GitHub Flavored Markdown'da ayrica ustu cizgili karakter de desteklenir: -->

~~Bu yazi ustu cizili olarak gozukecek.~~

<!-- Paragraflar bir veya daha fazla bos satirla ayrilir. -->

Bu bir paragraf. Paragrafin icerigine devam ediyorum, eglenceli degil mi?

simdi 2. paragrafima gectim.
Hala 2. paragraftayim, cunku bos bir satir birakmadim.

Bu da 3. paragrafim!

<!-- HTML'de her satir icin <br /> etiketi kullanmak ister misiniz, Bir
paragrafi bitirdikten sonra 2 veya daha fazla bosluk birakin ve yeni paragrafa
baslayin, bu bir <br /> etiketi sayilacaktir  -->

Bu yazinin sonunda 2 bosluk var (bu satiri secerek kontrol edebilirsiniz).

Bir ust satirda <br /> etiketi var!

<!-- Blok yazilarinin yapimi oldukca kolay, (>) karakteri ile yapabilirsiniz  -->

> Bu bir blok etiketi. Satirlara ayirmak icin
> her satirin basinda `>` karakter yerlestirmeli veya tek satirda butun icerigi yazabilirsiniz.
> Satir `>` karakteri ile basladigi surece sorun yok.

> Ayrica alt alta da blok elementi acabilirsiniz
>
> > ic ice yani
> > duzgun degil mi ?

<!-- Listeler -->
<!-- Numarasiz listeler icin yildiz, arti, veya tire kullanabilirsiniz -->

- Nesne
- Nesne
- Bir baska nesne

veya

- Nesne
- Nesne
- Bir baska nesne

veya

- Nesne
- Nesne
- Son bir nesne

<!-- Numarali liste icin basina sirali bir sekilde sayi eklemeniz yeterli -->

1. Ilk nesne
2. Ikinci nesne
3. ucuncu nesne

<!-- Isterseniz sirali bir sekilde yazmak zorunda degilsiniz, markdown
bicimlendirirken sizin icin siralayacaktir, fakat bunu onermiyorum. Markdown dosyasinin
duzgun gozukmesi icin onerilen metodu uygulamanizi tavsiye ederim -->

1. Ilk nesne
1. Ikinci nesne
1. ucuncu nesne

<!-- (Bunun ciktisi ile, sirali olarak yazdigimiz ornegin ciktisi ayni olacaktir) -->

<!-- Ayrica alt alta liste olusturabilirsiniz -->

1. Ilk nesne
2. Ikinci nesne
3. ucuncu nesne
   - Alt nesne
   - Alt nesne
4. Dorduncu nesne

<!-- Ayrica gorev listeleri de bulunmakta. HTML secim kutusu(checkbox) olusturacaktir. -->

Kutunun icerisinde `x` yoksa eger secim kutusu bos olacaktir.

- [ ] Yapilacak ilk gorev.
- [ ] Yapilmasi gereken bir baska gorev
      Asagidaki secim kutusu ise ici dolu olacaktir.
- [x] Bu gorev basariyla yapildi

<!-- Kod bloklari -->
<!-- Kod bloklarini(<code> elementi) belirtmek icin 4 adet bosluk veya bir
tab karakterini kullanabilirsiniz -->

    Bu bir kod
    oyle mi?

<!-- Ayrica kod icerisinde girinti kullanmak istiyorsaniz tekrar `tab` veya `4 bosluk`
kullanabilirsiniz -->

    my_array.each do |item|
        puts item
    end

<!-- Yazi icerisinde kod belirtmek icin sorgu tirnagi (`) kullanabilirsiniz -->

Ahmet `go_to()` fonksiyonun ne yaptigini bilmiyor!

<!-- GitHub Flavored Markdown'da, kod icerisinde aydinlatma kullanabilirsiniz -->

\`\`\`ruby <!-- buradaki ters slas (\) isaretlerini kullanmayin, sadece ```ruby ! -->
def foobar
puts "Hello world!"
end
\`\`\` <!-- burada da (\) isaretlerini kullanmayin, sadece ``` -->

<!-- Yukaridaki ornekte girinti kullanmaniza gerek yok, GitHub da
``` isaretinden sonra belirttiginiz yazilim diline gore gerekli
syntax aydinlatmalari uygulanacaktir -->

<!-- Duz cizgi (<hr />) -->
<!-- Duz cizgiler 3 veya daha fazla yildiz/cizgi ile yapilabilir. Bosluklar onemsiz. -->

---

---

---

---

<!-- Linkler -->
<!-- Markdown'daki en guzel seylerden biri kolayca link olusturmaktir.
Linkte gostermek istediginiz yaziyi [] icerisine yerlestirin ve sonuna parantezler icerisinde ()
gidecegi adresi belirtin -->

[Bana tikla!](http://test.com)

<!-- Ayrica linke `title` ozelligi eklemek icin tirnaklari kullanabilirsiniz -->

[Bana tikla!](http://test.com "Test.com'a gider")

<!-- Bagil yollar da calisiyor. -->

[Muzik dinle](/muzik/).

<!-- Markdown ayrica referans linklerini de destekler -->

[Bu linke tiklayarak][link1] daha detayli bilgi alabilirsiniz!
[Ayrica bu linki de inceleyin][foobar] tabi istiyorsaniz.

<!--Baslik ayrica tek tirnak veya parantez icinde olabilir, veya direk yazilabilir.
Referans dokuman icerisindeki herhangi bir yer olabilir ve referans IDsi
benzersiz oldugu surece sorunsuz calisacaktir. -->

<!-- Ayrica "dolayli adlandirma" bulunmaktadir, "dolayli adlandirma", linkin yazisinin
ayni zamanda onun idsi olmasidir -->

[Bu][] bir link.

<!-- Fakat bu cok tercih edilen bir yontem degil. -->

<!-- Resimler -->
<!-- Resimler aslinda linklere cok benziyor fakat basinda unlem bulunuyor! -->

![Bu alt etiketine gelecek icerik](http://imgur.com/resmim.jpg "Bu da istege bagli olan bir baslik")

<!-- Referanslar resimler icin de gecerli -->

![Bu alt etiketi.][resmim]

<!-- cesitli -->
<!-- Oto-linkler -->

<http://testwebsite.com/> ile
[http://testwebsite.com/](http://testwebsite.com) ayni seyler

<!-- Oto-linkler epostalari da destekler -->

<foo@bar.com>

<!-- Kacis karakterleri -->

Bu yazinin _yildizlar arasinda gozukmesini_ istiyorum fakat italik olmamasini istiyorum,
bunun icin, su sekilde: \*bu yazi italik degil, yildizlar arasinda\*.

<!-- Tablolar -->
<!-- Tablolar sadece GitHub Flavored Markdown'da destekleniyor ve acikcasi
performansi cok yoruyorlar, fakat illa ki kullanmak isterseniz: -->

| Sutun1      | Sutun 2 |     Sutun 3 |
| :---------- | :-----: | ----------: |
| Sola dayali | Ortali  | Saga dayali |
| test        |  test   |        test |

<!-- ayrica, bunun aynisi -->

| Sutun 1               | Sutun 2 | Sutun 3 |
| :-------------------- | :-----: | ------: |
| cok cirkin goozukuyor |  degil  |     mi? |

<!-- Bitis! -->
````
