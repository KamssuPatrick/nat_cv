import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/utils/constants.dart';

class NeumorphicFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: EdgeInsets.all(14),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: Icon(
        Icons.favorite,
        color: kColorPrimaryBlue,
        size: 25,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}