import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class BoxWithMovingBorderComponent extends StatelessWidget {
  const BoxWithMovingBorderComponent({
    super.key,
    required this.firstStartBorder,
    required this.firstEndBorder,
    required this.child,
    required this.width,
    required this.height,
    this.delay = const Duration(milliseconds: 0),
  });

  final DynamicBorderSide firstStartBorder;
  final DynamicBorderSide firstEndBorder;
  final Widget child;
  final int width;
  final int height;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    return ExplicitAnimatedStyledContainer(
      style: Style(
        width: width.toPXLength,
        height: height.toPXLength,
        alignment: Alignment.center,
        childAlignment: Alignment.center,
        shapeBorder: RectangleShapeBorder(
          border: firstStartBorder.copyWith(strokeCap: StrokeCap.square)),

      ),
      localAnimations: {
        AnimationTrigger.visible: MultiAnimationSequence(
          control: Control.loop,
          sequences: {
            AnimationProperty.shapeBorder:
              AnimationSequence<MorphableShapeBorder>()
              ..add(
                duration: const Duration(milliseconds: 4000),
                delay: Duration(),
                value: RectangleShapeBorder(
                  border: firstEndBorder.copyWith(
                    strokeCap: StrokeCap.square,
                  ),
                ),
              )
          },
          
          
        ) 
      },
      child: child,
                  
    );
  }
}