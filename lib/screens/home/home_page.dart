import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/screens/accueil/accueil_screen.dart';
import 'package:nat_cv/screens/alert/alert_page.dart';
import 'package:nat_cv/screens/conversation/conversation_page.dart';
import 'package:nat_cv/screens/favoris/favoris_page.dart';
import 'package:nat_cv/screens/settings/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool statusHome = true;
  bool statusFilm = false;
  bool statusData = false;
  bool statusChat = false;
  bool statusSetting = false;





  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: const Size(1080, 1920),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
        backgroundColor: const Color(0xFFF1F3F6),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.4,
            margin:
            EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            statusHome = true;
                            statusSetting = false;
                            statusData = false;
                            statusChat = false;
                            statusFilm = false;
                          });
                        },
                        child:
                        socialButton(Icons.home, selected: statusHome)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            statusHome = false;
                            statusSetting = false;
                            statusData = false;
                            statusChat = false;
                            statusFilm = true;
                          });
                        },
                        child: socialButton(FontAwesomeIcons.solidStar,
                            selected: statusFilm)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            statusHome = false;
                            statusSetting = false;
                            statusData = true;
                            statusChat = false;
                            statusFilm = false;
                          });
                        },
                        child: socialButton(FontAwesomeIcons.solidBell,
                            selected: statusData)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            statusHome = false;
                            statusSetting = false;
                            statusData = false;
                            statusChat = true;
                            statusFilm = false;
                          });
                        },
                        child: socialButton(Icons.chat_bubble,
                            selected: statusChat)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            statusHome = false;
                            statusSetting = true;
                            statusData = false;
                            statusChat = false;
                            statusFilm = false;
                          });
                        },
                        child: socialButton(Icons.settings,
                            selected: statusSetting)),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(1),
                ),
                Flexible(
                  child: ListView(
                    children: [
                      Container(
                      height: MediaQuery.of(context).size.height * 1.4,
                      child: Column(
                        children: [

                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[


                                statusHome
                                    ? AccueilPage()
                                    : statusFilm
                                        ? Container(
                                            // padding: EdgeInsets.all(1),
                                            child: FavorisPage())
                                        : statusData
                                            ? AlertPage()
                                            : statusChat
                                                ? ConversationPage()
                                                : SettingsScreen()
                              ],
                            ),
                          ),
                        ],
                      ),
                    )],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget socialButton(IconData icon, {bool selected = false}) {
    return selected
        ? Stack(
            children: <Widget>[
              InnerShadow(
                color: Color(0xFF4D70A6).withOpacity(.2),
                offset: Offset(5, 5),
                blur: 2,
                child: Container(
                  height: ScreenUtil().setHeight(130),
                  width: ScreenUtil().setHeight(130),
                  margin: EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF1F3F6),
                  ),
                  child: Icon(
                    icon,
                    color: Color(0xFF4D70A6),
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 14,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF4D70A6)),
                ),
              )
            ],
          )
        : Container(
            height: ScreenUtil().setHeight(130),
            width: ScreenUtil().setHeight(130),
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Color(0xFFF1F3F6),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      color: Color(0xFF4D70A6).withOpacity(0.2),
                      blurRadius: 16),
                  const BoxShadow(
                      offset: Offset(-10, -10),
                      color: Color.fromARGB(170, 255, 255, 255),
                      blurRadius: 10),
                ]),
            child: Icon(
              icon,
              color: Color(0xFF4D70A6),
            ),
          );
  }
}
