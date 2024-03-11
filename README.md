
<!-- README.md is generated from README.Rmd. Please edit that file -->

# srt <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![CRAN
status](https://www.r-pkg.org/badges/version/srt)](https://CRAN.R-project.org/package=srt)
![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/srt)
[![Codecov test
coverage](https://codecov.io/gh/k5cents/srt/graph/badge.svg?token=CMz6DIxJdH)](https://app.codecov.io/gh/k5cents/srt?branch=master)
[![R build
status](https://github.com/k5cents/srt/workflows/R-CMD-check/badge.svg)](https://github.com/k5cents/srt/actions)
<!-- badges: end -->

The goal of srt is to read
[SubRip](https://en.wikipedia.org/wiki/SubRip) text files as tabular
data for easy analysis and manipulation.

## Installation

You can install the development version of srt from
[GitHub](https://github.com/k5cents/srt) with:

``` r
# install.packages("remotes")
remotes::install_github("k5cents/srt")
```

## Example

The `.srt` standard is used to identify the subtitle components for the
columns of a data frame:

1.  A numeric counter identifying each sequential subtitle
2.  The time that the subtitle should appear followed by `-->` and the
    time it should disappear
3.  Subtitle text itself on one or more lines
4.  A blank line containing no text, indicating the end of this subtitle

``` r
library(srt)
library(tidyverse)
library(tidytext)
srt <- srt_example()
```

    #> 1
    #> 00:01:25,210 --> 00:01:28,004
    #> I owe everything to George Bailey.
    #> 
    #> 2
    #> 00:01:28,422 --> 00:01:30,298
    #> Help him, dear Father.
    #> 
    #> 3
    #> 00:01:30,674 --> 00:01:33,718
    #> Joseph, Jesus and Mary,

These subtitle files are parsed as data frames with separate columns.

``` r
(wonderful_life <- read_srt(path = srt, collapse = " "))
#> # A tibble: 2,268 × 4
#>        n start   end subtitle                           
#>    <int> <dbl> <dbl> <chr>                              
#>  1     1  85.2  88.0 I owe everything to George Bailey. 
#>  2     2  88.4  90.3 Help him, dear Father.             
#>  3     3  90.7  93.7 Joseph, Jesus and Mary,            
#>  4     4  93.8  96.4 help my friend Mr. Bailey.         
#>  5     5  96.9  99.5 Help my son George tonight.        
#>  6     6 100.  102.  He never thinks about himself, God.
#>  7     7 102.  104.  That's why he's in trouble.        
#>  8     8 104.  105.  George is a good guy.              
#>  9     9 106.  108.  Give him a break, God.             
#> 10    10 108.  110.  I love him, dear Lord.             
#> # ℹ 2,258 more rows
```

This makes it easy to perform various text analysis on the subtitles.

``` r
wonderful_life %>% 
  unnest_tokens(word, subtitle) %>% 
  count(word, sort = TRUE) %>% 
  anti_join(stop_words)
#> # A tibble: 1,651 × 2
#>    word       n
#>    <chr>  <int>
#>  1 george   216
#>  2 mary      85
#>  3 bailey    74
#>  4 hey       56
#>  5 harry     53
#>  6 yeah      50
#>  7 gonna     45
#>  8 potter    45
#>  9 home      34
#> 10 money     34
#> # ℹ 1,641 more rows
```

Or uniformly manipulate the *numeric* time stamps:

``` r
wonderful_life <- srt_shift(wonderful_life, seconds = 9.99)
```

The subtitle data frames can be easily re-written as valid SubRip files.

``` r
tmp <- tempfile(fileext = ".srt")
write_srt(wonderful_life, tmp, wrap = FALSE)
```

    #> 1
    #> 00:01:35,200 --> 00:01:37,994
    #> I owe everything to George Bailey.
    #> 
    #> 2
    #> 00:01:38,412 --> 00:01:40,288
    #> Help him, dear Father.
    #> 
    #> 3
    #> 00:01:40,664 --> 00:01:43,708
    #> Joseph, Jesus and Mary,

<!-- refs: start -->
<!-- refs: end -->
