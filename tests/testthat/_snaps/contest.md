# get_contests() returns expected results

    Code
      d
    Output
      # A tibble: 2,255 x 54
            uc    ec   mec   fpp     s n          nt      m     a     po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>   <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>  
       1     0     0     3    15     3 NHL $1~    61    117    15 1.5 e3 FALSE Fri 7:~
       2     0     0     1   121     3 NHL $4~    28     44   121 4.8 e3 FALSE Fri 7:~
       3     0     0   150    20     1 NFL $2~ 33323 148392    20 2.52e6 FALSE Sun 1:~
       4     0     0    75  2222     1 NFL $5~  1063   2511  2222 5.02e6 FALSE Sun 1:~
       5     0     0   150    15     4 NBA $3~ 22999  27450    15 3.5 e5 FALSE Fri 7:~
       6     0     0    25   600     4 NBA $4~   704    835   600 4.51e5 FALSE Fri 7:~
       7     0     0   100   333     1 NFL $1~   947   3336   333 1   e6 FALSE Sun 1:~
       8     0     0     5    33     1 NFL $2~  1299   7067    33 2   e5 FALSE Sun 1:~
       9     0     0    20     4     4 NBA $1~ 27654  29726     4 1   e5 FALSE Fri 7:~
      10     0     0     8     4     4 NBA $1~    31    297     4 1   e3 FALSE Fri 7:~
      # ... with 2,245 more rows, 42 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_is_starred <chr>,
      #   pd_cash <chr>, attr_lobby_class <chr>, pd_contest_seat <chr>, ...

# get_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 25 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1       125 Clas~ Create~ ""          3 Salary~ FALSE   13      3       1      
       2         1 Clas~ Create~ ""          1 Salary~ FALSE   1       1       1      
       3        70 Clas~ Create~ ""          4 Salary~ FALSE   5       4       2      
       4        73 Tiers Our no~ ""          4 Tiered  FALSE   6       4       6      
       5        98 Clas~ Create~ ""          6 Salary~ FALSE   50      6       1      
       6       158 Madd~ Create~ ""          1 Salary~ FALSE   96      1       12     
       7       122 Clas~ Create~ ""         12 Salary~ FALSE   17      12      1      
       8        94 Clas~ Create~ ""          5 Salary~ FALSE   46      5       1      
       9       127 Show~ Create~ ""          3 Salary~ FALSE   71      3       2      
      10         6 Clas~ Create~ ""         13 Salary~ FALSE   20      13      1      
      # ... with 15 more rows, 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

