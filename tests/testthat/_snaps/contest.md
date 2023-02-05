# dk_get_lobby_contests() returns expected results

    Code
      d
    Output
      # A tibble: 904 x 53
            uc    ec   mec   fpp     s n           nt      m     a    po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>    <dbl>  <dbl> <dbl> <dbl> <lgl> <chr>  
       1     0     0   150    20    13 PGA TO~   7179  11764    20 2  e5 FALSE Sun 3:~
       2     0     0     7   555    13 PGA TO~    177    240   555 1.2e5 FALSE Sun 3:~
       3     0     0   150    15     1 NFL Sh~  74191 470588    15 6  e6 FALSE Sun 6:~
       4     0     0    22  4444     1 NFL Sh~    132    750  4444 3  e6 FALSE Sun 6:~
       5     0     0    18    10    13 PGA TO~   1258   2352    10 2  e4 FALSE Sun 3:~
       6     0     0   150     5    13 PGA TO~   5000   7134     5 3  e4 FALSE Sun 3:~
       7     0     0    11   888     4 NBA $3~    293    375   888 3  e5 FALSE Sun 6:~
       8     0     0   150    15     4 NBA $3~  12804  23529    15 3  e5 FALSE Sun 6:~
       9     0     0    20     3     1 NFL Sh~ 104224 475624     3 1.2e6 FALSE Sun 6:~
      10     0     0   150   333     1 NFL Sh~    741   5005   333 1.5e6 FALSE Sun 6:~
      # ... with 894 more rows, 41 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_is_starred <chr>,
      #   pd_cash <chr>, attr_lobby_class <chr>, pd_ticket <chr>, ...

# dk_get_lobby_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 25 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1        87 Show~ Create~ ""         13 Salary~ FALSE   41      13      2      
       2        96 Show~ Create~ ""          1 Salary~ FALSE   48      1       2      
       3        70 Clas~ Create~ ""          4 Salary~ FALSE   5       4       2      
       4       173 Clas~ Create~ ""         10 Salary~ FALSE   25      10      1      
       5         6 Clas~ Create~ ""         13 Salary~ FALSE   20      13      1      
       6        73 Tiers Our no~ ""          4 Tiered  FALSE   6       4       6      
       7        81 Show~ Create~ ""          4 Salary~ FALSE   38      4       3      
       8       122 Clas~ Create~ ""         12 Salary~ FALSE   17      12      1      
       9       159 Madd~ Create~ ""          1 Salary~ FALSE   97      1       13     
      10       106 Sing~ Create~ ""         16 Salary~ FALSE   44      16      1      
      # ... with 15 more rows, 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

