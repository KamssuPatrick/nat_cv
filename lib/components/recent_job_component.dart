// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/models/emploie.dart';
import 'package:nat_cv/utils/constants.dart';

import '../utils/inner_shadow.dart';

class RecentJobComponent extends StatefulWidget {

  final AnimationController? animationController;
  final Animation<double>? animation;
  final EmploieModel? data;

  const RecentJobComponent({Key? key, this.animationController,
    this.animation, this.data,}) : super(key: key);

  @override
  _RecentJobComponentState createState() => _RecentJobComponentState();
}

class _RecentJobComponentState extends State<RecentJobComponent> {

  String lieuText = "Douala, Douala II, Communauté urbaine de douala, Wouri, Littoral, 3522 DLA, Cameroun";

  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.animation!,
        builder: (BuildContext context, Widget? child) {
      return FadeTransition(
        opacity: widget.animation!,
        child: Transform(
          transform: Matrix4.translationValues(
              0.0, 50 * (1.0 - widget.animation!.value), 0.0),
          child: Row(
            children: [
              Container(
                width: ScreenUtil().setHeight(975),
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(490),
                // padding: EdgeInsets.only(right: 15),
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
                                      margin: EdgeInsets.only(left: 3),
                                      child:  InnerShadow(
                                        color: Color(0xFF4D70A6).withOpacity(.2),
                                        offset: Offset(5, 5),
                                        blur: 2,
                                        // key: null,
                                        child: Container(
                                          height: ScreenUtil().setHeight(200),
                                          width: ScreenUtil().setHeight(200),
                                          // margin: EdgeInsets.symmetric(vertical: 1),
                                          decoration: BoxDecoration(
                                            // borderRadius: BorderRadius.circular(10),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/logos/NatLogo.jpg"),
                                                  fit: BoxFit.fill
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
                                      padding: EdgeInsets.only(left: 10, top: 15, bottom: 3,),
                                      child: Container(
                                        padding: EdgeInsets.only(left: 1, top: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                             Text(
                                              "${widget.data!.nom_emploi.toString() .length <= 40 ? widget.data!.nom_emploi.toString()  : widget.data!.nom_emploi.toString() .replaceRange(40, widget.data!.nom_emploi.toString() .length, "...")}",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: kBlueColorLight),
                                            ),
                                            Row(
                                              children:  [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  color: kBlueColorLight,
                                                  size: 25,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    "Region: ${widget.data!.meta![6]["value"]}",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 3,
                              right: 14,
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    isSelected = !isSelected;

                                    if(isSelected)
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Favoris ajouté",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                    else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "Favoris retiré",
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.grey,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    }
                                  });
                                },
                                child: Icon(
                                  isSelected ? FontAwesomeIcons.solidStar : FontAwesomeIcons.star,
                                  size: 20,
                                  color: Color(0xFF4D70A6).withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Container(
                          // color: Colors.blueGrey,
                          // margin: EdgeInsets.only(bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Divider(),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 25,),
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
          ),
        ),
      );
    });
  }
}
