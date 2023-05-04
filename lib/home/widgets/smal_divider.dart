// ignore_for_file: prefer_const_declarations, unused_local_variable

import 'package:flutter/material.dart';

class SmallDivider extends StatelessWidget {
  const SmallDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Style
    final height = 5;
    final width = 30;
    final radius = 25.0;

    // padding
    const left = 8.0;
    const right = 8.0;
    const top = 20.0;
    const bottom = 8.0;

    return Padding(
      padding: const EdgeInsets.only(
          left: left, right: right, top: top, bottom: bottom),
      child: Center(
        child: Container(
          height: 5,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
