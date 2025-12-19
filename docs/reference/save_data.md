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

  **Required**. A non-empty string (without extension) must be provided.

- format:

  Output format: "rds", "csv", or "xlsx". Default "rds".

## Value

Full file path (invisibly).

## Examples

``` r
# \donttest{
  my_data <- fetch_bddk1(2024, 1, 15)
  temp_file <- tempfile() # filename should be without extension
  save_data(my_data, temp_file, format = "csv")
#> Data saved to /var/folders/ms/mr56rmh51q96hf944t8m7cgh0000gn/T//RtmpQv5J4R/fileccca33805d62.csv
# }
```
