# get_contest_info() returns expected results for contest ID 9000

    Code
      d
    Output
      # A tibble: 1 x 29
        contes~1 payou~2 is_ca~3 scori~4 conte~5 sport is_gu~6 is_pr~7 is_re~8 was_r~9
        <chr>    <chr>   <lgl>     <dbl> <chr>   <chr> <lgl>   <lgl>   <lgl>   <lgl>  
      1 This 5-~ $45     TRUE          1 Comple~ MLB   FALSE   FALSE   FALSE   FALSE  
      # ... with 19 more variables: fpp_award <dbl>, sort_order <dbl>,
      #   contest_start_time <chr>, game_type_id <dbl>, ticket_only_entry <lgl>,
      #   game_set_key <chr>, contest_key <chr>, name <chr>, draft_group_id <dbl>,
      #   play_type_id <dbl>, entries <dbl>, maximum_entries <dbl>,
      #   maximum_entries_per_user <dbl>, entry_fee <dbl>, crown_amount <dbl>,
      #   total_payouts <dbl>, contest_state <chr>, payout_descriptions_cash <chr>,
      #   attributes_league <chr>, and abbreviated variable names ...

# get_contests() returns expected results

    Code
      d
    Output
      # A tibble: 2,390 x 54
            uc    ec   mec   fpp     s n          nt      m     a     po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>   <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>  
       1     0     0   150    15     1 NFL $~  79937 117647    15 1.5 e6 FALSE Thu 8:~
       2     0     0    60   222     1 NFL S~   1356   2002   222 4   e5 FALSE Thu 8:~
       3     0     0   150    15     4 NBA $~  22307  26117    15 3.33e5 FALSE Thu 7:~
       4     0     0    21   555     4 NBA $~    686    700   555 3.5 e5 FALSE Thu 7:~
       5     0     0     1   555     4 NBA $~      3     16   555 8   e3 FALSE Thu 7:~
       6     0     0    20     3     1 NFL S~ 101198 138723     3 3.5 e5 FALSE Thu 8:~
       7     0     0     6  2120     1 NFL S~    144    200  2120 4   e5 FALSE Thu 8:~
       8     0     0   150    20     1 NFL $~  20604 148392    20 2.52e6 FALSE Sun 1:~
       9     0     0    75  2222     1 NFL $~    775   2511  2222 5.02e6 FALSE Sun 1:~
      10     0     0     3   444     1 NFL S~    183    300   444 1.2 e5 FALSE Thu 8:~
      # ... with 2,380 more rows, 42 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_is_starred <chr>,
      #   pd_cash <chr>, attr_lobby_class <chr>, pd_contest_seat <chr>, ...

# get_gametype_rules() returns expected results

    Code
      d
    Output
      # A tibble: 1 x 25
        game_type_id game_ty~1 game_~2 lineu~3 uniqu~4 allow~5 error~6 rules~7 draft~8
               <int> <chr>     <chr>     <int> <lgl>   <lgl>   <lgl>   <chr>   <chr>  
      1          159 Madden S~ Create~      81 TRUE    FALSE   NA      /help/~ Salary~
      # ... with 16 more variables: allowed_competition_attributes <lgl>,
      #   scoring_divider <lgl>, use_optimal_lineups <lgl>,
      #   supports_players_tab <lgl>, show_bye_week_info <lgl>,
      #   original_draft_type <lgl>, is_season_long <lgl>,
      #   salary_cap_is_enabled <lgl>, salary_cap_min_value <int>,
      #   salary_cap_max_value <int>, game_count_is_enabled <lgl>,
      #   game_count_min_value <lgl>, game_count_max_value <lgl>, ...

