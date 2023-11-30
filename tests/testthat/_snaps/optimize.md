# dk_optimize_lineup() returns results for NFL Showdown Captain Mode

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name  display_name short_name player_id
      1     24633261      Lamar   Jackson Lamar Jackson L. Jackson    877745
      2     24633262    Ja'Marr     Chase Ja'Marr Chase   J. Chase   1109979
      3     24633263        Joe    Burrow    Joe Burrow  J. Burrow    878785
      4     24633265        Joe     Mixon     Joe Mixon   J. Mixon    820727
      5     24633267       J.K.   Dobbins  J.K. Dobbins J. Dobbins    976513
      6     24633239        Gus   Edwards   Gus Edwards G. Edwards    739799
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        17173       QB            512  12200   None        FALSE       FALSE
      2       557826       WR            512  11000   None        FALSE       FALSE
      3       485441       QB            512  10600   None        FALSE       FALSE
      4        13893       RB            512   8800   None        FALSE       FALSE
      5       476830       RB            512   7000   None        FALSE       FALSE
      6        17079       RB            511    300   None        FALSE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nfl/players/50/17173.png
      2      Recent https://dkn.gs/sports/images/nfl/players/50/557826.png
      3      Recent https://dkn.gs/sports/images/nfl/players/50/485441.png
      4      Recent  https://dkn.gs/sports/images/nfl/players/50/13893.png
      5      Recent https://dkn.gs/sports/images/nfl/players/50/476830.png
      6    Breaking  https://dkn.gs/sports/images/nfl/players/50/17079.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nfl/players/160/17173.png                   
      2 https://dkn.gs/sports/images/nfl/players/160/557826.png                   
      3 https://dkn.gs/sports/images/nfl/players/160/485441.png                   
      4  https://dkn.gs/sports/images/nfl/players/160/13893.png                   
      5 https://dkn.gs/sports/images/nfl/players/160/476830.png                   
      6  https://dkn.gs/sports/images/nfl/players/160/17079.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                         366               BAL   877745-5819761        5819761
      2                         327               CIN  1109979-5819761        5819761
      3                         327               CIN   878785-5819761        5819761
      4                         327               CIN   820727-5819761        5819761
      5                         366               BAL   976513-5819761        5819761
      6                         366               BAL   739799-5819761        5819761
        competition_name       competition_start_time exp_fp is_captain
      1        CIN @ BAL 2022-10-10T00:20:00.0000000Z   19.9      FALSE
      2        CIN @ BAL 2022-10-10T00:20:00.0000000Z   19.4      FALSE
      3        CIN @ BAL 2022-10-10T00:20:00.0000000Z   16.3      FALSE
      4        CIN @ BAL 2022-10-10T00:20:00.0000000Z   13.5      FALSE
      5        CIN @ BAL 2022-10-10T00:20:00.0000000Z   11.7      FALSE
      6        CIN @ BAL 2022-10-10T00:20:00.0000000Z   18.0       TRUE
      
      $draft_group_id
      [1] 75284
      
      $salary_total
      [1] 49900
      
      $exp_fp_total
      [1] 98.8
      

