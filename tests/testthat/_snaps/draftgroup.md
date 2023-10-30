# dk_get_draft_group() works when passed a draftgroup ID

    Code
      str(d_sampled)
    Output
      tibble [5 x 24] (S3: tbl_df/tbl/data.frame)
       $ draftable_id          : num [1:5] 24651646 24651627 24651606 24651625 24651628
       $ first_name            : chr [1:5] "Kawaan" "Deonte" "Davante" "Wil" ...
       $ last_name             : chr [1:5] "Baker" "Harty" "Adams" "Lutz" ...
       $ display_name          : chr [1:5] "Kawaan Baker" "Deonte Harty" "Davante Adams" "Wil Lutz" ...
       $ short_name            : chr [1:5] "K. Baker" "D. Harty" "D. Adams" "W. Lutz" ...
       $ player_id             : num [1:5] 951485 1166545 611417 700299 838415
       $ player_dk_id          : num [1:5] 560956 18497 19493 18657 18806
       $ position              : chr [1:5] "WR" "WR" "WR" "K" ...
       $ roster_slot_id        : num [1:5] 511 511 511 511 511
       $ salary                : num [1:5] 1500 4200 15900 5400 3600
       $ status                : chr [1:5] "None" "None" "None" "None" ...
       $ is_swappable          : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ is_disabled           : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ news_status           : chr [1:5] "None" "Recent" "Breaking" "Breaking" ...
       $ player_image50        : chr [1:5] "https://dkn.gs/sports/images/nfl/players/50/560956.png" "https://dkn.gs/sports/images/nfl/players/50/18497.png" "https://dkn.gs/sports/images/nfl/players/50/19493.png" "https://dkn.gs/sports/images/nfl/players/50/18657.png" ...
       $ player_image160       : chr [1:5] "https://dkn.gs/sports/images/nfl/players/160/560956.png" "https://dkn.gs/sports/images/nfl/players/160/18497.png" "https://dkn.gs/sports/images/nfl/players/160/19493.png" "https://dkn.gs/sports/images/nfl/players/160/18657.png" ...
       $ alt_player_image50    : chr [1:5] "" "" "" "" ...
       $ alt_player_image160   : chr [1:5] "" "" "" "" ...
       $ team_id               : num [1:5] 350 350 341 350 350
       $ team_abbreviation     : chr [1:5] "NO" "NO" "LV" "NO" ...
       $ player_game_hash      : chr [1:5] "951485-5915939" "1166545-5915939" "611417-5915939" "700299-5915939" ...
       $ competition_id        : num [1:5] 5915939 5915939 5915939 5915939 5915939
       $ competition_name      : chr [1:5] "NO @ LV" "NO @ LV" "NO @ LV" "NO @ LV" ...
       $ competition_start_time: chr [1:5] "2022-10-08T18:00:00.0000000Z" "2022-10-08T18:00:00.0000000Z" "2022-10-08T18:00:00.0000000Z" "2022-10-08T18:00:00.0000000Z" ...

