// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:test_state_management/core/widget/drawer.dart';
// import 'package:test_state_management/feature/news_headline/controller/accueil_controller.dart';
//
// class NewsHeadlineView extends StatelessWidget {
//   const NewsHeadlineView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     final controller = Get.find<NewsHeadlineController>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("News Headline"),
//       ),
//       drawer: getAppDrawer(),
//       body: Obx(() {
//         return controller.isLoading.isTrue
//             ? Center(
//           child: CircularProgressIndicator(),
//         )
//             : Container(
//           margin: const EdgeInsets.all(10),
//           child: ListView.separated(
//             itemBuilder: (context, index){
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   controller.articles[index].imageUrl == null ?
//                   Container():
//                   controller.articles[index].imageUrl.toString().length < 6 ? Image.network("https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2022%2F0111%2Fr960251_1296x729_16%2D9.jpg") : Image.network(controller.articles[index].imageUrl.toString()),
//                   SizedBox(height: 8,),
//                   Text(controller.articles[index].title.toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
//                   SizedBox(height: 4,),
//                   Text(controller.articles[index].desc.toString(),),
//                 ],
//               );
//             },
//             separatorBuilder: (context, index) => Divider(),
//             itemCount: controller.articles.length,
//           ),
//         );
//       }),
//     );
//   }
//
// }
