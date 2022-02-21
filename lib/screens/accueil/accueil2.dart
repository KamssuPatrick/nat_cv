import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:nat_cv/style.dart';
import 'package:nat_cv/widgets/main_drawer.dart';
import 'package:nat_cv/widgets/timer.dart';
import 'package:nat_cv/widgets/top_bar.dart';

class Accueil2Page extends StatefulWidget {
  const Accueil2Page({Key? key}) : super(key: key);

  @override
  _Accueil2PageState createState() => _Accueil2PageState();
}

class _Accueil2PageState extends State<Accueil2Page> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: new Drawer(
          child: new ListView(
            children: <Widget>[

              new Container(child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: new Image.asset('assets/images/logo.png'),
              ),color: Color(0xFFf0f0f0),)

              ,
              new ListTile(
                leading: new Icon(Icons.photo),
                title: new Text("Photo"),
                trailing: new Text("96",style: TextStyle(fontWeight: FontWeight.bold),),

                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).pushNamed(PHOTO_CONTAINER_SCREEN);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.video_library),
                title: new Text("Video"),
                trailing: new Text("58",style: TextStyle(fontWeight: FontWeight.bold),),

                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).pushNamed(VIDEO_CONTAINER_SCREEN);
                },
              ),
              new ListTile(
                leading: new Icon(Icons.photo_library),
                trailing: new Text("56",style: TextStyle(fontWeight: FontWeight.bold),),

                title: new Text("Album"),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.of(context).pushNamed(ALBUM_CONTAINER_SCREEN);
                },
              )
            ],
          )),
      backgroundColor: NeumorphicTheme.baseColor(context),
      appBar: NeumorphicAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  <Widget>[
            // Padding(
            //   padding:  EdgeInsets.only(left: 8.0, right: 8.0, top: 9.0),
            //   child: TopBar(actions: [], isMenu: true,),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: Style.doublePadding),
            //   child: MainTimer(),
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(Style.doublePadding,
                  Style.mainPadding, Style.mainPadding, 0.0),
              child: Text(
                'task_count',
                style: TextStyle(
                    color: NeumorphicTheme.defaultTextColor(context)
                        .withOpacity(0.5),
                    fontSize: 16.00),
              )
              // Selector<Todo, int>(
              //     selector: (_, todo) => todo.total_items,
              //     shouldRebuild: (old_total, new_total) =>
              //     old_total != new_total,
              //     builder: (_, total_items, __) {
              //       return Text(
              //         'task_count',
              //         style: TextStyle(
              //             color: NeumorphicTheme.defaultTextColor(context)
              //                 .withOpacity(0.5),
              //             fontSize: 16.00),
              //       ).plural(total_items);
              //     }),
            ),
            // const Carousel(),
            const SizedBox(height: Style.doublePadding)
          ],
        ),
      ),
    );
  }
}
