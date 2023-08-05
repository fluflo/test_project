import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ybticketapp/model/game_mode_type.dart';

final gameModeProvider = Provider<List<GameModeType>>((ref) {
  return [
    GameModeType.superLeage,
    GameModeType.championsLeage,
    GameModeType.cup,
  ];
});