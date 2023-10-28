# dk_get_leaderboard() works

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 20
      $ draft_group_id          <int> 75284, 75284, 75284, 75284, 75284
      $ contest_key             <chr> "133645678", "133645678", "133645678", "133645678", "133645678"
      $ entry_key               <chr> "3411015380", "3414445043", "3416518654", "3410462084", "3416166137"
      $ lineup_id               <int> -1, -1, -1, -1, -1
      $ user_name               <chr> "ChipotleAddict", "TomCota", "Jakethasnke1", "Svoboda996", "BIGChief1978"
      $ user_key                <chr> "566634", "14381198", "9466", "19391381", "4299956"
      $ user_entry_count        <int> 6, 1, 1, 1, 1
      $ user_entry_index        <int> 6, 1, 1, 1, 1
      $ time_remaining          <int> 0, 0, 0, 0, 0
      $ time_remaining_unit     <chr> "PMR", "PMR", "PMR", "PMR", "PMR"
      $ max_time_remaining      <int> 360, 360, 360, 360, 360
      $ time_remaining_opponent <int> 0, 0, 0, 0, 0
      $ rank                    <int> 57, 167, 129, 162, 43
      $ fantasy_points          <dbl> 79.14, 64.84, 70.98, 65.39, 81.78
      $ fantasy_points_opponent <dbl> 101.41, 101.41, 101.41, 101.41, 101.41
      $ user_name_opponent      <chr> "GenoMike21", "GenoMike21", "GenoMike21", "GenoMike21", "GenoMike21"
      $ number_tickets_won      <int> NA, NA, NA, NA, NA
      $ tickets_value           <int> 0, 0, 0, 0, 0
      $ winning_value           <int> 0, 0, 0, 0, 0
      $ winnings                <list> <NULL>, <NULL>, <NULL>, <NULL>, <NULL>

# dk_get_entries() works

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 29
      $ contest_key                <chr> "140039397", "140039397", "140039397", "140039397", "140039397"
      $ entry_key                  <chr> "3618897002", "3618897002", "3618408508", "3618408508", "3618897002"
      $ user_key                   <chr> "1510", "1510", "11222656", "11222656", "1510"
      $ draft_group_id             <int> 80584, 80584, 80584, 80584, 80584
      $ lineup_id                  <int> -1, -1, -1, -1, -1
      $ first_name                 <chr> "Tyreek", "Cole", "Cole", "Tyreek", "Cole"
      $ last_name                  <chr> "Hill", "Beasley", "Beasley", "Hill", "Beasley"
      $ short_name                 <chr> "T. Hill", "C. Beasley", "C. Beasley", "T. Hill", "C. Beasley"
      $ display_name               <chr> "Tyreek Hill", "Cole Beasley", "Cole Beasley", "Tyreek Hill", "Cole Beasley"
      $ roster_position_id         <int> 512, 512, 512, 512, 512
      $ roster_position            <chr> "FLEX", "FLEX", "FLEX", "FLEX", "FLEX"
      $ roster_position_sort_order <int> 2, 2, 2, 2, 2
      $ e_tag                      <chr> "305", "344", "344", "305", "344"
      $ percent_drafted            <dbl> 29.75, 13.50, 13.50, 29.75, 13.50
      $ draftable_id               <int> 26368976, 26369002, 26369002, 26368976, 26369002
      $ score                      <dbl> 16.4, 11.5, 11.5, 16.4, 11.5
      $ stats_description          <chr> "69 RecYds, 5 RuYds, 7 REC, 1 2PT", "1 RecTD, 35 RecYds, 2 REC", "1 RecTD, 35 RecYds, 2 REC", "69 RecYds, 5 RuYds, 7 REC, 1 2PT", "1 RecTD, 35 RecYds, 2 REC"
      $ time_remaining_unit        <chr> "PMR", "PMR", "PMR", "PMR", "PMR"
      $ time_remaining             <int> 0, 0, 0, 0, 0
      $ max_time_remaining         <int> 0, 0, 0, 0, 0
      $ percent_drafted_cp         <chr> "2.03", "0.44", "0.44", "2.03", "0.44"
      $ player_deep_link           <chr> "dklive://NFL/boxscores?gameid=5819869", "dklive://NFL/boxscores?gameid=5819869", "dklive://NFL/boxscores?gameid=5819869", "dklive://NFL/boxscores?gameid=5819869",~
      $ player_projection_icon     <chr> "", "fire", "fire", "", "fire"
      $ stat_id                    <int> 38, 37, 37, 48, 467
      $ name                       <chr> "Rushing Touchdowns", "Receiving Touchdowns", "Receiving Touchdowns", "100+ Rushing Game", "Targets"
      $ abbreviation               <chr> "RuTD", "RecTD", "RecTD", "100+Rush", "Targets"
      $ fantasy_points             <dbl> 0, 6, 6, 0, 0
      $ stat_value                 <int> 0, 1, 1, 0, 5
      $ contributes_to_scoring     <lgl> TRUE, TRUE, TRUE, TRUE, FALSE