# dk_get_draft_group() works when passed a contest ID

    Code
      str(d_sampled)
    Output
      tibble [5 x 24] (S3: tbl_df/tbl/data.frame)
       $ draftable_id          : num [1:5] 22845058 22844982 22845147 22845105 22845093
       $ first_name            : chr [1:5] "Mario" "Juwan" "Andre" "George" ...
       $ last_name             : chr [1:5] "Chalmers" "Morgan" "Iguodala" "King" ...
       $ display_name          : chr [1:5] "Mario Chalmers" "Juwan Morgan" "Andre Iguodala" "George King" ...
       $ short_name            : chr [1:5] "M. Chalmers" "J. Morgan" "A. Iguodala" "G. King" ...
       $ player_id             : num [1:5] 296572 900536 173004 742864 292394
       $ player_dk_id          : num [1:5] 116081 32856 33131 59064 32861
       $ position              : chr [1:5] "PG" "PF" "SG/SF" "SF" ...
       $ roster_slot_id        : num [1:5] 465 461 464 465 465
       $ salary                : num [1:5] 3000 3000 3000 3000 3000
       $ status                : chr [1:5] "None" "None" "Q" "None" ...
       $ is_swappable          : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ is_disabled           : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ news_status           : chr [1:5] "None" "None" "Recent" "None" ...
       $ player_image50        : chr [1:5] "https://dkn.gs/sports/images/nba/players/50/116081.png" "https://dkn.gs/sports/images/nba/players/50/32856.png" "https://dkn.gs/sports/images/nba/players/50/33131.png" "https://dkn.gs/sports/images/nba/players/50/59064.png" ...
       $ player_image160       : chr [1:5] "https://dkn.gs/sports/images/nba/players/160/116081.png" "https://dkn.gs/sports/images/nba/players/160/32856.png" "https://dkn.gs/sports/images/nba/players/160/33131.png" "https://dkn.gs/sports/images/nba/players/160/59064.png" ...
       $ alt_player_image50    : chr [1:5] "" "" "" "" ...
       $ alt_player_image160   : chr [1:5] "" "" "" "" ...
       $ team_id               : num [1:5] 14 2 9 6 2
       $ team_abbreviation     : chr [1:5] "MIA" "BOS" "GSW" "DAL" ...
       $ player_game_hash      : chr [1:5] "296572-5820648" "900536-5820648" "173004-5820702" "742864-5820702" ...
       $ competition_id        : num [1:5] 5820648 5820648 5820702 5820702 5820648
       $ competition_name      : chr [1:5] "MIA @ BOS" "MIA @ BOS" "DAL @ GSW" "DAL @ GSW" ...
       $ competition_start_time: chr [1:5] "2022-05-28T00:30:00.0000000Z" "2022-05-28T00:30:00.0000000Z" "2022-05-27T01:00:00.0000000Z" "2022-05-27T01:00:00.0000000Z" ...

# dk_get_lobby_draft_groups() returns expected data

    Code
      str(d_sampled)
    Output
      tibble [5 x 17] (S3: tbl_df/tbl/data.frame)
       $ draft_group_id           : num [1:5] 94529 94828 94510 94653 94900
       $ contest_type_id          : num [1:5] 110 29 96 123 70
       $ start_date               : chr [1:5] "2023-10-31T01:45:00.0000000Z" "2023-11-02T10:00:00.0000000Z" "2023-10-31T00:15:00.0000000Z" "2023-10-30T23:00:00.0000000Z" ...
       $ start_date_est           : chr [1:5] "2023-10-30T21:45:00.0000000" "2023-11-02T06:00:00.0000000" "2023-10-30T20:15:00.0000000" "2023-10-30T19:00:00.0000000" ...
       $ sort_order               : num [1:5] 41 999 37 999 999
       $ draft_group_tag          : chr [1:5] "Featured" "" "Featured" "" ...
       $ game_type_id             : num [1:5] 110 6 96 123 70
       $ game_type                : logi [1:5] NA NA NA NA NA
       $ sport_sort_order         : num [1:5] 0 2 0 7 3
       $ sport                    : chr [1:5] "NFL" "GOLF" "NFL" "SOC" ...
       $ game_count               : num [1:5] 1 1 1 1 2
       $ contest_start_time_suffix: chr [1:5] " (4Q LV vs DET)" " (LPGA)" " (LV vs DET)" " (ORL vs NSH)" ...
       $ contest_start_time_type  : num [1:5] 0 0 0 0 0
       $ games                    : logi [1:5] NA NA NA NA NA
       $ draft_group_series_id    : num [1:5] 96 0 90 0 0
       $ game_set_key             : chr [1:5] "6538271309076983FA2FD83058660C56" "BC193B96287494501EE5F9E033C30C91" "BDC3C9E411C80B5F1CB8ACC38B3A0C6E" "CF19980C96C3BD10F46EA84EF1DDC914" ...
       $ allowugc                 : logi [1:5] TRUE NA TRUE TRUE TRUE

# dk_get_draft_group_info() returns expected data

    Code
      str(d)
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

