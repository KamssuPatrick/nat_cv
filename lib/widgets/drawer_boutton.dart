import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(18),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: Icon(
        Icons.menu_rounded,
        color: NeumorphicTheme.isUsingDark(context)
            ? Colors.white70
            : Colors.black87,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}