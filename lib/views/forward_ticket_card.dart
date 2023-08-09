import 'package:flutter/material.dart';
import 'package:ybticketapp/views/components/lower_part_card_component.dart';

class ForwardTicketCard extends StatelessWidget {
  const ForwardTicketCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LowerPartCard(
      children: [
        const Row(
          
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Ticket weiterleiten", textAlign: TextAlign.start, style: TextStyle(fontFamily: 'UtilityOT', fontWeight: FontWeight.bold, fontSize: 18.0, height: 1.6),),
          ],
        ),

        SizedBox(height: 8.0,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 30.0,
              height: 30.0,
              margin: const EdgeInsets.only(right: 15.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Icon(Icons.send, color: Colors.white, size: 15.0,)
            ),
            const Expanded(
              child: Text(
                "Du kannst dieses Ticket direkt in der YB Ticket-App an eine andere Person weiterleiten.",
                maxLines: 3,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'UtilityOT',
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0,),
        TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              side: const BorderSide(),
              borderRadius: BorderRadius.circular(10.0))
          ),
          child: const Text("Ticket weiterleiten", style: TextStyle(color: Colors.black, fontFamily: 'UtilityOT', fontWeight: FontWeight.bold, fontSize: 16.0),),
        ),
      ],
    );
  }
}