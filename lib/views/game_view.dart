import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ybticketapp/view_models/game_view_model.dart';
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Column(
            
            children: [
              const QrCodeView(key: Key("QRCodeView"), ticketNumber: "293931086241625872820005",),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Padding(
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
                          TeamIconView(
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
                                const GameBoxView(title: "Tarif", value: "Vollpreis"),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          GameInfoView(title: "Stadionöffnung", value: "${DateFormat('Hm').format(game.gameTime?.subtract(const Duration(minutes: 90)) ?? DateTime.now())} Uhr"),
                          const GameInfoView(title: "Stadioneingang", value: "D Süd / D Ost"),
                          GameInfoView(title: "Wettbewerb", value: "${game.gameModeType?.name ?? ''} 2023/24"),
                          const GameInfoView(title: "Spieltag", value: "Runde 3"),
                          const GameInfoView(title: "Abonnement", value: "Saisonkarte 2023/24"),
                          SizedBox(height: 15),
                          
                        
                      ]
                      ),
                    ]
                  ),
      
                ),
              ),
        
            ]),
        ),
      ),
    );
  }
}