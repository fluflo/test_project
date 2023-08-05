import 'package:ybticketapp/model/game_mode_type.dart';
import 'package:ybticketapp/model/seat_model.dart';
import 'package:ybticketapp/model/team_model.dart';

class GameModel {
  GameModel({
    DateTime? gameTime,
    TeamModel? homeTeam,
    TeamModel? awayTeam,
    GameModeType? gameModeType,
    SeatModel? seatModel,
    int? gameNumber,
  }) {
    _gameTime = gameTime;
    _homeTeam = homeTeam;
    _awayTeam = awayTeam;
    _gameModeType = gameModeType;
    _seatModel = seatModel;
    _gameNumber = gameNumber;
  }

  GameModel.fromJson(dynamic json) {
    _gameTime = json['gameTime'];
    _homeTeam = json['homeTeam'];
    _awayTeam = json['awayTeam'];
    _gameModeType = json['gameModeType'];
    _seatModel = json['seat'];
    _gameNumber = json['gameNumber'];
  }
  DateTime? _gameTime;
  TeamModel? _homeTeam;
  TeamModel? _awayTeam;
  GameModeType? _gameModeType;
  SeatModel? _seatModel;
  int? _gameNumber;

  GameModel copyWith({
    DateTime? gameTime,
    TeamModel? homeTeam,
    TeamModel? awayTeam,
    GameModeType? gameModeType,
    SeatModel? seatModel,
    int? gameNumber,
  }) =>
      GameModel(
        gameTime: gameTime ?? _gameTime,
        homeTeam: homeTeam ?? _homeTeam,
        awayTeam: awayTeam ?? _awayTeam,
        gameModeType: gameModeType ?? _gameModeType,
        seatModel: seatModel ?? _seatModel,
        gameNumber: gameNumber ?? _gameNumber,
      );
  DateTime? get gameTime => _gameTime;
  TeamModel? get homeTeam => _homeTeam;
  TeamModel? get awayTeam => _awayTeam;
  GameModeType? get gameModeType => _gameModeType;
  SeatModel? get seatModel => _seatModel;
  int? get gameNumber => _gameNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gameTime'] = _gameTime;
    map['homeTeam'] = _homeTeam;
    map['awayTeam'] = _awayTeam;
    map['gameModeType'] = _gameModeType;
    map['seat'] = _seatModel;
    map['gameNumber'] = _gameNumber;
    return map;
  }
}