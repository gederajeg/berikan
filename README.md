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

``` r
devtools::session_info()
#> ─ Session info ───────────────────────────────────────────────────────────────
#>  setting  value
#>  version  R version 4.1.3 (2022-03-10)
#>  os       macOS Monterey 12.4
#>  system   aarch64, darwin20
#>  ui       X11
#>  language (EN)
#>  collate  en_US.UTF-8
#>  ctype    en_US.UTF-8
#>  tz       Asia/Makassar
#>  date     2022-07-26
#>  pandoc   2.17.1.1 @ /Applications/RStudio.app/Contents/MacOS/quarto/bin/ (via rmarkdown)
#> 
#> ─ Packages ───────────────────────────────────────────────────────────────────
#>  package     * version date (UTC) lib source
#>  brio          1.1.3   2021-11-30 [1] CRAN (R 4.1.1)
#>  cachem        1.0.6   2021-08-19 [1] CRAN (R 4.1.1)
#>  callr         3.7.0   2021-04-20 [1] CRAN (R 4.1.0)
#>  cli           3.2.0   2022-02-14 [1] CRAN (R 4.1.1)
#>  crayon        1.5.0   2022-02-14 [1] CRAN (R 4.1.1)
#>  desc          1.4.1   2022-03-06 [1] CRAN (R 4.1.1)
#>  devtools      2.4.3   2021-11-30 [1] CRAN (R 4.1.1)
#>  digest        0.6.29  2021-12-01 [1] CRAN (R 4.1.1)
#>  ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.1.0)
#>  evaluate      0.15    2022-02-18 [1] CRAN (R 4.1.1)
#>  fastmap       1.1.0   2021-01-25 [1] CRAN (R 4.1.0)
#>  fs            1.5.2   2021-12-08 [1] CRAN (R 4.1.1)
#>  glue          1.6.2   2022-02-24 [1] CRAN (R 4.1.1)
#>  htmltools     0.5.2   2021-08-25 [1] CRAN (R 4.1.1)
#>  knitr         1.37    2021-12-16 [1] CRAN (R 4.1.1)
#>  lifecycle     1.0.1   2021-09-24 [1] CRAN (R 4.1.1)
#>  magrittr      2.0.2   2022-01-26 [1] CRAN (R 4.1.1)
#>  memoise       2.0.1   2021-11-26 [1] CRAN (R 4.1.1)
#>  pkgbuild      1.3.1   2021-12-20 [1] CRAN (R 4.1.1)
#>  pkgload       1.2.4   2021-11-30 [1] CRAN (R 4.1.1)
#>  prettyunits   1.1.1   2020-01-24 [1] CRAN (R 4.1.0)
#>  processx      3.5.2   2021-04-30 [1] CRAN (R 4.1.0)
#>  ps            1.6.0   2021-02-28 [1] CRAN (R 4.1.0)
#>  purrr         0.3.4   2020-04-17 [1] CRAN (R 4.1.0)
#>  R6            2.5.1   2021-08-19 [1] CRAN (R 4.1.1)
#>  remotes       2.4.2   2021-11-30 [1] CRAN (R 4.1.1)
#>  rlang         1.0.2   2022-03-04 [1] CRAN (R 4.1.1)
#>  rmarkdown     2.13    2022-03-10 [1] CRAN (R 4.1.1)
#>  rprojroot     2.0.2   2020-11-15 [1] CRAN (R 4.1.0)
#>  rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.1.0)
#>  sessioninfo   1.2.2   2021-12-06 [1] CRAN (R 4.1.1)
#>  stringi       1.7.6   2021-11-29 [1] CRAN (R 4.1.1)
#>  stringr       1.4.0   2019-02-10 [1] CRAN (R 4.1.1)
#>  testthat      3.1.3   2022-03-29 [1] CRAN (R 4.1.1)
#>  usethis       2.1.5   2021-12-09 [1] CRAN (R 4.1.1)
#>  withr         2.5.0   2022-03-03 [1] CRAN (R 4.1.1)
#>  xfun          0.30    2022-03-02 [1] CRAN (R 4.1.1)
#>  yaml          2.3.5   2022-02-21 [1] CRAN (R 4.1.1)
#> 
#>  [1] /Library/Frameworks/R.framework/Versions/4.1-arm64/Resources/library
#> 
#> ──────────────────────────────────────────────────────────────────────────────
```
