import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder_location/geocoder.dart';
import 'package:nat_cv/components/job_category_component.dart';
import 'package:nat_cv/components/recent_job_component.dart';
import 'package:nat_cv/models/emploie.dart';
import 'package:nat_cv/screens/detail_alerte/detail_alerte_page.dart';
import 'package:nat_cv/screens/see_all/see_all_recent_job_page.dart';
import 'package:nat_cv/services/get.dart';
import 'package:nat_cv/utils/constants.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({Key? key}) : super(key: key);

  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> with TickerProviderStateMixin{

  bool status = true;
  int selectedIndex = 0;
  TextEditingController _etSearch = TextEditingController();

  List<dynamic> listIcons = [Icons.account_balance, Icons.design_services, Icons.electrical_services];

  List<String> listTextIcon = ["Bank", "Design", "Electricien"];

  late AnimationController animationController;

  List<Map<dynamic, dynamic>> lists = [];

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      // Container(
      // child:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: ScreenUtil().setHeight(10),
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
            height: ScreenUtil().setHeight(5),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Job Category",
                style: TextStyle(
                    color: Color(0xFF1F1C1C).withOpacity(0.8),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "see all",
                style: TextStyle(
                    color: Color(0xFF4D70A6),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),

          Container(
            height: ScreenUtil().setHeight(300),
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: listTextIcon.length,
                itemBuilder: (context,index){



                  return  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: JobCategoryComponent(
                      icons : listIcons[index],
                      category: listTextIcon[index],
                      selected : selectedIndex,
                      index : index
                    ),
                  );
                }),
          ),

          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Jobs",
                style: TextStyle(
                    color: Color(0xFF1F1C1C).withOpacity(0.8),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SeeAllRecentJobPage()));
                },
                child: Text(
                  "see all",
                  style: TextStyle(
                      color: Color(0xFF4D70A6),
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          Container(
            height: ScreenUtil().setHeight(680),
            width: double.infinity,
            child: FutureBuilder<List<EmploieModel>?>(
              future: GetService.getAllEmploies(),
              builder: (context, snapshot) {

                if(!snapshot.hasData || snapshot.hasError)
                  {

                    return Center(
                      child: Text(
                        "Aucune donnée trouvée"
                      ),
                    );
                  }

                print("iiiii ${snapshot.data!.length}");
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){

                      final int count =
                      12 > 10 ? 10 : 7;
                      final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval(
                                  (1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                      animationController.forward();

                      return  GestureDetector(
                        onTap: () async{

                          // From a query

                          print("${snapshot.data![index].meta!.length}");
                          print("${snapshot.data![index].meta![28]["value"]}");
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return DetailAlertPage(data: snapshot.data![index]);
                            },
                            ),
                          );
                        },
                        child: RecentJobComponent(
                          animation: animation,
                          animationController: animationController,
                          data: snapshot.data![index]
                        ),
                      );
                    });
              }
            ),
          ),



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
         Container(
           height: 250,
           child: FutureBuilder<List<EmploieModel>?>(
             future: GetService.getAllEmploies(),
             builder: (context, snapshot) {

               if(!snapshot.hasData || snapshot.hasError)
               {

                 return Center(
                   child: Text(
                       "Aucune donnée trouvée"
                   ),
                 );
               }

               return ListView.builder(
                 shrinkWrap: true,
                 primary: false,
                 itemCount: snapshot.data!.length,
                 itemBuilder: (context, index)
                 {
                   return listTile(snapshot.data![index].nom_emploi.toString(), "75 000 \$", FontAwesomeIcons.briefcase, snapshot.data![index]);
                 },
               );
             }
           ),
         ),
          
        ],
      )

    // )
    ;
  }

  Widget listTile(String title, String cost, IconData icon, data) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(260),
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
                  "Region: ${data!.meta![6]["value"]}",
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
