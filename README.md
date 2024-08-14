
<!-- README.md is generated from README.Rmd. Please edit that file -->

# envplyr

<!-- badges: start -->
<!-- badges: end -->

A personal learning project for manipulating tabular R environments
using the dplyr interface.

## Installation

You can install the development version of envplyr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("davidfoord1/envplyr")
```

## Example

``` r
library(dplyr)
library(envplyr)
```

``` r
starwars |> 
  as.environment() |> 
  filter(species == "Droid") |> 
  glimpse()
```

    #> Rows: 10
    #> Columns: 14
    #> $ starships  <list> , , , NULL, , NULL, NULL, , NULL, 
    #> $ vehicles   <list> , , , NULL, , NULL, NULL, , NULL, 
    #> $ films      <list> A New Hope             , The Empire Strikes Back, Return o...
    #> $ species    <chr> Droid, Droid, Droid, NA   , Droid, NA   , NA   , Droid, NA ...
    #> $ homeworld  <chr> Tatooine, Naboo   , Tatooine, NA      , NA      , NA      ,...
    #> $ gender     <chr> masculine, masculine, masculine, NA       , masculine, NA  ...
    #> $ sex        <chr> none, none, none, NA  , none, NA  , NA  , none, NA  , none
    #> $ birth_year <dbl> 112,  33,  NA,  NA,  15,  NA,  NA,  NA,  NA,  NA
    #> $ eye_color  <chr> yellow   , red      , red      , NA       , red      , NA  ...
    #> $ skin_color <chr> gold       , white, blue, white, red , NA         , metal  ...
    #> $ hair_color <chr> NA  , NA  , NA  , NA  , none, NA  , NA  , none, NA  , none
    #> $ mass       <dbl>  75,  32,  32,  NA, 140,  NA,  NA,  NA,  NA,  NA
    #> $ height     <int> 167,  96,  97,  NA, 200,  NA,  NA,  96,  NA,  NA
    #> $ name       <chr> C-3PO , R2-D2 , R5-D4 , NA    , IG-88 , NA    , NA    , R4-...
    #> <environment: 0x000001869b662488>
