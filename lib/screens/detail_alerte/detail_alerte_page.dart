import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/common/general/theme_provider.dart';
import 'package:nat_cv/common/ui/bulged_in_widget.dart';
import 'package:nat_cv/common/ui/clear_focus_container.dart';
import 'package:nat_cv/common/ui/tab_indicator.dart';
import 'package:nat_cv/models/emploie.dart';
import 'package:nat_cv/screens/apply_for_job/apply_for_job_page.dart';
import 'package:nat_cv/screens/detail_alerte/clock.dart';
import 'package:nat_cv/screens/detail_alerte/tab/description.dart';
import 'package:nat_cv/screens/detail_alerte/tab/job_overview.dart';
import 'package:nat_cv/screens/settings/general_tab_screen.dart';
import 'package:nat_cv/screens/settings/mon_cv_tab_screen.dart';
import 'package:nat_cv/screens/settings/parametre_tab_screen.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:nat_cv/utils/constants.dart';
import 'package:nat_cv/widgets/top_bar.dart';
import 'package:nat_cv/widgets/top_card.dart';

class DetailAlertPage extends StatefulWidget {
  final EmploieModel? data;
  const DetailAlertPage({Key? key, this.data}) : super(key: key);

  @override
  _DetailAlertPageState createState() => _DetailAlertPageState();
}

class _DetailAlertPageState extends State<DetailAlertPage> {
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
          child: _ClockFirstPage(data: widget.data),
        ),
      ),
    );
  }
}

class _ClockFirstPage extends StatefulWidget {
  final EmploieModel? data;

  const _ClockFirstPage({Key? key, this.data}) : super(key: key);
  @override
  createState() => _ClockFirstPageState();
}

class _ClockFirstPageState extends State<_ClockFirstPage> with TickerProviderStateMixin{

  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<TabInterface> tabs = [
      DescriptionTabDetail(titleName : 'Description', data: widget.data),
      JobOverviewTabDetail(titleName : 'Job Overview', data: widget.data),
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding:  EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
              child: TopBar(actions: [], isMenu: false, haveFavorite: false),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(330),
                  // margin: EdgeInsets.symmetric(vertical: 10),
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
                    padding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                    child:
                      Container(
                        // height: 100,
                        // width: 100,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(17)),
                    image: DecorationImage(
                                  image: AssetImage("assets/images/logos/NatLogo.jpg"),
                                  fit: BoxFit.fill,
                                  ),
                                  ),
                      )
                  ),
                ),
              ],
            ),

            SizedBox(
              height: ScreenUtil().setHeight(55),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.data!.nom_emploi.toString()}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "NatRH / ",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,),
                ),
                Icon(
                  Icons.location_on,
                  size: 14,
                ),
                Text(
                  "${widget.data!.meta![6]["value"]}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,),
                ),

              ],
            ),

            Container(
              height: 450,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kGreyColor.withOpacity(0.1)
              ),
              child: ClearFocusContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // const SizedBox(height: 24),
                          BulgedInWidget(
                            width: double.infinity,
                            height: 48,
                            cornerRadius: 18,
                            borderWidth: 2,
                            color: Colors.white,
                            child: TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: const BubbleTabIndicator(
                                indicatorHeight: 48,
                                indicatorColor: kColorPrimaryBlue,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                              labelPadding: EdgeInsets.all(0),
                              controller: _controller,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.white,
                              tabs: List.generate(
                                tabs.length,
                                    (index) {
                                  return Container(
                                    child: Center(
                                      child: Text(
                                        tabs[index].titleName,
                                        // style: theme.textTheme.bodyText2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _controller,
                        children: tabs,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ApplyForJobPage()));
              },
              child: Container(
                width: ScreenUtil().setHeight(730),
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(180),
                // margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: kColorPrimaryBlue.withOpacity(0.9),
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
                    padding: EdgeInsets.fromLTRB(13, 12, 13, 12),
                    child:
                    Text("Apply for Job",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),)
                ),
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(80),
            ),


          ],
        ),
      ),
    );
  }
}

class NeumorphicClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Neumorphic(
        margin: EdgeInsets.all(14),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: 14,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          margin: EdgeInsets.all(20),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: -8,
              boxShape: NeumorphicBoxShape.circle(),
            ),
            margin: EdgeInsets.all(10),
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                //the click center
                Neumorphic(
                  style: NeumorphicStyle(
                    depth: -1,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  margin: EdgeInsets.all(65),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: <Widget>[
                      //those childs are not "good" for a real clock, but will fork for a sample
                      Align(
                        alignment: Alignment.topCenter,
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment(-0.7, -0.7),
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment(0.7, -0.7),
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment(-0.7, 0.7),
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment(0.7, 0.7),
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _createDot(context),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _createDot(context),
                      ),
                      _buildLine(
                        context: context,
                        angle: 0,
                        width: 70,
                        color: NeumorphicTheme.accentColor(context),
                      ),
                      _buildLine(
                        context: context,
                        angle: 0.9,
                        width: 100,
                        color: NeumorphicTheme.accentColor(context),
                      ),
                      _buildLine(
                        context: context,
                        angle: 2.2,
                        width: 120,
                        height: 1,
                        color: NeumorphicTheme.variantColor(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLine(
      {BuildContext? context,
        double? angle,
        double? width,
        double height = 6,
        Color? color}) {
    return Transform.rotate(
      angle: angle!,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: width!),
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 20,
            ),
            child: Container(
              width: width,
              height: height,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _createDot(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -10,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: SizedBox(
        height: 10,
        width: 10,
      ),
    );
  }
}

class NeumorphicSelector extends StatelessWidget {
  final double _elementHeight = 14;
  final double _spacing = 10;

  Widget _buildSimpleButton(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -4,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: SizedBox(
        height: _elementHeight,
        width: _elementHeight,
      ),
    );
  }

  Widget _buildSelectedButton(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: -4,
        boxShape: NeumorphicBoxShape.stadium(),
        color: Color(0xffE1E8F5),
      ),
      child: SizedBox(
        height: _elementHeight,
        width: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildSimpleButton(context),
        SizedBox(
          width: _spacing,
        ),
        _buildSelectedButton(context),
        SizedBox(
          width: _spacing,
        ),
        _buildSimpleButton(context),
        SizedBox(
          width: _spacing,
        ),
        _buildSimpleButton(context),
      ],
    );
  }
}