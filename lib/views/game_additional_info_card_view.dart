import 'package:flutter/material.dart';
import 'package:ybticketapp/model/game_model.dart';
import 'package:ybticketapp/views/components/lower_part_card_component.dart';
import 'package:ybticketapp/views/game_additional_info_view.dart';

class GameAdditionalInfoCardView extends StatelessWidget {
const GameAdditionalInfoCardView({ Key? key, required this.game }) : super(key: key);

  final GameModel game;
  @override
  Widget build(BuildContext context){
    return LowerPartCard(      
      children: [
        const GameAdditionalInfoView(title: "Ticketweitergabe", additionalInformation: "Der kommerzielle Weiterverkauf von Tickets ist nicht gestattet - https://bscyb.ch/AGB",),
        const GameAdditionalInfoView(title: "Kontakt", additionalInformation: "234323 | Heinrich Moser",),
        const GameAdditionalInfoView(title: "Vorgang · Ticketnummer", additionalInformation: "491232 | 09020328039",),
        GameAdditionalInfoView(title: "Preis", additionalInformation: "${game.gameModeType?.ticketPrice.toStringAsFixed(2) ?? "0.00"} CHF (inkl. Gebühren und 2,5% MwST.)"),
        const GameAdditionalInfoView(title: "Veranstalter", additionalInformation: "BSC Young Boys AG (CHE-111.703.91 MWST)"),
        const GameAdditionalInfoView(title: "Anreise", additionalInformation: "In den Libero-Zonen 100 und 101 sind die Hinfahrt zum Stadion Wankdorf und die Rückfahrt ab drei Stunden vor Spielgebinn und bis drei Stunden nach Spielende im matchticket bzw. in der Saisonkarte inbegriffen. Weitere Informationen zur Anreise findest Du HIER."),
        const GameAdditionalInfoView(title: "YB Ticket-App Nr.", additionalInformation: "BSCYB-10228719087020"),
      ]
    );
  }
}