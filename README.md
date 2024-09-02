
<!-- README.md is generated from README.Rmd. Please edit that file -->

# draft.kings <a href="github.com/gacolitti/draft.kings"><img src="man/figures/logo.png" align="right" height="138" /></a>

<!-- badges: start -->

[![experimental](https://img.shields.io/badge/experimental-orange.svg)](https://github.com/gaclitti/draft.kings)
<!-- badges: end -->

# Overview

`draft.kings` is an R package that wraps the undocumented DraftKings
API, providing seamless access to data and additional tools for fantasy
sports strategy.

Key features:

- Retrieve contests and draftable players
- List participants and scores
- Optimize lineups

`draft.kings` aims to be the most comprehensive API wrapper package for
DraftKings in any programming language. Users are encouraged to create
issues for new endpoints or bugs to help improve the package.

### Installation

You can install the development version of draft.kings from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gacolitti/draft.kings")
```

``` r
library(draft.kings)
```

# Examples

## Contests & Draft Groups

**Contest Info**

``` r
contest_info <- dk_get_contest_info(contest_key = 133645678) 

contest_info$contest_summary
#> [1] "This 215-player contest features $5,000.00 in total prizes and pays out the top 5 finishing positions. First place wins $1,000.00."

contest_info |> 
  dplyr::select(contest_key, contest_summary, payout_description, sport, entry_fee, entries)
#> # A tibble: 1 × 6
#>   contest_key contest_summary         payout_description sport entry_fee entries
#>   <chr>       <chr>                   <chr>              <chr>     <dbl>   <dbl>
#> 1 133645678   This 215-player contes… $5,000             NFL          27     215
```

**Draft Group**

``` r
draft_group <- dk_get_draft_group(draft_group_id = 75284)

draft_group |> 
  dplyr::select(draftable_id, player_id, first_name, last_name, position, salary, status)
#> # A tibble: 106 × 7
#>    draftable_id player_id first_name last_name position salary status
#>           <dbl>     <dbl> <chr>      <chr>     <chr>     <dbl> <chr> 
#>  1     24633208    877745 Lamar      Jackson   QB        18300 None  
#>  2     24633209   1109979 Ja'Marr    Chase     WR        16500 None  
#>  3     24633210    878785 Joe        Burrow    QB        15900 None  
#>  4     24633211    820699 Mark       Andrews   TE        14400 None  
#>  5     24633212    820727 Joe        Mixon     RB        13200 None  
#>  6     24633213    978579 Tee        Higgins   WR        12300 None  
#>  7     24633261    877745 Lamar      Jackson   QB        12200 None  
#>  8     24633262   1109979 Ja'Marr    Chase     WR        11000 None  
#>  9     24633263    878785 Joe        Burrow    QB        10600 None  
#> 10     24633214    976513 J.K.       Dobbins   RB        10500 None  
#> # ℹ 96 more rows
```

**Draft Group Info**

``` r
dg_info <- dk_get_draft_group_info(draft_group_id = 75284)

dg_info$info |> 
  dplyr::select(draft_group_id, game_type_id, sport, game_type, min_start_time, max_start_time)
#> # A tibble: 1 × 6
#>   draft_group_id game_type_id sport game_type min_start_time      max_start_time
#>            <int>        <int> <chr> <chr>     <chr>               <chr>         
#> 1          75284           96 NFL   SalaryCap 2022-10-10T00:20:0… 2022-10-10T00…

dg_info$games |> 
  dplyr::select(game_id, away_team_id, home_team_id, start_date, location, time_remaining_status)
#> # A tibble: 1 × 6
#>   game_id away_team_id home_team_id start_date    location time_remaining_status
#>     <int>        <int>        <int> <chr>         <chr>    <chr>                
#> 1 5819761          327          366 2022-10-10T0… M&T Ban… Final

dg_info$leagues |> 
  dplyr::select(league_id, league_name, league_abbreviation)
#> # A tibble: 1 × 3
#>   league_id league_name              league_abbreviation
#>       <int> <chr>                    <chr>              
#> 1         1 National Football League NFL
```

## Leaderboard & Entries

**Leaderboard**

``` r
leaderboard <- dk_get_leaderboard(contest_key = 133645678)

leaderboard |> 
  dplyr::select(draft_group_id, contest_key, entry_key, user_name, rank, fantasy_points)
#> # A tibble: 215 × 6
#>    draft_group_id contest_key entry_key  user_name     rank fantasy_points
#>             <int> <chr>       <chr>      <chr>        <int>          <dbl>
#>  1          75284 133645678   3412356478 GenoMike21       1          101. 
#>  2          75284 133645678   3416201807 carlitosway9     1          101. 
#>  3          75284 133645678   3416313295 KidRaider3       1          101. 
#>  4          75284 133645678   3416410911 carlosking89     4           97.6
#>  5          75284 133645678   3416034618 sjamo35          5           96.3
#>  6          75284 133645678   3416642033 Jace2013         6           96.2
#>  7          75284 133645678   3416680035 Bucknutz00       7           94.2
#>  8          75284 133645678   3415573084 JWolff33         8           93.9
#>  9          75284 133645678   3416580244 eracnrobert      9           90.2
#> 10          75284 133645678   3415480406 Maria2199       10           90.1
#> # ℹ 205 more rows
```

**Entries**

``` r
entries <- dk_get_entries(draft_group_id = 80584, entry_keys = c(3618408508, 3618897002))

entries |> 
  dplyr::select(entry_key, draftable_id, display_name, roster_position, fantasy_points)
#> # A tibble: 76 × 5
#>    entry_key  draftable_id display_name roster_position fantasy_points
#>    <chr>             <int> <chr>        <chr>                    <dbl>
#>  1 3618408508     26369002 Cole Beasley FLEX                       6  
#>  2 3618408508     26369002 Cole Beasley FLEX                       3.5
#>  3 3618408508     26369002 Cole Beasley FLEX                       2  
#>  4 3618408508     26369002 Cole Beasley FLEX                       0  
#>  5 3618408508     26369002 Cole Beasley FLEX                       0  
#>  6 3618408508     26368984 Gabe Davis   FLEX                       6  
#>  7 3618408508     26368984 Gabe Davis   FLEX                      11.3
#>  8 3618408508     26368984 Gabe Davis   FLEX                       6  
#>  9 3618408508     26368984 Gabe Davis   FLEX                       3  
#> 10 3618408508     26368984 Gabe Davis   FLEX                       0  
#> # ℹ 66 more rows
```

## Lineup Optimization

**Prepare Schematic**

``` r
# prepare schematic with contest rules and DraftKings player projections
schematic <- dk_prepare_schematic(draft_group_id = 80584)
schematic |> names()
#> [1] "draft_group"    "rules"          "draft_group_id"
```

**Run Optimization**

``` r
# perform lineup optimization based on rules and player projections 
optimized_lineup <- dk_optimize_lineup(schematic)
```

**Extract Solution**

``` r
# extract solution from optimized lineup object
solution <- dk_extract_solution(optimized_lineup)

solution |> names()
#> [1] "optimal_lineup" "draft_group_id" "salary_total"   "exp_fp_total"

# exp_fp is the expected fantasy points for each player in the lineup
solution$optimal_lineup |> 
  dplyr::select(draftable_id, display_name, position, salary, exp_fp)
#>   draftable_id   display_name position salary exp_fp
#> 1     26368922     Josh Allen       QB  18600   39.0
#> 2     26368976    Tyreek Hill       WR  11000   24.6
#> 3     26368982 Raheem Mostert       RB   8000   17.4
#> 4     26368990     James Cook       RB   5400   14.1
#> 5     26368996  Jason Sanders        K   3800    8.2
#> 6     26368997       Dolphins      DST   3200    8.6

# total expected fantasy points for the lineup
solution$exp_fp_total
#> [1] 111.9
```

# Further Reading

- [SeanDrum/Draft-Kings-API-Documentation](https://github.com/SeanDrum/Draft-Kings-API-Documentation)
