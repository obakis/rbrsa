# List available groups Print available banking groups for a data source.

List available groups Print available banking groups for a data source.

## Usage

``` r
list_groups(source = c("bddk", "finturk"), lang = c("en", "tr"))
```

## Arguments

- source:

  Either "bddk" or "finturk"

- lang:

  Either "tr" or "en" for names. "en" is default

## Value

Data frame of available groups (invisibly)

## Examples

``` r
list_groups("bddk")
#> Available banking groups for bddk data:
#>  Group_Code                             Name
#>       10001                     Sector Total
#>       10002                    Deposit Banks
#>       10008       Deposit - Domestic Private
#>       10009                 Deposit - Public
#>       10010                Deposit - Foreign
#>       10003              Participation Banks
#>       10004 Development and Investment Banks
#>       10005           Domestic Private Banks
#>       10006                     Public Banks
#>       10007                    Foreign Banks
list_groups("finturk","tr")
#> Available banking groups for finturk data:
#>  Group_Code                Name
#>       10001              SEKTÖR
#>       10002             MEVDUAT
#>       10003 KALKINMA VE YATIRIM
#>       10004             KATILIM
#>       10005             YABANCI
#>       10006                KAMU
#>       10007          YERLİ ÖZEL
```
