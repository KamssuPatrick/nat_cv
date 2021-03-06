import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/widgets/back_boutton.dart';
import 'package:nat_cv/widgets/drawer_boutton.dart';
import 'package:nat_cv/widgets/like_boutton_neo.dart';

// import 'back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isMenu, haveFavorite;
  final List<Widget> actions;

  static const double kToolbarHeight = 110.0;

  const TopBar({this.title = "", required this.actions, required this.isMenu, required this.haveFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: isMenu ? NeumorphicDrawer() : NeumorphicBack()),
          haveFavorite ? Align(alignment: Alignment.centerRight, child:  NeumorphicFavorite()) : Container(),
          Center(
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.white70
                    : Colors.black87,
              ),
            ),
          ),
          // Align(
          //     alignment: Alignment.centerRight,
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: actions ?? [],
          //     )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}