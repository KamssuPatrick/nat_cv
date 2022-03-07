import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/common/ui/non_overscroll_widget.dart';
import 'package:nat_cv/screens/settings/tab_interface.dart';
import 'package:nat_cv/screens/settings/widget/text_input_widget.dart';
import 'package:nat_cv/utils/expande_text.dart';

class DescriptionTabDetail extends TabInterface {
   DescriptionTabDetail({required String titleName}) : super(titleName);

  @override
  _DescriptionTabDetailState createState() => _DescriptionTabDetailState();
}

class _DescriptionTabDetailState extends State<DescriptionTabDetail> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";


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
            "Company Description",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          ExpandableText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
            trimLines: 7,
          ),

          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),

          Text(
            "Job Overview",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),

          ExpandableText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque scelerisque efficitur posuere. Curabitur tincidunt placerat diam ac efficitur. Cras rutrum egestas nisl vitae pulvinar. Donec id mollis diam, id hendrerit neque. Donec accumsan efficitur libero, vitae feugiat odio fringilla ac. Aliquam a turpis bibendum, varius erat dictum, feugiat libero. Nam et dignissim nibh. Morbi elementum varius elit, at dignissim ex accumsan a',
            trimLines: 5,
          ),


        ],
      ),
    );
  }
}
