# Linux İşletim Sisteminde Sıkıştırma Komutları

## TAR

The tar is the most widely used command to create compressed archive files and that can be moved easily from one disk to another disk or machine to machine.The highly compressed archive file commonly called tarball or tar, gzip and bzip in Linux.

### 1. Linux'ta tar Arşiv Dosyası Oluşturma

`tar -cvf dosyam.tar /home/osman/Desktop/1` komutu osman adlı kullanıcının masaüstünde bulunan "1" klasörünü sıkıştırır ve "dosyam.tar" olarak bulunduğumuz dizine kaydeder.

- c – Creates a new .tar archive file.
- v – Verbosely show the .tar file progress.
- f – File name type of the archive file.

### 2. Linux'ta tar.gz Arşiv Dosyası Oluşturma

- Sıkıştırılmış bir gzip arşiv dosyası oluşturmak için z seçeneğini kullanırız.

`tar cvzf dosyam.tar.gz /home/osman/Desktop/1` <br>
`tar cvzf dosyam.tar.tgz /home/osman/Desktop/1` komutu ile sıkıştırılmış gzip arşiv dosyası oluşturulabilir.

### 3. Linux'ta tar.bz2 Arşiv Dosyası Oluşturma

- bz2 gzip boyutundan daha küçük bir arşiv dosyası sıkıştırır ve oluşturur. bz2 sıkıştırması, dosyaları sıkıştırmak ve açmak için gzip'ten daha fazla zaman alır. Yüksek oranda sıkıştırılmış bir tar dosyası oluşturmak için j seçeneğini kullanılır.

`tar cvfj dosyam.bz2 /home/osman/Desktop/1` <br>
`tar cvfj dosyam.tbz /home/osman/Desktop/1` <br>
`tar cvfj dosyam.tb2 /home/osman/Desktop/1` komutu ile sıkıştırılmış bz2 arşiv dosyası oluşturulabilir.

### 4. Linux'ta tar Arşiv Dosyası Çıkarma

- Bir tar dosyasını açmak veya çıkarmak için, x (çıkarma) seçeneğini kullanarak aşağıdaki komutu vermeniz yeterlidir. Farklı bir dizinde açmak istiyorsanız, -C (belirtilen dizin) seçeneğini kullanın.

`tar -xvf dosyam.tar` <br>
`tar -xvf dosyam.tar -C /home/osman/Desktop/`

### 5. Linux'ta tar.gz Arşiv Dosyası Çıkarma

`tar -xvf dosyam.tar.gz`

### 6. Linux'ta tar.bz2 Arşiv Dosyası Çıkarma

`tar -xvf dosyam.tar.bz2`

### 7. Linux'ta tar Arşiv Dosyasının İçeriğini Listeleme

- Tar arşiv dosyasının içeriğini listelemek için, aşağıdaki komutu t seçeneğiyle (içeriği listele) çalıştırmanız yeterlidir.

`tar -tvf dosyam.tar`

### 8. Linux'ta tar.gz Arşiv Dosyasının İçeriğini Listeleme

`tar -tvf dosyam.tar.gz`

### 9. Linux'ta tar.bz2 Arşiv Dosyasının İçeriğini Listeleme

`tar -tvf dosyam.tar.bz2`

### 10. Linux'ta tar Dosyasından Tek Dosyayı Çıkarma

`tar -xvf dosyam.tar index.php` <br>
`tar --extract --file=dosyam.tar index.php`

### 11. Linux'ta tar.gz Dosyasından Tek Dosyayı Çıkarma

`tar -zxvf dosyam.tar.gz index.php` <br>
`tar --extract --file=dosyam.tar.gz index.php`

### 12. Linux'ta tar.bz2 Dosyasından Tek Dosyayı Çıkarma

`tar -jxvf dosyam.tar.bz2 home/osman/Desktop/1/sitelerim/html/index.php` <br>
`tar --extract --file=dosyam.tar.bz2 /home/osman/Desktop/1/sitelerim/html/index.php`

### 13. Linux'ta tar, tar.gz, tar.bz2 Dosyasından Çoklu Dosya Çıkarma

- Bir tar, tar.gz, tar.bz2 dosyasından çoklu dosya açmak veya çıkarmak için aşağıdaki komutlar kullanılır. Her bir komutun sonucunda "file1" ve "file2" dosyaları arşivden çıkartılmış olur.

`tar -xvf dosyam.tar "file1" "file2"` <br>
`tar -zxvf dosyam.tar.gz "file1" "file2"` <br>
`tar -jxvf dosyam.tar.bz2 "file1" "file2"`

