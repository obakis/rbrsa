# List Available Tables Print available tables for a data source.

List Available Tables Print available tables for a data source.

## Usage

``` r
list_tables(source = c("bddk", "finturk"), lang = c("en", "tr"))
```

## Arguments

- source:

  Either "bddk" or "finturk"

- lang:

  Either "tr" or "en" for column names. "en" is default

## Value

Data frame of available tables (invisibly)

## Examples

``` r
list_tables("bddk")
#> Available tables for bddk data:
#>  Table_No                            Title
#>         1                    Balance Sheet
#>         2                  Profit and Loss
#>         3                            Loans
#>         4                   Consumer Loans
#>         5       Sectoral Loan Distribution
#>         6                        SME Loans
#>         7 Syndication Securitization Loans
#>         8                       Securities
#>         9                 Deposits by Type
#>        10             Deposits by Maturity
#>        11               Liquidity Position
#>        12                 Capital Adequacy
#>        13        Foreign Currency Position
#>        14   Off-Balance Sheet Transactions
#>        15                           Ratios
#>        16                Other Information
#>        17            Foreign Branch Ratios
list_tables("finturk", "tr")
#> Available tables for finturk data:
#>  Table_No                                      Title
#>         1                          Krediler (Bin TL)
#>         2                           Mevduat (Bin TL)
#>         3               Bireysel Bankacılık (Bin TL)
#>         4        Seçilmiş Sektörel Krediler (Bin TL)
#>         5                                Oranlar (%)
#>         6 Şubeler (Adet) ve Nüfusa Göre Dağılım (TL)
#>         7 Altın Kredileri ve Altın Mevduatı (Bin TL)
```
