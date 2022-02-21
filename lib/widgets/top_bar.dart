import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/widgets/back_boutton.dart';
import 'package:nat_cv/widgets/drawer_boutton.dart';

// import 'back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isMenu;
  final List<Widget> actions;

  static const double kToolbarHeight = 110.0;

  const TopBar({this.title = "", required this.actions, required this.isMenu});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: isMenu ? NeumorphicDrawer() : NeumorphicBack()),
          Center(
            child: Text(
              this.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: NeumorphicTheme.isUsingDark(context)
                    ? Colors.white70
                    : Colors.black87,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions ?? [],
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}