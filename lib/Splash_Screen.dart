// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, camel_case_types, avoid_unnecessary_containers

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apicalling_demo/Login%20&%20Register/login_pg.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Navigation/Home_pg.dart';
import 'Utils.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gonext();
  }
  gonext() async {
    Utils.prefs = await SharedPreferences.getInstance();

    await Future.delayed(Duration(seconds:3));

    bool loginstatus = Utils.prefs!.getBool('loginstatus') ?? false;

    if (loginstatus) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Home_pg();
        },
      ));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return login_pg();
        },
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedSplashScreen(
              splashIconSize: 150,
              splash: Container(child:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("myimg/ic_launcher.png",height:80,width:80),
                  Text("API Calling",style:TextStyle(fontFamily:'font2',fontSize:15,color:Colors.black))
                ],)),
              nextScreen:Text('loginstatus'),
              disableNavigation: true,
              backgroundColor: Colors.blueGrey,
              curve: Curves.bounceInOut,
            ))
    );
  }
}
