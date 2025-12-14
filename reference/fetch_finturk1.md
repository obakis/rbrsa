# Fetch single period Finturk data

Retrieves quarterly data from the BDDK Finturk website

## Usage

``` r
fetch_finturk1(year, month, table_no, grup_kod = 10001, il = 0)
```

## Arguments

- year:

  Year as 4-digit integer (YYYY).

- month:

  Month as integer (3,6,9,12 for quarterly data).

- table_no:

  Table number to fetch (1-7). No default.

- grup_kod:

  Group code (10001-1007). Default 10001.

- il:

  plaka (license plate) number (0-81, 99). Default 0. 0=HEPSİ (All
  Cities), 1=Adana, 6=Ankara, 34=İstanbul, 35=İzmir, etc. See
  [`list_cities`](https://obakis.github.io/rbrsa/reference/list_cities.md)
  for full list.

## Value

Data frame with data and period metadata.

## Examples

``` r
# \donttest{
  # Fetch Table 1 (Loans) for Q1 2024
  data <- fetch_finturk1(2024, 3, 1)
# }
```
