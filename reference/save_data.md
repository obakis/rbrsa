# Save Fetched Data to Multiple Formats

Save Fetched Data to Multiple Formats

## Usage

``` r
save_data(df, filename = NULL, format = "rds")
```

## Arguments

- df:

  Data frame to save (with fetch_info attribute for auto-naming).

- filename:

  Base name for output file (without extension).

- format:

  Output format: "rds", "csv", or "xlsx". Default "rds".

## Value

Full file path (invisibly).

## Examples

``` r
if (FALSE) { # \dontrun{
  my_data <- fetch_bddk1(2024, 1, 15)
  temp_file <- tempfile() # filename should be without extension
  save_data(my_data, temp_file, format = "csv")
} # }
```
