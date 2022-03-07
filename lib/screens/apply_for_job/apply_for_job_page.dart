import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/utils/constants.dart';
import 'package:nat_cv/widgets/top_bar.dart';

class ApplyForJobPage extends StatefulWidget {
  const ApplyForJobPage({Key? key}) : super(key: key);

  @override
  _ApplyForJobPageState createState() => _ApplyForJobPageState();
}

class _ApplyForJobPageState extends State<ApplyForJobPage> {
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

  TabController? _controller;

  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding:  EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
              child: TopBar(actions: [], isMenu: false, title: "Apply for this job",),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(15),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(17)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: InputBorder.none,
                      ),
                    ),
                    
                  )
                ],
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: 50,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Enter Email',
                        border: InputBorder.none,
                      ),
                    ),

                  )
                ],
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Message",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: 130,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Your cover letter/ send to the employer...',
                        border: InputBorder.none,
                      ),
                    ),

                  )
                ],
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(5),
            ),

            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Message",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    height: 150,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10, ),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: Center(child: Image.asset("assets/images/upload_image.png",
                    height: 60,
                    width: 60,)),

                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Text(
                "Upload your CV/resume or any other relevant. \n Max. file size: 20 MB",
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(105),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ApplyForJobPage()));
              },
              child: Center(
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
                      Text("Send Application",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)
                  ),
                ),
              ),
            ),

            SizedBox(
              height: ScreenUtil().setHeight(115),
            ),

          ],
        ),
      ),
    );
  }
}