# dk_get_draft_group_info2() returns expected data for single competition draft group

    Code
      str(d)
    Output
      List of 5
       $ draft_groups: tibble [1 x 22] (S3: tbl_df/tbl/data.frame)
        ..$ draft_group_id        : int 75367
        ..$ contest_type_id       : int 159
        ..$ sport_id              : int 1
        ..$ start_time_suffix     : chr " (Madden Stream NO vs LV)"
        ..$ start_time_type       : chr "Normal"
        ..$ min_start_time        : chr "2022-10-08T18:00:00.0000000Z"
        ..$ max_start_time        : chr "2022-10-08T18:00:00.0000000Z"
        ..$ draft_group_state     : chr "Historical"
        ..$ sort_order            : int 118
        ..$ allow_ugc             : logi TRUE
        ..$ league_id             : logi NA
        ..$ league_name           : logi NA
        ..$ league_abbreviation   : logi NA
        ..$ leagues               :List of 1
        .. ..$ :List of 1
        .. .. ..$ :List of 3
        .. .. .. ..$ leagueId          : int 79
        .. .. .. ..$ leagueName        : chr "Simulation"
        .. .. .. ..$ leagueAbbreviation: chr "SIM"
        ..$ game_type_id          : int 159
        ..$ game_set_key          : chr "053F506F9FF644BE55A825378B66217B"
        ..$ all_tags1             : logi NA
        ..$ competition_ids       : chr "5915939"
        ..$ scoring_style_id      : int 1
        ..$ allow_lineup_creation : logi TRUE
        ..$ is_late_draft_eligible: logi FALSE
        ..$ last_draft_time_utc   : chr "2022-10-08T18:00:00.0000000Z"
       $ game_types  : tibble [1 x 5] (S3: tbl_df/tbl/data.frame)
        ..$ game_types_game_type_id: int 159
        ..$ game_types_name        : chr "Madden Showdown Captain Mode"
        ..$ game_types_description : chr "Create your team from 1 game, while staying under the $50,000 salary cap"
        ..$ game_types_tag         : chr ""
        ..$ game_types_sport_id    : int 1
       $ game_styles : tibble [1 x 7] (S3: tbl_df/tbl/data.frame)
        ..$ game_styles_game_style_id: int 97
        ..$ game_styles_name         : chr "Madden Showdown Captain Mode"
        ..$ game_styles_description  : chr "Create your team from 1 game, while staying under the $50,000 salary cap"
        ..$ game_styles_draft_type   : chr "SalaryCap"
        ..$ game_styles_sport_id     : int 1
        ..$ game_styles_sort_order   : int 15
        ..$ game_styles_tag          : chr ""
       $ sports      : tibble [1 x 8] (S3: tbl_df/tbl/data.frame)
        ..$ sportId                : int 1
        ..$ name                   : chr "NFL"
        ..$ fullName               : chr "Football"
        ..$ sortOrder              : int 1
        ..$ competitionTerm        : chr "Game"
        ..$ competitionTermPlural  : chr "Games"
        ..$ regionalDisplayName    : chr "NFL"
        ..$ regionalDisplayFullName: chr "Football"
       $ competitions: tibble [1 x 20] (S3: tbl_df/tbl/data.frame)
        ..$ competition_id            : int 5915939
        ..$ sport                     : chr "NFL"
        ..$ sport_id                  : int 1
        ..$ home_team_team_id         : int 341
        ..$ home_team_team_name       : chr "Raiders"
        ..$ home_team_abbreviation    : chr "LV"
        ..$ home_team_city            : chr "Las Vegas"
        ..$ away_team_team_id         : int 350
        ..$ away_team_team_name       : chr "Saints"
        ..$ away_team_abbreviation    : chr "NO"
        ..$ away_team_city            : chr "New Orleans"
        ..$ start_time                : chr "2022-10-08T18:00:00.0000000Z"
        ..$ name                      : chr "NO @ LV"
        ..$ starting_lineups_available: logi FALSE
        ..$ depth_charts_available    : logi TRUE
        ..$ competition_state         : chr "ScoresOfficial"
        ..$ competition_state_detail  : chr ""
        ..$ competition_started_early : logi FALSE
        ..$ competition_attributes    :List of 1
        .. ..$ :List of 4
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "5"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "00"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "2"
        ..$ min_start_time            : chr "2022-10-08T18:00:00.0000000Z"

