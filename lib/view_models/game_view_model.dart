import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ybticketapp/model/game_mode_type.dart';
import 'package:ybticketapp/model/game_model.dart';
import 'package:ybticketapp/model/seat_model.dart';
import 'package:ybticketapp/providers/teams_provider.dart';


final gameStateProvider = StateProvider<GameModel>((ref) {
  var homeTeam = ref.watch(ybProvider);
  var awayTeam = ref.watch(winthiProvider);


  return GameModel(
    gameTime: DateTime(2023,8,5,18), 
    homeTeam: homeTeam,
    awayTeam: awayTeam,
    gameModeType: GameModeType.superLeage, 
    seatModel: SeatModel(section: "D13 Balkon", row: 7, seat: 622)
  );
  
});