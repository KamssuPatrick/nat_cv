import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/models/emploie.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:nat_cv/utils/constants.dart';

class JobOverviewTabDetail extends TabInterface {

  final EmploieModel? data;

  JobOverviewTabDetail({required String titleName, this.data}) : super(titleName);

  @override
  _JobOverviewTabDetailState createState() => _JobOverviewTabDetailState();
}

class _JobOverviewTabDetailState extends State<JobOverviewTabDetail> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),

          Text(
            "Job Overview",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.date_range,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date posted",
                      style: const TextStyle(
                          color: kColorPrimaryDark,
                          fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "May 2, 2022",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.alarm,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date d'expiration ",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "${widget.data!.meta![28]["value"]}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.close,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cloture des candidats",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "${widget.data!.meta![28]["value"]}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "${widget.data!.meta![6]["value"]}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.sort,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Career Level",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Director",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.wb_twilight_sharp,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Experience",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "10+ Years",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.wallet_travel_outlined,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qualification",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Master Degree",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.money_outlined,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rate",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "200 000 XAF/Mois",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),

          SizedBox(
            height: ScreenUtil().setHeight(40),
          ),

          Row(
            children: [
              Icon(
                Icons.perm_identity,
                size: 39,
                color: kColorPrimaryBlue.withOpacity(0.9),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Job Applications",
                      style: const TextStyle(
                        color: kColorPrimaryDark,
                        fontSize: 15,),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "2 Application(s)",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,),
                    ),
                  ],
                ),
              )
            ],
          ),



        ],
      ),
    );
  }
}
