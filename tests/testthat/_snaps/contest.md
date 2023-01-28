# get_contests() returns expected results

    Code
      d
    Output
      # A tibble: 1,529 x 52
            uc    ec   mec   fpp     s n          nt      m     a     po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>   <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>  
       1     0     0   150    25    13 PGA T~  11014  14117    25 3   e5 FALSE Sat 12~
       2     0     0   150    20     1 NFL $~  95421 205882    20 3.5 e6 FALSE Sun 3:~
       3     0     0   100   333     1 NFL $~   1686   3336   333 1   e6 FALSE Sun 3:~
       4     0     0    12   888     4 NBA $~    131    416   888 3.33e5 FALSE Sat 7:~
       5     0     0   150    15     4 NBA $~   5692  23529    15 3   e5 FALSE Sat 7:~
       6     0     0   150    15     4 NBA $~   3136   7843    15 1   e5 FALSE Sat 3:~
       7     0     0   150    15     4 NBA $~   1223   7843    15 1   e5 FALSE Sat 9:~
       8     0     0     7  4444     1 NFL $~    122    250  4444 1   e6 FALSE Sun 3:~
       9     0     0    20     3     1 NFL $~ 155606 317082     3 8   e5 FALSE Sun 3:~
      10     0     0    47    15     6 CBB $~   1227   1568    15 2   e4 FALSE Sat 12~
      # ... with 1,519 more rows, 40 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_is_starred <chr>,
      #   pd_cash <chr>, attr_lobby_class <chr>, pd_ticket <chr>, ...

# get_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 30 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1        87 Show~ Create~ ""         13 Salary~ FALSE   41      13      2      
       2         1 Clas~ Create~ ""          1 Salary~ FALSE   1       1       1      
       3        70 Clas~ Create~ ""          4 Salary~ FALSE   5       4       2      
       4        98 Clas~ Create~ ""          6 Salary~ FALSE   50      6       1      
       5       173 Clas~ Create~ ""         10 Salary~ FALSE   25      10      1      
       6        81 Show~ Create~ ""          4 Salary~ FALSE   38      4       3      
       7       125 Clas~ Create~ ""          3 Salary~ FALSE   13      3       1      
       8       154 Capt~ Create~ ""         13 Salary~ FALSE   92      13      2      
       9        96 Show~ Create~ ""          1 Salary~ FALSE   48      1       2      
      10       123 Show~ Create~ ""         12 Salary~ FALSE   39      12      2      
      # ... with 20 more rows, 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

