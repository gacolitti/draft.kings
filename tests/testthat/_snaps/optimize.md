# dk_optimize_lineup() returns results for NFL Showdown Captain Mode

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name  display_name short_name player_id
      1     24633208      Lamar   Jackson Lamar Jackson L. Jackson    877745
      2     24633262    Ja'Marr     Chase Ja'Marr Chase   J. Chase   1109979
      3     24633264       Mark   Andrews  Mark Andrews M. Andrews    820699
      4     24633267       J.K.   Dobbins  J.K. Dobbins J. Dobbins    976513
      5     24633282    Bengals                 Bengals    Bengals       327
      6     24633292        Gus   Edwards   Gus Edwards G. Edwards    739799
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        17173       QB            511  18300   None        FALSE       FALSE
      2       557826       WR            512  11000   None        FALSE       FALSE
      3        16963       TE            512   9600   None        FALSE       FALSE
      4       476830       RB            512   7000   None        FALSE       FALSE
      5        18320      DST            512   3600   None        FALSE       FALSE
      6        17079       RB            512    200   None        FALSE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nfl/players/50/17173.png
      2      Recent https://dkn.gs/sports/images/nfl/players/50/557826.png
      3      Recent  https://dkn.gs/sports/images/nfl/players/50/16963.png
      4      Recent https://dkn.gs/sports/images/nfl/players/50/476830.png
      5        <NA>    https://dkn.gs/sports/images/nfl/teams/50/18320.png
      6    Breaking  https://dkn.gs/sports/images/nfl/players/50/17079.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nfl/players/160/17173.png                   
      2 https://dkn.gs/sports/images/nfl/players/160/557826.png                   
      3  https://dkn.gs/sports/images/nfl/players/160/16963.png                   
      4 https://dkn.gs/sports/images/nfl/players/160/476830.png                   
      5    https://dkn.gs/sports/images/nfl/teams/160/18320.png                   
      6  https://dkn.gs/sports/images/nfl/players/160/17079.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                         366               BAL   877745-5819761        5819761
      2                         327               CIN  1109979-5819761        5819761
      3                         366               BAL   820699-5819761        5819761
      4                         366               BAL   976513-5819761        5819761
      5                         327               CIN      327-5819761        5819761
      6                         366               BAL   739799-5819761        5819761
        competition_name       competition_start_time exp_fp is_captain
      1        CIN @ BAL 2022-10-10T00:20:00.0000000Z   34.5       TRUE
      2        CIN @ BAL 2022-10-10T00:20:00.0000000Z   21.6      FALSE
      3        CIN @ BAL 2022-10-10T00:20:00.0000000Z   15.6      FALSE
      4        CIN @ BAL 2022-10-10T00:20:00.0000000Z   11.7      FALSE
      5        CIN @ BAL 2022-10-10T00:20:00.0000000Z    9.5      FALSE
      6        CIN @ BAL 2022-10-10T00:20:00.0000000Z    8.8      FALSE
      
      $draft_group_id
      [1] 75284
      
      $salary_total
      [1] 49700
      
      $exp_fp_total
      [1] 101.7
      

