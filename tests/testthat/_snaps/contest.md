# dk_get_lobby_contests() returns expected results

    Code
      d
    Output
      # A tibble: 581 x 48
            uc    ec   mec   fpp     s n          nt      m     a     po tix   sdstr~1
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>   <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>  
       1     0     0   150    15     1 NFL Sh~ 15524 470588    15 6   e6 FALSE Sun 6:~
       2     0     0    22  4444     1 NFL Sh~    47    750  4444 3   e6 FALSE Sun 6:~
       3     0     0   150    15     4 NBA $4~  7822  31372    15 4   e5 FALSE Mon 7:~
       4     0     0     2  2120     4 NBA $1~    17     67  2120 1.34e5 FALSE Mon 7:~
       5     0     0    20     3     1 NFL Sh~ 21845 475624     3 1.2 e6 FALSE Sun 6:~
       6     0     0   150   333     1 NFL Sh~   205   5005   333 1.5 e6 FALSE Sun 6:~
       7     0     0    22   600     4 NBA $4~   247    740   600 4   e5 FALSE Mon 7:~
       8     0     0     1    40     4 NBA $3~   293    874    40 3   e4 FALSE Mon 7:~
       9     0     0   150    25    10 NAS $2~  1881 106949    25 2.27e6 FALSE Sun 2:~
      10     0     0   150    10    10 NAS $2~   266  23529    10 2   e5 FALSE Sun 8:~
      # ... with 571 more rows, 36 more variables: sd <chr>, id <dbl>, tmpl <dbl>,
      #   pt <dbl>, so <dbl>, fwt <lgl>, is_owner <lgl>, start_time_type <dbl>,
      #   dg <dbl>, ulc <dbl>, cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>,
      #   cso <dbl>, ir <dbl>, rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>,
      #   free_with_crowns <lgl>, crown_amount <dbl>, is_bonus_finalized <lgl>,
      #   is_snake_draft <lgl>, attr_is_guaranteed <chr>, attr_lobby_class <chr>,
      #   attr_is_starred <chr>, pd_cash <chr>, pd_ticket <chr>, ...

# dk_get_lobby_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 18 x 15
         game_ty~1 name  descr~2 tag   sport~3 draft~4 is_se~5 game_~6 game_~7 game_~8
             <int> <chr> <chr>   <chr>   <int> <chr>   <lgl>   <chr>   <chr>   <chr>  
       1        96 Show~ "Creat~ ""          1 Salary~ FALSE   48      1       2      
       2        70 Clas~ "Creat~ ""          4 Salary~ FALSE   5       4       2      
       3       173 Clas~ "Creat~ ""         10 Salary~ FALSE   25      10      1      
       4         6 Clas~ "Creat~ ""         13 Salary~ FALSE   20      13      1      
       5       109 Clas~ "Creat~ ""         11 Salary~ FALSE   59      11      1      
       6       158 Madd~ "Creat~ ""          1 Salary~ FALSE   96      1       12     
       7       127 Show~ "Creat~ ""          3 Salary~ FALSE   71      3       2      
       8       106 Sing~ "Creat~ ""         16 Salary~ FALSE   44      16      1      
       9       122 Clas~ "Creat~ ""         12 Salary~ FALSE   17      12      1      
      10       123 Show~ "Creat~ ""         12 Salary~ FALSE   39      12      2      
      11       168 Clas~ "Creat~ ""          9 Salary~ FALSE   23      9       1      
      12        81 Show~ "Creat~ ""          4 Salary~ FALSE   38      4       3      
      13        98 Clas~ "Creat~ ""          6 Salary~ FALSE   50      6       1      
      14       159 Madd~ "Creat~ ""          1 Salary~ FALSE   97      1       13     
      15        73 Tiers "Our n~ ""          4 Tiered  FALSE   6       4       6      
      16        97 Show~ "Creat~ ""          6 Salary~ FALSE   49      6       2      
      17       112 In-G~ "Draft~ ""          4 Salary~ FALSE   61      4       7      
      18       113 In-G~ "Draft~ ""          4 Salary~ FALSE   61      4       7      
      # ... with 5 more variables: game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>, and abbreviated
      #   variable names 1: game_type_id, 2: description, 3: sport_id, 4: draft_type,
      #   5: is_season_long, 6: game_style_id, 7: game_style_sport_id,
      #   8: game_style_sort_order

