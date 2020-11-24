
<!-- README.md is generated from README.Rmd. Please edit that file -->

# srt <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/srt)](https://CRAN.R-project.org/package=srt)
[![Codecov test
coverage](https://codecov.io/gh/kiernann/srt/branch/master/graph/badge.svg)](https://codecov.io/gh/kiernann/srt?branch=master)
[![R build
status](https://github.com/kiernann/srt/workflows/R-CMD-check/badge.svg)](https://github.com/kiernann/srt/actions)
<!-- badges: end -->

The goal of srt is to read
[SubRip](https://en.wikipedia.org/wiki/SubRip) text files as tabular
data for easy analysis and manipulation.

## Installation

You can install the development version of srt from
[GitHub](https://github.com/kiernann/srt) with:

``` r
# install.packages("remotes")
remotes::install_github("kiernann/srt")
```

## Example

The `.srt` standard is used to identify the subtitle components for the
columns of a data frame:

1.  A numeric counter identifying each sequential subtitle
2.  The time that the subtitle should appear followed by `-->` and the
    time it should disappear
3.  Subtitle text itself on one or more lines
4.  A blank line containing no text, indicating the end of this subtitle

<!-- end list -->

``` r
library(srt)
library(tidyverse)
library(tidytext)
srt <- srt_example("toy-story.en.srt")
```

    #> 1
    #> 00:00:58,559 --> 00:01:01,602
    #> BOY: All right, everyone!
    #> This... is a stick-up!
    #> 
    #> 2
    #> 00:01:01,687 --> 00:01:03,354
    #> Don't anybody move!
    #> 
    #> 3
    #> 00:01:04,398 --> 00:01:06,482
    #> Now, empty that safe!

These subtitle files are parsed as data frames with separate columns.

``` r
(toy_story <- read_srt(path = srt, collapse = " "))
#> # A tibble: 1,398 x 4
#>        n start   end subtitle                                        
#>    <int> <dbl> <dbl> <chr>                                           
#>  1     1  58.6  61.6 BOY: All right, everyone! This... is a stick-up!
#>  2     2  61.7  63.4 Don't anybody move!                             
#>  3     3  64.4  66.5 Now, empty that safe!                           
#>  4     4  68.3  71.6 Ooh-hoo-hoo! Money, money, money! (KISSING)     
#>  5     5  71.7  74.0 Stop it! Stop it, you mean, old potato!         
#>  6     6  74.1  77.2 Quiet, Bo Peep, or your sheep get run over!     
#>  7     7  77.3  79.3 Help! Baa! Help us!                             
#>  8     8  79.4  83.0 Oh, no, not my sheep! Somebody do something!    
#>  9     9  89.3  92.4 VOICE BOX: Reach for the sky!                   
#> 10    10  92.5  94.7 Oh, no! Sheriff Woody!                          
#> # … with 1,388 more rows
```

This makes it easy to perform various text analysis on the subtitles.

``` r
toy_story %>% 
  unnest_tokens(word, subtitle) %>% 
  count(word, sort = TRUE) %>% 
  anti_join(stop_words)
#> # A tibble: 1,314 x 2
#>    word      n
#>    <chr> <int>
#>  1 buzz    122
#>  2 woody    72
#>  3 hey      63
#>  4 whoa     37
#>  5 andy     35
#>  6 ha       35
#>  7 mom      35
#>  8 gasps    31
#>  9 sid      30
#> 10 toy      30
#> # … with 1,304 more rows
```

Or uniformly manipulate the *numeric* time stamps:

``` r
toy_story <- srt_shift(toy_story, seconds = 9.99)
```

The subtitle data frames can be easily re-written as valid SubRip files.

``` r
tmp <- tempfile(fileext = ".srt")
write_srt(toy_story, tmp, wrap = FALSE)
```

    #> 1
    #> 00:01:08,549 --> 00:01:11,592
    #> BOY: All right, everyone! This... is a stick-up!
    #> 
    #> 2
    #> 00:01:11,677 --> 00:01:13,344
    #> Don't anybody move!
    #> 
    #> 3
    #> 00:01:14,388 --> 00:01:16,472
    #> Now, empty that safe!

<!-- refs: start -->

<!-- refs: end -->
