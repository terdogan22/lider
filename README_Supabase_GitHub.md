# Apartman Yonetim Sistemi - Supabase Kurulumu

## 1. Supabase projesi

1. Supabase'de yeni bir proje olustur.
2. SQL Editor'u ac.
3. `supabase_kurulum.sql` dosyasindaki sorgulari calistir.

## 2. Auth ayari

1. `Authentication > Providers > Email` bolumunu acik birak.
2. Ilk kullanim icin istersen e-posta dogrulamasini kapatabilir, istersen acik birakabilirsin.
3. E-posta dogrulamasi acik kalacaksa GitHub Pages adresini `URL Configuration` altina ekle.

## 3. Baglanti bilgisi

1. `Project Settings > API` ekranindan `Project URL` ve `anon public` anahtarini al.
2. `supabase-config.js` dosyasini doldur:

```js
window.SUPABASE_CONFIG = {
    url: 'https://PROJE_URL.supabase.co',
    anonKey: 'SUPABASE_ANON_KEY'
};
```

## 4. GitHub'a yukleme

1. Bu klasoru bir GitHub reposuna yukle.
2. `Apartman_Yönetim_Sistemi.html` dosyasini repo kokunde tut.
3. GitHub Pages'i repo icin ac.
4. Ana dosya olarak `Apartman_Yönetim_Sistemi.html` kullan.

## 5. Ilk giris

1. Sayfayi ac.
2. E-posta ve sifre gir.
3. Hesap yoksa `Hesap Olustur` butonunu kullan.
4. E-posta dogrulamasi aciksa e-postayi onaylayip tekrar giris yap.

## Notlar

- Veriler artik yerelde tek kaynak olarak tutulmaz; ana kaynak Supabase tablosudur.
- LocalStorage sadece tarayici onbellek ve gecici calisma katmani gibi davranir.
- Manuel `Yedekle` ve `Yukle` butonlari korunmustur.
