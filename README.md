
<!-- README.md is generated from README.Rmd. Please edit that file -->

# draft.kings <a href="github.com/gacolitti/draft.kings"><img src="man/figures/logo.png" align="right" height="138" /></a>

<!-- badges: start -->

[![experimental](https://img.shields.io/badge/experimental-orange.svg)](https://github.com/gaclitti/draft.kings)
<!-- badges: end -->

# Overview

`draft.kings` makes it easy to pull data from DraftKings and optimize
your lineups. You can get current contests, fetch draftable players for
each contest, and list contest participants and their points for each
contest. There are also functions to facilitate lineup optimization
using DraftKings player projections or your own player point
predictions. If you use DraftKings and know R, this package is for you.

The functions contained in this package wrap any endpoints I was able to
find by inspecting the Draft Kings website. The DraftKings public API is
undocumented. If you find an endpoint not included in the package,
please open an issue.

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

## Contests

``` r
dk_get_contest_info(contest_key = 133645678)
#> # A tibble: 1 × 33
#>   contest_summary         payout_description is_cash_prize_only scoring_style_id
#>   <chr>                   <chr>              <lgl>                         <dbl>
#> 1 This 215-player contes… $5,000             TRUE                              1
#> # ℹ 29 more variables: contest_state_detail <chr>,
#> #   includes_past_season_collectibles <lgl>, sport <chr>, is_guaranteed <lgl>,
#> #   is_private <lgl>, is_resizable <lgl>, was_resized <lgl>, fpp_award <dbl>,
#> #   sort_order <dbl>, contest_start_time <chr>, game_type_id <dbl>,
#> #   ticket_only_entry <lgl>, game_set_key <chr>, contest_key <chr>, name <chr>,
#> #   draft_group_id <dbl>, play_type_id <dbl>, entries <dbl>,
#> #   maximum_entries <dbl>, maximum_entries_per_user <dbl>, entry_fee <dbl>, …
```

## Draft Groups

``` r
dk_get_draft_group_info(draft_group_id = 75284)
#> $info
#> # A tibble: 1 × 12
#>   draft_group_id sport_id start_time_suffix start_time_type min_start_time      
#>            <int>    <int> <chr>             <chr>           <chr>               
#> 1          75284        1 " (CIN vs BAL)"   Normal          2022-10-10T00:20:00…
#> # ℹ 7 more variables: max_start_time <chr>, draft_group_state <chr>,
#> #   allow_ugc <lgl>, game_type_id <int>, contest_type_id <int>, sport <chr>,
#> #   game_type <chr>
#> 
#> $games
#> # A tibble: 1 × 16
#>   game_id away_team_id home_team_id start_date    location time_remaining_status
#>     <int>        <int>        <int> <chr>         <chr>    <chr>                
#> 1 5819761          327          366 2022-10-10T0… M&T Ban… Final                
#> # ℹ 10 more variables: sport <chr>, status <chr>, description <chr>,
#> #   league <chr>, competition_status <chr>, competition_status_detail <chr>,
#> #   sport_specific_data_time_remaining <chr>,
#> #   sport_specific_data_home_team_score <chr>,
#> #   sport_specific_data_away_team_score <chr>,
#> #   sport_specific_data_quarter <chr>
#> 
#> $leagues
#> # A tibble: 1 × 3
#>   league_id league_name              league_abbreviation
#>       <int> <chr>                    <chr>              
#> 1         1 National Football League NFL
```

## Leaderboard & Entries

``` r
dk_get_leaderboard(contest_key = 133645678)
#> # A tibble: 215 × 21
#>    draft_group_id contest_key entry_key  lineup_id user_name    user_key
#>             <int> <chr>       <chr>          <int> <chr>        <chr>   
#>  1          75284 133645678   3412356478        -1 GenoMike21   642864  
#>  2          75284 133645678   3416201807        -1 carlitosway9 1334845 
#>  3          75284 133645678   3416313295        -1 KidRaider3   5752908 
#>  4          75284 133645678   3416410911        -1 carlosking89 8636059 
#>  5          75284 133645678   3416034618        -1 sjamo35      8672865 
#>  6          75284 133645678   3416642033        -1 Jace2013     11763756
#>  7          75284 133645678   3416680035        -1 Bucknutz00   417423  
#>  8          75284 133645678   3415573084        -1 JWolff33     13692689
#>  9          75284 133645678   3416580244        -1 eracnrobert  2374855 
#> 10          75284 133645678   3415480406        -1 Maria2199    3405766 
#> # ℹ 205 more rows
#> # ℹ 15 more variables: user_entry_count <int>, user_entry_index <int>,
#> #   time_remaining <int>, time_remaining_unit <chr>, max_time_remaining <int>,
#> #   time_remaining_opponent <int>, rank <int>, fantasy_points <dbl>,
#> #   fantasy_points_opponent <dbl>, user_name_opponent <chr>,
#> #   number_tickets_won <int>, tickets_value <int>, winning_value <int>,
#> #   winnings <list>, scoring_precision <int>
```

``` r
dk_get_entries(draft_group_id = 80584, entry_keys = c(3618408508, 3618897002))
#> # A tibble: 76 × 29
#>    contest_key entry_key  user_key draft_group_id lineup_id first_name last_name
#>    <chr>       <chr>      <chr>             <int>     <int> <chr>      <chr>    
#>  1 140039397   3618408508 11222656          80584        -1 Cole       Beasley  
#>  2 140039397   3618408508 11222656          80584        -1 Cole       Beasley  
#>  3 140039397   3618408508 11222656          80584        -1 Cole       Beasley  
#>  4 140039397   3618408508 11222656          80584        -1 Cole       Beasley  
#>  5 140039397   3618408508 11222656          80584        -1 Cole       Beasley  
#>  6 140039397   3618408508 11222656          80584        -1 Gabe       Davis    
#>  7 140039397   3618408508 11222656          80584        -1 Gabe       Davis    
#>  8 140039397   3618408508 11222656          80584        -1 Gabe       Davis    
#>  9 140039397   3618408508 11222656          80584        -1 Gabe       Davis    
#> 10 140039397   3618408508 11222656          80584        -1 Gabe       Davis    
#> # ℹ 66 more rows
#> # ℹ 22 more variables: short_name <chr>, display_name <chr>,
#> #   roster_position_id <int>, roster_position <chr>,
#> #   roster_position_sort_order <int>, e_tag <chr>, percent_drafted <dbl>,
#> #   draftable_id <int>, score <dbl>, stats_description <chr>,
#> #   time_remaining_unit <chr>, time_remaining <int>, max_time_remaining <int>,
#> #   percent_drafted_cp <chr>, player_deep_link <chr>, …
```

## Lineup Optimization

``` r
# prepare schematic with contest rules and DraftKings player projections
schematic <- dk_prepare_schematic(draft_group_id = 80584)

# run optimization
optimized_lineup <- dk_optimize_lineup(schematic)

# extract solution
dk_extract_solution(optimized_lineup)
#> $optimal_lineup
#>   draftable_id first_name last_name   display_name short_name player_id
#> 1     26368922       Josh     Allen     Josh Allen   J. Allen    868199
#> 2     26368976     Tyreek      Hill    Tyreek Hill    T. Hill    823156
#> 3     26368982     Raheem   Mostert Raheem Mostert R. Mostert    606501
#> 4     26368990      James      Cook     James Cook    J. Cook   1131012
#> 5     26368996      Jason   Sanders  Jason Sanders J. Sanders    821895
#> 6     26368997   Dolphins                 Dolphins   Dolphins       345
#>   player_dk_id position roster_slot_id salary status is_swappable is_disabled
#> 1        11370       QB            511  18600   None        FALSE       FALSE
#> 2        11477       WR            512  11000   None        FALSE       FALSE
#> 3        19614       RB            512   8000   None        FALSE       FALSE
#> 4       640895       RB            512   5400   None        FALSE       FALSE
#> 5        14871        K            512   3800   None        FALSE       FALSE
#> 6        18401      DST            512   3200   None        FALSE       FALSE
#>   news_status                                         player_image50
#> 1      Recent  https://dkn.gs/sports/images/nfl/players/50/11370.png
#> 2      Recent  https://dkn.gs/sports/images/nfl/players/50/11477.png
#> 3    Breaking  https://dkn.gs/sports/images/nfl/players/50/19614.png
#> 4      Recent https://dkn.gs/sports/images/nfl/players/50/640895.png
#> 5        None  https://dkn.gs/sports/images/nfl/players/50/14871.png
#> 6        <NA>    https://dkn.gs/sports/images/nfl/teams/50/18401.png
#>                                           player_image160 alt_player_image50
#> 1  https://dkn.gs/sports/images/nfl/players/160/11370.png                   
#> 2  https://dkn.gs/sports/images/nfl/players/160/11477.png                   
#> 3  https://dkn.gs/sports/images/nfl/players/160/19614.png                   
#> 4 https://dkn.gs/sports/images/nfl/players/160/640895.png                   
#> 5  https://dkn.gs/sports/images/nfl/players/160/14871.png                   
#> 6    https://dkn.gs/sports/images/nfl/teams/160/18401.png                   
#>   alt_player_image160 team_id team_abbreviation player_game_hash competition_id
#> 1                         324               BUF   868199-5819869        5819869
#> 2                         345               MIA   823156-5819869        5819869
#> 3                         345               MIA   606501-5819869        5819869
#> 4                         324               BUF  1131012-5819869        5819869
#> 5                         345               MIA   821895-5819869        5819869
#> 6                         345               MIA      345-5819869        5819869
#>   competition_name       competition_start_time exp_fp is_captain
#> 1        MIA @ BUF 2023-01-15T18:00:00.0000000Z   39.0       TRUE
#> 2        MIA @ BUF 2023-01-15T18:00:00.0000000Z   24.6      FALSE
#> 3        MIA @ BUF 2023-01-15T18:00:00.0000000Z   17.4      FALSE
#> 4        MIA @ BUF 2023-01-15T18:00:00.0000000Z   14.1      FALSE
#> 5        MIA @ BUF 2023-01-15T18:00:00.0000000Z    8.2      FALSE
#> 6        MIA @ BUF 2023-01-15T18:00:00.0000000Z    8.6      FALSE
#> 
#> $draft_group_id
#> [1] 80584
#> 
#> $salary_total
#> [1] 50000
#> 
#> $exp_fp_total
#> [1] 111.9
```

# Further Reading

- [SeanDrum/Draft-Kings-API-Documentation](https://github.com/SeanDrum/Draft-Kings-API-Documentation)