# dk_optimize_lineup() returns results for NFL Classic Game Type

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name  last_name   display_name    short_name player_id
      1     24170126     Travis      Kelce   Travis Kelce      T. Kelce    448240
      2     24169658     Tyreek       Hill    Tyreek Hill       T. Hill    823156
      3     24169672     Keenan      Allen   Keenan Allen      K. Allen    557210
      4     24169273        Tua Tagovailoa Tua Tagovailoa T. Tagovailoa    973947
      5     24169690       Adam    Thielen   Adam Thielen    A. Thielen    733643
      6     24169432       Zack       Moss      Zack Moss       Z. Moss    913170
      7     24169456     Raheem    Mostert Raheem Mostert    R. Mostert    606501
      8     24169510      Kyren   Williams Kyren Williams   K. Williams   1167361
      9     24170431   Seahawks                  Seahawks      Seahawks       361
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        11557       TE             69   7900   None        FALSE       FALSE
      2        11477       WR             68   7600   None        FALSE       FALSE
      3        19006       WR             68   6500   None        FALSE       FALSE
      4       468529       QB             66   6100   None        FALSE       FALSE
      5        17396       WR             68   5900   None        FALSE       FALSE
      6       477269       RB             67   4800   None        FALSE       FALSE
      7        19614       RB             67   4500   None        FALSE       FALSE
      8       641057       RB             67   4000   None        FALSE       FALSE
      9        18471      DST             71   2700   None        FALSE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nfl/players/50/11557.png
      2      Recent  https://dkn.gs/sports/images/nfl/players/50/11477.png
      3      Recent  https://dkn.gs/sports/images/nfl/players/50/19006.png
      4      Recent https://dkn.gs/sports/images/nfl/players/50/468529.png
      5      Recent  https://dkn.gs/sports/images/nfl/players/50/17396.png
      6      Recent https://dkn.gs/sports/images/nfl/players/50/477269.png
      7      Recent  https://dkn.gs/sports/images/nfl/players/50/19614.png
      8        None https://dkn.gs/sports/images/nfl/players/50/641057.png
      9        <NA>    https://dkn.gs/sports/images/nfl/teams/50/18471.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nfl/players/160/11557.png                   
      2  https://dkn.gs/sports/images/nfl/players/160/11477.png                   
      3  https://dkn.gs/sports/images/nfl/players/160/19006.png                   
      4 https://dkn.gs/sports/images/nfl/players/160/468529.png                   
      5  https://dkn.gs/sports/images/nfl/players/160/17396.png                   
      6 https://dkn.gs/sports/images/nfl/players/160/477269.png                   
      7  https://dkn.gs/sports/images/nfl/players/160/19614.png                   
      8 https://dkn.gs/sports/images/nfl/players/160/641057.png                   
      9    https://dkn.gs/sports/images/nfl/teams/160/18471.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                         339                KC   448240-5818079        5818079
      2                         345               MIA   823156-5818419        5818419
      3                         357               LAC   557210-5818750        5818750
      4                         345               MIA   973947-5818419        5818419
      5                         347               MIN   733643-5818642        5818642
      6                         324               BUF   913170-5818419        5818419
      7                         345               MIA   606501-5818419        5818419
      8                         343               LAR  1167361-5818774        5818774
      9                         361               SEA      361-5818792        5818792
        competition_name       competition_start_time exp_fp
      1         KC @ IND 2022-09-25T17:00:00.0000000Z   21.8
      2        BUF @ MIA 2022-09-25T17:00:00.0000000Z   28.4
      3        JAX @ LAC 2022-09-25T20:05:00.0000000Z   23.3
      4        BUF @ MIA 2022-09-25T17:00:00.0000000Z   21.1
      5        DET @ MIN 2022-09-25T17:00:00.0000000Z   22.6
      6        BUF @ MIA 2022-09-25T17:00:00.0000000Z   19.5
      7        BUF @ MIA 2022-09-25T17:00:00.0000000Z   21.8
      8        LAR @ ARI 2022-09-25T20:25:00.0000000Z   19.5
      9        ATL @ SEA 2022-09-25T20:25:00.0000000Z   10.2
      
      $draft_group_id
      [1] 74625
      
      $salary_total
      [1] 50000
      
      $exp_fp_total
      [1] 188.2
      

# dk_optimize_lineup() returns results for NBA Showdown Captain Mode

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name     display_name short_name player_id
      1     30625967   Domantas   Sabonis Domantas Sabonis D. Sabonis    850111
      2     30626006   Harrison    Barnes  Harrison Barnes  H. Barnes    552336
      3     30625969   De'Aaron       Fox     De'Aaron Fox     D. Fox    957489
      4     30625971      Chris      Paul       Chris Paul    C. Paul    229598
      5     30625976     Keegan    Murray    Keegan Murray  K. Murray   1231161
      6     30625981      Dario     Saric      Dario Saric   D. Saric    830641
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        33091        C            475  11400   None         TRUE       FALSE
      2        33337       SF            476  10500   None         TRUE       FALSE
      3        33343       PG            475   9800   None         TRUE       FALSE
      4        33246       PG            475   7800   None         TRUE       FALSE
      5       649547       PF            475   6400   None         TRUE       FALSE
      6        33306       PF            475   4000   None         TRUE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nba/players/50/33091.png
      2      Recent  https://dkn.gs/sports/images/nba/players/50/33337.png
      3      Recent  https://dkn.gs/sports/images/nba/players/50/33343.png
      4      Recent  https://dkn.gs/sports/images/nba/players/50/33246.png
      5    Breaking https://dkn.gs/sports/images/nba/players/50/649547.png
      6        None  https://dkn.gs/sports/images/nba/players/50/33306.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nba/players/160/33091.png                   
      2  https://dkn.gs/sports/images/nba/players/160/33337.png                   
      3  https://dkn.gs/sports/images/nba/players/160/33343.png                   
      4  https://dkn.gs/sports/images/nba/players/160/33246.png                   
      5 https://dkn.gs/sports/images/nba/players/160/649547.png                   
      6  https://dkn.gs/sports/images/nba/players/160/33306.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                          23               SAC   850111-5956958        5956958
      2                          23               SAC   552336-5956958        5956958
      3                          23               SAC   957489-5956958        5956958
      4                           9               GSW   229598-5956958        5956958
      5                          23               SAC  1231161-5956958        5956958
      6                           9               GSW   830641-5956958        5956958
        competition_name       competition_start_time exp_fp is_captain
      1        GSW @ SAC 2023-10-28T02:00:00.0000000Z   51.0      FALSE
      2        GSW @ SAC 2023-10-28T02:00:00.0000000Z   67.5       TRUE
      3        GSW @ SAC 2023-10-28T02:00:00.0000000Z   36.3      FALSE
      4        GSW @ SAC 2023-10-28T02:00:00.0000000Z   38.5      FALSE
      5        GSW @ SAC 2023-10-28T02:00:00.0000000Z   34.5      FALSE
      6        GSW @ SAC 2023-10-28T02:00:00.0000000Z   21.8      FALSE
      
      $draft_group_id
      [1] 94770
      
      $salary_total
      [1] 49900
      
      $exp_fp_total
      [1] 249.6
      

