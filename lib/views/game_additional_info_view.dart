import 'package:flutter/material.dart';

class GameAdditionalInfoView extends StatelessWidget {
const GameAdditionalInfoView({ Key? key, required this.title, required this.additionalInformation }) : super(key: key);
  final String title;
  final String additionalInformation;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title.toUpperCase(), 
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 15.0,
            fontFamily: 'UtilityOT',
            height: 1.6
          ),
        ),
        Text(
          additionalInformation,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.grey[800],
            fontSize: 15.0,
            fontFamily: 'UtilityOT',
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}