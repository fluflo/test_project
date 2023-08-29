import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ybticketapp/model/team_model.dart';





var teamsProvider = Provider<List<TeamModel>>((ref) {
  var teams = [
    TeamModel(name: "FC Basel", logoAssetName: "assets/logos/fcb.png"),
    TeamModel(name: "FC Lugano", logoAssetName: "assets/logos/fclugano.png"),
    TeamModel(name: "FC Winterthur", logoAssetName: "assets/logos/fcw.png"),
    TeamModel(name: "FC Stade Lausanne-Ouchy", logoAssetName: "assets/logos/fcslo.png"),
    TeamModel(name: "FC Zürich", logoAssetName: "assets/logos/fcz.png"),
    TeamModel(name: "Grasshoppers Zürich", logoAssetName: "assets/logos/gc.png"),
    TeamModel(name: "Maccabi Haifa FC", logoAssetName: ""),
  ];

  return teams;
});

final ybProvider = Provider<TeamModel>((ref) {
  return TeamModel(name: "BSC Young Boys", logoAssetName: "assets/logos/yb.png");
});

final winthiProvider = Provider<TeamModel>((ref) {
  return TeamModel(name: "FC Winterthur", logoAssetName:"assets/logos/fcw.png");
});
