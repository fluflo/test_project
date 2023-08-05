import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ybticketapp/model/team_model.dart';
import 'package:ybticketapp/providers/teams_provider.dart';

class TeamsSelectionDropdown extends ConsumerWidget {
  const TeamsSelectionDropdown({super.key, this.selectedTeam, required this.onChanged});
  final TeamModel? selectedTeam;
  final Function(TeamModel?) onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teams = ref.watch(teamsProvider);
    return DropdownButton<TeamModel>(
      value: selectedTeam,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black54,
      ),
      onChanged: onChanged,
      items: teams.map<DropdownMenuItem<TeamModel>>((TeamModel value) {
        return DropdownMenuItem<TeamModel>(
          value: value,
          child: Text(value.name ?? ""),
        );
      }).toList(),
    );
  }
}
