// import 'dart:async';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:invest_partner/screens/home/home_screen.dart';
// import 'package:invest_partner/screens/investisseur/investisseur_home.dart';
// import 'package:invest_partner/screens/login/login_screen.dart';
// import 'package:invest_partner/screens/porteur_projet/porteur_projet_home.dart';
// import 'package:invest_partner/utils/app_themes.dart';
// import 'package:invest_partner/utils/pref_manager.dart';
// import 'package:invest_partner/utils/themebloc/theme_bloc.dart';
// import 'package:nat_cv/utils/pref_manager.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
// class Wrapper extends StatefulWidget {
//   @override
//   _WrapperState createState() => _WrapperState();
// }
//
// class _WrapperState extends State<Wrapper> {
//   String? userEmail;
//   int? typeUser;
//   SharedPreferences? preferences;
//   String? fcmToken, userFirebaseToken;
//   final FirebaseMessaging _messaging = FirebaseMessaging();
//   String _homeScreenText = "Waiting for token...";
//   bool _topicButtonsDisabled = false;
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//
//   final Map<String, Item> _items = <String, Item>{};
//   Item _itemForMessage(Map<String, dynamic> message) {
//     final dynamic data = message['data'] ?? message;
//     final String itemId = data['id'];
//     final Item item = _items.putIfAbsent(itemId, () => Item(itemId: itemId))
//       ..status = data['status'];
//     return item;
//   }
//
//
//   Widget _buildDialog(BuildContext context, Item item) {
//     return AlertDialog(
//       content: Text("Item ${item.itemId} has been updated"),
//       actions: <Widget>[
//         FlatButton(
//           child: const Text('CLOSE'),
//           onPressed: () {
//             Navigator.pop(context, false);
//           },
//         ),
//         FlatButton(
//           child: const Text('SHOW'),
//           onPressed: () {
//             Navigator.pop(context, true);
//           },
//         ),
//       ],
//     );
//   }
//
//   void _showItemDialog(Map<String, dynamic> message) {
//     showDialog<bool>(
//       context: context,
//       builder: (_) => _buildDialog(context, _itemForMessage(message)),
//     ).then((bool? shouldNavigate) {
//       if (shouldNavigate == true) {
//         _navigateToItemDetail(message);
//       }
//     });
//   }
//
//   // void _navigateToItemDetail(Map<String, dynamic> message) {
//   //   final Step item = _itemForMessage(message);
//   //   // Clear away dialogs
//   //   Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
//   //   if (!item.route.isCurrent) {
//   //     Navigator.push(context, item.route);
//   //   }
//   // }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUserInfo();
//     // _loadScreen();
//
//
//     // _firebaseMessaging.configure(
//     //   onMessage: (Map<String, dynamic> message) async {
//     //     print("onMessage: $message");
//     //     _showItemDialog(message);
//     //   },
//     //   onLaunch: (Map<String, dynamic> message) async {
//     //     print("onLaunch: $message");
//     //     _navigateToItemDetail(message);
//     //   },
//     //   onResume: (Map<String, dynamic> message) async {
//     //     print("onResume: $message");
//     //     _navigateToItemDetail(message);
//     //   },
//     // );
//     // _firebaseMessaging.requestNotificationPermissions(
//     //     const IosNotificationSettings(
//     //         sound: true, badge: true, alert: true, provisional: true));
//     // _firebaseMessaging.onIosSettingsRegistered
//     //     .listen((IosNotificationSettings settings) {
//     //   print("Settings registered: $settings");
//     // });
//     // _firebaseMessaging.getToken().then((String token) {
//     //   assert(token != null);
//     //   setState(() {
//     //     _homeScreenText = "Push Messaging token: $token";
//     //   });
//     //   print(_homeScreenText);
//     // });
//
//   }
//
//   void _navigateToItemDetail(Map<String, dynamic> message) {
//     final Item item = _itemForMessage(message);
//     // Clear away dialogs
//     Navigator.popUntil(context, (Route<dynamic> route) => route is PageRoute);
//     if (!item.route.isCurrent) {
//       Navigator.push(context, item.route);
//     }
//   }
//
//   _loadScreen() async {
//     preferences = await SharedPreferences.getInstance();
//
//     await Prefs.load();
//     userFirebaseToken = preferences!.getString("userFirebaseToken");
//     print("__________________1toooooken $userFirebaseToken");
//     if(userFirebaseToken == null)
//       {
//         fcmToken = await _messaging.getToken();
//         print("__________________2toooooken $fcmToken");
//         preferences!.setString("userFirebaseToken", fcmToken);
//       }
//     // fcmToken = await _messaging.getToken();
//
//     //updateUserElement();
//
//     print("__________________3toooooken $fcmToken");
//     // print("uidd $currentuserid");
//
//
//   }
//
//   void getMessage() {
//     _messaging.configure(
//         onMessage: (Map<String, dynamic> message) async {},
//         onResume: (Map<String, dynamic> message) async {},
//         onLaunch: (Map<String, dynamic> message) async {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // final user = Provider.of<User>(context);
//     _loadScreen();
//     print("patrick Wrapper ${userEmail}");
//
//     //return either Home or Authentificate widget
//     // print("patrick Wrapperss ${getUserInfo()}");
//     // if (userEmail == null) {
//     //   return LoginPage();
//     // } else {
//     //   // print("patriqsdck Wrapper ${getUserInfo()}");
//     //   // return Admin();
//     //  return HomePage(email: userEmail,);
//     // }
//
//     // if(typeUser == 3)
//     //   {
//     //     return PorteurProjetScreen();
//     //   }
//     // else if (typeUser == 4)
//     //   {
//     //     return InvestisseurHomeScreen();
//     //   }
//     // else
//     //   {
//     //     return HomePage();
//     //   }
//
//     // return LoginScreen();
//   }
//
//
//   // _loadScreen() async {
//   //   await Prefs.load();
//   //   // context.bloc<ThemeBloc>().add(ThemeChanged(
//   //   //     theme: Prefs.getBool(Prefs.DARKTHEME, def: false)
//   //   //         ? AppTheme.DarkTheme
//   //   //         : AppTheme.LightTheme));
//   //   // Navigator.of(context).pushReplacementNamed(Routes.login);
//   // }
//
//   Future<String?> getUserInfo() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     // print("icic_______${prefs.getString("UserUid")}");
//     var langue = prefs.getString('language');
//
//     print("___languelangue ${prefs.getInt("typeUser")} ");
//     // Prefs.setString(Prefs.LANGUAGE, 'en');
//     // if()
//
//     if(langue == null)
//       {
//         prefs.setString("language", 'fr');
//       }
//
//     setState(() {
//       userEmail = prefs.getString("email");
//       typeUser = prefs.getInt("typeUser");
//     });
//   }
// }
//
//
//
// class Item {
//   Item({required this.itemId});
//   final String itemId;
//
//   StreamController<Item> _controller = StreamController<Item>.broadcast();
//   Stream<Item> get onChanged => _controller.stream;
//
//   String _status;
//   String get status => _status;
//   set status(String value) {
//     _status = value;
//     _controller.add(this);
//   }
//
//   static final Map<String, Route<void>> routes = <String, Route<void>>{};
//   Route<void> get route {
//     final String routeName = '/detail/$itemId';
//     return routes.putIfAbsent(
//       routeName,
//           () => MaterialPageRoute<void>(
//         settings: RouteSettings(name: routeName),
//         builder: (BuildContext context) => HomePage(),
//       ),
//     );
//   }
// }
//
