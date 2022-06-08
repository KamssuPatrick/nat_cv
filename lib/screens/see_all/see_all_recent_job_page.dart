import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/components/recent_job_component.dart';
import 'package:nat_cv/screens/detail_alerte/detail_alerte_page.dart';
import 'package:nat_cv/utils/constants.dart';
import 'package:nat_cv/widgets/top_bar.dart';

class SeeAllRecentJobPage extends StatefulWidget {
  const SeeAllRecentJobPage({Key? key}) : super(key: key);

  @override
  _SeeAllRecentJobPageState createState() => _SeeAllRecentJobPageState();
}

class _SeeAllRecentJobPageState extends State<SeeAllRecentJobPage> with TickerProviderStateMixin{




  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      theme: NeumorphicThemeData(
          defaultTextColor: Color(0xFF303E57),
          accentColor: Color(0xFF7B79FC),
          variantColor: Colors.black38,
          baseColor: Color(0xFFF8F9FC),
          depth: 8,
          intensity: 0.5,
          lightSource: LightSource.topLeft),
      themeMode: ThemeMode.light,
      child: Material(
        child: NeumorphicBackground(
          child: _ClockFirstPage(),
        ),
      ),
    );
  }
}

class _ClockFirstPage extends StatefulWidget {
  @override
  createState() => _ClockFirstPageState();
}

class _ClockFirstPageState extends State<_ClockFirstPage> with TickerProviderStateMixin{

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
    final theme = Theme.of(context);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding:  EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
            child: TopBar(actions: [], isMenu: false, title: "Recent Jobs", haveFavorite: false,),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),

          Flexible(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 20,
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

                  return  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailAlertPage();
                        },
                        ),
                      );
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(28, 5, 5, 0),
                        child: RecentJobComponent(
                          animation: animation,
                          animationController: animationController,
                        )),
                  );
                }),
          )



        ],
      ),
    );
  }
}
