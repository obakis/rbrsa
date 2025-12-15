# Fetch single period table from BDDK website

Retrieves data for a specific table, month, and grup_kod from the BDDK
Monthly Bulletin.

## Usage

``` r
fetch_bddk1(
  year,
  month,
  table_no,
  grup_kod = 10001,
  currency = "TL",
  lang = "en"
)
```

## Arguments

- year:

  Year as 4-digit integer (YYYY).

- month:

  Month as integer (1-12).

- table_no:

  Table number to fetch (1-17). No default. Use
  [`list_tables`](https://obakis.github.io/rbrsa/reference/list_tables.md)
  with `source = "bddk"` to see available options.

- grup_kod:

  Group code (10001-10010). Default 10001. Use
  [`list_groups`](https://obakis.github.io/rbrsa/reference/list_groups.md)
  with `source = "bddk"` to see available options.

- currency:

  Currency code ("TL" or "USD"). Default "TL".

- lang:

  Language ("en" or "tr"). Default "en".

## Value

Data frame with data and period/currency metadata.

## Examples

``` r
# \donttest{
  # Fetch Table 15 (Ratios) for January 2024
  data <- fetch_bddk1(2024, 1, 15)
# }
```
