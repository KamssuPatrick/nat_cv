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

  TextEditingController _etSearch = TextEditingController();



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
          child: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height * 1.4,
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      height: ScreenUtil().setHeight(30),
                    ),
                    Text(
                      "Hey, John Doe",
                      style: const TextStyle(
                          color: Color(0xFF908F8F),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Find Your ',
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF1F1C1C).withOpacity(0.8),
                            fontWeight: FontWeight.bold),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Perfect Job',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xFF0642C4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),

                    Container(
                      height: 100,
                      width: 500,
                      child: Row(
                        children: [
                          Flexible(

                            child: Container(
                              width: double.infinity,
                              // color: Colors.redAccent,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF1F3F6),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(10, 10),
                                        color: Color(0xFF4D70A6).withOpacity(0.2),
                                        blurRadius: 36),
                                    BoxShadow(
                                        offset: Offset(-10, -10),
                                        color: Color.fromARGB(170, 255, 255, 255),
                                        blurRadius: 10),
                                  ]),
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              height: kToolbarHeight,
                              child: Center(
                                child: TextFormField(
                                  controller: _etSearch,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                                  onChanged: (textValue) {
                                    setState(() {
                                      // _runFilter(textValue);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    // fillColor: Colors.red[100]!.withOpacity(0.9),
                                    // filled: true,
                                    hintText: 'Job keywords',
                                    prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                                    suffixIcon: (_etSearch.text == '')
                                        ? null
                                        : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _etSearch = TextEditingController(text: '');
                                          });
                                        },
                                        child: Icon(Icons.close, color: Colors.grey[500])),
                                    focusedBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        borderSide: BorderSide(color: Colors.grey[200]!.withOpacity(0.9)),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      borderSide: BorderSide(color: Colors.grey[100]!.withOpacity(0.9)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 20,
                          ),

                          Container(
                            height: kToolbarHeight,
                            width: kToolbarHeight,
                            // margin: EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                                color: Color(0xFF0642C4).withOpacity(0.9),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                              Icons.menu_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
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
                )),
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
