import 'dart:async';
import 'dart:math';

import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:ybticketapp/views/components/box_with_moving_border_component.dart';

class QrCodeComponent extends StatefulWidget {
  const QrCodeComponent({super.key, required this.qrCodeData});
  final String qrCodeData;

  @override
  State<QrCodeComponent> createState() => _StateQrCodeComponent();
}

class _StateQrCodeComponent extends State<QrCodeComponent> {
  double _progress = 0.0; // Change this value to update the progress
  double _secondProgress = 0.5;
    late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const duration = Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        _progress += 0.02;
        _secondProgress += 0.02;
        if (_progress >= 1.0) {
          _progress = 0;
        }
        if (_secondProgress >=1.0){
          _secondProgress = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    DynamicBorderSide firstStartBorder = DynamicBorderSide(
        
        width: 3,
        begin: 0.toPercentLength,
        end: 20.toPercentLength,
        shift: 0.toPercentLength,
        color: Colors.black,
        strokeCap: StrokeCap.round,
        strokeJoin: StrokeJoin.round);
    DynamicBorderSide firstEndBorder = DynamicBorderSide(
        width: 3,
        begin: 0.toPercentLength,
        end: 20.toPercentLength,
        shift: 100.toPercentLength,
        color: Colors.black,
        strokeCap: StrokeCap.round,
        strokeJoin: StrokeJoin.round);
    DynamicBorderSide secondStartBorder = DynamicBorderSide(
        width: 3,
        begin: 50.toPercentLength,
        end: 25.toPercentLength,
        shift: 0.toPercentLength,
        color: Colors.black,
        strokeCap: StrokeCap.round,
        strokeJoin: StrokeJoin.round);
    DynamicBorderSide secondEndBorder = DynamicBorderSide(
        width: 3,
        begin: 100.toPercentLength,
        end: 75.toPercentLength,
        shift: 50.toPercentLength,
        color: Colors.black,
        strokeCap: StrokeCap.round,
        strokeJoin: StrokeJoin.round);

    DynamicBorderSide firstBorder = DynamicBorderSide.lerp(firstStartBorder, firstEndBorder, 0);

    DynamicBorderSide secondBorder = DynamicBorderSide.lerp(secondStartBorder, secondEndBorder, 0);

    return Center(
        child: Container(
          width: 120,
          height: 120,
          color: Colors.white,
          child: CustomPaint(
            painter: BorderProgressPainter(progress: _progress, secondProgress: _secondProgress),
            child: Center(
              child: Container(
                  color: Colors.white,
                  child: QrImageView( 
                  data: widget.qrCodeData,
                  version: 3,
                  size: 100,
                  gapless: true,
                ),
              ),
            ),
          ),
        ),
      );
  }
}

class BorderProgressPainter extends CustomPainter {
  final double progress;
  final double secondProgress;
  final double strokeWidth;
  final Color color;

  BorderProgressPainter({
    required this.progress,
    required this.secondProgress,

    this.strokeWidth = 3.0,
    this.color = Colors.black,
  });


  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
  
    canvas.drawPath(getRectangle(size, progress), paint);
    canvas.drawPath(getRectangle(size, (secondProgress).abs()), paint);
  }

  Path getRectangle(Size size, double state ){
    var fullBorderLength = (size.width + size.height) * 2 - strokeWidth * 4;
    var lineLength = size.width * (3/4);
    var offset = (fullBorderLength) * state;
    var head = lineLength + offset;
    var rect = Path();

    //top
    if (offset < size.width){
      rect.moveTo(offset,0);
      rect.lineTo(min(lineLength + offset, size.width), 0);

    }

    // right
    if (head > size.width && head <= size.width + size.height){
      if (offset >= size.width){
        rect.moveTo(size.width,offset-size.width);
      }
      rect.lineTo(size.width,head - size.width);
    }

    if (head >= size.width + size.height && head < (fullBorderLength/4*3)){
      //right
      if (offset < size.width + size.height){
        rect.moveTo(size.width,offset - size.width);
        rect.lineTo(size.width,min(lineLength+(offset-size.width), size.height));
      } else {
        rect.moveTo(fullBorderLength/4*3-offset,size.height);
      }
      //bottom
      rect.lineTo(size.width - (head-size.width-size.height), size.height);

    }

    if (head >= (fullBorderLength/4*3) && head < fullBorderLength){
      if (offset <= fullBorderLength/4*3){
        rect.moveTo(fullBorderLength/4*3-offset,size.height);
        rect.lineTo(0,size.height);
      } else {
        rect.moveTo(0, max(fullBorderLength-offset, 0));
      }
      rect.lineTo(0, fullBorderLength-head);
    }
    if (head >= fullBorderLength) {
      rect.lineTo(0, max(fullBorderLength-offset, 0));
      rect.moveTo(0, 0);
      rect.lineTo(head-fullBorderLength, 0);
    }
    return rect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

