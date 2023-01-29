# dk_get_lobby_contests() returns expected results

    Code
      d
    Output
      # A tibble: 917 x 52
            uc    ec   mec   fpp     s n            nt     m     a    po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>     <dbl> <dbl> <dbl> <dbl> <lgl> <chr>  
       1     0     0   150    20     1 NFL $500~ 13843 29411    20 5  e5 FALSE Sun 3:~
       2     0     0    30   333     1 NFL $300~   526  1001   333 3  e5 FALSE Sun 3:~
       3     0     0    20     3     1 NFL $100~ 27028 39635     3 1  e5 FALSE Sun 3:~
       4     0     0   150    15     1 NFL $500~ 37961 39215    15 5  e5 FALSE Sun 3:~
       5     0     0   150    15     1 NFL $100~  2702  7843    15 1  e5 FALSE Sun 3:~
       6     0     0   150    15     1 NFL $1M ~ 34435 78431    15 1  e6 FALSE Sun 6:~
       7     0     0     1    12     1 NFL $40K~   476  3921    12 4  e4 FALSE Sun 3:~
       8     0     0     1    12     1 NFL $10K~   169   980    12 1  e4 FALSE Sun 3:~
       9     0     0    30   222     1 NFL Show~   762  1001   222 2  e5 FALSE Sun 3:~
      10     0     0     2   222     1 NFL Show~     4    75   222 1.5e4 FALSE Sun 3:~
      # ... with 907 more rows, 40 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
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
      # A tibble: 27 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1         1 Clas~ Create~ ""          1 Salary~ FALSE   1       1       1      
       2        96 Show~ Create~ ""          1 Salary~ FALSE   48      1       2      
       3       173 Clas~ Create~ ""         10 Salary~ FALSE   25      10      1      
       4        81 Show~ Create~ ""          4 Salary~ FALSE   38      4       3      
       5        70 Clas~ Create~ ""          4 Salary~ FALSE   5       4       2      
       6       125 Clas~ Create~ ""          3 Salary~ FALSE   13      3       1      
       7       123 Show~ Create~ ""         12 Salary~ FALSE   39      12      2      
       8         6 Clas~ Create~ ""         13 Salary~ FALSE   20      13      1      
       9       122 Clas~ Create~ ""         12 Salary~ FALSE   17      12      1      
      10        51 Tiers Our no~ ""          1 Tiered  FALSE   2       1       4      
      # ... with 17 more rows, 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