# dk_get_draft_group_info2() returns expected data for multi-competition draft group

    Code
      str(d)
    Output
      List of 5
       $ draft_groups: tibble [1 x 20] (S3: tbl_df/tbl/data.frame)
        ..$ draft_group_id        : int 42994
        ..$ contest_type_id       : int 21
        ..$ sport_id              : int 1
        ..$ start_time_type       : chr "Normal"
        ..$ min_start_time        : chr "2021-01-03T18:00:00.0000000Z"
        ..$ max_start_time        : chr "2021-01-03T21:25:00.0000000Z"
        ..$ draft_group_state     : chr "Historical"
        ..$ allow_ugc             : logi TRUE
        ..$ league_id             : logi NA
        ..$ league_name           : logi NA
        ..$ league_abbreviation   : logi NA
        ..$ leagues               :List of 1
        .. ..$ :List of 1
        .. .. ..$ :List of 3
        .. .. .. ..$ leagueId          : int 1
        .. .. .. ..$ leagueName        : chr "National Football League"
        .. .. .. ..$ leagueAbbreviation: chr "NFL"
        ..$ game_type_id          : int 1
        ..$ game_set_key          : chr "DCFBEBF16AA6DC5B68B6C919F3CF158E"
        ..$ all_tags1             : chr "Featured"
        ..$ competition_ids       : chr "5673424, 5673442, 5673748, 5674390, 5674408, 5674426, 5674444, 5674456, 5674474, 5674492, 5675369, 5675399, 567"| __truncated__
        ..$ scoring_style_id      : int 1
        ..$ allow_lineup_creation : logi TRUE
        ..$ is_late_draft_eligible: logi FALSE
        ..$ last_draft_time_utc   : chr "2021-01-03T18:00:00.0000000Z"
       $ game_types  : tibble [1 x 5] (S3: tbl_df/tbl/data.frame)
        ..$ game_types_game_type_id: int 1
        ..$ game_types_name        : chr "Classic"
        ..$ game_types_description : chr "Create a 9-player lineup while staying under the $50,000 salary cap"
        ..$ game_types_tag         : chr ""
        ..$ game_types_sport_id    : int 1
       $ game_styles : tibble [1 x 7] (S3: tbl_df/tbl/data.frame)
        ..$ game_styles_game_style_id: int 1
        ..$ game_styles_name         : chr "Classic"
        ..$ game_styles_description  : chr "Create a 9-player lineup while staying under the $50,000 salary cap"
        ..$ game_styles_draft_type   : chr "SalaryCap"
        ..$ game_styles_sport_id     : int 1
        ..$ game_styles_sort_order   : int 1
        ..$ game_styles_tag          : chr ""
       $ sports      : tibble [1 x 8] (S3: tbl_df/tbl/data.frame)
        ..$ sportId                : int 1
        ..$ name                   : chr "NFL"
        ..$ fullName               : chr "Football"
        ..$ sortOrder              : int 1
        ..$ competitionTerm        : chr "Game"
        ..$ competitionTermPlural  : chr "Games"
        ..$ regionalDisplayName    : chr "NFL"
        ..$ regionalDisplayFullName: chr "Football"
       $ competitions: tibble [15 x 22] (S3: tbl_df/tbl/data.frame)
        ..$ competition_id            : int [1:15] 5673424 5673442 5674390 5674456 5674474 5675369 5675399 5673748 5674408 5674426 ...
        ..$ sport                     : chr [1:15] "NFL" "NFL" "NFL" "NFL" ...
        ..$ sport_id                  : int [1:15] 1 1 1 1 1 1 1 1 1 1 ...
        ..$ home_team_team_id         : int [1:15] 348 334 324 327 329 351 362 326 364 338 ...
        ..$ home_team_team_name       : chr [1:15] "Patriots" "Lions" "Bills" "Bengals" ...
        ..$ home_team_abbreviation    : chr [1:15] "NE" "DET" "BUF" "CIN" ...
        ..$ home_team_city            : chr [1:15] "New England" "Detroit" "Buffalo" "Cincinnati" ...
        ..$ away_team_team_id         : int [1:15] 352 347 345 366 356 331 323 335 350 365 ...
        ..$ away_team_team_name       : chr [1:15] "Jets" "Vikings" "Dolphins" "Ravens" ...
        ..$ away_team_abbreviation    : chr [1:15] "NYJ" "MIN" "MIA" "BAL" ...
        ..$ away_team_city            : chr [1:15] "New York" "Minnesota" "Miami" "Baltimore" ...
        ..$ start_time                : chr [1:15] "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" ...
        ..$ name                      : chr [1:15] "NYJ @ NE" "MIN @ DET" "MIA @ BUF" "BAL @ CIN" ...
        ..$ venue                     : chr [1:15] "Gillette Stadium" "Ford Field" "Ralph Wilson Stadium" "Paul Brown Stadium" ...
        ..$ weather                   :List of 15
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi TRUE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "rain"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "rain"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "partly-cloudy-day"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "partly-cloudy-day"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "cloudy"
        .. .. ..$ isDome: logi TRUE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "clear-day"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "fog"
        .. .. ..$ isDome: logi FALSE
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "partly-cloudy-day"
        .. .. ..$ isDome: logi FALSE
        .. ..$ : NULL
        .. ..$ :List of 2
        .. .. ..$ icon  : chr "partly-cloudy-day"
        .. .. ..$ isDome: logi FALSE
        ..$ starting_lineups_available: logi [1:15] FALSE FALSE FALSE FALSE FALSE FALSE ...
        ..$ depth_charts_available    : logi [1:15] TRUE TRUE TRUE TRUE TRUE TRUE ...
        ..$ competition_state         : chr [1:15] "ScoresOfficial" "ScoresOfficial" "ScoresOfficial" "ScoresOfficial" ...
        ..$ competition_state_detail  : chr [1:15] "" "" "" "" ...
        ..$ competition_started_early : logi [1:15] FALSE FALSE FALSE FALSE FALSE FALSE ...
        ..$ competition_attributes    :List of 15
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "85"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "(Shotgun) S.Darnold pass short left to C.Herndon to NYJ 15 for 8 yards (M.Jackson). Belichick 311th career win "| __truncated__
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "13"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "13"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "K.Cousins kneels to DET 13 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "3"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "13"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "38"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "M.Barkley kneels to MIA 38 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "1"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "10"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "33"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "(Shotgun) T.Williams left guard to BLT 33 for 17 yards (P.Queen)."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "2"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "40"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "B.Mayfield kneels to PIT 40 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "1"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "13"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "64"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "D.Jones kneels to NYG 36 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "19"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "T.Brady kneels to ATL 19 for no gain."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "1"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "1"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "(Shotgun) M.Trubisky pass short right to J.Graham to GB 1 for 3 yards (J.Alexander)."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "1"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "3"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "85"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "J.Winston kneels to NO 15 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "2"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "12"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "43"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "P.Rivers kneels to JAX 43 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "1"
        .. ..$ :List of 12
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "65"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "S.Sloman 37 yard field goal is GOOD, Center-M.Overton, Holder-B.Kern. Kick hits right upright and bounces throu"| __truncated__
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "1"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "J.Herbert kneels to KC 11 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "3"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "2"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "11"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "58"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "D.Carr kneels to LV 42 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "1"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "10"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "59"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "(Shotgun) C.Streveler pass short left to D.Hopkins to ARZ 41 for 12 yards (J.Ramsey, J.Fuller)."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "0"
        .. ..$ :List of 14
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 3
        .. .. .. ..$ value : chr "home"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 5
        .. .. .. ..$ value : chr "3"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 6
        .. .. .. ..$ value : chr "6"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 8
        .. .. .. ..$ value : chr "4"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 9
        .. .. .. ..$ value : chr "Final"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 10
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 11
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 12
        .. .. .. ..$ value : chr "40"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 13
        .. .. .. ..$ value : chr "R.Wilson kneels to SF 40 for -1 yards."
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 14
        .. .. .. ..$ value : chr "away"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 22
        .. .. .. ..$ value : chr "17"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 27
        .. .. .. ..$ value : chr "False"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 46
        .. .. .. ..$ value : chr "0"
        .. .. ..$ :List of 2
        .. .. .. ..$ typeId: int 47
        .. .. .. ..$ value : chr "1"
        ..$ min_start_time            : chr [1:15] "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" "2021-01-03T18:00:00.0000000Z" ...

