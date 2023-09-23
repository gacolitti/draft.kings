# dk_get_draft_group() works when passed a draftgroup ID

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 24
      $ draftable_id           <dbl> 24651646, 24651627, 24651606, 24651625, 24651628
      $ first_name             <chr> "Kawaan", "Deonte", "Davante", "Wil", "Tre'Quan"
      $ last_name              <chr> "Baker", "Harty", "Adams", "Lutz", "Smith"
      $ display_name           <chr> "Kawaan Baker", "Deonte Harty", "Davante Adams", "Wil Lutz", "Tre'Quan Smith"
      $ short_name             <chr> "K. Baker", "D. Harty", "D. Adams", "W. Lutz", "T. Smith"
      $ player_id              <dbl> 951485, 1166545, 611417, 700299, 838415
      $ player_dk_id           <dbl> 560956, 18497, 19493, 18657, 18806
      $ position               <chr> "WR", "WR", "WR", "K", "WR"
      $ roster_slot_id         <dbl> 511, 511, 511, 511, 511
      $ salary                 <dbl> 1500, 4200, 15900, 5400, 3600
      $ status                 <chr> "None", "None", "None", "None", "None"
      $ is_swappable           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ is_disabled            <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ news_status            <chr> "None", "Recent", "Breaking", "Breaking", "Breaking"
      $ player_image50         <chr> "https://dkn.gs/sports/images/nfl/players/50/560956.png", "https://dkn.gs/sports/images/nfl/players/50/18497.png", "https://dkn.gs/sports/images/nfl/players/50/19493.p~
      $ player_image160        <chr> "https://dkn.gs/sports/images/nfl/players/160/560956.png", "https://dkn.gs/sports/images/nfl/players/160/18497.png", "https://dkn.gs/sports/images/nfl/players/160/1949~
      $ alt_player_image50     <chr> "", "", "", "", ""
      $ alt_player_image160    <chr> "", "", "", "", ""
      $ team_id                <dbl> 350, 350, 341, 350, 350
      $ team_abbreviation      <chr> "NO", "NO", "LV", "NO", "NO"
      $ player_game_hash       <chr> "951485-5915939", "1166545-5915939", "611417-5915939", "700299-5915939", "838415-5915939"
      $ competition_id         <dbl> 5915939, 5915939, 5915939, 5915939, 5915939
      $ competition_name       <chr> "NO @ LV", "NO @ LV", "NO @ LV", "NO @ LV", "NO @ LV"
      $ competition_start_time <chr> "2022-10-08T18:00:00.0000000Z", "2022-10-08T18:00:00.0000000Z", "2022-10-08T18:00:00.0000000Z", "2022-10-08T18:00:00.0000000Z", "2022-10-08T18:00:00.0000000Z"

# dk_get_draft_group() works when passed a contest ID

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 22
      $ draftable_id           <dbl> 4374353, 4374400, 4373745, 4374278, 4373887
      $ first_name             <chr> "Charlie", "Travis", "Archie", "Jedd", "Boone"
      $ last_name              <chr> "Culberson", "Snider", "Bradley", "Gyorko", "Logan"
      $ display_name           <chr> "Charlie Culberson", "Travis Snider", "Archie Bradley", "Jedd Gyorko", "Boone Logan"
      $ short_name             <chr> "C. Culberson", "T. Snider", "A. Bradley", "J. Gyorko", "B. Logan"
      $ player_id              <dbl> 389929, 326476, 597753, 526816, 244205
      $ player_dk_id           <dbl> 0, 0, 0, 0, 0
      $ position               <chr> "2B/SS", "OF", "SP", "2B/3B", "RP"
      $ roster_slot_id         <dbl> 55, 56, 50, 54, 50
      $ salary                 <dbl> 3000, 3700, 5700, 3200, 4000
      $ status                 <chr> "None", "None", "None", "None", "None"
      $ is_swappable           <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ is_disabled            <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ news_status            <chr> "None", "None", "None", "None", "None"
      $ player_image50         <chr> "https://dkn.gs/playerimages/m/mlb_50/389929.png", "https://dkn.gs/playerimages/m/mlb_50/326476.png", "https://dkn.gs/playerimages/m/mlb_50/597753.png", "https://dkn.g~
      $ player_image160        <chr> "https://dkn.gs/playerimages/m/mlb_retina/389929.png", "https://dkn.gs/playerimages/m/mlb_retina/326476.png", "https://dkn.gs/playerimages/m/mlb_retina/597753.png", "h~
      $ team_id                <dbl> 251, 225, 253, 249, 251
      $ team_abbreviation      <chr> "COL", "BAL", "ARI", "SD", "COL"
      $ player_game_hash       <chr> "389929-1499829", "326476-1498315", "597753-1500189", "526816-1499105", "244205-1499829"
      $ competition_id         <dbl> 1499829, 1498315, 1500189, 1499105, 1499829
      $ competition_name       <chr> "SF @ COL", "BOS @ BAL", "PIT @ ARI", "LAD @ SD", "SF @ COL"
      $ competition_start_time <chr> "2015-04-25T00:40:00.0000000Z", "2015-04-24T23:05:00.0000000Z", "2015-04-25T01:40:00.0000000Z", "2015-04-25T02:10:00.0000000Z", "2015-04-25T00:40:00.0000000Z"

