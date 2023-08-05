import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ybticketapp/model/game_mode_type.dart';
import 'package:ybticketapp/model/team_model.dart';
import 'package:ybticketapp/providers/gameModes_provider.dart';
import 'package:ybticketapp/providers/teams_provider.dart';

class GameModeSelectionDropdown extends ConsumerWidget {
  const GameModeSelectionDropdown({super.key, this.selectedMode, required this.onChanged});
  final GameModeType? selectedMode;
  final Function(GameModeType?) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gameModes = ref.watch(gameModeProvider);
    return DropdownButton<GameModeType>(
      value: selectedMode,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black54,
      ),
      onChanged: onChanged,
      items: gameModes.map<DropdownMenuItem<GameModeType>>((GameModeType value) {
        return DropdownMenuItem<GameModeType>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}