# dk_get_player_list() returns expected data

    Code
      str(d_sampled)
    Output
      tibble [5 x 32] (S3: tbl_df/tbl/data.frame)
       $ pid                      : num [1:5] 496083 922451 611417 885540 838415
       $ did                      : num [1:5] 0 0 0 0 0
       $ pcode                    : num [1:5] 27564 34206 27581 33901 31061
       $ tsid                     : num [1:5] 5915939 5915939 5915939 5915939 5915939
       $ fn                       : chr [1:5] "Derek" "Brittain" "Davante" "Adam" ...
       $ ln                       : chr [1:5] "Carr" "Brown" "Adams" "Prentice" ...
       $ fnu                      : chr [1:5] "Derek" "Brittain" "Davante" "Adam" ...
       $ lnu                      : chr [1:5] "Carr" "Brown" "Adams" "Prentice" ...
       $ jn                       : num [1:5] 4 38 17 46 81
       $ pn                       : chr [1:5] "QB" "RB" "WR" "RB" ...
       $ dgst                     : num [1:5] 1.67e+12 1.67e+12 1.67e+12 1.67e+12 1.67e+12
       $ tid                      : num [1:5] 341 341 341 350 350
       $ htid                     : num [1:5] 341 341 341 341 341
       $ atid                     : num [1:5] 350 350 350 350 350
       $ htabbr                   : chr [1:5] "LV" "LV" "LV" "LV" ...
       $ atabbr                   : chr [1:5] "NO" "NO" "NO" "NO" ...
       $ posid                    : num [1:5] 1 2 3 2 3
       $ rosposid                 : num [1:5] 512 512 512 512 512
       $ slo                      : logi [1:5] NA NA NA NA NA
       $ is_disabled_from_drafting: logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ s                        : num [1:5] 9000 1000 10600 1000 2400
       $ ppg                      : chr [1:5] "17.8" "0.0" "16.1" "0.4" ...
       $ or                       : num [1:5] 0 0 0 0 0
       $ swp                      : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ ipc                      : logi [1:5] FALSE FALSE FALSE FALSE FALSE
       $ pp                       : num [1:5] 0 0 0 0 0
       $ i                        : chr [1:5] "" "IR" "" "IR" ...
       $ news                     : num [1:5] 2 0 0 0 2
       $ img_lg                   : chr [1:5] "https://dkn.gs/sports/images/nfl/players/0/12350.png" "https://dkn.gs/sports/images/nfl/players/0/641146.png" "https://dkn.gs/sports/images/nfl/players/0/19493.png" "https://dkn.gs/sports/images/nfl/players/0/564244.png" ...
       $ alt_img_lg               : chr [1:5] NA NA NA NA ...
       $ img_sm                   : chr [1:5] "https://dkn.gs/sports/images/nfl/players/50/12350.png" "https://dkn.gs/sports/images/nfl/players/50/641146.png" "https://dkn.gs/sports/images/nfl/players/50/19493.png" "https://dkn.gs/sports/images/nfl/players/50/564244.png" ...
       $ alt_img_sm               : chr [1:5] NA NA NA NA ...

