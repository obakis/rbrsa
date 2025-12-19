# Convert plaka (license plate number) to province name Maps Turkish license plate numbers to province names used in the Finturk API.

Convert plaka (license plate number) to province name Maps Turkish
license plate numbers to province names used in the Finturk API.

## Usage

``` r
plaka_to_city(plaka)
```

## Arguments

- plaka:

  license plate number (0 for "HEPSI", 1-81 for provinces, 999 for "YURT
  DISI")

## Value

province name in ALL CAPS as required by API

## Examples

``` r
plaka_to_city(6)   # "ANKARA"
#> [1] "ANKARA"
plaka_to_city(34)  # "ISTANBUL"
#> [1] "İSTANBUL"
plaka_to_city(0)   # "HEPSI"
#> [1] "HEPSİ"
```
