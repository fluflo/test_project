import 'package:flutter/material.dart';

class ChampionsLeagueIconView extends StatelessWidget {
const ChampionsLeagueIconView({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 200,
      child: Image.asset("assets/logos/championsleague.png",scale: 2.0,)     
    );
  }
}