# dk_optimize_lineup() returns results for NBA Classic Game Type

    Code
      solution
    Output
      $optimal_lineup
        draftable_id first_name last_name     display_name short_name player_id
      1     30624222   Domantas   Sabonis Domantas Sabonis D. Sabonis    850111
      2     30624160      Chris      Paul       Chris Paul    C. Paul    229598
      3     30624282   Anfernee    Simons  Anfernee Simons  A. Simons   1121307
      4     30624177   Harrison    Barnes  Harrison Barnes  H. Barnes    552336
      5     30624306       Cole   Anthony     Cole Anthony C. Anthony   1185943
      6     30624374    Shaedon    Sharpe   Shaedon Sharpe  S. Sharpe   1371494
      7     30624319     Keegan    Murray    Keegan Murray  K. Murray   1231161
      8     30624188    Malcolm   Brogdon  Malcolm Brogdon M. Brogdon    601146
        player_dk_id position roster_slot_id salary status is_swappable is_disabled
      1        33091        C            462  10200   None         TRUE       FALSE
      2        33246       PG            464   6600   None         TRUE       FALSE
      3        33330       PG            458   6400    OUT         TRUE       FALSE
      4        33337       SF            460   5700   None         TRUE       FALSE
      5       527225       PG            458   5400   None         TRUE       FALSE
      6       649550       SG            459   5300   None         TRUE       FALSE
      7       649547       PF            461   5200   None         TRUE       FALSE
      8        33092       PG            458   5200   None         TRUE       FALSE
        news_status                                         player_image50
      1      Recent  https://dkn.gs/sports/images/nba/players/50/33091.png
      2      Recent  https://dkn.gs/sports/images/nba/players/50/33246.png
      3      Recent  https://dkn.gs/sports/images/nba/players/50/33330.png
      4      Recent  https://dkn.gs/sports/images/nba/players/50/33337.png
      5      Recent https://dkn.gs/sports/images/nba/players/50/527225.png
      6      Recent https://dkn.gs/sports/images/nba/players/50/649550.png
      7    Breaking https://dkn.gs/sports/images/nba/players/50/649547.png
      8      Recent  https://dkn.gs/sports/images/nba/players/50/33092.png
                                                player_image160 alt_player_image50
      1  https://dkn.gs/sports/images/nba/players/160/33091.png                   
      2  https://dkn.gs/sports/images/nba/players/160/33246.png                   
      3  https://dkn.gs/sports/images/nba/players/160/33330.png                   
      4  https://dkn.gs/sports/images/nba/players/160/33337.png                   
      5 https://dkn.gs/sports/images/nba/players/160/527225.png                   
      6 https://dkn.gs/sports/images/nba/players/160/649550.png                   
      7 https://dkn.gs/sports/images/nba/players/160/649547.png                   
      8  https://dkn.gs/sports/images/nba/players/160/33092.png                   
        alt_player_image160 team_id team_abbreviation player_game_hash competition_id
      1                          23               SAC   850111-5956958        5956958
      2                           9               GSW   229598-5956958        5956958
      3                          22               POR  1121307-5957600        5957600
      4                          23               SAC   552336-5956958        5956958
      5                          19               ORL  1185943-5957600        5957600
      6                          22               POR  1371494-5957600        5957600
      7                          23               SAC  1231161-5956958        5956958
      8                          22               POR   601146-5957600        5957600
        competition_name       competition_start_time exp_fp
      1        GSW @ SAC 2023-10-28T02:00:00.0000000Z   51.0
      2        GSW @ SAC 2023-10-28T02:00:00.0000000Z   38.5
      3        ORL @ POR 2023-10-28T02:00:00.0000000Z   31.5
      4        GSW @ SAC 2023-10-28T02:00:00.0000000Z   45.0
      5        ORL @ POR 2023-10-28T02:00:00.0000000Z   33.5
      6        ORL @ POR 2023-10-28T02:00:00.0000000Z   28.5
      7        GSW @ SAC 2023-10-28T02:00:00.0000000Z   34.5
      8        ORL @ POR 2023-10-28T02:00:00.0000000Z   31.0
      
      $draft_group_id
      [1] 94768
      
      $salary_total
      [1] 50000
      
      $exp_fp_total
      [1] 293.5
      

