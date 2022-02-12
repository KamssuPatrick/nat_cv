// import 'package:bank_app_neomorphism_flutter/src/screens/cards/cards_screen.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nat_cv/components/cards_screen.dart';
import 'package:nat_cv/screens/home/home_page.dart';
import 'package:nat_cv/screens/register/register_screen.dart';
import 'package:nat_cv/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(1080, 1920),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
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
                        const TextField(
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
                        const TextField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      },
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(120),
                        margin: const EdgeInsets.symmetric(vertical: 15),
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
                    ),
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
