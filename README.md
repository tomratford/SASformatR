
<!-- README.md is generated from README.Rmd. Please edit that file -->

# SASformatR

<!-- badges: start -->
<!-- badges: end -->

The goal of SASformatR is to port the functionality of SAS formats to R,
to ease in the creation of data sets.

## Installation

You can install the development version of SASformatR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tomratford/SASformatR")
```

## Example

Like as in SAS, we can create formats uses `proc_format()`.

``` r
library(SASformatR)

proc_format(
  PARAMCD = value(
    "SYSBP" = "Systolic Blood Pressure",
    "DIABP" = "Diastolic Blood Pressure",
    "HR" = "Heart Rate"
  ),
  YNn = value(
    `1` = 'Y',
    `2` = 'N'
  )
)
```

These values can be regular enum -\> enum formats, or can be numeric
ranges if provided in the format below.

``` r
proc_format(
  AGEGR1 = value(
    "< 21" = "<21",
    "21 - 39" = "21 - 39",
    "40 <=" = ">=40"
  )
)
```

These values can then be applied to a regular vector using the
`SASformat` function.

``` r
age <- c(10,20,30,40,50)
agegr1 <- SASformat(age, "AGEGR1")
```

When viewed in a data frame these values will appear formatted.

``` r
dplyr::bind_cols(age = age, agegr1 = agegr1)
#> # A tibble: 5 × 2
#>     age agegr1    
#>   <dbl> <SASformt>
#> 1    10 <21       
#> 2    20 <21       
#> 3    30 21 - 39   
#> 4    40 >=40      
#> 5    50 >=40
```

for more information, check out
`vignette("getting_started", package="SASformatR")`.
