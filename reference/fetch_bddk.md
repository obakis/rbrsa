# Fetch multiple period table from BDDK website Fetches BDDK data for a range of months by calling fetch_bddk1 iteratively.

Fetch multiple period table from BDDK website Fetches BDDK data for a
range of months by calling fetch_bddk1 iteratively.

## Usage

``` r
fetch_bddk(
  start_year,
  start_month,
  end_year,
  end_month,
  table_no,
  grup_kod = 10001,
  currency = "TL",
  lang = "en",
  delay = 0.5,
  verbose = TRUE
)
```

## Arguments

- start_year, end_year:

  Starting/ending year (YYYY).

- start_month, end_month:

  Starting/ending month (1-12).

- table_no:

  Table number to fetch (1-17). No default. Use
  [`list_tables`](https://obakis.github.io/rbrsa/reference/list_tables.md)
  with `source = "bddk"` to see available options.

- grup_kod:

  Group code (10001-10016). Default 10001. Use
  [`list_groups`](https://obakis.github.io/rbrsa/reference/list_groups.md)
  with `source = "bddk"` to see available options.

- currency:

  Currency code ("TL" or "USD"). Default "TL".

- lang:

  Language ("en" or "tr"). Default "en".

- delay:

  Delay between requests in seconds. Default 0.5.

- verbose:

  Print progress messages. Default TRUE.

## Value

Combined data frame with "fetch_range" attribute.

## Examples

``` r
# \donttest{
  # Fetch multiple months
  my_dat <- fetch_bddk(2024, 1, 2024, 3, table_no = 15)
#> Fetching table 15 for 3 months: 2024-01 to 2024-03
#> [1/3] 2024-01... 32 rows
#> [2/3] 2024-02... 32 rows
#> [3/3] 2024-03... 32 rows
# }
```
