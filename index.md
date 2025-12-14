# rbrsa: An R Package for Turkish Banking Sector Data

[![Documentation](https://img.shields.io/badge/docs-pkgdown-blue)](https://obakis.github.io/rbrsa/)

An R package for programmatic access to Turkish banking sector data from
the Turkish Banking Regulation and Supervision Agency (BRSA, known as
BDDK in Turkish). The package provides R users with a clean interface to
fetch monthly and quarterly banking statistics, financial reports, and
sectoral indicators directly from BRSA’s official APIs.

## Key Features

- Direct API access to BRSA monthly bulletins (17 financial tables)
- Quarterly Finturk data with city-level granularity (7 tables, 82
  cities including ‘HEPSİ’ for all cities)
- Consistent parameter interface for both data sources
- Built-in metadata for tables, banking groups, and cities
- Multiple export formats: RDS, CSV, Excel via
  [`save_data()`](https://obakis.github.io/rbrsa/reference/save_data.md)
- Returns base R data frames ready for analysis

## Design Philosophy

Unlike configuration-heavy approaches, such as
[bddkR](https://github.com/ozancanozdemir/bddkR) (which is a based on
[bddkdata](https://github.com/urazakgul/bddkdata), a Python package),
rbrsa uses a programmatic design that dynamically extracts column
structures from API responses while maintaining a stable user interface.
This approach reduces maintenance burden and adapts to BRSA API changes.

## Related Packages

- [bddkR](https://github.com/ozancanozdemir/bddkR) (R): Uses manual
  configuration for translations and column mappings
- [bddk](https://github.com/barbasan/bddk) (Python): Provides similar
  functionality for Python users  
- [bddkdata](https://github.com/urazakgul/bddkdata) (Python): Provides
  similar functionality for Python/pandas users
- [pybrsa](https://github.com/obakis/pybrsa) (Python, forthcoming):
  Python companion to this package with consistent API

## Installation

You can install from CRAN

``` r
install.packages("rbrsa")
```

The development version can be installed from GitHub:

``` r
#install.packages("pak")
pak::pkg_install("obakis/rbrsa")
```

## Getting started

**Full package documentation with function references and examples is
available at: <https://obakis.github.io/rbrsa/>.**

rbrsa package retrieves tablesfrom two distinct publication portals
maintained by the Turkish Banking Regulation and Supervision Agency
(BDDK). Both portals are official sources, but they organize the data
differently: The [Monthly Bulletin
Portal](https://www.bddk.org.tr/bultenaylik) provides high-level,
summary reports designed for general consumption and quick overviews of
monthly trends without any geographic coverage. The [Finturk Data
System](https://www.bddk.org.tr/BultenFinturk/) provides granular,
detailed data, including statistics broken down by province, whereas the
standard Monthly Bulletin offers national-level aggregates.

Note: Currently, only a single grup_kod can be specified per request.
The underlying BDDK API supports multiple codes, and this functionality
will be added in a future version.

``` r
library(rbrsa)
## Explore available tables
list_tables("bddk") # list_tables("bddk","tr")
list_tables("finturk")  # list_tables("finturk", "tr")
list_groups("bddk")  
list_groups("bddk","tr")  
list_groups("finturk")

## Monthly data (Table 15: Ratios)
data <- fetch_bddk(2024, 1, 2024, 3, table_no = 15, grup_kod = 10001)

## Quarterly Finturk data
q_data <- fetch_finturk(2024, 3, 2024, 9, table_no = 1, grup_kod = 10007)

## Save results
temp_file <- tempfile(fileext = ".csv") # filenames is without extension
save_data(q_data, temp_file, format = "csv")
```
