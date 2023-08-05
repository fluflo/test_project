import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ybticketapp/model/team_model.dart';

class TeamIconView extends StatelessWidget {
const TeamIconView({ Key? key, this.homeTeam, this.awayTeam  }) : super(key: key);
final TeamModel? homeTeam; 
final TeamModel? awayTeam;
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
      child: Row( 
          mainAxisSize: MainAxisSize.min,      
          children: [
          Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(color: Color(0xFFFFD100)),
              alignment: Alignment.center,
              child: SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(homeTeam?.logoAssetName ?? "", ))),
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(color: Colors.black),
              alignment: Alignment.center,
              child: SizedBox(
                height: 60,
                width: 60,
                child: Image.asset(awayTeam?.logoAssetName ?? "",))),
          ],
      ),
    );
  }
}