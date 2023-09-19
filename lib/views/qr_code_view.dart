import 'package:flutter/material.dart';

import 'package:ybticketapp/views/components/qr_code_component.dart';
import 'package:ybticketapp/views/components/timeComponent.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({super.key, required this.ticketNumber});
  final String ticketNumber;
  @override
  Widget build(BuildContext context) {

  return Card(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      color: const Color(0xFFFFD100),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
        child: Stack(
          
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 50,
                width: double.infinity,
              ),
            ),
            QrCodeComponent(qrCodeData: ticketNumber),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(270/360),
                  alignment: Alignment.center,
                  child: 
                    Container(
                      width: 140,
                      height: 10,
                      alignment: Alignment.centerRight,
                      child: Text(
                        ticketNumber, 
                        style: const TextStyle(fontFamily: "UtilityOT", fontSize: 9.0,), maxLines: 2,overflow: TextOverflow.clip,),
                    ),
                  ),
              ],
            ),
            const CurrentTimeComponent(),

            Container(
              width: 150,
              height: 150,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}