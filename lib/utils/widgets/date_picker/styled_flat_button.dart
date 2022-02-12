// import 'package:flutter/material.dart';
// import 'package:invest_partner/utils/constants.dart';
// import 'package:invest_partner/utils/widgets/date_picker/styles.dart';
//
// // import 'package:date_picker_input/styles.dart';
//
// class StyledFlatButton extends StatelessWidget {
//   final String text;
//   final onPressed;
//   final double radius;
//
//   const StyledFlatButton(this.text, {this.onPressed, Key key, this.radius})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       color: kColorPrimary,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 18.0),
//         child: Text(
//           this.text,
//           style: Styles.p.copyWith(
//             color: Colors.white,
//             height: 1,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ),
//       onPressed: () {
//         this.onPressed();
//       },
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(radius ?? 4.0),
//         side: BorderSide(
//           color: kColorPrimary,
//           width: 2,
//         ),
//       ),
//     );
//   }
// }