### 14. Linux'ta Wildcard Kullanarak Dosya Gruplarını Çıkarma

- .php ile başlayan dosyaları çıkarmak için aşağıdaki komutlar kullanılır.

`tar -xvf dosyam.tar --wildcards '*.php'` <br>
`tar -zxvf dosyam.tar.gz --wildcards '*.php'` <br>
`tar -jxvf dosyam.tar.bz2 --wildcards '*.php'`

### 15. Linux'ta tar Arşiv Dosyasına Dosya ya da Dizin Ekleme

- Mevcut tar arşiv dosyalarına dosya veya dizin eklemek için r (ekle) seçeneğini kullanıyoruz.

`tar -rvf dosyam.tar xyz.txt` <br>
`tar -rvf dosyam.tar php`

### 16. Linux'ta tar.gz and tar.bz2 Arşiv Dosyasına Dosya ya da Dizin Ekleme

- tar komutunun mevcut sıkıştırılmış tar.gz ve tar.bz2 arşiv dosyasına dosya veya dizin ekleme seçeneği yoktur. Eğer denersek aşağıdaki hatayı alırız.

`tar -rvf dosyam.tar.gz xyz.txt` <br>
`tar -rvf dosyam.tar.bz2 xyz.txt`

```
> tar: This does not look like a tar archive
> tar: Skipping to next header
> xyz.txt
> tar: Error exit delayed from previous errors
```

### 17. Linux'ta tar, tar.gz ve tar.bz2 Arşiv Dosyası Nasıl Doğrulanır

- Herhangi bir tar veya sıkıştırılmış arşivlenmiş dosyayı doğrulamak için W (doğrula) seçeneğini kullanırız.

`tar tvfW dosyam.tar`

### 18. Linux'ta tar, tar.gz ve tar.bz2 Arşiv Dosya Boyutunu Kontrol Etme

`tar -czf - dosyam.tar | wc -c` <br>
`tar -czf - dosyam.tar.gz | wc -c` <br>
`tar -czf - dosyam.tar.bz2 | wc -c`

#### Tar Kullanım Seçenekleri

- c – create an archive file.
- x – extract an archive file.
- v – show the progress of the archive file.
- f – filename of the archive file.
- t – viewing the content of the archive file.
- j – filter archive through bzip2.
- z – filter archive through gzip.
- r – append or update files or directories to the existing archive files.
- W – Verify an archive file.
- wildcards – Specify patterns in UNIX tar command.

**Ref:** https://www.tecmint.com/18-tar-command-examples-in-linux/

## GZIP

- gzip komutu dosyaları sıkıştırır. Bir dosya argüman olarak verilirse, gzip dosyayı sıkıştırır, bir “.gz” son eki ekler ve orijinal dosyayı siler. Argüman olmadan, gzip standart girdiyi sıkıştırır ve sıkıştırılmış dosyayı standart çıktıya yazar.

`gzip [Seçenek] [Dosyaadı]` <br>
`gzip dosyam.txt` komutu dosyam.txt.gz adında sıkıştırılmış bir dosyam.txt dosyası oluşturacak ve orijinal dosyayı silecektir.

### `-f` parametresi :

- Bazen bir dosya sıkıştırılamaz. Belki de “dosyam” adında bir dosyayı sıkıştırmaya çalışıyorsunuz ama zaten “dosyam1.gz” adında bir dosya var. Bu durumda, "gzip" komutu normalde çalışmayacaktır. "gzip" komutunu işini yapmaya zorlamak için -f seçeneğini kullanmanız yeterlidir.

`gzip -f dosyam.txt` komutu dosyam.txt.gz adlı bir dosya zaten mevcut olsa bile dosyam.txt adlı bir dosyayı zorla sıkıştıracaktır.

### `-k` parametresi :

- Varsayılan olarak “gzip” komutunu kullanarak bir dosyayı sıkıştırdığınızda, “.gz” uzantılı yeni bir dosya ile karşılaşırsınız. Dosyayı sıkıştırmak ve orijinal dosyayı saklamak istiyorsanız -k ile gzip komutunu çalıştırmanız gerekir.

`gzip -k dosyam.txt` komutu "dosyam.txt.gz" ve "dosyam.txt" adlı dosyalarla sonuçlanacaktır.

### `-L` parametresi :

- Bu seçenek gzip lisansını görüntüler.

`gzip -L dosyam.gz`

