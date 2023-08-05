import 'package:flutter/material.dart';

class GameIconView extends StatelessWidget {
const GameIconView({ Key? key, required this.icon, required this.title }) : super(key: key);

final IconData icon;
final String title;

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      
      children: [
        Icon(icon, size: 18.0,),
        const SizedBox(width: 8,),
        Text(title, style: TextStyle(fontFamily: 'UtilityOT', color: Colors.grey[800], fontSize: 15.0, height: 1.6),),
      ],
    );
  }
}