# dk_get_lobby_draft_groups() returns expected data

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 17
      $ draft_group_id            <dbl> 83904, 83829, 83426, 83860, 83830
      $ contest_type_id           <dbl> 106, 81, 253, 73, 70
      $ start_date                <chr> "2023-03-12T20:30:00.0000000Z", "2023-03-13T23:00:00.0000000Z", "2023-03-12T20:00:00.0000000Z", "2023-03-12T22:00:00.0000000Z", "2023-03-13T23:30:00.0000000Z"
      $ start_date_est            <chr> "2023-03-12T16:30:00.0000000", "2023-03-13T19:00:00.0000000", "2023-03-12T16:00:00.0000000", "2023-03-12T18:00:00.0000000", "2023-03-13T19:30:00.0000000"
      $ sort_order                <dbl> 999, 999, 4, 999, 999
      $ draft_group_tag           <chr> "", "", "Featured", "Featured", ""
      $ game_type_id              <dbl> 106, 81, 253, 73, 70
      $ game_type                 <lgl> NA, NA, NA, NA, NA
      $ sport_sort_order          <dbl> 14, 3, 0, 3, 3
      $ sport                     <chr> "TEN", "NBA", "NFL", "NBA", "NBA"
      $ game_count                <dbl> 8, 1, 2, 4, 3
      $ contest_start_time_suffix <chr> " (Late)", " (IND vs DET)", " (XFL Sun Only)", " (NBA Tiers)", " (Turbo)"
      $ contest_start_time_type   <dbl> 0, 0, 0, 0, 0
      $ games                     <lgl> NA, NA, NA, NA, NA
      $ draft_group_series_id     <dbl> 0, 0, 156, 0, 0
      $ game_set_key              <chr> "45484D9B2E0F2A2651D3763D84C38F54", "050E2D9CD204BA9C9ABF23164AC4C94C", "887E51ACB577FF6B52FA80675088D216", "E9E6EF752803DBCB3FB2BBE596CFC8A3", "79E849EDB354B7B4634~
      $ allowugc                  <lgl> TRUE, TRUE, TRUE, TRUE, TRUE

# dk_get_draft_group_info() returns expected data

    Code
      dplyr::glimpse(d, 200)
    Output
      List of 3
       $ info   : tibble [1 x 12] (S3: tbl_df/tbl/data.frame)
        ..$ draft_group_id   : int 75367
        ..$ sport_id         : int 1
        ..$ start_time_suffix: chr " (Madden Stream NO vs LV)"
        ..$ start_time_type  : chr "Normal"
        ..$ min_start_time   : chr "2022-10-08T18:00:00.0000000Z"
        ..$ max_start_time   : chr "2022-10-08T18:00:00.0000000Z"
        ..$ draft_group_state: chr "Historical"
        ..$ allow_ugc        : logi TRUE
        ..$ game_type_id     : int 159
        ..$ contest_type_id  : int 159
        ..$ sport            : chr "NFL"
        ..$ game_type        : chr "SalaryCap"
       $ games  : tibble [1 x 15] (S3: tbl_df/tbl/data.frame)
        ..$ game_id                            : int 5915939
        ..$ away_team_id                       : int 350
        ..$ home_team_id                       : int 341
        ..$ start_date                         : chr "2022-10-08T18:00:00.0000000Z"
        ..$ time_remaining_status              : chr "ScoresOfficial"
        ..$ sport                              : chr "NFL"
        ..$ status                             : chr "ScoresOfficial"
        ..$ description                        : chr "NO @ LV"
        ..$ league                             : chr "SIM"
        ..$ competition_status                 : chr "ScoresOfficial"
        ..$ competition_status_detail          : chr ""
        ..$ sport_specific_data_time_remaining : chr "ScoresOfficial"
        ..$ sport_specific_data_home_team_score: chr "23"
        ..$ sport_specific_data_away_team_score: chr "17"
        ..$ sport_specific_data_quarter        : chr "5"
       $ leagues: tibble [1 x 3] (S3: tbl_df/tbl/data.frame)
        ..$ league_id          : int 79
        ..$ league_name        : chr "Simulation"
        ..$ league_abbreviation: chr "SIM"

