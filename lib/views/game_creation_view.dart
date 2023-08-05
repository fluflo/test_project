import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:ybticketapp/model/game_mode_type.dart';
import 'package:ybticketapp/model/game_model.dart';
import 'package:ybticketapp/model/seat_model.dart';
import 'package:ybticketapp/model/team_model.dart';
import 'package:ybticketapp/providers/teams_provider.dart';
import 'package:ybticketapp/view_models/game_view_model.dart';
import 'package:ybticketapp/views/components/dateInputComponent.dart';
import 'package:ybticketapp/views/components/game_mode_selection_dropdown.dart';
import 'package:ybticketapp/views/components/timeComponent.dart';
import 'package:ybticketapp/views/components/timeInputComponent.dart';
import 'package:ybticketapp/views/game_view.dart';
import 'package:ybticketapp/views/teams_selection_dropdown.dart';

class GameCreationView extends ConsumerStatefulWidget {
  const GameCreationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameCreationViewState();
}

class _GameCreationViewState extends ConsumerState<GameCreationView> {
  TeamModel? opponent;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? selectedGameTime;
  GameModeType? selectedMode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Erstelle ein Ticket")),
      body: Column(
        children: [
          TeamsSelectionDropdown(
            key: const Key("TeamSelection"),
            selectedTeam: opponent,
            onChanged: (value) {
              setState(() {
                opponent = value!;
              });
            },
          ),
          DateInputComponent(
            dateController: dateController, 
            onDateChanged: (pickedDate) {
              String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate!);
              if (selectedGameTime != null) {
                setState(() {
                  selectedGameTime = DateTime.parse("${DateFormat('yyyy-MM-dd').format(pickedDate)} ${DateFormat('HH:mm').format(selectedGameTime!)}");
                });
              } else {
                setState(() {
                  selectedGameTime = pickedDate;
                });
              }

              setState(() {
                  dateController.text = formattedDate; //set foratted date to TextField value. 
              });
            }
          ),

          TimeInputComponent(timeController: timeController, onTimeChanged: (pickedTime){
            String formatedTime = pickedTime!.to24hours();
            if (selectedGameTime != null) {
              setState(() {
                selectedGameTime = DateTime.parse("${DateFormat('yyyy-MM-dd').format(selectedGameTime!)} ${pickedTime.to24hours()}");
              });
            } else {
              setState(() {
                selectedGameTime = DateTime.parse("${DateFormat('yyyy-MM-dd').format(DateTime.now())} ${pickedTime.to24hours()}");
              });
            }

            setState(() {
                timeController.text = formatedTime; //set foratted date to TextField value. 
            });
          }),

          GameModeSelectionDropdown(
            key: const Key("GameModeSelection"),
            selectedMode: selectedMode,
            onChanged: (value) {
              setState(() {
                selectedMode = value!;
              });
            },
          ),

          TextButton(onPressed: (){
            ref.read(gameStateProvider.notifier).state = GameModel(
              homeTeam: ref.read(ybProvider),
              gameTime: selectedGameTime,
              awayTeam: opponent,
              seatModel: SeatModel(
                section: "Balkon D13",
                seat: 622,
                row: 7
              ),
              gameModeType: selectedMode,
              gameNumber: 2,
            );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GameView()),
              );
          } , child: const Text("Ticket erstellen"),)
        ]),
    );
  }
}