# dk_optimize_lineup() returns results for NFL Classic Game Type

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name        display_name   short_name player_id
      1     24169348  Christian McCaffrey Christian McCaffrey C. McCaffrey    830517
      2     24169658     Tyreek      Hill         Tyreek Hill      T. Hill    823156
      3     24169662    Amon-Ra St. Brown   Amon-Ra St. Brown A. St. Brown   1127106
      4     24169672     Keenan     Allen        Keenan Allen     K. Allen    557210
      5     24169456     Raheem   Mostert      Raheem Mostert   R. Mostert    606501
      6     24170144       T.J. Hockenson      T.J. Hockenson T. Hockenson    923915
      7     24169337        Sam    Howell          Sam Howell    S. Howell   1168245
      8     24169510      Kyren  Williams      Kyren Williams  K. Williams   1167361
      9     24170427     Ravens                        Ravens       Ravens       366
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        20415       RB             67   8800   None        FALSE       FALSE
      2        11477       WR             68   7600   None        FALSE       FALSE
      3       560800       WR             68   7200   None        FALSE       FALSE
      4        19006       WR             68   6500   None        FALSE       FALSE
      5        19614       RB             67   4500   None        FALSE       FALSE
      6        19265       TE             69   4200   None        FALSE       FALSE
      7       641037       QB             66   4000   None        FALSE       FALSE
      8       641057       RB             67   4000   None        FALSE       FALSE
      9        18495      DST             71   3000   None        FALSE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nfl/players/50/20415.png
      2      Recent  https://dkn.gs/sports/images/nfl/players/50/11477.png
      3      Recent https://dkn.gs/sports/images/nfl/players/50/560800.png
      4      Recent  https://dkn.gs/sports/images/nfl/players/50/19006.png
      5      Recent  https://dkn.gs/sports/images/nfl/players/50/19614.png
      6      Recent  https://dkn.gs/sports/images/nfl/players/50/19265.png
      7        None https://dkn.gs/sports/images/nfl/players/50/641037.png
      8        None https://dkn.gs/sports/images/nfl/players/50/641057.png
      9        <NA>    https://dkn.gs/sports/images/nfl/teams/50/18495.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nfl/players/160/20415.png                   
      2  https://dkn.gs/sports/images/nfl/players/160/11477.png                   
      3 https://dkn.gs/sports/images/nfl/players/160/560800.png                   
      4  https://dkn.gs/sports/images/nfl/players/160/19006.png                   
      5  https://dkn.gs/sports/images/nfl/players/160/19614.png                   
      6  https://dkn.gs/sports/images/nfl/players/160/19265.png                   
      7 https://dkn.gs/sports/images/nfl/players/160/641037.png                   
      8 https://dkn.gs/sports/images/nfl/players/160/641057.png                   
      9    https://dkn.gs/sports/images/nfl/teams/160/18495.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                         364               CAR   830517-5818371        5818371
      2                         345               MIA   823156-5818419        5818419
      3                         334               DET  1127106-5818642        5818642
      4                         357               LAC   557210-5818750        5818750
      5                         345               MIA   606501-5818419        5818419
      6                         334               DET   923915-5818642        5818642
      7                         363               WAS  1168245-5818720        5818720
      8                         343               LAR  1167361-5818774        5818774
      9                         366               BAL      366-5818004        5818004
        competition_name       competition_start_time exp_fp
      1         NO @ CAR 2022-09-25T17:00:00.0000000Z   26.1
      2        BUF @ MIA 2022-09-25T17:00:00.0000000Z   27.5
      3        DET @ MIN 2022-09-25T17:00:00.0000000Z   23.0
      4        JAX @ LAC 2022-09-25T20:05:00.0000000Z   24.7
      5        BUF @ MIA 2022-09-25T17:00:00.0000000Z   19.0
      6        DET @ MIN 2022-09-25T17:00:00.0000000Z   15.9
      7        PHI @ WAS 2022-09-25T17:00:00.0000000Z   20.6
      8        LAR @ ARI 2022-09-25T20:25:00.0000000Z   22.6
      9         BAL @ NE 2022-09-25T17:00:00.0000000Z   10.4
      
      $draft_group_id
      [1] 74625
      
      $salary_total
      [1] 49800
      
      $exp_fp_total
      [1] 189.8
      

# dk_optimize_lineup() returns results for NBA Showdown Captain Mode

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name     display_name short_name player_id
      1     30626002   De'Aaron       Fox     De'Aaron Fox     D. Fox    957489
      2     30625967   Domantas   Sabonis Domantas Sabonis D. Sabonis    850111
      3     30625968    Stephen     Curry    Stephen Curry   S. Curry    338365
      4     30625977      Malik      Monk       Malik Monk    M. Monk    957492
      5     30625981      Dario     Saric      Dario Saric   D. Saric    830641
      6     30625984       Trey     Lyles       Trey Lyles   T. Lyles    845596
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        33343       PG            476  14700   None        FALSE       FALSE
      2        33091        C            475  11400   None        FALSE       FALSE
      3        33049       PG            475  10400   None        FALSE       FALSE
      4        32941       SG            475   6000   None        FALSE       FALSE
      5        33306       PF            475   4000   None        FALSE       FALSE
      6        33360        C            475   3200   None        FALSE       FALSE
        news_status                                        player_image50
      1      Recent https://dkn.gs/sports/images/nba/players/50/33343.png
      2      Recent https://dkn.gs/sports/images/nba/players/50/33091.png
      3      Recent https://dkn.gs/sports/images/nba/players/50/33049.png
      4        None https://dkn.gs/sports/images/nba/players/50/32941.png
      5        None https://dkn.gs/sports/images/nba/players/50/33306.png
      6      Recent https://dkn.gs/sports/images/nba/players/50/33360.png
                                               player_image160 alt_player_image50
      1 https://dkn.gs/sports/images/nba/players/160/33343.png                   
      2 https://dkn.gs/sports/images/nba/players/160/33091.png                   
      3 https://dkn.gs/sports/images/nba/players/160/33049.png                   
      4 https://dkn.gs/sports/images/nba/players/160/32941.png                   
      5 https://dkn.gs/sports/images/nba/players/160/33306.png                   
      6 https://dkn.gs/sports/images/nba/players/160/33360.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                          23               SAC   957489-5956958        5956958
      2                          23               SAC   850111-5956958        5956958
      3                           9               GSW   338365-5956958        5956958
      4                          23               SAC   957492-5956958        5956958
      5                           9               GSW   830641-5956958        5956958
      6                          23               SAC   845596-5956958        5956958
        competition_name       competition_start_time exp_fp is_captain
      1        GSW @ SAC 2023-10-28T02:00:00.0000000Z   74.4       TRUE
      2        GSW @ SAC 2023-10-28T02:00:00.0000000Z   47.1      FALSE
      3        GSW @ SAC 2023-10-28T02:00:00.0000000Z   44.7      FALSE
      4        GSW @ SAC 2023-10-28T02:00:00.0000000Z   26.8      FALSE
      5        GSW @ SAC 2023-10-28T02:00:00.0000000Z   24.2      FALSE
      6        GSW @ SAC 2023-10-28T02:00:00.0000000Z   17.9      FALSE
      
      $draft_group_id
      [1] 94770
      
      $salary_total
      [1] 49700
      
      $exp_fp_total
      [1] 235.1
      