# dk_get_team_list() returns expected data

    Code
      str(d_sampled)
    Output
      tibble [1 x 9] (S3: tbl_df/tbl/data.frame)
       $ ht         : chr "LV"
       $ htid       : num 341
       $ at         : chr "NO"
       $ atid       : num 350
       $ tz         : chr "/Date(1665252000000)/"
       $ dh         : num 0
       $ s          : num 1
       $ status     : chr "Final"
       $ status_code: num 4

# dk_get_player_fp() returns expected data

    Code
      str(d_sampled)
    Output
      tibble [5 x 27] (S3: tbl_df/tbl/data.frame)
       $ player_id                 : num [1:5] 976528 605242 696882 397945 885494
       $ player_dk_id              : num [1:5] 485485 19905 19867 11677 485733
       $ first_name                : chr [1:5] "KJ" "Tyler" "Jacob" "LeSean" ...
       $ last_name                 : chr [1:5] "Hamler" "Lockett" "Hollister" "McCoy" ...
       $ team_id                   : num [1:5] 332 361 361 362 332
       $ position                  : chr [1:5] "WR" "WR" "TE" "RB" ...
       $ salary                    : num [1:5] 3200 6500 2900 4000 NA
       $ fantasy_points            : num [1:5] 0.3 7.4 9.7 1.5 2.6
       $ value_icon                : chr [1:5] "ice" "ice" "" "ice" ...
       $ game_id                   : num [1:5] 5674180 5674306 5674306 5674156 5674180
       $ image_url                 : chr [1:5] "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/976528.png" "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/605242.png" "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/696882.png" "https://d327rxwuxd0q0c.cloudfront.net/m/nfl_retina/397945.png" ...
       $ points                    : num [1:5] 0.3 7.4 9.7 1.5 2.6
       $ sport                     : chr [1:5] "nfl" "nfl" "nfl" "nfl" ...
       $ game_status               : chr [1:5] "liveOrFinal" "liveOrFinal" "liveOrFinal" "liveOrFinal" ...
       $ game_start_time           : chr [1:5] "2020-12-27T21:05:00.0000000Z" "2020-12-27T21:25:00.0000000Z" "2020-12-27T21:25:00.0000000Z" "2020-12-26T18:00:00.0000000Z" ...
       $ week_number               : num [1:5] 16 16 16 16 16
       $ team_city                 : chr [1:5] "Denver" "Seattle" "Seattle" "Tampa Bay" ...
       $ team_name                 : chr [1:5] "Broncos" "Seahawks" "Seahawks" "Buccaneers" ...
       $ team_abbreviation         : chr [1:5] "DEN" "SEA" "SEA" "TB" ...
       $ opposing_team_city        : chr [1:5] "Los Angeles" "Los Angeles" "Los Angeles" "Detroit" ...
       $ opposing_team_name        : chr [1:5] "Chargers" "Rams" "Rams" "Lions" ...
       $ opposing_team_abbreviation: chr [1:5] "LAC" "LAR" "LAR" "DET" ...
       $ fantasy_stats_num_games   : num [1:5] 3 3 3 3 3
       $ fantasy_points_per_game   : num [1:5] 8.1 8.333 7.467 4.067 0.867
       $ player_state              : chr [1:5] NA NA NA NA ...
       $ pregame_projection        : num [1:5] NA NA NA NA NA
       $ real_time_projection      : num [1:5] NA NA NA NA NA