```
> Apple gzip 264.50.1 (based on FreeBSD gzip 20111009)
> Copyright (c) 1997, 1998, 2003, 2004, 2006 Matthew R. Green
> All rights reserved.
```

### `-r` parametresi :

- Bu seçenek, bir klasördeki ve alt klasörlerindeki her dosyayı sıkıştırabilir. Bu seçenek, klasöradı.gz adında bir dosya oluşturmaz. Bunun yerine, dizin yapısını geçer ve o klasör yapısındaki her dosyayı sıkıştırır.

`gzip -r dosyam` komutu dosyam klasöründe bulunan tüm dosyaları sıkıştırır.

### `-[1-9]` parametresi :

- Sıkıştırma düzeyini değiştirmeye izin verir. Bir dosya farklı şekillerde sıkıştırılabilir. Örneğin, daha hızlı çalışacak daha küçük bir sıkıştırmayı seçebilir veya daha uzun sürmesi karşılığında maksimum sıkıştırmayı seçebilirsiniz. Hız ve sıkıştırma seviyesi, 1 ile 9 arasındaki sayıları kullanarak seviyelere göre değişebilir.

`gzip -1 dosyam.txt` komutu minimum hızda maksimum sıkıştırmayı sağlar. <br>
`gzip -9 dosyam.txt` komutu maksimum hızda minimum sıkıştırmayı sağlar.

### `-v` parametresi :

- Bu seçenek, sıkıştırılmış veya açılmış her dosyanın adını ve yüzde sıkıştırılmasını görüntüler.

`gzip -v dosyam.txt`

```
>yeni.txt:       18.2% -- replaced with yeni.txt.gz
```

### `-d` parametresi :

- Bu seçenek, "gzip" komutunu kullanarak bir dosyanın açılmasını sağlar.

`gzip -d dosyam.txt.gz` komutu dosyam.txt.gz adlı sıkıştırılmış dosyayı açar.

**Ref:** https://www.geeksforgeeks.org/gzip-command-linux/?ref=lbp

## ZIP/UNZIP

- İki sunucu arasında sınırlı bir bant genişliğiniz varsa ve dosyaları daha hızlı aktarmak istiyorsanız, dosyaları sıkıştırın ve aktarın.
- Zip programı, bir veya daha fazla sıkıştırılmış dosyayı, dosyalar hakkındaki bilgilerle birlikte (ad, yol, tarih, son değişiklik zamanı, koruma ve dosya bütünlüğünü doğrulamak için kontrol bilgileri) tek bir zip arşivine koyar. Tüm bir dizin yapısı, tek bir komutla bir zip arşivine paketlenebilir.
- Metin dosyaları için 2:1 ila 3:1 sıkıştırma oranları yaygındır. zip'in bir sıkıştırma yöntemi (deflation) vardır ve dosyaları sıkıştırma olmadan da saklayabilir. Zip, sıkıştırılacak her dosya için ikisinden daha iyisini otomatik olarak seçer.
- Program, dağıtım için bir dizi dosyayı paketlemek, dosyaları arşivlemek, ve kullanılmayan dosyaları veya dizinleri geçici olarak sıkıştırarak disk alanından tasarruf etmek için kullanışlıdır.

`zip [seçenekler] [dosyaadı]` <br>
`zip dosyam.zip dosyam.txt` komutu dosyam.zip adında sıkıştırılmış bir dosyam.txt dosyası oluşturacaktır. <br>
`unzip dosyam.zip` komutu dosyam.zip adındaki arşivi çıkaracaktır.

### `-d` parametresi :

- Dosyayı zip arşivinden kaldırır. Bir zip dosyası oluşturduktan sonra, -d seçeneğini kullanarak bir dosyayı arşivden kaldırabilirsiniz.

`zip -d [arşivadı] [dosyaadı]` <br>
`zip -d dosyam.zip dosyam.txt` komutu dosyam.zip adındaki arşivden dosyam.txt dosyasını silecektir.

### `-u` parametresi :

- Zip arşivindeki dosyayı günceller. Bu seçenek, belirtilen dosya listesini güncellemek veya mevcut zip dosyasına yeni dosyalar eklemek için kullanılabilir. Zip arşivindeki mevcut bir girişi, yalnızca halihazırda zip arşivinde bulunan sürümden daha yakın zamanda değiştirilmişse güncelleyin.

`zip -u [arşivadı] [dosyaadı]` <br>
`zip -u dosyam.zip dosyam2.txt` komutu dosyam.zip adındaki arşive dosyam2.txt dosyasını ekler.

### `-m` parametresi :

