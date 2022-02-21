import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nat_cv/screens/detail_alerte/detail_alerte_page.dart';

class JobCategoryComponent extends StatefulWidget {

  final dynamic icons;
  final String category;
  final int selected;
  final int index;
  const JobCategoryComponent({Key? key, this.icons, required this.category, required this.selected, required this.index}) : super(key: key);

  @override
  _JobCategoryComponentState createState() => _JobCategoryComponentState();
}

class _JobCategoryComponentState extends State<JobCategoryComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 140,
          alignment: Alignment.center,
          height: ScreenUtil().setHeight(210),
          // margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: widget.selected == widget.index ? Color(0xFF0642C4).withOpacity(0.9) : Color(0xFFF1F3F6),
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
            padding: EdgeInsets.fromLTRB(12, 2, 2, 2),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Icon(
                  widget.icons,
                  color: widget.selected == widget.index ? Colors.white : Color(0xFF0642C4).withOpacity(0.8),
                  size: 28,
                ),

                SizedBox(
                  width: 7,
                ),

                Expanded(
                  child: Text("${widget.category}",
                    style: TextStyle(
                        color: widget.selected == widget.index ? Colors.white : Colors.black,
                        fontSize: 18
                    ),),
                )

              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
