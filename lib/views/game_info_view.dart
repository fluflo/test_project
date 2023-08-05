import 'package:flutter/material.dart';

class GameInfoView extends StatelessWidget {
const GameInfoView({ Key? key, required this.title, required this.value }) : super(key: key);

final String title;
final String value;
  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10.0,        
        alignment: WrapAlignment.spaceBetween,
        children: [
    
          Text(title.toUpperCase(), style: TextStyle(color: Colors.grey[800], fontSize: 15.0, fontFamily: 'UtilityOT', height: 1.6),),
          Text(value.toUpperCase(), style: const TextStyle(fontSize: 15.0, fontFamily: 'UtilityOT', height: 1.6,),),
        ],
      ),
    );
  }
}