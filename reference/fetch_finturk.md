# Fetch multiple period Finturk data Fetches Finturk data for a range of quarters by calling fetch_finturk1 iteratively.

Fetch multiple period Finturk data Fetches Finturk data for a range of
quarters by calling fetch_finturk1 iteratively.

## Usage

``` r
fetch_finturk(
  start_year,
  start_month,
  end_year,
  end_month,
  table_no,
  grup_kod = 10001,
  il = 0,
  delay = 0.5,
  verbose = TRUE
)
```

## Arguments

- start_year, end_year:

  Starting/ending year (YYYY).

- start_month, end_month:

  Starting/ending month (3,6,9,12).

- table_no:

  Table number to fetch (1-7). No default. Use
  [`list_tables`](https://obakis.github.io/rbrsa/reference/list_tables.md)
  with `source = "finturk"` to see available options.

- grup_kod:

  Group code (10001-10007). Default 10001. Use
  [`list_groups`](https://obakis.github.io/rbrsa/reference/list_groups.md)
  with `source = "finturk"` to see available options.

- il:

  plaka (license plate) number (0-81, 99). Default 0.

- delay:

  Delay between requests in seconds. Default 0.5.

- verbose:

  Print progress messages. Default TRUE.

## Value

Combined data frame with "fetch_range" attribute.

## Examples

``` r
# \donttest{
  # Fetch multiple quarters
  my_data <- fetch_finturk(2024, 3, 2024, 9, table_no = 1)
#> Fetching table 1 for 3 quarterly periods: 2024-03 to 2024-09
#> [1/3] 2024-03... 82 rows
#> [2/3] 2024-06... 82 rows
#> [3/3] 2024-09... 82 rows
# }
```
