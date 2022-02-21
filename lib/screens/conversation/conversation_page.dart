import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/utils/constants.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
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
          "Mes Conversations",
          style: TextStyle(
              color: Color(0xFF4D70A6),
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(80),
        ),
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index)
            {
              return Column(
                children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    // color: Colors.red,
                    padding: EdgeInsets.only( right: 10, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.orange,
                            child: Center(
                              child: Container(
                                width: 67.0,
                                height: 67.0,
                                padding: EdgeInsets.only( left: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage("assets/images/logos/NatLogo.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all( Radius.circular(50.0)),
                                  border: Border.all(
                                    color: kBlueColorLight,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex : 2,
                          child: Container(
                            // color: Colors.green,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 2,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex : 2,
                                        child: Container(
                                          // color: Colors.red,
                                          child: AutoSizeText("Kamssu Patrick".toUpperCase(), style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.black,
                                            fontFamily: 'Building_Typeface',
                                            fontWeight: FontWeight.normal,),
                                            minFontSize: 21,
                                            maxFontSize: 26,),
                                        ),
                                      ),
                                      // Expanded(
                                      //   flex : 1,
                                      //   child: Container(
                                      //     // color: Colors.green,
                                      //     child: AutoSizeText("Conseiller I&P", style: TextStyle(
                                      //         fontSize: 16,
                                      //         color: Colors.black,
                                      //         fontFamily: 'Karla',
                                      //         fontWeight: FontWeight.w700),
                                      //       minFontSize: 12,
                                      //       maxFontSize: 16,),
                                      //   ),
                                      // ),
                                      // SizedBox(
                                      //   height: 5,
                                      // ),
                                      Expanded(
                                        flex : 2,
                                        child: Container(
                                          // color: Colors.green,
                                            padding: EdgeInsets.only(top: 5),
                                            child:  AutoSizeText("Projet ", style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'Karla',
                                                fontWeight: FontWeight.w700),
                                              minFontSize: 12,
                                              maxFontSize: 14,)
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              flex : 1,
                                              child:  Icon(
                                                Icons.file_copy_outlined, size: 10, color: Colors.black,),
                                            ),
                                            Expanded(
                                              flex: 12,
                                              child: Container(
                                                  child: AutoSizeText(
                                                    "Patrick",
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 12,
                                                      fontFamily: 'Karla',
                                                      fontWeight: FontWeight.w500,),
                                                    minFontSize: 5,
                                                    maxFontSize: 20,
                                                  )
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            // color: Colors.purple,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    // "${DateFormat('d MMM yyyy').format(DateTime.parse(snapshot.data[index].created_at))}",
                                    "22/01/2022",
                                    style: TextStyle(
                                      // fontSize: 15,
                                      color: Colors.grey,
                                      fontFamily: 'Karla',
                                      fontWeight: FontWeight.w500,),
                                    minFontSize: 5,
                                    maxFontSize: 15,
                                  ),
                                ),

                                // snapshot.data[index].not_seen != 0 ? Padding(
                                //     padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                                //     child: Container(
                                //       width: 60,
                                //       height: 20,
                                //       child: Column(
                                //         children: <Widget>[
                                //           CircleAvatar(
                                //             radius: 9,
                                //             child: Text( "${snapshot.data[index].not_seen}",
                                //               style:
                                //               TextStyle(fontSize: 10),
                                //             ),
                                //             backgroundColor:
                                //             Colors.red[400],
                                //             foregroundColor: Colors.white,
                                //           ),
                                //         ],
                                //       ),
                                //     ))
                                //     : Container()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(height: 3,)
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
