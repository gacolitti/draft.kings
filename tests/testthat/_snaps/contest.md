# get_contests() returns expected results

    Code
      d
    Output
      # A tibble: 1,432 x 52
            uc    ec   mec   fpp     s n          nt      m     a     po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>   <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>  
       1     0     0   150    20     1 NFL $~ 104723 205882    20 3.5 e6 FALSE Sun 3:~
       2     0     0   100   333     1 NFL $~   1865   3336   333 1   e6 FALSE Sun 3:~
       3     0     0     4   222     4 NBA $~     90    134   222 2.68e4 FALSE Sat 3:~
       4     0     0    12   888     4 NBA $~    244    416   888 3.33e5 FALSE Sat 7:~
       5     0     0     1  1500     4 NBA $~      2      9  1500 1.27e4 FALSE Sat 3:~
       6     0     0     7    15     4 NBA $~     56    235    15 3   e3 FALSE Sat 3:~
       7     0     0    20     1     4 NBA $~   4194   5945     1 5   e3 FALSE Sat 3:~
       8     0     0   150    15     4 NBA S~   1412   7843    15 1   e5 FALSE Sat 10~
       9     0     0    20     1     4 NBA S~   2787  11890     1 1   e4 FALSE Sat 10~
      10     0     0   150    15     4 NBA $~   2384   7843    15 1   e5 FALSE Sat 9:~
      # ... with 1,422 more rows, 40 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_lobby_class <chr>,
      #   attr_is_starred <chr>, pd_cash <chr>, pd_ticket <chr>, ...

# get_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 30 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1         1 Clas~ Create~ ""          1 Salary~ FALSE   1       1       1      
       2        70 Clas~ Create~ ""          4 Salary~ FALSE   5       4       2      
       3        81 Show~ Create~ ""          4 Salary~ FALSE   38      4       3      
       4       173 Clas~ Create~ ""         10 Salary~ FALSE   25      10      1      
       5       125 Clas~ Create~ ""          3 Salary~ FALSE   13      3       1      
       6       123 Show~ Create~ ""         12 Salary~ FALSE   39      12      2      
       7        96 Show~ Create~ ""          1 Salary~ FALSE   48      1       2      
       8       122 Clas~ Create~ ""         12 Salary~ FALSE   17      12      1      
       9        98 Clas~ Create~ ""          6 Salary~ FALSE   50      6       1      
      10         6 Clas~ Create~ ""         13 Salary~ FALSE   20      13      1      
      # ... with 20 more rows, 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

