import 'package:flutter/material.dart';
import 'package:lemari2/ui/pages.dart';
import 'package:lemari2/ui/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffE3B68D),
        primaryColorLight: Color(0xffD6AA8E),
        accentColor: Color(0xff5D4736),
      ),
      home: Splash(),
      initialRoute: '/',
      routes: {
        // '/':(context) => Login(),
        //cara panggil modular, shg ga perlu rename satu", jd klo misal keganti routename nya lgs ke ganti
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        Dashboard.routeName: (context) => Dashboard(),
        Lemari.routeName: (context) => Lemari(),
        Profile.routeName: (context) => Profile(),
        // MainMenu.routeName:(context) => MainMenu(),
        // Register.routeName:(context) => Register(),
        // 'menu':(context)=> Menu(),
        // History.routeName:(context)=>History(),
      },
    );
  }
}