# dk_get_player_list() returns expected data

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 32
      $ pid                       <dbl> 496083, 922451, 611417, 885540, 838415
      $ did                       <dbl> 0, 0, 0, 0, 0
      $ pcode                     <dbl> 27564, 34206, 27581, 33901, 31061
      $ tsid                      <dbl> 5915939, 5915939, 5915939, 5915939, 5915939
      $ fn                        <chr> "Derek", "Brittain", "Davante", "Adam", "Tre'Quan"
      $ ln                        <chr> "Carr", "Brown", "Adams", "Prentice", "Smith"
      $ fnu                       <chr> "Derek", "Brittain", "Davante", "Adam", "Tre'Quan"
      $ lnu                       <chr> "Carr", "Brown", "Adams", "Prentice", "Smith"
      $ jn                        <dbl> 0, 38, 17, 46, 10
      $ pn                        <chr> "QB", "RB", "WR", "RB", "WR"
      $ dgst                      <dbl> 1.665252e+12, 1.665252e+12, 1.665252e+12, 1.665252e+12, 1.665252e+12
      $ tid                       <dbl> 341, 341, 341, 350, 350
      $ htid                      <dbl> 341, 341, 341, 341, 341
      $ atid                      <dbl> 350, 350, 350, 350, 350
      $ htabbr                    <chr> "LV", "LV", "LV", "LV", "LV"
      $ atabbr                    <chr> "NO", "NO", "NO", "NO", "NO"
      $ posid                     <dbl> 1, 2, 3, 2, 3
      $ rosposid                  <dbl> 512, 512, 512, 512, 512
      $ slo                       <lgl> NA, NA, NA, NA, NA
      $ is_disabled_from_drafting <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ s                         <dbl> 9000, 1000, 10600, 1000, 2400
      $ ppg                       <chr> "16.5", "0.0", "15.5", "0.4", "0.0"
      $ or                        <dbl> 0, 0, 0, 0, 0
      $ swp                       <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ ipc                       <lgl> FALSE, FALSE, FALSE, FALSE, FALSE
      $ pp                        <dbl> 0, 0, 0, 0, 0
      $ i                         <chr> "", "", "", "", ""
      $ news                      <dbl> 1, 0, 0, 0, 0
      $ img_lg                    <chr> "https://dkn.gs/sports/images/nfl/players/0/12350.png", "https://dkn.gs/sports/images/nfl/players/0/641146.png", "https://dkn.gs/sports/images/nfl/players/0/19493.p~
      $ alt_img_lg                <chr> NA, NA, NA, NA, NA
      $ img_sm                    <chr> "https://dkn.gs/sports/images/nfl/players/50/12350.png", "https://dkn.gs/sports/images/nfl/players/50/641146.png", "https://dkn.gs/sports/images/nfl/players/50/1949~
      $ alt_img_sm                <chr> NA, NA, NA, NA, NA

# dk_get_team_list() returns expected data

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 1
      Columns: 9
      $ ht          <chr> "LV"
      $ htid        <dbl> 341
      $ at          <chr> "NO"
      $ atid        <dbl> 350
      $ tz          <chr> "/Date(1665252000000)/"
      $ dh          <dbl> 0
      $ s           <dbl> 1
      $ status      <chr> "Final"
      $ status_code <dbl> 4

