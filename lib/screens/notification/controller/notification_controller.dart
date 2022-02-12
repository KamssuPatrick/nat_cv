//
// import 'package:get/get.dart';
// import 'package:test_state_management/core/model/article.dart';
// import 'package:test_state_management/core/repository/news_repository.dart';
// import 'package:test_state_management/core/repository/news_repository_imple.dart';
//
// class NewsHeadlineController extends GetxController{
//   NewsRepo? _newsRepo;
//   late final result;
//   NewsHeadlineController(){
//     _newsRepo = Get.find<NewsRepoImpl>();
//     loadNewsLine();
//   }
//
//   RxBool isLoading = false.obs;
//
//    late dynamic articles ;
//
//   loadNewsLine() async{
//     print("No data recieved debut");
//     showLoading();
//
//
//     print("No data recieved res");
//     try {
//       result = await _newsRepo!.getNewsHeadline();
//     } on Exception catch (e) {
//       // TODO
//       print("No data recieved error ${e.toString()}");
//     }
//     print("No data recieved result");
//     hideLoading();
//     if(result!= null){
//       print("data recieved result ${result.toString()}");
//       articles = result;
//       print("No data recieved");
//     }else{
//       print("No data recieved vrai");
//     }
//
//     update();
//   }
//
//   showLoading(){
//     print("No data recieveds");
//     isLoading.toggle();
//   }
//
//   hideLoading(){
//     isLoading.toggle();
//   }
// }