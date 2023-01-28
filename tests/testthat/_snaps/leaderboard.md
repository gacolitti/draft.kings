# dk_get_leaderboard() works

    Code
      d
    Output
      # A tibble: 215 x 20
         draft_group~1 conte~2 entry~3 lineu~4 user_~5 user_~6 user_~7 user_~8 time_~9
                 <int> <chr>   <chr>     <int> <chr>   <chr>     <int>   <int>   <int>
       1         75284 133645~ 341235~      -1 GenoMi~ 642864        1       1       0
       2         75284 133645~ 341620~      -1 carlit~ 1334845       1       1       0
       3         75284 133645~ 341631~      -1 KidRai~ 5752908       1       1       0
       4         75284 133645~ 341641~      -1 carlos~ 8636059       1       1       0
       5         75284 133645~ 341603~      -1 sjamo35 8672865       6       3       0
       6         75284 133645~ 341664~      -1 Jace20~ 117637~       1       1       0
       7         75284 133645~ 341668~      -1 Bucknu~ 417423        2       1       0
       8         75284 133645~ 341557~      -1 JWolff~ 136926~       2       1       0
       9         75284 133645~ 341658~      -1 eracnr~ 2374855       1       1       0
      10         75284 133645~ 341548~      -1 Maria2~ 3405766       1       1       0
      # ... with 205 more rows, 11 more variables: time_remaining_unit <chr>,
      #   max_time_remaining <int>, time_remaining_opponent <int>, rank <int>,
      #   fantasy_points <dbl>, fantasy_points_opponent <dbl>,
      #   user_name_opponent <chr>, number_tickets_won <int>, tickets_value <int>,
      #   winning_value <int>, winnings <list>, and abbreviated variable names
      #   1: draft_group_id, 2: contest_key, 3: entry_key, 4: lineup_id,
      #   5: user_name, 6: user_key, 7: user_entry_count, 8: user_entry_index, ...

# dk_get_entries() works

    Code
      d
    Output
      # A tibble: 76 x 29
         contest_key entry_key user_~1 draft~2 lineu~3 first~4 last_~5 short~6 displ~7
         <chr>       <chr>     <chr>     <int>   <int> <chr>   <chr>   <chr>   <chr>  
       1 140039397   36184085~ 112226~   80584      -1 Cole    Beasley C. Bea~ Cole B~
       2 140039397   36184085~ 112226~   80584      -1 Cole    Beasley C. Bea~ Cole B~
       3 140039397   36184085~ 112226~   80584      -1 Cole    Beasley C. Bea~ Cole B~
       4 140039397   36184085~ 112226~   80584      -1 Cole    Beasley C. Bea~ Cole B~
       5 140039397   36184085~ 112226~   80584      -1 Cole    Beasley C. Bea~ Cole B~
       6 140039397   36184085~ 112226~   80584      -1 Gabe    Davis   G. Dav~ Gabe D~
       7 140039397   36184085~ 112226~   80584      -1 Gabe    Davis   G. Dav~ Gabe D~
       8 140039397   36184085~ 112226~   80584      -1 Gabe    Davis   G. Dav~ Gabe D~
       9 140039397   36184085~ 112226~   80584      -1 Gabe    Davis   G. Dav~ Gabe D~
      10 140039397   36184085~ 112226~   80584      -1 Gabe    Davis   G. Dav~ Gabe D~
      # ... with 66 more rows, 20 more variables: roster_position_id <int>,
      #   roster_position <chr>, roster_position_sort_order <int>, e_tag <chr>,
      #   percent_drafted <dbl>, draftable_id <int>, score <dbl>,
      #   stats_description <chr>, time_remaining_unit <chr>, time_remaining <int>,
      #   max_time_remaining <int>, percent_drafted_cp <chr>, player_deep_link <chr>,
      #   player_projection_icon <chr>, stat_id <int>, name <chr>,
      #   abbreviation <chr>, fantasy_points <dbl>, stat_value <int>, ...

