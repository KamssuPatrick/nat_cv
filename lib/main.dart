import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nat_cv/screens/home/home_page.dart';
import 'package:nat_cv/screens/login/login_screen.dart';
import 'package:nat_cv/utils/pref_manager.dart';
import 'package:nat_cv/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<dynamic>? myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);


  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),
      //Locale('de', 'DE'),
      //Locale('ar', 'DZ'),

      // Locale('es', 'ES'),
      Locale('fr', 'FR'),
      // Locale('it', 'IT'),
      // Locale('pt', 'PT'),
    ],
    path: 'assets/languages',));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  late String typeUser;

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => ThemeBloc(),
    //   child: BlocBuilder<ThemeBloc, ThemeState>(
    //     builder: _buildWithTheme,
    //   ),
    // );

    return _buildWithTheme(context);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //
  //        primarySwatch: Colors.blue,
  //       // This makes the visual density adapt to the platform that you run
  //       // the app on. For desktop platforms, the controls will be smaller and
  //       // closer together (more dense) than on mobile platforms.
  //       visualDensity: VisualDensity.adaptivePlatformDensity,
  //     ),
  //     // home: MyHomePage(title: 'Flutter Demo Home Page'),
  //     home: Wrapper(),
  //   );
  // }

  wrapper () async
  {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // if(prefs.getString("typeUser") == "3")
    // {
    //
    // }
  }

  Widget _buildWithTheme(BuildContext context) {
    return MaterialApp(
      // builder: (context, child) {
      //   _loadScreen(context);
      //   // return ScrollConfiguration(
      //   //   behavior: MyBehavior(),
      //   //   child: child,
      //   // );
      // },
      title: 'Natrhemploi-camer',
      // initialRoute: Wrapper(),
      // onGenerateRoute: RouteGenerator.generateRoute,
      // localizationsDelegates: [
      //   // GlobalMaterialLocalizations.delegate,
      //   // GlobalWidgetsLocalizations.delegate,
      //   // GlobalCupertinoLocalizations.delegate,
      //   // context.lo,
      //   DefaultCupertinoLocalizations.delegate,
      //   EasyLocalization.of(context).delegate,
      // ],
      // supportedLocales: EasyLocalization.of(context).supportedLocales,
      // locale: EasyLocalization.of(context).locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      // theme: state.themeData,
      // home: Wrapper(),
      home: const LoginScreen(),
    );
  }

  _loadScreen(context) async {
    await Prefs.load();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // context.bloc<ThemeBloc>().add(ThemeChanged(
    //     theme: prefs.getBool("appTheme")
    //         ? AppTheme.DarkTheme
    //         : AppTheme.LightTheme));
    // Navigator.of(context).pushReplacementNamed(Routes.login);
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: lightMode
          ? const Color(0x00e1f5fe).withOpacity(1.0)
          : const Color(0x00042a49).withOpacity(1.0),
      body: Center(
          child: lightMode
              ? Image.asset('assets/images/logos/invest_partner.png')
              : Image.asset('assets/images/logos/invest_partner.png')),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
