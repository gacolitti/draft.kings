# get_draftable_players() works when passed a draftgroup ID

    Code
      d
    Output
      # A tibble: 82 x 24
         draftable_id first_~1 last_~2 displ~3 short~4 playe~5 playe~6 posit~7 roste~8
                <dbl> <chr>    <chr>   <chr>   <chr>     <dbl>   <dbl> <chr>     <dbl>
       1     24651606 Davante  Adams   Davant~ D. Ada~  611417   19493 WR          511
       2     24651607 Jameis   Winston Jameis~ J. Win~  691536   20214 QB          511
       3     24651608 Alvin    Kamara  Alvin ~ A. Kam~  750846   18573 RB          511
       4     24651609 Derek    Carr    Derek ~ D. Carr  496083   12350 QB          511
       5     24651610 Michael  Thomas  Michae~ M. Tho~  653699   18818 WR          511
       6     24651611 Josh     Jacobs  Josh J~ J. Jac~  944416   12715 RB          511
       7     24651612 Darren   Waller  Darren~ D. Wal~  600191   13162 TE          511
       8     24651565 Davante  Adams   Davant~ D. Ada~  611417   19493 WR          512
       9     24651613 Mark     Ingram~ Mark I~ M. Ing~  456613   17165 RB          511
      10     24651566 Jameis   Winston Jameis~ J. Win~  691536   20214 QB          512
      # ... with 72 more rows, 15 more variables: salary <dbl>, status <chr>,
      #   is_swappable <lgl>, is_disabled <lgl>, news_status <chr>,
      #   player_image50 <chr>, player_image160 <chr>, alt_player_image50 <chr>,
      #   alt_player_image160 <chr>, team_id <dbl>, team_abbreviation <chr>,
      #   player_game_hash <chr>, competition_competition_id <dbl>,
      #   competition_name <chr>, competition_start_time <chr>, and abbreviated
      #   variable names 1: first_name, 2: last_name, 3: display_name, ...

# get_draftable_players() works when passed a contest ID

    Code
      d
    Output
      # A tibble: 1,265 x 22
         draftable_id first_~1 last_~2 displ~3 short~4 playe~5 playe~6 posit~7 roste~8
                <dbl> <chr>    <chr>   <chr>   <chr>     <dbl>   <dbl> <chr>     <dbl>
       1      4373678 Clayton  Kershaw Clayto~ C. Ker~  326468       0 SP           50
       2      4373781 Max      Scherz~ Max Sc~ M. Sch~  326473       0 SP           50
       3      4373757 Félix    Hernán~ Félix ~ F. Her~  244302       0 SP           50
       4      4373661 Chris    Sale    Chris ~ C. Sale  392121       0 SP           50
       5      4373772 David    Price   David ~ D. Pri~  388363       0 SP           50
       6      4373788 Stephen  Strasb~ Stephe~ S. Str~  500543       0 SP           50
       7      4373676 Zack     Greinke Zack G~ Z. Gre~  202781       0 SP           50
       8      4373750 Matt     Harvey  Matt H~ M. Har~  390378       0 SP           50
       9      4373794 Cole     Hamels  Cole H~ C. Ham~  202810       0 SP           50
      10      4373702 Madison  Bumgar~ Madiso~ M. Bum~  388396       0 SP           50
      # ... with 1,255 more rows, 13 more variables: salary <dbl>, status <chr>,
      #   is_swappable <lgl>, is_disabled <lgl>, news_status <chr>,
      #   player_image50 <chr>, player_image160 <chr>, team_id <dbl>,
      #   team_abbreviation <chr>, player_game_hash <chr>,
      #   competition_competition_id <dbl>, competition_name <chr>,
      #   competition_start_time <chr>, and abbreviated variable names 1: first_name,
      #   2: last_name, 3: display_name, 4: short_name, 5: player_id, ...

# get_draft_groups() returns expected data

    Code
      d
    Output
      # A tibble: 76 x 17
         draft~1 conte~2 start~3 start~4 sort_~5 draft~6 game_~7 game_~8 sport~9 sport
           <dbl>   <dbl> <chr>   <chr>     <dbl> <chr>     <dbl> <lgl>     <dbl> <chr>
       1   81315      21 2023-0~ 2023-0~       1 "Featu~       1 NA            0 NFL  
       2   81325      51 2023-0~ 2023-0~       2 ""           51 NA            0 NFL  
       3   81316      96 2023-0~ 2023-0~       3 ""           96 NA            0 NFL  
       4   81318     108 2023-0~ 2023-0~       6 ""          108 NA            0 NFL  
       5   81319     110 2023-0~ 2023-0~       7 ""          110 NA            0 NFL  
       6   81317      96 2023-0~ 2023-0~       8 "Featu~      96 NA            0 NFL  
       7   81320     108 2023-0~ 2023-0~      10 "Featu~     108 NA            0 NFL  
       8   81321     110 2023-0~ 2023-0~      11 "Featu~     110 NA            0 NFL  
       9   81210     159 2023-0~ 2023-0~      21 ""          159 NA            0 NFL  
      10   81211     158 2023-0~ 2023-0~      22 "Featu~     158 NA            0 NFL  
      # ... with 66 more rows, 7 more variables: game_count <dbl>,
      #   contest_start_time_suffix <chr>, contest_start_time_type <dbl>,
      #   games <lgl>, draft_group_series_id <dbl>, game_set_key <chr>,
      #   allowugc <lgl>, and abbreviated variable names 1: draft_group_id,
      #   2: contest_type_id, 3: start_date, 4: start_date_est, 5: sort_order,
      #   6: draft_group_tag, 7: game_type_id, 8: game_type, 9: sport_sort_order

