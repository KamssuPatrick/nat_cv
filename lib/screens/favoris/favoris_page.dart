import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/components/recent_job_component.dart';
import 'package:nat_cv/utils/constants.dart';


class FavorisPage extends StatefulWidget {
  const FavorisPage({Key? key}) : super(key: key);

  @override
  _FavorisPageState createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> with TickerProviderStateMixin{

  late AnimationController animationController;

  List<Map<dynamic, dynamic>> lists = [];
  TabController? _controller;

  @override
  void initState() {

    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(1),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context,index){

              final int count =
              20 > 10 ? 10 : 20;
              final Animation<double> animation =
              Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      parent: animationController,
                      curve: Interval(
                          (1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn)));
              animationController.forward();

              return  Padding(
                  padding: EdgeInsets.only(left: 15, ),
                  child: RecentJobComponent(
                    animation: animation,
                    animationController: animationController,
                    // data: {},
                  ));
            }),
      ],
    );
  }
}
