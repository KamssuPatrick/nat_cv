import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/utils/constants.dart';


class FavorisPage extends StatefulWidget {
  const FavorisPage({Key? key}) : super(key: key);

  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
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
          "Mes Favoris",
          style: TextStyle(
              color: Color(0xFF4D70A6),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Container(
          height: ScreenUtil().setHeight(1280),
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 30),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
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
                    // SizedBox(
                    //   width: 20,
                    // )
                  ],
                );
              }),
        ),
      ],
    );
  }
}