# get_draft_group_info() returns expected data

    Code
      d
    Output
      # A tibble: 1 x 37
        draft_group_id sport~1 start~2 start~3 min_s~4 max_s~5 draft~6 allow~7 leagu~8
                 <int>   <int> <chr>   <chr>   <chr>   <chr>   <chr>   <lgl>     <int>
      1          75367       1 " (Mad~ Normal  2022-1~ 2022-1~ Histor~ TRUE         79
      # ... with 28 more variables: league_name <chr>, league_abbreviation <chr>,
      #   game_id <int>, away_team_id <int>, home_team_id <int>, start_date <chr>,
      #   time_remaining_status <chr>, sport <chr>, status <chr>, description <chr>,
      #   time_remaining <chr>, home_team_score <chr>, away_team_score <chr>,
      #   quarter <chr>, league <chr>, competition_status <chr>,
      #   competition_status_detail <chr>, game_attributes_type_id1 <chr>,
      #   game_attributes_value1 <chr>, game_attributes_type_id2 <chr>, ...

# get_player_list() returns expected data

    Code
      d
    Output
      # A tibble: 41 x 32
            pid   did pcode    tsid fn     ln    fnu   lnu      jn pn       dgst   tid
          <dbl> <dbl> <dbl>   <dbl> <chr>  <chr> <chr> <chr> <dbl> <chr>   <dbl> <dbl>
       1 611417     0 27581 5915939 Davan~ Adams Dava~ Adams    17 WR    1.67e12   341
       2 691536     0 28389 5915939 Jameis Wins~ Jame~ Wins~     2 QB    1.67e12   350
       3 750846     0 30180 5915939 Alvin  Kama~ Alvin Kama~    41 RB    1.67e12   350
       4 496083     0 27564 5915939 Derek  Carr  Derek Carr      4 QB    1.67e12   341
       5 653699     0 29281 5915939 Micha~ Thom~ Mich~ Thom~    13 WR    1.67e12   350
       6 944416     0 31856 5915939 Josh   Jaco~ Josh  Jaco~    28 RB    1.67e12   341
       7 600191     0 28592 5915939 Darren Wall~ Darr~ Wall~    83 TE    1.67e12   341
       8 456613     0 24815 5915939 Mark   Ingr~ Mark  Ingr~    22 RB    1.67e12   350
       9 590796     0 28442 5915939 Ameer  Abdu~ Ameer Abdu~    22 RB    1.67e12   341
      10 875444     0 32775 5915939 Adam   Trau~ Adam  Trau~    82 TE    1.67e12   350
      # ... with 31 more rows, and 20 more variables: htid <dbl>, atid <dbl>,
      #   htabbr <chr>, atabbr <chr>, posid <dbl>, rosposid <dbl>, slo <lgl>,
      #   is_disabled_from_drafting <lgl>, s <dbl>, ppg <chr>, or <dbl>, swp <lgl>,
      #   ipc <lgl>, pp <dbl>, i <chr>, news <dbl>, img_lg <chr>, alt_img_lg <chr>,
      #   img_sm <chr>, alt_img_sm <chr>

# get_team_list() returns expected data

    Code
      d
    Output
      # A tibble: 1 x 9
        ht     htid at     atid tz                       dh     s status status_code
        <chr> <dbl> <chr> <dbl> <chr>                 <dbl> <dbl> <chr>        <dbl>
      1 LV      341 NO      350 /Date(1665252000000)/     0     1 Final            4

# get_player_points() returns expected data

    Code
      d
    Output
      # A tibble: 350 x 27
         player_id player_dk_id first~1 last_~2 team_id posit~3 salary fanta~4 value~5
             <dbl>        <dbl> <chr>   <chr>     <dbl> <chr>    <dbl>   <dbl> <chr>  
       1    750846        18573 Alvin   Kamara      350 RB        7900    59.2 fire   
       2    611417        19493 Davante Adams       335 WR        9100    46.2 fire   
       3    694041        17102 Stefon  Diggs       324 WR        8000    44.5 fire   
       4    593587        20134 Mike    Evans       362 WR        6100    43.1 fire   
       5    868199        11370 Josh    Allen       324 QB        7300    35.3 fire   
       6    865895        14491 Myles   Gaskin      345 RB        5300    33.9 fire   
       7    912070        17742 Michael Gallup      331 WR        4100    33.1 fire   
       8     25347        17557 Tom     Brady       362 QB        6800    32.9 fire   
       9    552409        17825 David   Johnson     325 RB        6100    31.9 fire   
      10    828743        18229 Deshaun Watson      325 QB        7600    30.8 fire   
      # ... with 340 more rows, 18 more variables: game_id <dbl>, image_url <chr>,
      #   points <dbl>, sport <chr>, game_status <chr>, game_start_time <chr>,
      #   week_number <dbl>, team_city <chr>, team_name <chr>,
      #   team_abbreviation <chr>, opposing_team_city <chr>,
      #   opposing_team_name <chr>, opposing_team_abbreviation <chr>,
      #   fantasy_stats_num_games <dbl>, fantasy_points_per_game <dbl>,
      #   player_state <chr>, pregame_projection <dbl>, ...

