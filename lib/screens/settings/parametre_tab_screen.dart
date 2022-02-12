import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nat_cv/common/ui/non_overscroll_widget.dart';
import 'package:nat_cv/screens/notification/view/notification_screen.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:nat_cv/screens/settings/widget/text_input_widget.dart';
import 'package:nat_cv/utils/constants.dart';

import 'widget/button_widget.dart';

class ParametreTab extends TabInterface {
  ParametreTab(String titleName) : super(titleName);

  @override
  _ParametreTabState createState() => _ParametreTabState();
}

class _ParametreTabState extends State<ParametreTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final serverTextController = TextEditingController();

  final portTextController = TextEditingController();

  final usernameTextController = TextEditingController();

  final pathTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final serverKey = GlobalKey<TextInputState>();

  final portKey = GlobalKey<TextInputState>();

  final usernameKey = GlobalKey<TextInputState>();

  final pathKey = GlobalKey<TextInputState>();

  final passwordKey = GlobalKey<TextInputState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: NonOverscrollWidget(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 6.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[

                    ListTile(
                      leading:
                      Icon(Icons.monetization_on_outlined, size: 28, color: kBlueColorLight ),
                      title: Text('Centre de notification'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change password
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return NotificationScreen();
                          },
                          ),
                        );

                      },
                    ),
                    _buildDivider() ,
                    ListTile(
                      leading: Icon(
                        Icons.clear,
                        color: kBlueColorLight,
                      ),
                      title: Text('changer_de_langue'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      // onTap: () => navigateChangeLanguagePage(),
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.lock,
                        color: kBlueColorLight,
                      ),
                      title: Text('modifier_mot_de_passe'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        //open change location
                      },
                    ),
                    _buildDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: kBlueColorLight,
                      ),
                      title: Text('se_deconnecter'),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () async{
                        //open change location

                        // set up the buttons
                        Widget cancelButton = FlatButton(
                          child: Text('cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );
                        Widget continueButton = FlatButton(
                          child: Text('confirm'),
                          onPressed: () async {
                            String token ;


                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: Text('attention'),
                          content: Text('confirmation_deconnexion'),
                          actions: [
                            cancelButton,
                            continueButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 140),
            ],
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