- Sıkıştırdıktan sonra orijinal dosyaları siler. Belirtilen dosyaları zip arşivine taşıyın, bu, belirtilen zip arşivini yaptıktan sonra hedef dizinleri/dosyaları siler. Dosyalar kaldırıldıktan sonra bir dizin boşalırsa, dizin de kaldırılır. Zip, arşivi hatasız olarak oluşturana kadar hiçbir silme işlemi yapılmaz. Bu, disk alanını korumak için kullanışlıdır, ancak tüm girdi dosyalarının kaldırılması potansiyel olarak tehlikelidir.

`zip -m [arşivadı] [dosyaadı]` <br>
`zip -m dosyam.zip dosyam.txt` komutu dosyam.zip adında sıkıştırılmış bir dosyam.txt dosyası oluşturacak ve orijinal dosyaları silecektir.

### `-r` parametresi :

- Bir dizini yinelemeli olarak sıkıştırmak için, zip komutuyla -r seçeneğini kullanın; bu, dosyaları bir dizinde yinelemeli olarak sıkıştıracaktır. Bu seçenek, belirtilen dizinde bulunan tüm dosyaları sıkıştırmanıza yardımcı olur.

`zip -r [arşivadı] [dizinadı]` <br>
`zip -r dosyam.zip dosyam` komutu dosyam klasöründeki tüm dosyaları dosyam.zip adı ile sıkıştırır.

### `-x` parametresi :

- Zip'i oluştururken dosyaları hariç tutun. Geçerli dizindeki tüm dosyaları sıkıştırdığınızı ve bazı istenmeyen dosyaları dışlamak istediğinizi varsayalım. Bu istenmeyen dosyaları -x seçeneğini kullanarak yapabilirsiniz.

`zip -x [arşivadı] [dosyaadı]` <br>
`zip -x dosyam.zip dosyam.txt` komutu dosyam.zip adındaki arşivi oluştururken dosyam.txt dosyasını dışarıda tutacaktır.

### `-v` parametresi :

- Ayrıntılı mod veya tanılama sürümü bilgisi yazdırın. Normalde, gerçek işlemlere uygulandığında bu seçenek, sıkıştırma sırasında bir ilerleme göstergesinin görüntülenmesini sağlar ve zip dosyası yapısı tuhaflıkları hakkında ayrıntılı tanılama bilgisi ister.
- -v tek komut satırı argümanı olduğunda ve stdin veya stdout bir dosyaya yeniden yönlendirilmediğinde, bir tanılama ekranı yazdırılır. Program adı, sürümü ve yayın tarihini içeren yardım ekranı başlığına ek olarak, Info-ZIP ana sayfası ve dağıtım sitelerine yönelik bazı işaretçiler verilmiştir.

`zip -v [arşivadı] [dosyaadı]` <br>
`zip -v dosyam.zip dosyam.txt` komutu dosyam.zip adındaki arşive dosyam.txt dosyasını eklerken ilerleme durumunu gösterecektir.

```
> adding: dosyam.txt    (in=0) (out=0) (stored 0%)
> total bytes=0, compressed=0 -> 0% savings
```

**Ref:** https://www.geeksforgeeks.org/zip-command-in-linux-with-examples/?ref=lbp

### Gzip ve zip Komutu Arasındaki Fark ve Hangi Komutun Ne Zaman Kullanılacağı

- Genel olarak, GZIP, sıkıştırma açısından, özellikle çok sayıda dosyayı sıkıştırırken, ZIP'e kıyasla çok daha iyidir.
- GZIP, sıkıştırmadan önce tüm dosyaları tek bir tarball'da arşivler. ZIP dosyalarında, tek tek dosyalar sıkıştırılır ve ardından arşive eklenir.
- Bir ZIP'den tek bir dosya çekmek istediğinizde, dosya basitçe ayıklanır, ardından sıkıştırılır. GZIP ile, istediğiniz dosyayı arşivden çıkarabilmeniz için önce tüm dosyanın sıkıştırılması gerekir. 10 GB'lık bir arşivden 1 MB'lık bir dosya çekme işleminin, GZIP'de ZIP'den çok daha uzun süreceği oldukça açıktır.
- GZIP'in çalışma biçimindeki dezavantajı, aynı zamanda GZIP'in avantajıdır. GZIP'deki sıkıştırma algoritması, birden fazla küçük dosya yerine büyük bir dosyayı sıkıştırdığından, dosya boyutunu daha da azaltmak için dosyalardaki fazlalıktan faydalanabilir.
- 10 özdeş dosyayı ZIP ve GZIP ile arşivler ve sıkıştırırsanız, ZIP dosyası elde edilen GZIP dosyasından 10 kat daha büyük olur.

