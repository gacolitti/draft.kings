# dk_get_competitions() returns expected results for Classic NFL game type

    Code
      d
    Output
      # A tibble: 15 x 28
         competition_id sport start_time      competition_state competition_state_de~1
                  <int> <chr> <chr>           <chr>             <lgl>                 
       1        5673424 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
       2        5673442 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
       3        5673748 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
       4        5674390 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
       5        5674408 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
       6        5674426 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
       7        5674444 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
       8        5674456 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
       9        5674474 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
      10        5674492 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
      11        5675369 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
      12        5675399 NFL   2021-01-03T18:~ ScoresOfficial    NA                    
      13        5675429 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
      14        5675441 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
      15        5675459 NFL   2021-01-03T21:~ ScoresOfficial    NA                    
      # i abbreviated name: 1: competition_state_detail
      # i 23 more variables: time_remaining_status <chr>, home_team_team_id <int>,
      #   home_team_team_name <chr>, home_team_team_abbreviation <chr>,
      #   home_team_team_city <chr>, home_team_primary_color <chr>,
      #   home_team_secondary_color <chr>, home_team_tertiary_color <chr>,
      #   home_team_team_logo_url <chr>, home_team_dark_mode_team_logo_url <chr>,
      #   away_team_team_id <int>, away_team_team_name <chr>, ...

# dk_get_competitions() returns expected results for Showdown NFL game type

    Code
      d
    Output
      # A tibble: 1 x 28
        competition_id sport start_time       competition_state competition_state_de~1
                 <int> <chr> <chr>            <chr>             <lgl>                 
      1        5819761 NFL   2022-10-10T00:2~ ScoresOfficial    NA                    
      # i abbreviated name: 1: competition_state_detail
      # i 23 more variables: time_remaining_status <chr>, home_team_team_id <int>,
      #   home_team_team_name <chr>, home_team_team_abbreviation <chr>,
      #   home_team_team_city <chr>, home_team_primary_color <chr>,
      #   home_team_secondary_color <chr>, home_team_tertiary_color <chr>,
      #   home_team_team_logo_url <chr>, home_team_dark_mode_team_logo_url <chr>,
      #   away_team_team_id <int>, away_team_team_name <chr>, ...

