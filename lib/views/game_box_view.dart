import 'package:flutter/material.dart';

class GameBoxView extends StatelessWidget {
const GameBoxView({ Key? key, required this.title, required this.value }) : super(key: key);

final String title;
final String value;
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            fontFamily: 'UtilityOT'
          ),
          ),
          Text(value,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            fontFamily: 'UtilityOT'
          ),),
        ]),
    );
  }
}