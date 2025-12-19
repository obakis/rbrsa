# Fetch Monthly Data from BDDK with Multiple Group Codes

Retrieves monthly banking data from the BDDK API for specified group
codes. Supports multiple group codes in a single request, returning a
combined data frame with consistent numeric `grup_kod` values.

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

Data frame with a `fetch_info` attribute that contains query details.

## See also

[`fetch_finturk1()`](https://obakis.github.io/rbrsa/reference/fetch_finturk1.md)
for quarterly province-level data.

## Examples

``` r
# Single group code
fetch_bddk1(2020, 3, 1, grup_kod = 10001)
#>        group_name BasitSira
#> 1  Banking Sector         1
#> 2  Banking Sector         2
#> 3  Banking Sector         3
#> 4  Banking Sector         4
#> 5  Banking Sector         5
#> 6  Banking Sector         6
#> 7  Banking Sector         7
#> 8  Banking Sector         8
#> 9  Banking Sector         9
#> 10 Banking Sector        10
#> 11 Banking Sector        11
#> 12 Banking Sector        12
#> 13 Banking Sector        13
#> 14 Banking Sector        14
#> 15 Banking Sector        15
#> 16 Banking Sector        16
#> 17 Banking Sector        17
#> 18 Banking Sector        18
#> 19 Banking Sector        19
#> 20 Banking Sector        20
#> 21 Banking Sector        21
#> 22 Banking Sector        22
#> 23 Banking Sector        23
#> 24 Banking Sector        24
#> 25 Banking Sector        25
#> 26 Banking Sector        26
#> 27 Banking Sector        27
#> 28 Banking Sector        28
#> 29 Banking Sector        29
#> 30 Banking Sector        30
#> 31 Banking Sector        31
#> 32 Banking Sector        32
#> 33 Banking Sector        33
#> 34 Banking Sector        34
#> 35 Banking Sector        35
#> 36 Banking Sector        36
#> 37 Banking Sector        37
#> 38 Banking Sector        38
#> 39 Banking Sector        39
#> 40 Banking Sector        40
#> 41 Banking Sector        41
#> 42 Banking Sector        42
#> 43 Banking Sector        43
#> 44 Banking Sector        44
#> 45 Banking Sector        45
#> 46 Banking Sector        46
#> 47 Banking Sector        47
#> 48 Banking Sector        48
#> 49 Banking Sector        49
#> 50 Banking Sector        50
#> 51 Banking Sector        51
#> 52 Banking Sector        52
#> 53 Banking Sector        53
#> 54 Banking Sector        54
#> 55 Banking Sector        55
#> 56 Banking Sector        56
#> 57 Banking Sector        57
#> 58 Banking Sector        58
#> 59 Banking Sector        59
#> 60 Banking Sector        60
#> 61 Banking Sector        61
#> 62 Banking Sector        62
#>                                                                           Ad
#> 1                                                                       Cash
#> 2                                                      Receivables from CBRT
#> 3                                              Receivables from Money Market
#> 4                                                     Receivables from Banks
#> 5                            Securities at Fair Value Through Profit or Loss
#> 6                Securities at Fair Value Through Other Comprehensive Income
#> 7                                                          Required Reserves
#> 8                                      Receivables from Securities Interbank
#> 9                                              Receivables from Reverse Repo
#> 10                                                                    Loans*
#> 11                                                      Non-performing Loans
#> 12                                          Allowances for Credit Losses (-)
#> 13                            a) Allowances for 12 Month ECL (First Stage)**
#> 14                           b) Allowances for Lifetime ECL (Second Stage)**
#> 15                              c) Allowances for Lifetime ECL (Third Stage)
#> 16               Interest (Profit Share) and Income Accruals and Rediscounts
#> 17 a) Interest (Profit Share) and Income Accruals and Rediscounts from Loans
#> 18                          b) Interest (Income) Rediscounts from Securities
#> 19                   c) Other Interest (Profit Share) and Income Rediscounts
#> 20                                                       Leasing Receivables
#> 21                               Affiliates, Subsidiaries and Joint Ventures
#> 22                                              Securities at Amortised Cost
#> 23                                                   Assets to be Sold (Net)
#> 24                                              Premises and Equipment (Net)
#> 25                                                              Other Assets
#> 26                                                              TOTAL ASSETS
#> 27                                          Deposit (Participation Funds)***
#> 28                                                        a) Demand Deposits
#> 29                                                          b) Term Deposits
#> 30                                                      Payables to the CBRT
#> 31                                                  Payables to Money Market
#> 32                                             Payables to Securities Market
#> 33                                                         Payables to Banks
#> 34                                              Funds from Repo Transactions
#> 35                                                                     Funds
#> 36                                           Securities Issued (Net) (37+38)
#> 37                                                        a) Bonds and Bills
#> 38                    b) Asset Backed Securities and Other Securities Issued
#> 39                                     Liabilities Arising from Leases (Net)
#> 40                               Taxes, Duties, Charges and Premiums Payable
#> 41                                                   Subordinated Debt (Net)
#> 42              Interest (Profit Share) and Expense Accruals and Rediscounts
#> 43      a) Deposit (Participation Funds) Interest (Profit Share) Rediscounts
#> 44                  b) Other Interest (Profit Share) and Expense Rediscounts
#> 45                                                            Provisions****
#> 46                                                         Other Liabilities
#> 47                                                               LIABILITIES
#> 48                                                         Paid - in Capital
#> 49                                                            Legal Reserves
#> 50                              Capital Reserves Due to Inflation Accounting
#> 51                                              Fixed Asset Revaluation Fund
#> 52                                           Securities Increment Value Fund
#> 53                                               Profit (Loss) of the Period
#> 54                                                 Accumulated Profit (Loss)
#> 55                                                TOTAL SHAREHOLDERS' EQUITY
#> 56                                                         TOTAL LIABILITIES
#> 57                                                             Contingencies
#> 58                                                       Commitments (59+60)
#> 59                                       a) Derivative Financial Instruments
#> 60                                                      b) Other Commitments
#> 61                                              Loans Extended to Banks*****
#> 62                  Deposits (Participation Funds) Collected from Banks*****
#>    BasitFont     TRY      FX   Total grup_kod  period currency
#> 1              17087   36476   53563    10001 2020-03       TL
#> 2              31016  177481  208497    10001 2020-03       TL
#> 3               1113     164    1277    10001 2020-03       TL
#> 4              51381  145668  197049    10001 2020-03       TL
#> 5              30595   21559   52153    10001 2020-03       TL
#> 6             249571  156408  405980    10001 2020-03       TL
#> 7                199  192666  192865    10001 2020-03       TL
#> 8                713       0     713    10001 2020-03       TL
#> 9              22277   12563   34840    10001 2020-03       TL
#> 10           1798698 1097823 2896521    10001 2020-03       TL
#> 11            139855   11671  151526    10001 2020-03       TL
#> 12            134145   23351  157496    10001 2020-03       TL
#> 13    italic   12635    3482   16117    10001 2020-03       TL
#> 14    italic   23553   13471   37024    10001 2020-03       TL
#> 15    italic   97957    6398  104355    10001 2020-03       TL
#> 16            169451   65941  235392    10001 2020-03       TL
#> 17    italic   60203   24141   84344    10001 2020-03       TL
#> 18    italic   63043    3399   66441    10001 2020-03       TL
#> 19    italic   46206   38401   84607    10001 2020-03       TL
#> 20              4276    4507    8783    10001 2020-03       TL
#> 21             48327   37227   85554    10001 2020-03       TL
#> 22            173908  116378  290285    10001 2020-03       TL
#> 23             21412       0   21412    10001 2020-03       TL
#> 24             51242     107   51349    10001 2020-03       TL
#> 25             69009   72597  141605    10001 2020-03       TL
#> 26      bold 2745984 2125885 4871869    10001 2020-03       TL
#> 27           1350837 1445348 2796185    10001 2020-03       TL
#> 28    italic  304776  452708  757483    10001 2020-03       TL
#> 29    italic 1046061  992640 2038701    10001 2020-03       TL
#> 30               488   96845   97332    10001 2020-03       TL
#> 31             22611       0   22611    10001 2020-03       TL
#> 32             16115      98   16213    10001 2020-03       TL
#> 33             62398  498267  560666    10001 2020-03       TL
#> 34            138680   55101  193781    10001 2020-03       TL
#> 35             18443     801   19244    10001 2020-03       TL
#> 36             69717  140530  210247    10001 2020-03       TL
#> 37    italic   57494  136958  194453    10001 2020-03       TL
#> 38    italic   12223    3572   15795    10001 2020-03       TL
#> 39             10181     526   10707    10001 2020-03       TL
#> 40              5793       6    5798    10001 2020-03       TL
#> 41             20658  119834  140493    10001 2020-03       TL
#> 42             41464   43071   84535    10001 2020-03       TL
#> 43    italic    8234    1254    9488    10001 2020-03       TL
#> 44    italic   33231   41817   75047    10001 2020-03       TL
#> 45             42274    3153   45427    10001 2020-03       TL
#> 46            117296   51994  169289    10001 2020-03       TL
#> 47      bold 1916955 2455574 4372528    10001 2020-03       TL
#> 48            109282       0  109282    10001 2020-03       TL
#> 49            336916     389  337305    10001 2020-03       TL
#> 50                 0       0       0    10001 2020-03       TL
#> 51             21422       5   21427    10001 2020-03       TL
#> 52             12689  -13004    -315    10001 2020-03       TL
#> 53             15347       0   15347    10001 2020-03       TL
#> 54             16294       0   16294    10001 2020-03       TL
#> 55      bold  511950  -12610  499340    10001 2020-03       TL
#> 56      bold 2428905 2442964 4871869    10001 2020-03       TL
#> 57            321642  539393  861035    10001 2020-03       TL
#> 58           1334186 3092455 4426641    10001 2020-03       TL
#> 59    italic  728330 2790683 3519013    10001 2020-03       TL
#> 60    italic  605856  301772  907628    10001 2020-03       TL
#> 61             13093   39748   52841    10001 2020-03       TL
#> 62             50889   68462  119350    10001 2020-03       TL

# Multiple group codes
fetch_bddk1(2020, 3, 1, grup_kod = c(10001, 10002))
#>         group_name BasitSira
#> 1   Banking Sector         1
#> 2   Banking Sector         2
#> 3   Banking Sector         3
#> 4   Banking Sector         4
#> 5   Banking Sector         5
#> 6   Banking Sector         6
#> 7   Banking Sector         7
#> 8   Banking Sector         8
#> 9   Banking Sector         9
#> 10  Banking Sector        10
#> 11  Banking Sector        11
#> 12  Banking Sector        12
#> 13  Banking Sector        13
#> 14  Banking Sector        14
#> 15  Banking Sector        15
#> 16  Banking Sector        16
#> 17  Banking Sector        17
#> 18  Banking Sector        18
#> 19  Banking Sector        19
#> 20  Banking Sector        20
#> 21  Banking Sector        21
#> 22  Banking Sector        22
#> 23  Banking Sector        23
#> 24  Banking Sector        24
#> 25  Banking Sector        25
#> 26  Banking Sector        26
#> 27  Banking Sector        27
#> 28  Banking Sector        28
#> 29  Banking Sector        29
#> 30  Banking Sector        30
#> 31  Banking Sector        31
#> 32  Banking Sector        32
#> 33  Banking Sector        33
#> 34  Banking Sector        34
#> 35  Banking Sector        35
#> 36  Banking Sector        36
#> 37  Banking Sector        37
#> 38  Banking Sector        38
#> 39  Banking Sector        39
#> 40  Banking Sector        40
#> 41  Banking Sector        41
#> 42  Banking Sector        42
#> 43  Banking Sector        43
#> 44  Banking Sector        44
#> 45  Banking Sector        45
#> 46  Banking Sector        46
#> 47  Banking Sector        47
#> 48  Banking Sector        48
#> 49  Banking Sector        49
#> 50  Banking Sector        50
#> 51  Banking Sector        51
#> 52  Banking Sector        52
#> 53  Banking Sector        53
#> 54  Banking Sector        54
#> 55  Banking Sector        55
#> 56  Banking Sector        56
#> 57  Banking Sector        57
#> 58  Banking Sector        58
#> 59  Banking Sector        59
#> 60  Banking Sector        60
#> 61  Banking Sector        61
#> 62  Banking Sector        62
#> 63         Deposit         1
#> 64         Deposit         2
#> 65         Deposit         3
#> 66         Deposit         4
#> 67         Deposit         5
#> 68         Deposit         6
#> 69         Deposit         7
#> 70         Deposit         8
#> 71         Deposit         9
#> 72         Deposit        10
#> 73         Deposit        11
#> 74         Deposit        12
#> 75         Deposit        13
#> 76         Deposit        14
#> 77         Deposit        15
#> 78         Deposit        16
#> 79         Deposit        17
#> 80         Deposit        18
#> 81         Deposit        19
#> 82         Deposit        20
#> 83         Deposit        21
#> 84         Deposit        22
#> 85         Deposit        23
#> 86         Deposit        24
#> 87         Deposit        25
#> 88         Deposit        26
#> 89         Deposit        27
#> 90         Deposit        28
#> 91         Deposit        29
#> 92         Deposit        30
#> 93         Deposit        31
#> 94         Deposit        32
#> 95         Deposit        33
#> 96         Deposit        34
#> 97         Deposit        35
#> 98         Deposit        36
#> 99         Deposit        37
#> 100        Deposit        38
#> 101        Deposit        39
#> 102        Deposit        40
#> 103        Deposit        41
#> 104        Deposit        42
#> 105        Deposit        43
#> 106        Deposit        44
#> 107        Deposit        45
#> 108        Deposit        46
#> 109        Deposit        47
#> 110        Deposit        48
#> 111        Deposit        49
#> 112        Deposit        50
#> 113        Deposit        51
#> 114        Deposit        52
#> 115        Deposit        53
#> 116        Deposit        54
#> 117        Deposit        55
#> 118        Deposit        56
#> 119        Deposit        57
#> 120        Deposit        58
#> 121        Deposit        59
#> 122        Deposit        60
#> 123        Deposit        61
#> 124        Deposit        62
#>                                                                            Ad
#> 1                                                                        Cash
#> 2                                                       Receivables from CBRT
#> 3                                               Receivables from Money Market
#> 4                                                      Receivables from Banks
#> 5                             Securities at Fair Value Through Profit or Loss
#> 6                 Securities at Fair Value Through Other Comprehensive Income
#> 7                                                           Required Reserves
#> 8                                       Receivables from Securities Interbank
#> 9                                               Receivables from Reverse Repo
#> 10                                                                     Loans*
#> 11                                                       Non-performing Loans
#> 12                                           Allowances for Credit Losses (-)
#> 13                             a) Allowances for 12 Month ECL (First Stage)**
#> 14                            b) Allowances for Lifetime ECL (Second Stage)**
#> 15                               c) Allowances for Lifetime ECL (Third Stage)
#> 16                Interest (Profit Share) and Income Accruals and Rediscounts
#> 17  a) Interest (Profit Share) and Income Accruals and Rediscounts from Loans
#> 18                           b) Interest (Income) Rediscounts from Securities
#> 19                    c) Other Interest (Profit Share) and Income Rediscounts
#> 20                                                        Leasing Receivables
#> 21                                Affiliates, Subsidiaries and Joint Ventures
#> 22                                               Securities at Amortised Cost
#> 23                                                    Assets to be Sold (Net)
#> 24                                               Premises and Equipment (Net)
#> 25                                                               Other Assets
#> 26                                                               TOTAL ASSETS
#> 27                                           Deposit (Participation Funds)***
#> 28                                                         a) Demand Deposits
#> 29                                                           b) Term Deposits
#> 30                                                       Payables to the CBRT
#> 31                                                   Payables to Money Market
#> 32                                              Payables to Securities Market
#> 33                                                          Payables to Banks
#> 34                                               Funds from Repo Transactions
#> 35                                                                      Funds
#> 36                                            Securities Issued (Net) (37+38)
#> 37                                                         a) Bonds and Bills
#> 38                     b) Asset Backed Securities and Other Securities Issued
#> 39                                      Liabilities Arising from Leases (Net)
#> 40                                Taxes, Duties, Charges and Premiums Payable
#> 41                                                    Subordinated Debt (Net)
#> 42               Interest (Profit Share) and Expense Accruals and Rediscounts
#> 43       a) Deposit (Participation Funds) Interest (Profit Share) Rediscounts
#> 44                   b) Other Interest (Profit Share) and Expense Rediscounts
#> 45                                                             Provisions****
#> 46                                                          Other Liabilities
#> 47                                                                LIABILITIES
#> 48                                                          Paid - in Capital
#> 49                                                             Legal Reserves
#> 50                               Capital Reserves Due to Inflation Accounting
#> 51                                               Fixed Asset Revaluation Fund
#> 52                                            Securities Increment Value Fund
#> 53                                                Profit (Loss) of the Period
#> 54                                                  Accumulated Profit (Loss)
#> 55                                                 TOTAL SHAREHOLDERS' EQUITY
#> 56                                                          TOTAL LIABILITIES
#> 57                                                              Contingencies
#> 58                                                        Commitments (59+60)
#> 59                                        a) Derivative Financial Instruments
#> 60                                                       b) Other Commitments
#> 61                                               Loans Extended to Banks*****
#> 62                   Deposits (Participation Funds) Collected from Banks*****
#> 63                                                                       Cash
#> 64                                                      Receivables from CBRT
#> 65                                              Receivables from Money Market
#> 66                                                     Receivables from Banks
#> 67                            Securities at Fair Value Through Profit or Loss
#> 68                Securities at Fair Value Through Other Comprehensive Income
#> 69                                                          Required Reserves
#> 70                                      Receivables from Securities Interbank
#> 71                                              Receivables from Reverse Repo
#> 72                                                                     Loans*
#> 73                                                       Non-performing Loans
#> 74                                           Allowances for Credit Losses (-)
#> 75                             a) Allowances for 12 Month ECL (First Stage)**
#> 76                            b) Allowances for Lifetime ECL (Second Stage)**
#> 77                               c) Allowances for Lifetime ECL (Third Stage)
#> 78                Interest (Profit Share) and Income Accruals and Rediscounts
#> 79  a) Interest (Profit Share) and Income Accruals and Rediscounts from Loans
#> 80                           b) Interest (Income) Rediscounts from Securities
#> 81                    c) Other Interest (Profit Share) and Income Rediscounts
#> 82                                                        Leasing Receivables
#> 83                                Affiliates, Subsidiaries and Joint Ventures
#> 84                                               Securities at Amortised Cost
#> 85                                                    Assets to be Sold (Net)
#> 86                                               Premises and Equipment (Net)
#> 87                                                               Other Assets
#> 88                                                               TOTAL ASSETS
#> 89                                           Deposit (Participation Funds)***
#> 90                                                         a) Demand Deposits
#> 91                                                           b) Term Deposits
#> 92                                                       Payables to the CBRT
#> 93                                                   Payables to Money Market
#> 94                                              Payables to Securities Market
#> 95                                                          Payables to Banks
#> 96                                               Funds from Repo Transactions
#> 97                                                                      Funds
#> 98                                            Securities Issued (Net) (37+38)
#> 99                                                         a) Bonds and Bills
#> 100                    b) Asset Backed Securities and Other Securities Issued
#> 101                                     Liabilities Arising from Leases (Net)
#> 102                               Taxes, Duties, Charges and Premiums Payable
#> 103                                                   Subordinated Debt (Net)
#> 104              Interest (Profit Share) and Expense Accruals and Rediscounts
#> 105      a) Deposit (Participation Funds) Interest (Profit Share) Rediscounts
#> 106                  b) Other Interest (Profit Share) and Expense Rediscounts
#> 107                                                            Provisions****
#> 108                                                         Other Liabilities
#> 109                                                               LIABILITIES
#> 110                                                         Paid - in Capital
#> 111                                                            Legal Reserves
#> 112                              Capital Reserves Due to Inflation Accounting
#> 113                                              Fixed Asset Revaluation Fund
#> 114                                           Securities Increment Value Fund
#> 115                                               Profit (Loss) of the Period
#> 116                                                 Accumulated Profit (Loss)
#> 117                                                TOTAL SHAREHOLDERS' EQUITY
#> 118                                                         TOTAL LIABILITIES
#> 119                                                             Contingencies
#> 120                                                       Commitments (59+60)
#> 121                                       a) Derivative Financial Instruments
#> 122                                                      b) Other Commitments
#> 123                                              Loans Extended to Banks*****
#> 124                  Deposits (Participation Funds) Collected from Banks*****
#>     BasitFont     TRY      FX   Total grup_kod  period currency
#> 1               17087   36476   53563    10001 2020-03       TL
#> 2               31016  177481  208497    10001 2020-03       TL
#> 3                1113     164    1277    10001 2020-03       TL
#> 4               51381  145668  197049    10001 2020-03       TL
#> 5               30595   21559   52153    10001 2020-03       TL
#> 6              249571  156408  405980    10001 2020-03       TL
#> 7                 199  192666  192865    10001 2020-03       TL
#> 8                 713       0     713    10001 2020-03       TL
#> 9               22277   12563   34840    10001 2020-03       TL
#> 10            1798698 1097823 2896521    10001 2020-03       TL
#> 11             139855   11671  151526    10001 2020-03       TL
#> 12             134145   23351  157496    10001 2020-03       TL
#> 13     italic   12635    3482   16117    10001 2020-03       TL
#> 14     italic   23553   13471   37024    10001 2020-03       TL
#> 15     italic   97957    6398  104355    10001 2020-03       TL
#> 16             169451   65941  235392    10001 2020-03       TL
#> 17     italic   60203   24141   84344    10001 2020-03       TL
#> 18     italic   63043    3399   66441    10001 2020-03       TL
#> 19     italic   46206   38401   84607    10001 2020-03       TL
#> 20               4276    4507    8783    10001 2020-03       TL
#> 21              48327   37227   85554    10001 2020-03       TL
#> 22             173908  116378  290285    10001 2020-03       TL
#> 23              21412       0   21412    10001 2020-03       TL
#> 24              51242     107   51349    10001 2020-03       TL
#> 25              69009   72597  141605    10001 2020-03       TL
#> 26       bold 2745984 2125885 4871869    10001 2020-03       TL
#> 27            1350837 1445348 2796185    10001 2020-03       TL
#> 28     italic  304776  452708  757483    10001 2020-03       TL
#> 29     italic 1046061  992640 2038701    10001 2020-03       TL
#> 30                488   96845   97332    10001 2020-03       TL
#> 31              22611       0   22611    10001 2020-03       TL
#> 32              16115      98   16213    10001 2020-03       TL
#> 33              62398  498267  560666    10001 2020-03       TL
#> 34             138680   55101  193781    10001 2020-03       TL
#> 35              18443     801   19244    10001 2020-03       TL
#> 36              69717  140530  210247    10001 2020-03       TL
#> 37     italic   57494  136958  194453    10001 2020-03       TL
#> 38     italic   12223    3572   15795    10001 2020-03       TL
#> 39              10181     526   10707    10001 2020-03       TL
#> 40               5793       6    5798    10001 2020-03       TL
#> 41              20658  119834  140493    10001 2020-03       TL
#> 42              41464   43071   84535    10001 2020-03       TL
#> 43     italic    8234    1254    9488    10001 2020-03       TL
#> 44     italic   33231   41817   75047    10001 2020-03       TL
#> 45              42274    3153   45427    10001 2020-03       TL
#> 46             117296   51994  169289    10001 2020-03       TL
#> 47       bold 1916955 2455574 4372528    10001 2020-03       TL
#> 48             109282       0  109282    10001 2020-03       TL
#> 49             336916     389  337305    10001 2020-03       TL
#> 50                  0       0       0    10001 2020-03       TL
#> 51              21422       5   21427    10001 2020-03       TL
#> 52              12689  -13004    -315    10001 2020-03       TL
#> 53              15347       0   15347    10001 2020-03       TL
#> 54              16294       0   16294    10001 2020-03       TL
#> 55       bold  511950  -12610  499340    10001 2020-03       TL
#> 56       bold 2428905 2442964 4871869    10001 2020-03       TL
#> 57             321642  539393  861035    10001 2020-03       TL
#> 58            1334186 3092455 4426641    10001 2020-03       TL
#> 59     italic  728330 2790683 3519013    10001 2020-03       TL
#> 60     italic  605856  301772  907628    10001 2020-03       TL
#> 61              13093   39748   52841    10001 2020-03       TL
#> 62              50889   68462  119350    10001 2020-03       TL
#> 63              15919   28505   44424    10002 2020-03       TL
#> 64              28867  160061  188927    10002 2020-03       TL
#> 65                958       0     958    10002 2020-03       TL
#> 66              19021  100834  119855    10002 2020-03       TL
#> 67              27606    8997   36603    10002 2020-03       TL
#> 68             235077  129792  364869    10002 2020-03       TL
#> 69                199  168872  169071    10002 2020-03       TL
#> 70                713       0     713    10002 2020-03       TL
#> 71              21254   12563   33817    10002 2020-03       TL
#> 72            1663398  850035 2513432    10002 2020-03       TL
#> 73             130837   10371  141208    10002 2020-03       TL
#> 74             125543   21352  146895    10002 2020-03       TL
#> 75     italic   11571    2757   14329    10002 2020-03       TL
#> 76     italic   22259   12779   35038    10002 2020-03       TL
#> 77     italic   91713    5815   97528    10002 2020-03       TL
#> 78             159234   59178  218411    10002 2020-03       TL
#> 79     italic   53310   21851   75161    10002 2020-03       TL
#> 80     italic   60852    2820   63672    10002 2020-03       TL
#> 81     italic   45072   34507   79579    10002 2020-03       TL
#> 82                  0       0       0    10002 2020-03       TL
#> 83              45863   37215   83078    10002 2020-03       TL
#> 84             168013   98105  266119    10002 2020-03       TL
#> 85              19591       0   19591    10002 2020-03       TL
#> 86              44043      85   44128    10002 2020-03       TL
#> 87              62558   70193  132751    10002 2020-03       TL
#> 88       bold 2517608 1713454 4231062    10002 2020-03       TL
#> 89            1249177 1301976 2551154    10002 2020-03       TL
#> 90     italic  269976  395073  665049    10002 2020-03       TL
#> 91     italic  979201  906903 1886105    10002 2020-03       TL
#> 92                  3    4413    4415    10002 2020-03       TL
#> 93              22578       0   22578    10002 2020-03       TL
#> 94              16115      98   16213    10002 2020-03       TL
#> 95              60717  390742  451459    10002 2020-03       TL
#> 96             137203   52600  189803    10002 2020-03       TL
#> 97               9595     695   10290    10002 2020-03       TL
#> 98              63403  110383  173786    10002 2020-03       TL
#> 99     italic   51181  106811  157991    10002 2020-03       TL
#> 100    italic   12223    3572   15795    10002 2020-03       TL
#> 101              8872     467    9339    10002 2020-03       TL
#> 102              5178       5    5184    10002 2020-03       TL
#> 103             17457  106174  123630    10002 2020-03       TL
#> 104             40114   39224   79337    10002 2020-03       TL
#> 105    italic    7832    1163    8995    10002 2020-03       TL
#> 106    italic   32282   38061   70343    10002 2020-03       TL
#> 107             38766    2627   41393    10002 2020-03       TL
#> 108             90288   33169  123457    10002 2020-03       TL
#> 109      bold 1759466 2042574 3802040    10002 2020-03       TL
#> 110             63736       0   63736    10002 2020-03       TL
#> 111            320967     372  321339    10002 2020-03       TL
#> 112                 0       0       0    10002 2020-03       TL
#> 113             20829       5   20834    10002 2020-03       TL
#> 114             11687  -12451    -764    10002 2020-03       TL
#> 115             13012       0   13012    10002 2020-03       TL
#> 116             10865       0   10865    10002 2020-03       TL
#> 117      bold  441096  -12074  429022    10002 2020-03       TL
#> 118      bold 2200562 2030500 4231062    10002 2020-03       TL
#> 119            269914  493368  763283    10002 2020-03       TL
#> 120           1271642 2734266 4005908    10002 2020-03       TL
#> 121    italic  700762 2533411 3234173    10002 2020-03       TL
#> 122    italic  570880  200854  771735    10002 2020-03       TL
#> 123              3186   18958   22143    10002 2020-03       TL
#> 124             50863   65185  116048    10002 2020-03       TL

# Turkish language output
fetch_bddk1(2020, 3, 1, grup_kod = 10001, lang = "tr")
#>    group_name BasitSira
#> 1      Sektör         1
#> 2      Sektör         2
#> 3      Sektör         3
#> 4      Sektör         4
#> 5      Sektör         5
#> 6      Sektör         6
#> 7      Sektör         7
#> 8      Sektör         8
#> 9      Sektör         9
#> 10     Sektör        10
#> 11     Sektör        11
#> 12     Sektör        12
#> 13     Sektör        13
#> 14     Sektör        14
#> 15     Sektör        15
#> 16     Sektör        16
#> 17     Sektör        17
#> 18     Sektör        18
#> 19     Sektör        19
#> 20     Sektör        20
#> 21     Sektör        21
#> 22     Sektör        22
#> 23     Sektör        23
#> 24     Sektör        24
#> 25     Sektör        25
#> 26     Sektör        26
#> 27     Sektör        27
#> 28     Sektör        28
#> 29     Sektör        29
#> 30     Sektör        30
#> 31     Sektör        31
#> 32     Sektör        32
#> 33     Sektör        33
#> 34     Sektör        34
#> 35     Sektör        35
#> 36     Sektör        36
#> 37     Sektör        37
#> 38     Sektör        38
#> 39     Sektör        39
#> 40     Sektör        40
#> 41     Sektör        41
#> 42     Sektör        42
#> 43     Sektör        43
#> 44     Sektör        44
#> 45     Sektör        45
#> 46     Sektör        46
#> 47     Sektör        47
#> 48     Sektör        48
#> 49     Sektör        49
#> 50     Sektör        50
#> 51     Sektör        51
#> 52     Sektör        52
#> 53     Sektör        53
#> 54     Sektör        54
#> 55     Sektör        55
#> 56     Sektör        56
#> 57     Sektör        57
#> 58     Sektör        58
#> 59     Sektör        59
#> 60     Sektör        60
#> 61     Sektör        61
#> 62     Sektör        62
#>                                                               Ad BasitFont
#> 1                                                 Nakit Değerler          
#> 2                              T.C. Merkez Bankasından Alacaklar          
#> 3                                  Para Piyasalarından Alacaklar          
#> 4                                          Bankalardan Alacaklar          
#> 5                  Gerçeğe Uygun Değer Farkı K/Z Yan. Menk. Değ.          
#> 6                GUD Farkı Diğer Kapsamlı Gelire Yan. Menk. Değ.          
#> 7                                            Zorunlu Karşılıklar          
#> 8                     Menkul Kıymet Ödünç Piyasasından Alacaklar          
#> 9                                           Ters Repo Alacakları          
#> 10                                                     Krediler*          
#> 11                                           Takipteki Alacaklar          
#> 12                               Beklenen Zarar Karşılıkları (-)          
#> 13           a) 12 Ay Beklenen Zarar Karşılığı (Birinci Aşama)**    italic
#> 14               b) Kredi Riskinde Önemli Artış (İkinci Aşama)**    italic
#> 15                    c) Temerrüt - Özel Karşılık (Üçüncü Aşama)    italic
#> 16                    Faiz (Kar Payı) ve Gelir Tah. Reeskontları          
#> 17           a) Kredi Faiz (Kar Payı) ve Gelir Tah. Reeskontları    italic
#> 18                          b) Menkul Değerler Faiz Reeskontları    italic
#> 19                c) Diğer Faiz (Kar Payı) ve Gelir Reeskontları    italic
#> 20                                  Finansal Kiralama Alacakları          
#> 21           İştirakler,  Bağlı  ve Birlikte Kontrol Edilen Ort.          
#> 22    İtfa Edilmiş Maliyeti Üzerinden Değerlenen Menkul Değerler          
#> 23                             Elden Çıkarılacak Kıymetler (Net)          
#> 24                                         Sabit Kıymetler (Net)          
#> 25                                                Diğer Aktifler          
#> 26                                               TOPLAM AKTİFLER      bold
#> 27                                     Mevduat (Katılım Fonu)***          
#> 28                                            a) Vadesiz Mevduat    italic
#> 29                                             b) Vadeli Mevduat    italic
#> 30                                 T.C. Merkez Bankasına Borçlar          
#> 31                                     Para Piyasalarına Borçlar          
#> 32                        Menkul Kıymet Ödünç Piyasasına Borçlar          
#> 33                                             Bankalara Borçlar          
#> 34                            Repo İşlemlerinden Sağlanan Fonlar          
#> 35                                                        Fonlar          
#> 36                   İhraç Edilen Menkul Kıymetler (Net) (37+38)          
#> 37                                       a) Tahviller ve Bonolar    italic
#> 38            b) V.D.M.K. ve Diğer İhraç Edilen Menkul Kıymetler    italic
#> 39                    Kiralama İşlemlerinden Yükümlülükler (Net)          
#> 40                        Ödenecek Vergi, Resim, Harç ve Primler          
#> 41 Sermaye Hesaplamasına Dahil Edilecek Borçlanma Araçları (Net)          
#> 42                         Faiz (Kar Payı) ve Gider Reeskontları          
#> 43        a) Mevduat (Katılım Fonu) Faiz (Kar Payı) Reeskontları    italic
#> 44                b) Diğer Faiz (Kar Payı) ve Gider Reeskontları    italic
#> 45                                               Karşılıklar****          
#> 46                                                Diğer Pasifler          
#> 47                                      TOPLAM YABANCI KAYNAKLAR      bold
#> 48                                               Ödenmiş Sermaye          
#> 49                                                 Yedek Akçeler          
#> 50                      Ödenmiş Sermaye Enflasyon Düzeltme Farkı          
#> 51                       Sabit Kıymet Yeniden Değerleme Farkları          
#> 52                            Menkul Değerler Değerleme Farkları          
#> 53                                           Dönem Karı (Zararı)          
#> 54                                   Geçmiş Yıllar Karı (Zararı)          
#> 55                                            TOPLAM ÖZKAYNAKLAR      bold
#> 56                                               TOPLAM PASİFLER      bold
#> 57                             Gayrinakdi Kredi ve Yükümlülükler          
#> 58                                            Taahhütler (59+60)          
#> 59                                     a) Türev Finansal Araçlar    italic
#> 60                                           b) Diğer Taahhütler    italic
#> 61                         Bankalara Kullandırılan Krediler*****          
#> 62                         Bankalar Mevduatı (Katılım Fonu)*****          
#>         TP      YP  Toplam grup_kod  period currency
#> 1    17087   36476   53563    10001 2020-03       TL
#> 2    31016  177481  208497    10001 2020-03       TL
#> 3     1113     164    1277    10001 2020-03       TL
#> 4    51381  145668  197049    10001 2020-03       TL
#> 5    30595   21559   52153    10001 2020-03       TL
#> 6   249571  156408  405980    10001 2020-03       TL
#> 7      199  192666  192865    10001 2020-03       TL
#> 8      713       0     713    10001 2020-03       TL
#> 9    22277   12563   34840    10001 2020-03       TL
#> 10 1798698 1097823 2896521    10001 2020-03       TL
#> 11  139855   11671  151526    10001 2020-03       TL
#> 12  134145   23351  157496    10001 2020-03       TL
#> 13   12635    3482   16117    10001 2020-03       TL
#> 14   23553   13471   37024    10001 2020-03       TL
#> 15   97957    6398  104355    10001 2020-03       TL
#> 16  169451   65941  235392    10001 2020-03       TL
#> 17   60203   24141   84344    10001 2020-03       TL
#> 18   63043    3399   66441    10001 2020-03       TL
#> 19   46206   38401   84607    10001 2020-03       TL
#> 20    4276    4507    8783    10001 2020-03       TL
#> 21   48327   37227   85554    10001 2020-03       TL
#> 22  173908  116378  290285    10001 2020-03       TL
#> 23   21412       0   21412    10001 2020-03       TL
#> 24   51242     107   51349    10001 2020-03       TL
#> 25   69009   72597  141605    10001 2020-03       TL
#> 26 2745984 2125885 4871869    10001 2020-03       TL
#> 27 1350837 1445348 2796185    10001 2020-03       TL
#> 28  304776  452708  757483    10001 2020-03       TL
#> 29 1046061  992640 2038701    10001 2020-03       TL
#> 30     488   96845   97332    10001 2020-03       TL
#> 31   22611       0   22611    10001 2020-03       TL
#> 32   16115      98   16213    10001 2020-03       TL
#> 33   62398  498267  560666    10001 2020-03       TL
#> 34  138680   55101  193781    10001 2020-03       TL
#> 35   18443     801   19244    10001 2020-03       TL
#> 36   69717  140530  210247    10001 2020-03       TL
#> 37   57494  136958  194453    10001 2020-03       TL
#> 38   12223    3572   15795    10001 2020-03       TL
#> 39   10181     526   10707    10001 2020-03       TL
#> 40    5793       6    5798    10001 2020-03       TL
#> 41   20658  119834  140493    10001 2020-03       TL
#> 42   41464   43071   84535    10001 2020-03       TL
#> 43    8234    1254    9488    10001 2020-03       TL
#> 44   33231   41817   75047    10001 2020-03       TL
#> 45   42274    3153   45427    10001 2020-03       TL
#> 46  117296   51994  169289    10001 2020-03       TL
#> 47 1916955 2455574 4372528    10001 2020-03       TL
#> 48  109282       0  109282    10001 2020-03       TL
#> 49  336916     389  337305    10001 2020-03       TL
#> 50       0       0       0    10001 2020-03       TL
#> 51   21422       5   21427    10001 2020-03       TL
#> 52   12689  -13004    -315    10001 2020-03       TL
#> 53   15347       0   15347    10001 2020-03       TL
#> 54   16294       0   16294    10001 2020-03       TL
#> 55  511950  -12610  499340    10001 2020-03       TL
#> 56 2428905 2442964 4871869    10001 2020-03       TL
#> 57  321642  539393  861035    10001 2020-03       TL
#> 58 1334186 3092455 4426641    10001 2020-03       TL
#> 59  728330 2790683 3519013    10001 2020-03       TL
#> 60  605856  301772  907628    10001 2020-03       TL
#> 61   13093   39748   52841    10001 2020-03       TL
#> 62   50889   68462  119350    10001 2020-03       TL
```
