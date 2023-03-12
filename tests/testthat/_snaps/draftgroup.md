# dk_get_draft_group() works when passed a draftgroup ID

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
      #   player_game_hash <chr>, competition_id <dbl>, competition_name <chr>,
      #   competition_start_time <chr>, and abbreviated variable names 1: first_name,
      #   2: last_name, 3: display_name, 4: short_name, 5: player_id, ...

# dk_get_draft_group() works when passed a contest ID

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
      #   team_abbreviation <chr>, player_game_hash <chr>, competition_id <dbl>,
      #   competition_name <chr>, competition_start_time <chr>, and abbreviated
      #   variable names 1: first_name, 2: last_name, 3: display_name, 4: short_name,
      #   5: player_id, 6: player_dk_id, 7: position, 8: roster_slot_id

# dk_get_lobby_draft_groups() returns expected data

    Code
      d
    Output
      # A tibble: 70 x 17
         draft~1 conte~2 start~3 start~4 sort_~5 draft~6 game_~7 game_~8 sport~9 sport
           <dbl>   <dbl> <chr>   <chr>     <dbl> <chr>     <dbl> <lgl>     <dbl> <chr>
       1   83426     253 2023-0~ 2023-0~       4 "Featu~     253 NA            0 NFL  
       2   83427     254 2023-0~ 2023-0~       5 ""          254 NA            0 NFL  
       3   83428     254 2023-0~ 2023-0~       6 "Featu~     254 NA            0 NFL  
       4   83245     159 2023-0~ 2023-0~      25 ""          159 NA            0 NFL  
       5   83246     159 2023-0~ 2023-0~      26 ""          159 NA            0 NFL  
       6   83247     158 2023-0~ 2023-0~      27 "Featu~     158 NA            0 NFL  
       7   83248     159 2023-0~ 2023-0~      28 ""          159 NA            0 NFL  
       8   83249     159 2023-0~ 2023-0~      29 ""          159 NA            0 NFL  
       9   83250     159 2023-0~ 2023-0~      30 "Featu~     159 NA            0 NFL  
      10   83704     158 2023-0~ 2023-0~      31 ""          158 NA            0 NFL  
      # ... with 60 more rows, 7 more variables: game_count <dbl>,
      #   contest_start_time_suffix <chr>, contest_start_time_type <dbl>,
      #   games <lgl>, draft_group_series_id <dbl>, game_set_key <chr>,
      #   allowugc <lgl>, and abbreviated variable names 1: draft_group_id,
      #   2: contest_type_id, 3: start_date, 4: start_date_est, 5: sort_order,
      #   6: draft_group_tag, 7: game_type_id, 8: game_type, 9: sport_sort_order

# dk_get_draft_group_info() returns expected data

    Code
      d
    Output
      $info
      # A tibble: 1 x 12
        draft_group_id sport~1 start~2 start~3 min_s~4 max_s~5 draft~6 allow~7 game_~8
                 <int>   <int> <chr>   <chr>   <chr>   <chr>   <chr>   <lgl>     <int>
      1          75367       1 " (Mad~ Normal  2022-1~ 2022-1~ Histor~ TRUE        159
      # ... with 3 more variables: contest_type_id <int>, sport <chr>,
      #   game_type <chr>, and abbreviated variable names 1: sport_id,
      #   2: start_time_suffix, 3: start_time_type, 4: min_start_time,
      #   5: max_start_time, 6: draft_group_state, 7: allow_ugc, 8: game_type_id
      
      $games
      # A tibble: 1 x 15
        game_id away_tea~1 home_~2 start~3 time_~4 sport status descr~5 league compe~6
          <int>      <int>   <int> <chr>   <chr>   <chr> <chr>  <chr>   <chr>  <chr>  
      1 5915939        350     341 2022-1~ Scores~ NFL   Score~ NO @ LV SIM    Scores~
      # ... with 5 more variables: competition_status_detail <chr>,
      #   sport_specific_data_time_remaining <chr>,
      #   sport_specific_data_home_team_score <chr>,
      #   sport_specific_data_away_team_score <chr>,
      #   sport_specific_data_quarter <chr>, and abbreviated variable names
      #   1: away_team_id, 2: home_team_id, 3: start_date, 4: time_remaining_status,
      #   5: description, 6: competition_status
      
      $leagues
      # A tibble: 1 x 3
        league_id league_name league_abbreviation
            <int> <chr>       <chr>              
      1        79 Simulation  SIM                
      

# dk_get_player_list() returns expected data

    Code
      d
    Output
      # A tibble: 41 x 32
            pid   did pcode    tsid fn     ln    fnu   lnu      jn pn       dgst   tid
          <dbl> <dbl> <dbl>   <dbl> <chr>  <chr> <chr> <chr> <dbl> <chr>   <dbl> <dbl>
       1 611417     0 27581 5915939 Davan~ Adams Dava~ Adams    17 WR    1.67e12   341
       2 691536     0 28389 5915939 Jameis Wins~ Jame~ Wins~     2 QB    1.67e12   350
       3 750846     0 30180 5915939 Alvin  Kama~ Alvin Kama~    41 RB    1.67e12   350
       4 496083     0 27564 5915939 Derek  Carr  Derek Carr      0 QB    1.67e12   341
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

# dk_get_team_list() returns expected data

    Code
      d
    Output
      # A tibble: 1 x 9
        ht     htid at     atid tz                       dh     s status status_code
        <chr> <dbl> <chr> <dbl> <chr>                 <dbl> <dbl> <chr>        <dbl>
      1 LV      341 NO      350 /Date(1665252000000)/     0     1 Final            4

# dk_get_player_fp() returns expected data

    Code
      d_nfl
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

---

    Code
      d_nba
    Output
      # A tibble: 188 x 26
         player_id player_dk_id first~1 last_~2 team_id posit~3 salary fanta~4 value~5
             <dbl>        <dbl> <chr>   <chr>     <dbl> <chr>    <dbl>   <dbl> <chr>  
       1    463121        33322 Damian  Lillard      22 PG       10500       0 ""     
       2    830650        33018 Nikola  Jokic         7 C        11600       0 ""     
       3    794508        33292 Joel    Embiid       20 C        11500       0 ""     
       4   1257420       527219 LaMelo  Ball       5312 PG        3000       0 ""     
       5    395388        33070 James   Harden       20 PG        9900       0 ""     
       6    214152        33114 LeBron  James        13 SF       10400       0 ""     
       7   1067856        33258 Shai    Gilgeo~      25 PG        9100       0 ""     
       8    603096        33122 Anthony Davis        13 PF       10700       0 ""     
       9    879707        33398 Donovan Mitche~       5 SG        9300       0 ""     
      10   1132025        33223 Zion    Willia~       3 PF        8300       0 ""     
      # ... with 178 more rows, 17 more variables: pregame_projection <dbl>,
      #   real_time_projection <dbl>, game_id <dbl>, points <dbl>, sport <chr>,
      #   game_status <chr>, game_start_time <chr>, date <chr>, image_url <chr>,
      #   team_city <chr>, team_name <chr>, team_abbreviation <chr>,
      #   opposing_team_city <chr>, opposing_team_name <chr>,
      #   opposing_team_abbreviation <chr>, fantasy_stats_num_games <dbl>,
      #   fantasy_points_per_game <dbl>, and abbreviated variable names ...

