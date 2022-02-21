import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/screens/settings/widget/button_widget.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Text(
          "Mes Alerts",
          style: TextStyle(
              color: Color(0xFF4D70A6),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(440),
        ),

        Button.text(
          labelText: 'Définir mes alerts',
          onTap: () {},
        )
      ],
    );
  }
}
