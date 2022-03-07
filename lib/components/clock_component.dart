import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/screens/detail_alerte/detail_alerte_page.dart';
import 'package:nat_cv/widgets/top_card.dart';

class ClockComponentCard extends StatefulWidget {
  const ClockComponentCard({Key? key}) : super(key: key);

  @override
  _ClockComponentCardState createState() => _ClockComponentCardState();
}

class _ClockComponentCardState extends State<ClockComponentCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: TopNeuCard(
            context: context,
            balance: "400000",
            income: "5000",
            expense: "4111",
          ),
        ),
        SizedBox(height: 30),
        Text(
          "6:21 PM",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            shadows: [
              Shadow(
                  color: Colors.black38,
                  offset: Offset(1.0, 1.0),
                  blurRadius: 2)
            ],
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        ),
        Text(
          "London, Uk",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: NeumorphicTheme.variantColor(context),
          ),
        ),
        SizedBox(height: 20),
        NeumorphicSelector(),
        SizedBox(height: 20),
      ],
    );
  }
}
