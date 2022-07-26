Data dan kode pemrograman R untuk “Meninjau kembali pandangan klasik
terkait perilaku konstruksional *memberi* vs. *memberikan*: Suatu kajian
dari perspektif linguistik korpus kuantitatif dan Gramatika
Konstruksional”
================
[Gede Primahadi Wijaya
Rajeg](https://udayananetworking.unud.ac.id/lecturer/880-gede-primahadi-wijaya-rajeg)
<a itemprop="sameAs" content="https://orcid.org/0000-0002-2047-8621" href="https://orcid.org/0000-0002-2047-8621" target="orcid.widget" rel="noopener noreferrer" style="vertical-align:top;"><img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" style="width:1em;margin-right:.5em;" alt="ORCID iD icon"></a>

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />Material
pendukung dalam repositori ini berlisensi
<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative
Commons Attribution-NonCommercial 4.0 International License</a>.
<!-- badges: end -->

Repositori material pendukung untuk naskah berjudul “**Meninjau kembali
pandangan klasik terkait perilaku konstruksional *memberi*
vs. *memberikan*: Suatu kajian dari perspektif linguistik korpus
kuantitatif dan Gramatika Konstruksional**”. Makalah ini akan
diterbitkan sebagai salah satu bab dalam buku persembahan berjudul *Budi
Bahasa* (penyunting I Nengah Sudipa, Universitas Udayana).

Berikut ini adalah keterangan berkas dalam repositori ini:

-   berkas
    [`analysis-code.R`](https://github.com/gederajeg/berikan/blob/main/analysis-code.R)
    berisi kode pemrograman R untuk keseluruhan analisis
    kuantitatif/statistik dan visualisasi yang dilaporkan dalam makalah

    -   kode pemrograman untuk analisis mengandalkan fungsi-fungsi pada
        modul [tidyverse](https://www.tidyverse.org) dan
        [vcd](https://cran.r-project.org/web/packages/vcd/index.html)
        yang pembaca perlu instal di R sehingga kode dapat dijalankan
        dengan baik.

-   berkas
    [`df_beri.txt`](https://github.com/gederajeg/berikan/blob/main/data/df_beri.txt)
    yang terdapat di dalam direktori/folder `data` adalah data utama
    yang melandasi analisis (dan diproses pada berkas kode pemrograman
    [`analysis-code.R`](https://github.com/gederajeg/berikan/blob/main/analysis-code.R))

-   berkas sampel konkordansi awal (sebelum dianotasi) untuk *memberi*
    dan *memberikan* terdapat pada
    [`memberi.txt`](https://github.com/gederajeg/berikan/blob/main/memberi.txt)
    dan
    [`memberikan.txt`](https://github.com/gederajeg/berikan/blob/main/memberikan.txt).
    Berkas ini dihasilkan dengan kode yang terdapat pada
    [`memberi_memberikan_code.R`](https://github.com/gederajeg/berikan/blob/main/memberi_memberikan_code.R).

-   direktori
    [`figs`](https://github.com/gederajeg/berikan/tree/main/figs)
    menyimpan luaran visualisasi statistik yang dihasilkan melalui
    [`analysis-code.R`](https://github.com/gederajeg/berikan/blob/main/analysis-code.R)
    dan juga gambar jejaring konstruksional yang dilaporkan dalam
    makalah.
