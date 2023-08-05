import 'package:flutter/material.dart';

class TimeInputComponent extends StatelessWidget {
const TimeInputComponent({ Key? key, required this.timeController, required this.onTimeChanged }) : super(key: key);
final TextEditingController timeController;
final Function(TimeOfDay?) onTimeChanged;

  @override
  Widget build(BuildContext context){
    return TextField(
              
                controller: timeController, //editing controller of this TextField
                decoration: const InputDecoration( 
                
                   icon: Icon(Icons.watch_later_outlined), //icon of text field
                   labelText: "Gib d Spiuzyt ah" //label text of field
                ),
                readOnly: true,  // when true user cannot edit text 
                onTap: () async {
              TimeOfDay? pickedDate = await showTimePicker(
                  context: context,
                  initialTime: const TimeOfDay(hour: 16, minute: 30), //get today's date
                  builder: (context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                  
              );
              
              if(pickedDate != null ){
                  onTimeChanged(pickedDate);

              }
            },
    );
  }
}