## RAR/UNRAR

### 1. Linux'ta Unrar Nasıl Kurulur

- Debian ve Ubuntu tabanlı dağıtımlarda, gösterildiği gibi apt-get veya apt programını kullanarak unrar paketini kolayca kurabilirsiniz.

`sudo apt-get install unrar` ya da <br>
`sudo apt install unrar`

### 2. Linux'ta RAR Dosyası Nasıl Açılır/Çıkarılır

- Mevcut çalışma dizininde bir RAR dosyasını açmak/çıkarmak için, unrar e seçeneği ile aşağıdaki komutu kullanmanız yeterlidir.

`unrar e dosyam.rar`

- Belirli bir yol veya hedef dizindeki bir RAR dosyasını açmak/ayıklamak için, unrar e seçeneğini hedef dizin ile birlikte kullanın, belirtilen hedef dizindeki tüm dosyaları çıkaracaktır.

`unrar e dosyam.rar /home/`

- Orijinal dizin yapısıyla bir RAR dosyasını açmak/çıkarmak için. unrar x seçeneğiyle aşağıdaki komutu vermeniz yeterlidir. Klasör yapılarına göre ayıklayacaktır.

`unrar x dosyam.rar `

### 3. Linux'ta RAR Dosyası Nasıl Listelenir

- Bir arşiv dosyasındaki dosyaları listelemek için unrar l seçeneğini kullanın. Boyutları, tarihi, saati ve izinleriyle birlikte dosyaların listesini görüntüler.

`unrar l dosyam.rar`

### 4. Linux'ta RAR Dosyası Nasıl Test Edilir

- Bir arşiv dosyasının bütünlüğünü test etmek için unrar t seçeneğini kullanın. Aşağıdaki komut, her dosya için tam bir bütünlük kontrolü yapacak ve dosyanın durumunu görüntüleyecektir.

`unrar t dosyam.rar`

- unrar komutu, yalnızca arşiv dosyalarını ayıklamak, listelemek veya test etmek için kullanılır. Linux altında RAR dosyaları oluşturma seçeneği yoktur. Yani, burada arşiv dosyaları oluşturmak için RAR komut satırı yardımcı programını kurmamız gerekiyor.

### 5. Linux'ta Rar Nasıl Kurulur

- Linux'ta RAR komut seçeneğini kurmak için aşağıdaki komutu çalıştırmanız yeterlidir.

`sudo apt-get install rar`

### 6. Linux'ta Rar Dosyası Nasıl Oluşturulur

- Linux'ta bir arşiv(RAR) dosyası oluşturmak için aşağıdaki komutu rar a seçeneği ile çalıştırın. Bir dosyam dizini için arşiv dosyası oluşturacaktır.

`rar a dosyam.rar dosyam`

### 7. Arşivden Dosyalar Nasıl Silinir

`rar d dosyam.rar`

### 8. Arşivler Nasıl Kurtarılır

- Bir arşiv dosyasını veya dosyalarını kurtarmak veya düzeltmek için komutu rar r seçeneğiyle çalıştırın.

`rar r filename.rar`

### 9. Arşivler Nasıl Güncellenir

- Mevcut arşiv dosyasına dosya eklemek veya güncellemek için aşağıdaki komutu rar u seçeneğiyle kullanın.

`rar u dosyam.rar dosyam.sql`

- Şimdi dosyam.sql dosyasının arşiv dosyasına eklendiğini doğrulayın.

`rar l dosyam.rar`

### 10. Arşivlere Şifre Nasıl Belirlenir

- Bu Rar aracından çok ilginç bir özellik, arşiv dosyasına bir şifre belirlememize izin veriyor. Arşiv dosyasını parola ile korumak için rar a -p seçeneğini kullanın.

`rar a -p dosyam.rar`

### 11. Arşivler Nasıl Kilitlenir

- Rar aracından bir başka ilginç kilitleme özelliği, belirli bir arşiv dosyasının çıkarılmasını engelleme seçeneği sunar.

`rar k dosyam.rar`

### Conclusion

- Daha fazla RAR ve Unrar seçeneği ve kullanımı için aşağıdaki komutu çalıştırın, açıklamalarıyla birlikte bir seçenekler listesi görüntüleyecektir.

`man unrar` <br>
`man rar`

**Ref:** https://www.tecmint.com/how-to-open-extract-and-create-rar-files-in-linux/
