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
Commons Attribution-NonCommercial 4.0 International License</a>.<br />
[![](https://img.shields.io/badge/doi-10.17605/OSF.IO/CE3MR-green.svg)](https://doi.org/10.17605/OSF.IO/CE3MR)
[![DOI](https://img.shields.io/badge/doi-10.6084/m9.figshare.20375955-blue.svg?style=flat&labelColor=gainsboro&logoWidth=40&logo=data%3Aimage%2Fpng%3Bbase64%2CiVBORw0KGgoAAAANSUhEUgAAAFAAAAAZCAYAAACmRqkJAAAKi0lEQVR4Ae3ZaVBUV97H8evuE0EfH32MmkcfoyAuGjXKgkvMaFRAFuiloemWvRuEXlgEBREXBYJiXAQUFeKocUniQiKogAJhQWwWENDEjLNYvjFLzUzNkplEZb5kTme6nCRjKlOpSZlb9SmL2%2Ffcuv3re87%2FnKP0TYfOcslqPMbt63xBKuh09MTxgi7HKT1Sj1TvKp%2BMkZB6%2FXT8c4AjUYPyVdfb7Qs6HTIJ8EHe7Ul%2B152CphDabRQ0uMr7%2FRQgh%2B8qU6%2FBiPDVGv0jq0uGE94b0ZZ3j%2B25MTetoMsh%2FWD91OBqT9%2Fsehd5EqGV17nKMzTqOHvaRMMLEp7qACfinq%2FW1BBx5ZxB13x5X3Jr1v%2Fz9pUcaHU63PiicjrhvXfNRbY1Th49Q6Y1vu6zyqSjzX3aVIgf4OkKToxhgxpd5OMzV0bYE4CRN1Chu34pnTfwnV03FiTlfzDRXBHo6dfgIq8sX6ByV6vjthGc0UdrrPPVGFQBxlSjzJQWENVUZkebceiLpyM8IZSx7O7Zl4JivUNMZX5h8Rt4%2B2L0llKfgu6JKa%2BXvpB5bZ48%2Ba3F6lil2pDkE2rODzCsU0VUnNFHNZQqdS3lx3Utl%2FMILQcfYt5TEeC1GSprgAq0XlgYGLQyxJTlr0uK0DVX7E5s2ZtOgHvLw5fLK9xVmcqguEj%2F2LXbwsvPBkZZKl4j5NcIKinaUsLbejFWZ7m8Do2cmwnb4cFqArRwx3TEYzi%2Bz7DTD0uhxnj8cAEWWUZK%2BTcdhh4pmTWUsW01Y1uCUmNY7Rtqzo5svJSS0poVXtg6yVj7sn9qunek3j8xPVXXeMFoaDkev6lDF7ene7Y5r2taNAXmEBXaP69zevaOjuUeeZ0zhzJuPsM5CdYvOhZVqBMhBqIVDt8zwGdQjR4of9AA%2BXJjUFpww7GodnHAQca4srDAWCXjW3pETal%2BbfumuOLKqSm17vIQtWr1Uu3JYy6JbXuXFbRN1R8pm5byxtG5CcdOz9EUVc7I5IeQEWQ7wWVwzwrsRn%2BbAFeiCxNsKv5Y9P03BFgjAlT90AGOQy2T47fObl00ocFZHl%2B2UGXw0RjzNUWHTPFthckHWh18al8KsGuaFigVVzlKuY%2BG9z37qvuoGlelpsJVldrgrFjbOE%2BeWe8uW18W84qCqc4s7tmCIgzI75hs%2FaJKNFu7rF%2BIIIhr%2BmIQ%2Btn8LQkDMQOeWAYnDHgsQI3NNU7W9j4h5t72o%2FEyvLEQ%2F%2Bu7ymzbOxbCAeOxAgtghz6YgOVYiufEOUlqu0M37ho%2BYn%2FnpJT8bsejVSt90uqdFdlGmV7hF7cuWXetNCShLX%2BI3nKhN%2ByvCs%2Bs6GQpWB33fzKNQR%2BqWr022yvc94q7spBCY%2Bbzkou6ZfJNPf89ZN%2FdidYHnIsKfIzjCMIc7MAwSJiMPFxGMcKQixGwx07R%2FiEe4CNsxFCbAJvwifj8LkIgYRHa8Lm47jNY8AokmMS5NryPh%2FijOB%2BOX4h7foEuyPHlisMtylJpzu1YspkQ36YbLqnx8F1X4abaqmYs9DGmLlrk4CE9XlHlKZskxfpt%2FUJLzyhV23dG%2BITF72fqo9njEaokwIu8lSbG1N4wx273CrP%2B%2BjniQVZhGrzQjlEioFIRcjDM6MIdjBVtHogvl4W9qIX8sTfwU5SgU%2FzdhdGYLcJ9BzvRID6vgx2SxN8PUI9KnIEWH4n7FuIo%2FoRfYV5vMMV4wHRFs%2BvG%2FKl05ZrDVdP11T7eulK3oNQcz%2FAXcj3DpMePjO44KetDL2lDh%2FmV1S3nNoeWnJb7RSXmMJl%2BI0GmH13rKs8lvEdQwfoWKmCxdmGbAEdgAW5jFiQhBb8WXSYTPSjGCBHaMPR5LMANkOCM%2B%2FgD3MS5Z8W1ElzwW3HNJCSI9tcw2ub%2BO8T5LPTBQBy1nusNcB7ztximI1sIsSSzXb04v3vyusJmx63nMufHXlV6LvpEShDd9x%2FHFYWXVPuSX7%2FD7zmpcjuWRupbyvaHnj8Z7BNsUFCArm70iTRcd5bFEN7oxwJs%2FpoA%2FwfBaLJ2Z2EFbmEsNKL7fYYPUI9DIqj%2Fsgkw0CasW%2BL6RbBDFI7gTZSKzz6Gk02AJ23G3QF4xybYU8INce6s5CJNlTyXhYwKv%2FRWMiEeimquzIhrPpGzuSNCsbvLec2%2Brpmh2e0yu%2FxOp96wv6p8X0xeIZW5Bo2%2F6ucdvb%2FdMWVDm8lX11pRpD16OJ6VyZsrQ8yK%2BVFJ9h4UhwEHDj5JgGE23UkSfoZujMMzSESNCPBT9KAFjqi2rcIYZRPgYmzDQ9xDLSz4%2FGsCPIE%2BNkWrTJy%2FhRrRthpVyJJExbnmG2I%2B6x%2BT%2FHxYyQkzQfJGlufpWy6bYlvPUEgu%2BHlHJA5boo7rE3blnBR7r6mv%2BvCBMYEag%2Faqsyr1%2BIk5a%2Fd2z9zGBDpZ31qulCWk9443Hfg5BuJJAgxAG0ZBEmS4DZ7RKIliMVi0d8UvRUCeuPoNAf4Z%2FmgV13pAwiwR3iffFKBQJM5noB%2F6Y5h45v7Wwf0cDtD1DlMIeiugWmZOy5Cv3RgjX7%2FF4GdMXasOjgurmqdafqpojltml9IjvOJ8NMu9lNL5gQmXdMu0BTefz8loMyoJvivs3VMZvhpjqaig%2FZ8gwJGYIsIKRh%2FY4wh%2Bg%2FGQoxYbREgZ%2BB3uww1V3xKgN%2BrwCNtF4Pvx8NveQCEYX%2BAukhCIYuHZLy%2FyDjHbJQfo7PTK1dEBWqPBX2vS%2B2hNW1XquDURypiwXStCjVWuyrSKQC%2FdoUaHtOT2HENoyal4b40x7rK7ylip9NIV3Jy0P6fD24fl3Ra6uoe3PNqOH2Pw3x%2FC8K8CHIU%2BIpQ7OI8yNOJ9TMJO%2FAU9Nn6PjRiGmm%2FpwgsRLQpKjwjuU%2Fz1CQK0R4G4T4%2FwCHWYKlmcA6xr4SA2EzobXeUa9vh21LgpdKxK8hqd5RsaXWS7S9YvlhU2O7ya3ekXrm%2B9lK3KzFH6a4y5V92Ve5hkM4d02EShMestZekE2IxZX7MWdkAgBtmsi9U2lXEwliAOK%2BGLTowThWIZkrEVSSKYgegPOUxwtFmdaBGLsRgg2qeKtosQDh2GYzbisUIEaPvcQ8T5VGzCKowBk2I3mTVALe4wd4tumKcoaZirSKte4RtVrvXwLrw%2BJXV%2F18Ts3BtLEmOaS0yRtRdMfpGJhTKNMbDJWR5V7eEbUNDtcIQAd1PJMwnuJl6E9KQHY7AAHkzQoBkj8B%2B%2FpTWQ4Maezne1P3x1esLBuqmB%2BbccNhJMGetbM%2BGZIi1V%2FoRyOXB77sKVWuPmrd4RBvYQm9ihVue%2F7xDPGljB50MoJmO%2By36gCGsQovCyCGwOarD9R7PLLXZOJjKZvse%2FDQQSvffG7F1rWrZPiLKUX2DPr1hbfHAKb0kDBSeTed5MQj94Pn1xBMvA%2B2IDYTAkcXzXANPRjHq04ACeFeH9aAIcBC3LOq%2FY5pPDeYtO4yRTmzUhbx9LozCEea8ybaHoxDNmVtPltxSVzxhCm3Asg4Tvs683Aa5wwkD8qP9XbgQqUbb6Tp09U5Os3rWiV4jZv2OuvxPdvht70RfST8fjATZd7P33OYzxZ%2FdF7FwcgqPU0yMR2vMYDulpDfBvw%2BGCdBePpq8AAAAASUVORK5CYII%3D)](http://dx.doi.org/10.6084/m9.figshare.20375955)
[![DOI](https://zenodo.org/badge/367784418.svg)](https://zenodo.org/badge/latestdoi/367784418)
<!-- badges: end -->

Repositori material pendukung untuk naskah berjudul “**Meninjau kembali
pandangan klasik terkait perilaku konstruksional *memberi*
vs. *memberikan*: Suatu kajian dari perspektif linguistik korpus
kuantitatif dan Gramatika Konstruksional**”. Makalah ini akan
diterbitkan sebagai salah satu bab dalam buku persembahan berjudul *Budi
Bahasa* (penyunting [I Nengah
Sudipa](https://udayananetworking.unud.ac.id/professor/1746-i-nengah-sudipa),
Universitas Udayana). Berikut adalah cara mengutip repositori ini jika
diadaptasi dan/atau digunakan untuk penelitian lanjutan:

> Rajeg, G. P. W. (2022, July 26). Data dan kode pemrograman R untuk
> “Meninjau kembali pandangan klasik terkait perilaku konstruksional
> *memberi* vs. *memberikan*: Suatu kajian dari perspektif linguistik
> korpus kuantitatif dan Gramatika Konstruksional.”
> <https://doi.org/10.17605/OSF.IO/CE3MR>

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
    dan juga gambar [jejaring
    konstruksional](https://github.com/gederajeg/berikan/blob/main/figs/network.pdf)
    yang dilaporkan dalam makalah.

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
#>  date     2022-07-27
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
