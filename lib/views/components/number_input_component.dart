import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputComponent extends StatelessWidget {
const NumberInputComponent({ Key? key, required this.controller, required this.label}) : super(key: key);
final TextEditingController controller;
final String label;

  @override
  Widget build(BuildContext context){
    return TextField(
            controller: controller,
            decoration: InputDecoration(icon: const Icon(Icons.sports_soccer_outlined),labelText: label),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ]
    );
  }
}