---

    Code
      str(d_sampled)
    Output
      tibble [5 x 26] (S3: tbl_df/tbl/data.frame)
       $ player_id                   : num [1:5] 920092 1067852 1176529 830650 606701
       $ player_dk_id                : num [1:5] 33296 33027 591097 33018 33001
       $ first_name                  : chr [1:5] "Furkan" "Jarred" "Trendon" "Nikola" ...
       $ last_name                   : chr [1:5] "Korkmaz" "Vanderbilt" "Watford" "Jokic" ...
       $ team_id                     : num [1:5] 20 13 22 7 17
       $ position                    : chr [1:5] "SG" "PF" "PF" "C" ...
       $ salary                      : num [1:5] 3000 5000 3300 11600 4800
       $ fantasy_points              : num [1:5] 2.5 16.8 26.8 87.5 28
       $ value_icon                  : chr [1:5] "ice" "ice" "fire" "fire" ...
       $ game_id                     : num [1:5] 5900802 5902975 5898000 5898678 5898678
       $ points                      : num [1:5] 2.5 16.8 26.8 87.5 28
       $ sport                       : chr [1:5] "nba" "nba" "nba" "nba" ...
       $ game_status                 : chr [1:5] "liveOrFinal" "liveOrFinal" "liveOrFinal" "liveOrFinal" ...
       $ game_start_time             : chr [1:5] "2023-03-12T22:00:00.0000000Z" "2023-03-13T01:00:00.0000000Z" "2023-03-12T23:00:00.0000000Z" "2023-03-12T19:30:00.0000000Z" ...
       $ date                        : chr [1:5] "20230312" "20230312" "20230312" "20230312" ...
       $ image_url                   : chr [1:5] "https://dkn.gs/sports/images/nba/players/160/33296.png" "https://dkn.gs/sports/images/nba/players/160/33027.png" "https://dkn.gs/sports/images/nba/players/160/591097.png" "https://dkn.gs/sports/images/nba/players/160/33018.png" ...
       $ team_city                   : chr [1:5] "Philadelphia" "Los Angeles" "Portland" "Denver" ...
       $ team_name                   : chr [1:5] "76ers" "Lakers" "Trail Blazers" "Nuggets" ...
       $ team_abbreviation           : chr [1:5] "PHI" "LAL" "POR" "DEN" ...
       $ opposing_team_city          : chr [1:5] "Washington" "New York" "New Orleans" "Brooklyn" ...
       $ opposing_team_name          : chr [1:5] "Wizards" "Knicks" "Pelicans" "Nets" ...
       $ opposing_team_abbreviation  : chr [1:5] "WAS" "NYK" "NOP" "BKN" ...
       $ fantasy_stats_num_games     : num [1:5] 10 10 10 10 10
       $ fantasy_points_per_game     : num [1:5] 4.28 23.43 19.5 61.05 19.85
       $ attributes_dk_live_link_text: chr [1:5] "Boxscore" "Boxscore" "Boxscore" "Boxscore" ...
       $ attributes_dk_live_link     : chr [1:5] "dklive://NBA/boxscores?gameid=5900802&playerid=920092" "dklive://NBA/boxscores?gameid=5902975&playerid=1067852" "dklive://NBA/boxscores?gameid=5898000&playerid=1176529" "dklive://NBA/boxscores?gameid=5898678&playerid=830650" ...

