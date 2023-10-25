import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ybticketapp/model/game_mode_type.dart';
import 'package:ybticketapp/view_models/game_view_model.dart';
import 'package:ybticketapp/views/champions_league_icon_view.dart';
import 'package:ybticketapp/views/game_additional_info_card_view.dart';
import 'package:ybticketapp/views/game_box_view.dart';
import 'package:ybticketapp/views/game_info_view.dart';
import 'package:ybticketapp/views/qr_code_view.dart';
import 'package:ybticketapp/views/team_icon_view.dart';

import 'game_icon_view.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var game = ref.watch(gameStateProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton( onPressed: () {} , shape: const CircleBorder(), backgroundColor: Colors.black,child: const Icon(Icons.more_vert, color: Colors.white,)),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white,), onPressed: () => Navigator.pop(context),),
        title: const Column(
          children: [
            Text('Ticket 1 von 1', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontFamily: 'UtilityOT'),),
            Icon(Icons.circle, size: 10, color: Colors.white,),
          ]),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      
                      children: [
                        SizedBox(height: 160,),
                        Card(
                          color: Colors.white,
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Column(
                              children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green[200],
                                                
                                ),
                                child: 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [

                                      Icon(
                                        Icons.check_circle_outline_outlined,
                                        color: Colors.green[800],
                                        size: 15.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Ticket kontrolliert".toUpperCase(),
                                          
                                          style: TextStyle(
                                            color: Colors.green[800],
                                            fontFamily: 'UtilityOT',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            const Text("Spiel", style: TextStyle(fontFamily: 'UtilityOT', fontSize: 16),),
                                            Text(game.gameNumber.toString(), style: const TextStyle(fontFamily: 'UtilityOT', fontSize: 16, fontWeight: FontWeight.w700),),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          
                                          
                                          game.gameModeType == GameModeType.championsLeage ? 
                                          const ChampionsLeagueIconView(key: Key("TeamView"))
                                          : TeamIconView(
                                            key: const Key("TeamView"),
                                            homeTeam: game.homeTeam,
                                            awayTeam: game.awayTeam,                  
                                          ),
                                          SizedBox(height: 20),
                                          Text("${game.homeTeam?.name} - ${game.awayTeam?.name}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26, fontFamily: 'UtilityOT'), textAlign: TextAlign.center,),
                                          SizedBox(height: 20),
                                          const GameIconView(icon: Icons.location_on_outlined, title: "Stadion Wankdorf"),
                                          
                                          GameIconView(icon: Icons.calendar_today_outlined, title: DateFormat("dd.MM.yyyy").format(game.gameTime ?? DateTime.now())),
                                          GameIconView(icon: Icons.watch_later_outlined, title: "Spielbeginn ${DateFormat("Hm").format(game.gameTime ?? DateTime.now())}"),
                                          SizedBox(height: 20),
                                          SizedBox(
                                            width: double.infinity,
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              spacing: 5.0,
                                              runSpacing: 5.0,
                                              children: [
                                                GameBoxView(title: "Block", value: game.seatModel?.section ?? ""),
                                                GameBoxView(title: "Reihe", value: game.seatModel?.row.toString() ?? ""),
                                                GameBoxView(title: "Platz", value: game.seatModel?.seat.toString() ?? ""),
                                                const GameBoxView(title: "Kategorie", value: "D Balkon YB-Fanzone"),
                                                GameBoxView(title: "Tarif", value: game.gameModeType?.tarif ?? ''),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 15),
                                          GameInfoView(title: "Stadionöffnung", value: "${DateFormat('Hm').format(game.gameTime?.subtract(const Duration(minutes: 90)) ?? DateTime.now())} Uhr"),
                                          const GameInfoView(title: "Stadioneingang", value: "D Süd / D Ost"),
                                          GameInfoView(title: "Wettbewerb", value: "${game.gameModeType?.name ?? ''} 2023/24"),
                                          const GameInfoView(title: "Spieltag", value: "Spieltag 3"),
                                          GameInfoView(title: "Abonnement", value: game.gameModeType?.abotype ?? ''),
                                          SizedBox(height: 15),
                                          
                                        
                                      ]
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.grey[300],
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(),
                                      Text("Nicht übertragbares Ticket".toUpperCase(), 
                                      style: const TextStyle(
                                        fontFamily: 'UtilityOT',
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      const Icon(
                                        Icons.info_outline_rounded,
                                        size: 15.0,
                                      )
                                    ],
                                  ),
                                ),
                              )
                              ]
                            ),
                          ),
                        ),
                                  
                      ]),
                  ),
                ),
                Container(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  child: GameAdditionalInfoCardView(game: game),
                )
              ],
            ),
          ),
          Container(
            color: Colors.black,
            margin: const EdgeInsets.only(bottom: 10),
            child: const SizedBox(
              height: 160,
              child: QrCodeView(key: Key("QRCodeView"), ticketNumber: "293931086241625872820005",)
            ),
          ),

        ],
      ),
    );
  }
}