# dk_optimize_lineup() returns results for NBA Classic Game Type

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name    display_name short_name player_id
      1     30624164    Stephen     Curry   Stephen Curry   S. Curry    338365
      2     30624261   De'Aaron       Fox    De'Aaron Fox     D. Fox    957489
      3     30624303      Franz    Wagner    Franz Wagner  F. Wagner   1178131
      4     30624194     Jerami     Grant    Jerami Grant   J. Grant    699826
      5     30624374    Shaedon    Sharpe  Shaedon Sharpe  S. Sharpe   1371494
      6     30624319     Keegan    Murray   Keegan Murray  K. Murray   1231161
      7     30624188    Malcolm   Brogdon Malcolm Brogdon M. Brogdon    601146
      8     30624208      Dario     Saric     Dario Saric   D. Saric    830641
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        33049       PG            458   9300   None        FALSE       FALSE
      2        33343       PG            458   8700   None        FALSE       FALSE
      3       591008       SF            460   6500   None        FALSE       FALSE
      4        33017       PF            461   6100   None        FALSE       FALSE
      5       649550       SG            459   5300   None        FALSE       FALSE
      6       649547       PF            461   5200   None        FALSE       FALSE
      7        33092       PG            458   5200   None        FALSE       FALSE
      8        33306        C            462   3700   None        FALSE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nba/players/50/33049.png
      2      Recent  https://dkn.gs/sports/images/nba/players/50/33343.png
      3      Recent https://dkn.gs/sports/images/nba/players/50/591008.png
      4    Breaking  https://dkn.gs/sports/images/nba/players/50/33017.png
      5      Recent https://dkn.gs/sports/images/nba/players/50/649550.png
      6      Recent https://dkn.gs/sports/images/nba/players/50/649547.png
      7      Recent  https://dkn.gs/sports/images/nba/players/50/33092.png
      8        None  https://dkn.gs/sports/images/nba/players/50/33306.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nba/players/160/33049.png                   
      2  https://dkn.gs/sports/images/nba/players/160/33343.png                   
      3 https://dkn.gs/sports/images/nba/players/160/591008.png                   
      4  https://dkn.gs/sports/images/nba/players/160/33017.png                   
      5 https://dkn.gs/sports/images/nba/players/160/649550.png                   
      6 https://dkn.gs/sports/images/nba/players/160/649547.png                   
      7  https://dkn.gs/sports/images/nba/players/160/33092.png                   
      8  https://dkn.gs/sports/images/nba/players/160/33306.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                           9               GSW   338365-5956958        5956958
      2                          23               SAC   957489-5956958        5956958
      3                          19               ORL  1178131-5957600        5957600
      4                          22               POR   699826-5957600        5957600
      5                          22               POR  1371494-5957600        5957600
      6                          23               SAC  1231161-5956958        5956958
      7                          22               POR   601146-5957600        5957600
      8                           9               GSW   830641-5956958        5956958
        competition_name       competition_start_time exp_fp
      1        GSW @ SAC 2023-10-28T02:00:00.0000000Z   44.7
      2        GSW @ SAC 2023-10-28T02:00:00.0000000Z   49.6
      3        ORL @ POR 2023-10-28T02:00:00.0000000Z   34.9
      4        ORL @ POR 2023-10-28T02:00:00.0000000Z   35.4
      5        ORL @ POR 2023-10-28T02:00:00.0000000Z   30.5
      6        GSW @ SAC 2023-10-28T02:00:00.0000000Z   28.5
      7        ORL @ POR 2023-10-28T02:00:00.0000000Z   35.6
      8        GSW @ SAC 2023-10-28T02:00:00.0000000Z   24.2
      
      $draft_group_id
      [1] 94768
      
      $salary_total
      [1] 50000
      
      $exp_fp_total
      [1] 283.4
      

