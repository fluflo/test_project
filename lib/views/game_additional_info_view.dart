import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class GameAdditionalInfoView extends StatelessWidget {
const GameAdditionalInfoView({ Key? key, required this.title, required this.additionalInformation, this.link = ""}) : super(key: key);
  final String title;
  final String additionalInformation;
  final String link;

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
        Linkify(
          text: additionalInformation,
          linkStyle: const TextStyle(
            fontSize: 15.0,
            fontFamily: 'UtilityOT',
            fontWeight: FontWeight.w700,
            decorationColor: Colors.blue,
          ),
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