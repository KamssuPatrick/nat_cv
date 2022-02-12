import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/utils/constants.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {

  bool status = true;

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
          "Mes alertes",
          style: TextStyle(
              color: Color(0xFF4D70A6),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),

        Container(
          height: ScreenUtil().setHeight(680),
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 12,
              itemBuilder: (context,index){
                return  Row(
                  children: [
                    Container(
                      width: 320,
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(590),
                      margin: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                          color: Color(0xFFF1F3F6),
                          borderRadius:
                          BorderRadius.all(Radius.circular(20)),
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
                      child: Padding(
                        padding: EdgeInsets.only(left: 1, top: 1, bottom: 1),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 6,
                              child: Stack(
                                children: [
                                  Container(
                                    // color: Colors.redAccent,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Container(
                                            // color: Colors.yellow,
                                            child:  InnerShadow(
                                              color: Color(0xFF4D70A6).withOpacity(.2),
                                              offset: Offset(5, 5),
                                              blur: 2,
                                              child: Container(
                                                height: ScreenUtil().setHeight(200),
                                                width: ScreenUtil().setHeight(230),
                                                // margin: EdgeInsets.symmetric(vertical: 1),
                                                decoration: BoxDecoration(
                                                  // borderRadius: BorderRadius.circular(10),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: AssetImage("assets/images/logos/NatLogo.jpg")
                                                    )
                                                  // color: Color(0xFFF1F3F6),
                                                ),
                                                // child: Image.asset("assets/images/logos/NatLogo.jpg"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 7,
                                          child: Container(
                                            // color: Colors.green,
                                            padding: EdgeInsets.only(left: 3, top: 5, bottom: 3),
                                            child: Container(
                                              padding: EdgeInsets.only(left: 5, top: 5),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Développeur Full Stack",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: kBlueColorLight),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),

                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.location_on_outlined,
                                                        color: kBlueColorLight,
                                                        size: 25,
                                                      ),
                                                      Text(
                                                        "Douala, Douala II, \nCommunauté urbaine de douala, \nWouri, Littoral, \n 3522 DLA, Cameroun",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14
                                                        ),
                                                      )
                                                    ],
                                                  ),

                                                  Row(
                                                    children: const [
                                                      Icon(
                                                        Icons.monetization_on_outlined,
                                                        color: kBlueColorLight,
                                                        size: 25,
                                                      ),
                                                      Text(
                                                        "70 000 - 100 000",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14
                                                        ),
                                                      )
                                                    ],
                                                  )

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                        top: 7,
                                        left: 14,
                                        child: Icon(
                                          FontAwesomeIcons.solidStar,
                                          size: 20,
                                          color: Color(0xFF4D70A6).withOpacity(0.5),
                                        ),
                                      ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                // color: Colors.blueGrey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Divider(),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(left: 25, bottom: 3),
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.blue, // Button color
                                              child: InkWell(
                                                splashColor: Colors.red, // Splash color
                                                onTap: () {},
                                                child: SizedBox(width: 26, height: 26, child: Icon(Icons.wallet_travel, size: 16, color: Colors.white,)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "CDD",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20
                                          ),
                                        )

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    )
                  ],
                );
              }),
        ),


        // Stack(
        //   children: <Widget>[
        //
        //
        //     // Positioned(
        //     //   top: 22,
        //     //   left: 10,
        //     //   child: Icon(
        //     //     FontAwesomeIcons.star,
        //     //     size: 20,
        //     //     color: Color(0xFF4D70A6).withOpacity(0.5),
        //     //   ),
        //     // ),
        //     // Positioned(
        //     //   bottom: 30,
        //     //   right: 20,
        //     //   child: Icon(
        //     //     FontAwesomeIcons.ccMastercard,
        //     //     size: 40,
        //     //     color: Color(0xFF4D70A6).withOpacity(0.5),
        //     //   ),
        //     // ),
        //
        //   ],
        // ),
        SizedBox(
          height: ScreenUtil().setHeight(40),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
        //     Container(
        //       child: CustomSwitch(
        //         activeColor: Color(0xFFF1F3F6),
        //         value: status,
        //         onChanged: (value) {
        //           setState(() {
        //             status = value;
        //           });
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     Text(
        //       "Active",
        //       style: TextStyle(
        //           color: Color(0xFF4D70A6),
        //           fontSize: 14,
        //           fontWeight: FontWeight.bold),
        //     ),
        //     Text(
        //       "Foce ID before payment",
        //       style: TextStyle(
        //         color: Color(0xFF4D70A6).withOpacity(.7),
        //         fontSize: 14,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(
        //   height: ScreenUtil().setHeight(60),
        // ),
        Text(
          "Tous les Jobs",
          style: TextStyle(
              color: Color(0xFF4D70A6),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        listTile("Secrectariat Bureautique", "75 000 \$", FontAwesomeIcons.briefcase),
        listTile("Comptabilité et Finance", "80 000 \$", FontAwesomeIcons.briefcase),
        listTile("Marketing Digital", "100 000 \$",
            FontAwesomeIcons.briefcase),
      ],
    );
  }

  Widget listTile(String title, String cost, IconData icon) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(330),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xFFF1F3F6),
          borderRadius: BorderRadius.all(Radius.circular(20)),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          transationCards(icon),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF4D70A6).withOpacity(.7)),
                ),
                Text(
                  "Douala, Douala II, \nCommunauté urbaine de douala, \nWouri, Littoral, \n 3522 DLA, Cameroun",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4D70A6).withOpacity(.7)),
                ),
                // Text(
                //   cost,
                //   style: TextStyle(
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       color: Color(0xFF4D70A6).withOpacity(.7)),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget transationCards(IconData icon) {
    return Container(
      height: ScreenUtil().setHeight(130),
      width: ScreenUtil().setHeight(130),
      decoration: BoxDecoration(
          color: Color(0xFFF1F3F6),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10),
                color: Color(0xFF4D70A6).withOpacity(0.2),
                blurRadius: 16),
            BoxShadow(
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