# dk_get_player_fp() returns expected data

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 27
      $ player_id                  <dbl> 976528, 605242, 696882, 397945, 885494
      $ player_dk_id               <dbl> 485485, 19905, 19867, 11677, 485733
      $ first_name                 <chr> "KJ", "Tyler", "Jacob", "LeSean", "LeVante"
      $ last_name                  <chr> "Hamler", "Lockett", "Hollister", "McCoy", "Bellamy"
      $ team_id                    <dbl> 332, 361, 361, 362, 332
      $ position                   <chr> "WR", "WR", "TE", "RB", "RB"
      $ salary                     <dbl> 3200, 6500, 2900, 4000, NA
      $ fantasy_points             <dbl> 0.3, 7.4, 9.7, 1.5, 2.6
      $ value_icon                 <chr> "ice", "ice", "", "ice", NA
      $ game_id                    <dbl> 5674180, 5674306, 5674306, 5674156, 5674180
      $ image_url                  <chr> "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/976528.png", "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/605242.png", "https://d327rxwuxd0q0c.cloudfron~
      $ points                     <dbl> 0.3, 7.4, 9.7, 1.5, 2.6
      $ sport                      <chr> "nfl", "nfl", "nfl", "nfl", "nfl"
      $ game_status                <chr> "liveOrFinal", "liveOrFinal", "liveOrFinal", "liveOrFinal", "liveOrFinal"
      $ game_start_time            <chr> "2020-12-27T21:05:00.0000000Z", "2020-12-27T21:25:00.0000000Z", "2020-12-27T21:25:00.0000000Z", "2020-12-26T18:00:00.0000000Z", "2020-12-27T21:05:00.0000000Z"
      $ week_number                <dbl> 16, 16, 16, 16, 16
      $ team_city                  <chr> "Denver", "Seattle", "Seattle", "Tampa Bay", "Denver"
      $ team_name                  <chr> "Broncos", "Seahawks", "Seahawks", "Buccaneers", "Broncos"
      $ team_abbreviation          <chr> "DEN", "SEA", "SEA", "TB", "DEN"
      $ opposing_team_city         <chr> "Los Angeles", "Los Angeles", "Los Angeles", "Detroit", "Los Angeles"
      $ opposing_team_name         <chr> "Chargers", "Rams", "Rams", "Lions", "Chargers"
      $ opposing_team_abbreviation <chr> "LAC", "LAR", "LAR", "DET", "LAC"
      $ fantasy_stats_num_games    <dbl> 3, 3, 3, 3, 3
      $ fantasy_points_per_game    <dbl> 8.1000, 8.3333, 7.4667, 4.0667, 0.8667
      $ player_state               <chr> NA, NA, NA, NA, NA
      $ pregame_projection         <dbl> NA, NA, NA, NA, NA
      $ real_time_projection       <dbl> NA, NA, NA, NA, NA

---

    Code
      dplyr::glimpse(d_sampled, 200)
    Output
      Rows: 5
      Columns: 26
      $ player_id                  <dbl> 840567, 553158, 1325125, 549969, 843005
      $ player_dk_id               <dbl> 32939, 33189, 649573, 32903, 33316
      $ first_name                 <chr> "Guillermo", "Gorgui", "Blake", "Joe", "Cameron"
      $ last_name                  <chr> "Hernangómez", "Dieng", "Wesley", "Harris", "Johnson"
      $ team_id                    <dbl> 3, 24, 24, 17, 17
      $ position                   <chr> "C", "C", "PG/SG", "SG", "SF"
      $ salary                     <dbl> 3400, 3000, 3000, 3700, 6200
      $ fantasy_points             <dbl> 0, 0, 0, 0, 0
      $ value_icon                 <chr> "", "", "", "", ""
      $ pregame_projection         <dbl> 17.0, 15.0, 15.0, 18.5, 31.0
      $ real_time_projection       <dbl> 17.0, 15.0, 15.0, 18.5, 31.0
      $ game_id                    <dbl> 5898000, 5903395, 5903395, 5898678, 5898678
      $ points                     <dbl> 0, 0, 0, 0, 0
      $ sport                      <chr> "nba", "nba", "nba", "nba", "nba"
      $ game_status                <chr> "upcoming", "upcoming", "upcoming", "upcoming", "upcoming"
      $ game_start_time            <chr> "2023-03-12T23:00:00.0000000Z", "2023-03-12T23:00:00.0000000Z", "2023-03-12T23:00:00.0000000Z", "2023-03-12T19:30:00.0000000Z", "2023-03-12T19:30:00.0000000Z"
      $ date                       <chr> "20230312", "20230312", "20230312", "20230312", "20230312"
      $ image_url                  <chr> "https://dkn.gs/sports/images/nba/players/160/32939.png", "https://dkn.gs/sports/images/nba/players/160/33189.png", NA, "https://dkn.gs/sports/images/nba/players/1~
      $ team_city                  <chr> "New Orleans", "San Antonio", "San Antonio", "Brooklyn", "Brooklyn"
      $ team_name                  <chr> "Pelicans", "Spurs", "Spurs", "Nets", "Nets"
      $ team_abbreviation          <chr> "NOP", "SAS", "SAS", "BKN", "BKN"
      $ opposing_team_city         <chr> "Portland", "Oklahoma City", "Oklahoma City", "Denver", "Denver"
      $ opposing_team_name         <chr> "Trail Blazers", "Thunder", "Thunder", "Nuggets", "Nuggets"
      $ opposing_team_abbreviation <chr> "POR", "OKC", "OKC", "DEN", "DEN"
      $ fantasy_stats_num_games    <dbl> 10, 10, 10, 10, 10
      $ fantasy_points_per_game    <dbl> 22.075, 6.400, 11.950, 6.900, 28.725

