import 'package:flutter/material.dart';

class DateInputComponent extends StatelessWidget {
const DateInputComponent({ Key? key, required this.dateController, required this.onDateChanged}) : super(key: key);
final TextEditingController dateController;
final Function(DateTime?) onDateChanged;

  @override
  Widget build(BuildContext context){
    return TextField(
              
                controller: dateController, //editing controller of this TextField
                decoration: const InputDecoration( 
                
                   icon: Icon(Icons.calendar_today), //icon of text field
                   labelText: "Gib z Spiudatum ah" //label text of field
                ),
                readOnly: true,  // when true user cannot edit text 
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), //get today's date
                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2025),
                  
              );
              
              if(pickedDate != null ){
                  onDateChanged(pickedDate);
              }
            },
    );
  }
}