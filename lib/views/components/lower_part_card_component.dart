import 'package:flutter/material.dart';

class LowerPartCard extends StatelessWidget {
  const LowerPartCard({
    super.key, required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15.0,
      shadowColor: Colors.black,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),

      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}