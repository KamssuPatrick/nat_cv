// import 'package:bank_app_neomorphism_flutter/src/screens/cards/cards_screen.dart';
import 'dart:async';

// import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/components/cards_screen.dart';
import 'package:nat_cv/screens/home/home_page.dart';
import 'package:nat_cv/screens/register/register_screen.dart';
import 'package:nat_cv/services/auth.dart';
import 'package:nat_cv/utils/constants.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = true;

  final RoundedLoadingButtonController _btnController =
  new RoundedLoadingButtonController();
  TextEditingController _etEmail = TextEditingController();
  TextEditingController _etPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ScreenUtil.init(BoxConstraints(
    //     maxWidth: MediaQuery.of(context).size.width,
    //     maxHeight: MediaQuery.of(context).size.height),
    //     designSize: Size(1080, 1920),
    //     context: context,
    //     minTextAdapt: true,
    //     orientation: Orientation.portrait);
    ScreenUtil.init(
      context,
      designSize: const Size(1080, 1920),
      minTextAdapt: true,
    );
    return Scaffold(
        backgroundColor: Color(0xFFF1F3F6),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(50)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(60),
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                          color: kBlueColorLight,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    // SizedBox(
                    //   height: ScreenUtil().setHeight(10),
                    // ),
                    Center(
                      child: SizedBox(
                        height: 130,
                          width: 200,
                          child: socialButtonImg("assets/images/logos/nat.png")),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: socialButton(FontAwesomeIcons.facebookF),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(60),
                        ),
                        Expanded(
                          child: socialButton(FontAwesomeIcons.google),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(20),
                    ),
                    Stack(
                      children: <Widget>[
                         TextField(
                          controller: _etEmail,
                          style: TextStyle(color: kBlueColorLight),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kBlueColorLight, width: 2),
                              ),
                              labelText: "Username",
                              labelStyle: TextStyle(
                                  color: kBlueColorLight, fontSize: 14)),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 8,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F3F6),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(5, 5),
                                      color: const Color(0xFF4D70A6).withOpacity(0.2),
                                      blurRadius: 16),
                                  const BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Color.fromARGB(170, 255, 255, 255),
                                      blurRadius: 10),
                                ]),
                            child:  const Icon(
                              Icons.check,
                              color: kBlueColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(70),
                    ),
                    Stack(
                      children: <Widget>[
                         TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: _etPassword,
                          style: TextStyle(color: kBlueColorLight),
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: kBlueColorLight, width: 2),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  color: kBlueColorLight, fontSize: 14)),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 8,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xFFF1F3F6),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(5, 5),
                                      color: const Color(0xFF4D70A6).withOpacity(0.2),
                                      blurRadius: 16),
                                  const BoxShadow(
                                      offset: Offset(-10, -10),
                                      color: Color.fromARGB(170, 255, 255, 255),
                                      blurRadius: 10),
                                ]),
                            child:  const Icon(
                              Icons.remove_red_eye,
                              color: kBlueColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const TextField(
                    //   keyboardType: TextInputType.text,
                    //   obscureText: true,
                    //   style: TextStyle(color: kBlueColorLight),
                    //   decoration: InputDecoration(
                    //       focusedBorder: UnderlineInputBorder(
                    //         borderSide:
                    //             BorderSide(color: kBlueColorLight, width: 2),
                    //       ),
                    //       labelText: "Password",
                    //       labelStyle: TextStyle(
                    //           color: kBlueColorLight, fontSize: 14)),
                    // ),
                    SizedBox(
                      height: ScreenUtil().setHeight(90),
                    ),
                    Row(
                      children: const <Widget>[

                        Spacer(),
                        Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: kBlueColorLight,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(70),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: RoundedLoadingButton(
                        controller: _btnController,
                        width: size.width * 0.813,
                        height: ScreenUtil().setHeight(130),
                        color: Color(0xFF19236D),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          // height: ScreenUtil().setHeight(120),
                          // margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F3F6),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(10, 10),
                                    color: const Color(0xFF4D70A6).withOpacity(0.2),
                                    blurRadius: 16),
                                const BoxShadow(
                                    offset: Offset(-10, -10),
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    blurRadius: 10),
                              ]),
                          child: const Text(
                            "Login",
                            style:
                            TextStyle(color: kBlueColorLight, fontSize: 16),
                          ),
                        ),
                        onPressed: _doSomething,
                      ),
                    ),

                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => HomePage()));
                    //   },
                    //   child: Container(
                    //     width: double.infinity,
                    //     alignment: Alignment.center,
                    //     height: ScreenUtil().setHeight(120),
                    //     margin: const EdgeInsets.symmetric(vertical: 15),
                    //     decoration: BoxDecoration(
                    //         color: const Color(0xFFF1F3F6),
                    //         borderRadius: const BorderRadius.all(Radius.circular(10)),
                    //         boxShadow: [
                    //           BoxShadow(
                    //               offset: const Offset(10, 10),
                    //               color: const Color(0xFF4D70A6).withOpacity(0.2),
                    //               blurRadius: 16),
                    //           const BoxShadow(
                    //               offset: Offset(-10, -10),
                    //               color: Color.fromARGB(170, 255, 255, 255),
                    //               blurRadius: 10),
                    //         ]),
                    //     child: const Text(
                    //       "Login",
                    //       style:
                    //           TextStyle(color: kBlueColorLight, fontSize: 16),
                    //     ),
                    //   ),
                    // ),
              SizedBox(
              height: ScreenUtil().setHeight(70),
        ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegisterPage()));
                        },
                        child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: "Don't have an account?",
                                style: TextStyle(color: Colors.grey)),
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(color: kBlueColorLight),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(90),
                    ),
                  ],
                )),
          ),
        ));
  }

  Widget socialButton(IconData icon) {
    return Container(
      height: ScreenUtil().setHeight(120),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: const Color(0xFFF1F3F6),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset:const Offset(10, 10),
                color: const Color(0xFF4D70A6).withOpacity(0.2),
                blurRadius: 16),
            const BoxShadow(
                offset: Offset(-10, -10),
                color: Color.fromARGB(170, 255, 255, 255),
                blurRadius: 10),
          ]),
      child: Icon(
        icon,
        color:  kBlueColorLight,
      ),
    );
  }

  void _doSomething() async {

    SharedPreferences prefs = await  SharedPreferences.getInstance();

    Auth.connexionUtilisateur(_etEmail.text, _etPassword.text).then((value)
    {
      print("termine ${value}");
        Timer(Duration(seconds: 3), () {
          _btnController.reset();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage()));
        });
    });

    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: _etEmail.text.trim(), password: _etPassword.text.trim()).then((value)
    //   {
    //     if(value.user != null)
    //     {
    //       FirebaseFirestore.instance.collection("users").doc(value.user!.uid).get().then((value)
    //       {
    //         prefs.setString("userUid", value["userUid"]);
    //         prefs.setString("userNom", value["nom"]);
    //         prefs.setString("userPrenom", value["prenom"]);
    //         prefs.setString("userEmail", value["email"]);
    //         prefs.setString("userPhoto", value["photo"] ?? "");
    //         prefs.setString("userPhone", value["telephone"] ?? "");
    //         prefs.setString("userType", value["type"] ?? "");
    //         prefs.setString("userStatut", value["statut"] ?? "");
    //       });
    //
    //
    //
    //
    //       _btnController.success();
    //       Fluttertoast.showToast(msg: "Connexion réussi !", toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.green);
    //       Timer(Duration(seconds: 2), () {
    //         Navigator.of(context).pushAndRemoveUntil(
    //             MaterialPageRoute(
    //                 builder: (context) =>
    //                     HomePage()),
    //                 (Route<dynamic> route) => false);
    //       });
    //
    //
    //     }
    //   });
    //
    //
    // } on FirebaseAuthException catch (e) {
    //   // TODO
    //   _btnController.error();
    //   Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red);
    //   Timer(Duration(seconds: 3), () {
    //     _btnController.reset();
    //   });
    //
    // }
  }

  Widget socialButtonImg(String img) {
    return Container(
      height: ScreenUtil().setHeight(120),
      width: ScreenUtil().setWidth(100),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          color: const Color(0xFF19236D),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset:const Offset(10, 10),
                color: const Color(0xFF040D1C).withOpacity(0.2),
                blurRadius: 16),
            const BoxShadow(
                offset: Offset(-10, -10),
                color: Color.fromARGB(170, 255, 255, 255),
                blurRadius: 10),
          ]),
      child: Image.asset(
        img,
        height: 36.0,
        width: 50,
      ),
    );
  }
}
