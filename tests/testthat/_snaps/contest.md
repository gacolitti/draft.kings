# dk_get_lobby_contests() returns expected results

    Code
      d
    Output
      # A tibble: 904 x 53
            uc    ec   mec   fpp     s n         nt      m     a     po tix   sdstring
         <dbl> <dbl> <dbl> <dbl> <dbl> <chr>  <dbl>  <dbl> <dbl>  <dbl> <lgl> <chr>   
       1     0     0   150    20    13 PGA ~   7179  11764    20 2   e5 FALSE Sun 3:0~
       2     0     0     7   555    13 PGA ~    177    240   555 1.20e5 FALSE Sun 3:0~
       3     0     0   150    15     1 NFL ~  74191 470588    15 6   e6 FALSE Sun 6:3~
       4     0     0    22  4444     1 NFL ~    132    750  4444 3   e6 FALSE Sun 6:3~
       5     0     0    18    10    13 PGA ~   1258   2352    10 2   e4 FALSE Sun 3:0~
       6     0     0   150     5    13 PGA ~   5000   7134     5 3   e4 FALSE Sun 3:0~
       7     0     0    11   888     4 NBA ~    293    375   888 3   e5 FALSE Sun 6:0~
       8     0     0   150    15     4 NBA ~  12804  23529    15 3   e5 FALSE Sun 6:0~
       9     0     0    20     3     1 NFL ~ 104224 475624     3 1.20e6 FALSE Sun 6:3~
      10     0     0   150   333     1 NFL ~    741   5005   333 1.5 e6 FALSE Sun 6:3~
      # i 894 more rows
      # i 41 more variables: sd <chr>, id <dbl>, tmpl <dbl>, pt <dbl>, so <dbl>,
      #   fwt <lgl>, is_owner <lgl>, start_time_type <dbl>, dg <dbl>, ulc <dbl>,
      #   cs <dbl>, game_type <chr>, ssd <lgl>, dgpo <dbl>, cso <dbl>, ir <dbl>,
      #   rl <lgl>, rlc <dbl>, rll <dbl>, sa <lgl>, free_with_crowns <lgl>,
      #   crown_amount <dbl>, is_bonus_finalized <lgl>, is_snake_draft <lgl>,
      #   attr_is_guaranteed <chr>, attr_is_starred <chr>, pd_cash <chr>, ...

# dk_get_lobby_game_types() returns expected results

    Code
      d
    Output
      # A tibble: 25 x 15
         game_type_id name        description tag   sport_id draft_type is_season_long
                <int> <chr>       <chr>       <chr>    <int> <chr>      <lgl>         
       1           87 Showdown    Create you~ ""          13 SalaryCap  FALSE         
       2           96 Showdown C~ Create you~ ""           1 SalaryCap  FALSE         
       3           70 Classic     Create an ~ ""           4 SalaryCap  FALSE         
       4          173 Classic     Create a 6~ ""          10 SalaryCap  FALSE         
       5            6 Classic     Create a 6~ ""          13 SalaryCap  FALSE         
       6           73 Tiers       Our no-sal~ ""           4 Tiered     FALSE         
       7           81 Showdown C~ Create you~ ""           4 SalaryCap  FALSE         
       8          122 Classic     Create an ~ ""          12 SalaryCap  FALSE         
       9          159 Madden Sho~ Create you~ ""           1 SalaryCap  FALSE         
      10          106 Single Mat~ Create a 6~ ""          16 SalaryCap  FALSE         
      # i 15 more rows
      # i 8 more variables: game_style_id <chr>, game_style_sport_id <chr>,
      #   game_style_sort_order <chr>, game_style_name <chr>,
      #   game_style_abbreviation <chr>, game_style_description <chr>,
      #   game_style_is_enabled <chr>, game_style_attributes <chr>

