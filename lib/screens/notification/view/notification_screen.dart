import 'package:flutter/material.dart';
import 'package:nat_cv/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trois_immo/pages/language/change_laguage_page.dart';
// import 'package:trois_immo/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  late bool _dark;

  Brightness _getBrightness() {
    return _dark ? Brightness.dark : Brightness.light;
  }

  void initState() {
    super.initState();
    _dark = false;
    getAppTheme();
    print("ici_____if");

  }

  getAppTheme() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getBool("appTheme") != null )
    {
      setState(() {
        // _dark = prefs.getBool("appTheme");
      });

    }


  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        brightness: _getBrightness(),
      ),
      child: Scaffold(
        backgroundColor: _dark ? null : Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: _getBrightness(),
          iconTheme: IconThemeData(color: _dark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            'Centre de Notification',
            style: TextStyle(color: _dark ? Colors.white : Colors.black),
          ),
          // actions: <Widget>[
          //   IconButton(
          //     icon: Icon(FontAwesomeIcons.moon),
          //     onPressed: () {
          //       setState(() {
          //         _dark = !_dark;
          //       });
          //     },
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'parametre_notification'.tr(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                SwitchListTile(
                  activeColor: kBlueColorLight,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('recevoir_notification'),
                  onChanged: (val) {},
                ),
                _buildDivider(),
                SwitchListTile(
                  activeColor: kBlueColorLight,
                  contentPadding: const EdgeInsets.all(0),
                  value: false,
                  title: Text('recevoir_newsletter'),
                  onChanged: null,
                ),
                _buildDivider(),
                SwitchListTile(
                  activeColor: kBlueColorLight,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('recevoir_offre_notification'),
                  onChanged: (val) {},
                ),
                _buildDivider(),
                SwitchListTile(
                  activeColor: kBlueColorLight,
                  contentPadding: const EdgeInsets.all(0),
                  value: true,
                  title: Text('recevoir_update'),
                  onChanged: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
